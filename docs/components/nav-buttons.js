import { LitElement, html, css } from 'https://unpkg.com/lit?module'

import pages from '../pages/pages.js'

class NavButtons extends LitElement {
    static styles = css`
        .nav-btn-wrapper {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            padding: 30px;
            padding-bottom: 0px;

            > a {
                text-decoration: none;
                padding: 5px 20px;
                font-family: prompt;
                font-weight: 500;
                font-size: 18px;
                border-radius: 5px;
                border: solid 2px var(--highlight-color);
                background-color: var(--highlight-color);
                cursor: pointer;
                color: var(--body-text-color);
            }
            > a.disabled {
                background-color: var(--background-color-1);
                border: solid 2px var(--background-color-2);
                color: var(--body-text-color-faded);
                pointer-events: none;
                cursor: default;
            }

            > a:hover {
                border: solid 2px var(--highlight-color);
                background-color: transparent;
            }
            > a.disabled:hover {
                background-color: var(--background-color-1);
                border: solid 2px var(--background-color-2);
                color: var(--body-text-color-faded);
            }
        }
    `

    static properties = {
        nextUrl: {},
        prevUrl: {},
    }

    constructor() {
        super()
        this.getPrevNextPagesUrls()
        window.addEventListener("hashchange", () => {
            this.getPrevNextPagesUrls()
        })
    }

    render() {
        return html`
            <div class="nav-btn-wrapper">
                <a href=${this.prevUrl} class=${this.prevUrl ? "" : "disabled"}>← Précédent</a>
                <a href=${this.nextUrl} class=${this.nextUrl ? "" : "disabled"}>Suivant →</a>
            </div>
        `
    }

    getPrevNextPagesUrls() {
        const currentPage = this.getPageFromHash()
        let allPages = []

        for (const category of pages) {
            for (const page of category.pages) {
                allPages = [...allPages, page]
                if (page.subPages) {
                    for (const subpage of page.subPages) {
                        allPages = [...allPages, subpage]
                    }
                }
            }
        }

        const index = allPages.findIndex(p => p.link === currentPage.link)

        this.prevUrl = allPages[index - 1] ? `#${allPages[index - 1].link}` : null
        this.nextUrl = allPages[index + 1] ? `#${allPages[index + 1].link}` : null
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
                if (page.link === route.page) return page
                if (page.subPages) {
                    for (const subpage of page.subPages) {
                        if (subpage.link === route.page) return subpage
                    }
                }
            }
        }

        return pages[0].pages[0]
    }
}

customElements.define('nav-buttons', NavButtons)