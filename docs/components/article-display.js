import { LitElement, html, css } from 'https://unpkg.com/lit?module'

import pages from '../pages/pages.js'

const pagesUrl = new URL( "../pages/", import.meta.url).href

class PageDisplay extends LitElement {
    static properties = {
        page: {},
        src: {},
    }

    static styles = css`
    `

    constructor() {
        super()
        this.page = pages[1].pages[0]
        console.log(this.page)
        this.src = pagesUrl + this.page.link
    }

    render() {
        if (this.page.type === "markdown") {
            return html`
                <zero-md src=${this.src}>
                    <template data-append>
                        <style>
                        </style>
                    </template>
                </zero-md>
                <button @click=${() => this.changeToPage({
                    "title": "GDQuest",
                    "type": "html",
                    "link": "#",
                })}>
                    Change page
                </button>
            `
        } else {
            return html`
                <div>HTML</div>
                <button @click=${() => this.changeToPage({
                "title": "2. Jeu de plateforme",
                "type": "html",
                "link": "ateliers/jeu-de-plateforme.md",
            })}>
                    Change page
                </button>s
            `
        }
        
    }

    changeToPage(page) {
        console.log(page)
        this.page = page
        this.src = pagesUrl + page.link
        this.requestUpdate()
    }
}

customElements.define('page-display', PageDisplay)