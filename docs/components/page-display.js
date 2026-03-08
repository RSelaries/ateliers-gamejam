import { LitElement, html, css } from 'https://unpkg.com/lit?module'

import pages from '../pages/pages.js'

const pagesUrl = new URL( "../pages/", import.meta.url).href

class PageDisplay extends LitElement {
    static properties = {
        page: {},
    }

    static styles = css`
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
                <zero-md src=${pagesUrl + this.page.link} @zero-md-rendered=${() => this.scrollToAnchor()} >
                    <template>
                    </template>
                </zero-md>
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
        this.page = page
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
        } else {
            element = zeroMdShadowRoot.querySelector(".markdown-body").firstChild
        }

        if (element) {
            element.scrollIntoView({ behavior: "smooth" })
        }
    }
}

customElements.define('page-display', PageDisplay)