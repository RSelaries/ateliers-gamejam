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
                    <details class="hierarchy" style="cursor: pointer">
                        <summary>Hiérarchie</summary>
                        <right-panel></right-panel>
                    </details>

                    <zero-md
                        src=${pagesUrl + this.page.link}
                        @zero-md-rendered=${async() => {
                            this.fixHeadingIds()
                            
                            const body = this.renderRoot
                                .querySelector("zero-md")
                                .shadowRoot.querySelector(".markdown-body")
                            await this.waitForImages(body)
                            
                            // await new Promise(requestAnimationFrame)
                            this.buildHierarchy(body)
                            this.scrollToAnchor()
                        }}
                    >
                        <template>
                            <link rel="stylesheet" href="./code-block-style.css">
                            <style>
                                .markdown-body {
                                    font-size: 17px;
                                }

                                strong {
                                    font-weight: 500;
                                    color: var(--highlight-color);
                                }

                                em {
                                    color: var(--highlight-color);
                                }

                                a.external-link {
                                    color: var(--highlight-color);
                                    text-decoration: underline;
                                }

                                a {
                                    text-decoration: none;
                                    color: var(--redirection-color);
                                }

                                h1, h2, h3, h4, h5, h6 {
                                    display: flex;
                                    align-items: center;
                                    gap: 5px;
                                    margin: 0px;
                                    margin-top: 15px;
                                }

                                h3 > img {
                                    height: 24px;
                                    margin: 0px;
                                    padding: 0px;
                                }
                                
                                p > img {
                                    height: 16px;
                                    margin: 0px;
                                    padding: 0px;
                                }

                                a > img {
                                    height: 16px;
                                    margin: 0px;
                                    padding: 0px;
                                }

                                h1 {
                                    margin-bottom: 30px;
                                    color: var(--highlight-color);
                                }

                                h2 {
                                    border: solid 2px var(--highlight-color);
                                    background-color: light-dark(#0000, var(--highlight-color));
                                    padding: 2px 20px;
                                    border-radius: 15px;
                                    margin-bottom: 15px;
                                    margin-top: 40px;
                                }
                                
                                p {
                                    margin: 0px;
                                }
                                
                                blockquote {
                                    border-left: 2px solid var(--highlight-color);
                                    border-radius: 5px; 
                                    margin: 15px;
                                    margin-left: 0px;
                                    padding: 0px 30px;
                                }

                                img {
                                    max-width: 100%;
                                    margin: 15px 0px;
                                }

                                /* code {
                                    color: var(--code-color);
                                } */

                                .side-by-side {
                                    max-width: 100%;
                                    display: flex;
                                    flex-direction: row;
                                    gap: 15px;
                                    > * {
                                        width: 100%;    
                                        flex: 1;
                                    }
                                }

                                li {
                                    margin-bottom: 10px;
                                }

                                iframe {
                                    width: 100%;
                                    height: 100%;
                                    display: block;
                                }

                                .itch-embed {
                                    /* border-bottom: solid 1px #363636; */
                                    border-right: solid 1px #363636;
                                }

                                .tags-wrapper {
                                    display: flex;
                                    margin: 5px 0px;
                                    gap: 5px;

                                    > span {
                                        white-space: pre;
                                        border: solid 2px var(--redirection-color);
                                        /* background-color: var(--redirection-color); */
                                        border-radius: 10000px;
                                        padding: 0px 10px;
                                        font-weight: 300;
                                        font-size: 10px;
                                    }
                                }

                            </style>
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
                element.scrollIntoView({ behavior: "smooth", block: "center" })
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
        this.shadowRoot.querySelector("right-panel").hierarchy = root
    }
}

customElements.define('page-display', PageDisplay)