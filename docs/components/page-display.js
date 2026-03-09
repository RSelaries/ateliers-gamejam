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
            padding: 0 30px;
            background-color: var(--background-color-1);
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
                        @zero-md-rendered=${() => {
                            this.scrollToAnchor()
                            this.buildHierarchy()
                        }}
                    >
                        <template>
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
                                a {
                                    color: var(--highlight-color);
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
                element.scrollIntoView({ behavior: "smooth" })
            }
        } else {
            element = document.querySelector(".article")
            if (element) {
                element.scroll({ top: 0, behavior: "smooth" })
            }
        }
    }

    // j'avoue c'est écrit par chatGPT mais je crois que ça fonctionne
    // un peu la honte je sais
    buildHierarchy() {
        const elements = document.querySelector("page-display")
            .shadowRoot.querySelector("zero-md")
            .shadowRoot.querySelector(".markdown-body").children

        const root = [];
        const stack = [];

        function getLevel(el) {
            const match = el.tagName?.match(/^H([1-6])$/);
            return match ? parseInt(match[1]) : null;
        }

        for (const el of elements) {
            const level = getLevel(el);

            if (level) {
            const node = {
                name: el.textContent.trim(),
                id: el.id,
                level: level,
                children: []
            };

            while (stack.length && stack[stack.length - 1].level >= level) {
                stack.pop();
            }

            if (stack.length === 0) {
                root.push(node);
            } else {
                stack[stack.length - 1].children.push(node);
            }

            stack.push(node);
            } else {
            if (stack.length) {
                stack[stack.length - 1].children.push({
                type: el.tagName?.toLowerCase() || "text",
                content: el.textContent.trim()
                });
            }
            }
        }

        function clean(nodes) {
            return nodes.map(n => ({
                id: n.id,
                name: n.name,
                children: n.children ? clean(n.children) : []
            }));
        }

        document.querySelector("right-panel").hierarchy = clean(root)
    }
}

customElements.define('page-display', PageDisplay)