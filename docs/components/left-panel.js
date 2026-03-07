import { LitElement, html, css } from 'https://unpkg.com/lit?module'
import pages from '../pages/pages.js'

class LeftPanel extends LitElement {
    static styles = css`
        .left-panel-nav {
            text-decoration: none;
        }
    `

    render() {
        function pageLink(category) {
            return category.pages.map((page) => html`<li>
                ${page.title}
            </li>`)
        }

        return html`
        <nav class="left-panel-nav">
            <ol>
                ${pages.map((category) => html`<li>
                    <details>
                        <summary style="cursor: pointer">
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
}

customElements.define('left-panel', LeftPanel)