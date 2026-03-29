import { LitElement, html, css } from 'https://unpkg.com/lit?module'

class IframePlayer extends LitElement {
    static properties = {
        src: {},
        _visible: {},
    }

    static styles = css`
        iframe, .iframe-placeholder {
            width: 100%;
            height: 100%;
            aspect-ratio: 16/9;
            border: solid 1px var(--border-color);
            display: block;
        }

        .iframe-placeholder {
            display: flex;
            justify-content: center;
            align-items: center;

            button {
                font-family: prompt;
                color: var(--redirection-color);
                font-weight: 700;
                font-size: 1em;
                padding: 2px 30px;
                border-radius: 100000px;
                border: solid 2px var(--redirection-color);
                background-color: transparent
            }
            button:hover {
                cursor: pointer;
                color: var(--background-color-1);
                background-color: var(--redirection-color);
                transform: scale(1.1);
            }
        }
    `
    
    constructor() {
        super()
        this._visible = false
    }

    render() {
        if (!this._visible) return html`
            <div class="iframe-placeholder">
                <button @click=${() => this._visible = true}>Jouer</button>
            </div>
        `
        else return html`
            <iframe src="${this.src}">Ce moteur de recherche ne supporte par l'iframe.</iframe>
        `
    }
}

customElements.define('iframe-player', IframePlayer)