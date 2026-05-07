import { LitElement, html, css } from 'https://unpkg.com/lit?module'

class WCFooter extends LitElement {
    static styles = css`
        footer {
            background-color: var(--background-color-1);
            margin: 0;
            border-top: solid 1px var(--border-color);
            padding: 10px 30px;
        }

        .logo-row {
            display: flex;
            gap: 16px;
        }

        .logo-row > div {
            flex: 1;
        }

        .logo {
            background-color: var(--body-text-color);
            mask-position: center center;
            mask-size: contain;
            mask-repeat: none;
            height: 20px;
            aspect-ratio: 1;
        }

        a {
            color: var(--highlight-color);
            text-decoration: underline;
            white-space: nowrap;

            background-image: var(--external-link-icon);
            background-size: 12px;
            background-position: center right;
            background-repeat: no-repeat;
            padding-right: 16px;
        }
    `

    render() {
        return html`
        <footer class="logo-row">
            <div>
                Site et Ateliers créés par Raphaël Selaries
            </div>

            <div style="display: flex">
                <div style="display: flex; gap: 5px">
                    <div class="logo" style="mask-image: url(./medias/logo-sirius.svg)"></div>
                    <a href="https://sirius-productions.fr/accueil/">Sirius Productions</a>
                </div>
                <div style="display: flex; gap: 5px">
                    <div class="logo" style="mask-image: url(./medias/logo-sierra.svg)"></div>
                    <a href="https://www.lasierraprod.com/">La Sierra Prod</a>
                </div>
                <div style="display: flex; gap: 5px">
                    <div class="logo" style="mask-image: url(./medias/logo-ciney.svg); aspect-ratio: 2"></div>
                    <a href="https://www.lasierraprod.com/le-ciney">Le CiNey</a>
                </div>
            </div>

            <div></div>
        </footer>
        `
    }
}

customElements.define('wc-footer', WCFooter)