import { LitElement, html, css } from 'https://unpkg.com/lit?module'

import pages from '../pages/pages.js'

const pagesUrl = new URL( "../pages/", import.meta.url).href

class PageDisplay extends LitElement {
    static properties = {
        page: {},
    }

    static styles = css`
        .article-wrapper {
            border: solid 1px var(--border-color);        
            padding: 30px;
            background-color: var(--background-color-1);
        }

        @media screen and (min-width: 1350px) {
            .hierarchy {
                display: none;
            }
        }
    `

    constructor() {
        super()
        this.page = this.getPageFromHash()

        window.addEventListener("hashchange", () => {
            this.page = this.getPageFromHash()
            this.scrollToAnchor()
        })
    }

    render() {
        if (this.page.link.endsWith(".md")) {
            return html`
                <div class="article-wrapper">
                    <zero-md
                        src=${pagesUrl + this.page.link}
                        @zero-md-rendered=${async() => {
                            this.fixHeadingIds()
                            
                            const body = this.renderRoot
                                .querySelector("zero-md")
                                .shadowRoot.querySelector(".markdown-body")
                            await this.waitForImages(body)

                            this.buildHierarchy(body)
                            this.setupScrollSpy(body)
                            this.scrollToAnchor()
                        }}
                    >
                        <template>
                            <link rel="stylesheet" href="./styles/code-block-style.css">
                            <link rel="stylesheet" href="./styles/page-display.css">
                        </template>
                    </zero-md>
                </div>
            `
        } else if (this.page.link.endsWith(".html")) {
            return html`
                <div>HTML</div>
            `
        } else {
            return html`
                <div>Fichier non trouvé</div>
            `
        }
        
    }

    fixHeadingIds() {
        const body = this.renderRoot
            .querySelector("zero-md")
            .shadowRoot.querySelector(".markdown-body")

        const headings = body.querySelectorAll("h1,h2,h3,h4,h5,h6")

        headings.forEach(h => {
            const newId = h.textContent
                .normalize("NFD")
                .replace(/[\u0300-\u036f]/g, "")
                .toLowerCase()
                .replace(/[^\w\s-]/g, "")
                .trim()
                .replace(/\s+/g, "-")

            h.id = newId
        })
    }

    changeToPage(page) {
        window.location.hash = page.link
    }

    getRoute() {
        const parts = window.location.hash.split("#")

        return {
            page: parts[1],
            anchor: parts[2]
        }
    }

    getPageFromHash() {
        const route = this.getRoute()

        for (const category of pages) {
            for (const page of category.pages) {
                if (page.link === route.page) {   
                    return page
                }
            }
        }

        return pages[0].pages[0]
    }

    scrollToAnchor() {
        const anchor = this.getRoute().anchor
        const zeroMdShadowRoot = this.renderRoot.querySelector("zero-md").shadowRoot
        let element
        
        if (anchor) {
            element = zeroMdShadowRoot.querySelector(`#${anchor}`)
            if (element) {
                element.scrollIntoView({ behavior: "smooth", block: "start" })
            }
        } else {
            element = document.querySelector("html")
            if (element) {
                element.scroll({ top: 0, behavior: "smooth" })
            }
        }
    }

    async waitForImages(container) {
        const images = container.querySelectorAll("img")

        await Promise.all(
            [...images].map(img => {
                if (img.complete) return Promise.resolve()

                return new Promise(resolve => {
                    img.addEventListener("load", resolve)
                    img.addEventListener("error", resolve)
                })
            })
        )
    }

    // j'avoue c'est écrit par chatGPT mais je crois que ça fonctionne
    // un peu la honte je sais
    buildHierarchy(body) {
        const headings = body.querySelectorAll("h1,h2,h3,h4,h5,h6")

        const root = []
        const stack = []

        for (const h of headings) {
            const level = parseInt(h.tagName[1])

            const node = {
                id: h.id,
                name: h.textContent.trim(),
                children: []
            }

            while (stack.length && stack[stack.length - 1].level >= level) {
                stack.pop()
            }

            if (stack.length === 0) {
                root.push(node)
            } else {
                stack[stack.length - 1].node.children.push(node)
            }

            stack.push({ level, node })
        }

        document.querySelector("right-panel").hierarchy = root
        document.querySelector("bottom-hierarchy").shadowRoot.querySelector("right-panel").hierarchy = root
    }

    setupScrollSpy(body) {
        const headings = [...body.querySelectorAll("h1,h2,h3,h4,h5,h6")]

        if (this.headingObserver) {
            this.headingObserver.disconnect()
        }

        this.headingObserver = new IntersectionObserver(
            (entries) => {
                const visible = entries
                    .filter(e => e.isIntersecting)
                    .sort((a, b) => a.boundingClientRect.top - b.boundingClientRect.top)

                if (!visible.length) return

                const id = visible[0].target.id

                this.updateUrlHash(id)
            },
            {
                root: null,
                rootMargin: "0px 0px -80% 0px",
                threshold: 0
            }
        )

        headings.forEach(h => this.headingObserver.observe(h))
    }

    updateUrlHash(anchor) {
        const route = this.getRoute()

        const newHash = `#${route.page}#${anchor}`

        if (window.location.hash === newHash) return

        history.replaceState(null, "", newHash)
    }
}

customElements.define('page-display', PageDisplay)