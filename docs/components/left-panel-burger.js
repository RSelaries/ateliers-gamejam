import { LitElement, html, css } from 'https://unpkg.com/lit?module'

const burgerMenuIcon = new URL("../medias/icons/burger-menu.svg", import.meta.url).href
const burgerMenuCloseIcon = new URL("../medias/icons/burger-menu-close.svg", import.meta.url).href

class LeftPanelBurger extends LitElement {
    static styles = css`
        details {
            margin: 10px;
            padding: 0px;
            border: none;
            background-color: transparent;

            > summary > div {
                background-color: var(--body-text-color);
                aspect-ratio: 1;
                width: 24px;
                mask-size: 100%;
                -webkit-mask-repeat: no-repeat;
                mask-repeat: no-repeat;
                mask-position: center;
            }

            ::marker {
                content: "";
            }

            :hover {
                cursor: pointer;
            }

            .pages-nav {
                display: flex;
                position: absolute;
                top: 0;
                left: 0;

                width: 100vw;
                max-width: 100vw;
                height: 100vh;
                max-height: 100vh;

                background-color: #0007;
                backdrop-filter: blur(4px);

                z-index: 2;
            }

            .menu-wrapper {
                margin: 30px;
                background-color: var(--background-color-2);
                border-radius: 15px;
                border: solid 1px var(--border-color);
                display: flex;
                flex-direction: column;
                gap: 0px;
            }
        }

        .exit-menu {
            margin: 30px;
            margin-bottom: 0px;
            padding: 0px;
            border: none;
            background-color: transparent;

            > div {
                background-color: var(--body-text-color);
                aspect-ratio: 1;
                width: 24px;
                mask-size: 100%;
                -webkit-mask-repeat: no-repeat;
                mask-repeat: no-repeat;
                mask-position: center;
            }
        }
    `

    render() {
        return html`
            <details>
                <summary>
                    <div style="mask-image: url(${burgerMenuIcon})"></div>
                </summary>
                <div class="pages-nav" @click=${this.closeMenu}>
                    <div class="menu-wrapper" @click=${(event) => event.stopPropagation()}>
                        <button class="exit-menu" @click=${this.closeMenu}>
                            <div style="mask-image: url(${burgerMenuCloseIcon})"></div>
                        </button>
                        <left-panel></left-panel>
                    </div>
                </div>
            </details>
        `
    }

    closeMenu(event) {
        this.shadowRoot.querySelector("details").removeAttribute("open")
    }
}

customElements.define('left-panel-burger', LeftPanelBurger)