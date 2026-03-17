import { LitElement, html, css } from 'https://unpkg.com/lit?module'

class WCFooter extends LitElement {
    static styles = css`
        footer {
            padding: 0;
            margin: 0;
            border-top: solid 1px var(--border-color);
            font-weight: 200;
            font-size: 10px;
            padding: 5px;

            height: 150vh;
        }
    `

    render() {
        return html`
            <footer>
                Site créé par Raphaël Selaries
            </footer>
        `
    }
}

customElements.define('wc-footer', WCFooter)