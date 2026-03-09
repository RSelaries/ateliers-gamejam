import { LitElement, html, css, unsafeCSS } from 'https://unpkg.com/lit?module'

import pages from '../pages/pages.js'

const opened = new URL( "../medias/icons/folder-opened.svg", import.meta.url).href
const closed = new URL( "../medias/icons/folder-closed.svg", import.meta.url).href

class LeftPanel extends LitElement {
    static styles = css`
        .left-panel-nav {
            text-decoration: none;
            padding: 20px 10px;
            /* height: 100%; */
        }
        *::marker {
            content: "";
        }
        *[open]::marker {
            content: "";
        }

        .category-list {
            padding: 0px;
        }

        details > summary {
            display: flex;
            flex-direction: row;
            align-items: center;
            gap: 5px;
            margin: 5px;
            padding: 5px;
            font-weight: 500;
            text-transform: uppercase;
            user-select: none;
        }

        details > summary > div {
            background-color: var(--body-text-color);
            mask-size: 100%;
            -webkit-mask-repeat: no-<repeat;
            mask-repeat: no-repeat;
            mask-position: center;
            mask-image: url(${unsafeCSS(closed)});
            width: 24px;
            aspect-ratio: 1;
            display: inline-block;
        }
        details[open] > summary > div {
            mask-image: url(${unsafeCSS(opened)});
        }
        .page-btn {
            cursor: pointer;
        }
    `

    changeToPage(page) {
        window.location.hash = page.link
    }

    constructor() {
        super()

        window.addEventListener("hashchange", () => {
            this.openActivePage()
        })
    }

    firstUpdated() {
        super.firstUpdated()
        this.openActivePage()
    }

    render() {
        const pageLink = (category) => {
            return category.pages.map((page) => html`<li class="page-btn" @click=${() => this.changeToPage(page)}>
                ${page.title}
            </li>`)
        }

        return html`
        <nav class="left-panel-nav">
            <ol class="category-list">
                ${pages.map((category) => html`<li class="category ${category.slug}">
                    <details>
                        <summary style="cursor: pointer">
                            <div></div>
                            ${category.name}
                        </summary>
                        <ol>
                            ${pageLink(category)}
                        </ol>
                    </details>
                </li>`)}
            </ol>
        </nav>
        `
    }

    openActivePage() {
        let caterogy = window.location.hash.replace("#", "").split("/")[0]
        if (caterogy) {
            this.renderRoot.querySelector(`.${caterogy}`).querySelector("details").open = true
        } else {
            this.renderRoot.querySelector(`.introduction`).querySelector("details").open = true
        }
    }
}

customElements.define('left-panel', LeftPanel)