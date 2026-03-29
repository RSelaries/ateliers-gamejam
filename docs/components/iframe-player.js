import { LitElement, html, css } from 'https://unpkg.com/lit?module'

class IframePlayer extends LitElement {
    static properties = {
        src: {},
        title: {},
        _visible: {},
        _isFullscreen: {}
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
            flex-direction: column;
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

        .iframe-wrapper {
            position: relative;

            button {
                position: absolute;
                bottom: 0;
                right: 0;
                margin: 1em;
                width: 40px;
                height: 40px;
                background-color: var(--body-text-color);
                mask-image: url(./medias/icons/fullscreen.svg);
                mask-position: center center;
                mask-repeat: none;
                mask-size: contain;
            }

            button:hover {
                cursor: pointer;
            }
        }
    `
    
    constructor() {
        super()
        this._visible = false
        this._isFullscreen = document.fullscreenElement != null

        addEventListener("fullscreenchange", (event) => {
            this._isFullscreen = document.fullscreenElement != null
        })
    }

    render() {
        if (!this._visible) return html`
            <div class="iframe-placeholder">
                <h1>${this.title ? this.title : "Preview du jeu"}</h1>
                <button @click=${() => this._visible = true}>Jouer</button>
            </div>
        `
        else return html`
            <div class="iframe-wrapper">
                <iframe src="${this.src}">Ce moteur de recherche ne supporte par l'iframe.</iframe>
                <button @click=${this.toFullscreen}
                    style="mask-image: url(${this._isFullscreen ? "./medias/icons/exit-fullscreen.svg" : "./medias/icons/fullscreen.svg"})"
                ></button>
            </div>
        `
    }

    toFullscreen() {
        if (!this._isFullscreen)
            this.renderRoot.querySelector(".iframe-wrapper").requestFullscreen()
        else document.exitFullscreen()
    }
}

customElements.define('iframe-player', IframePlayer)