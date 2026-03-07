import { LitElement, html, css } from 'https://unpkg.com/lit?module'

class WCFooter extends LitElement {
    static styles = css`
        footer {
            width: 100vw;
            padding: 0;
            margin: 0;
            border-top: solid 1px var(--border-color);
        }
    `

    render() {
        return html`
            <footer>
                Footer !
            </footer>
        `
    }
}

customElements.define('wc-footer', WCFooter)