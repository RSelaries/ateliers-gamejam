import { LitElement, html, css } from 'https://unpkg.com/lit?module'

class ViewableImage extends LitElement {
    static properties = {
        src: {},
    }

    static styles = css`
        .img-btn {
            max-width: 100%;
            margin: 15px 0px;
        }
        .img-btn:hover {
            cursor: pointer;
        }

        .viewer-wrapper {
            position: fixed;
            width: 100vw;
            height: 100vh;
            top: 0;
            left: 0;
            backdrop-filter: blur(4px);
            z-index: 1000;
            display: none;
            /* overflow-y: auto;
            overflow-x: hidden; */

            img {
                width: 100vw;
                height: 100vh;
                object-fit: contain;
                position: sticky;
                top: 0;
                right: 0;
                left: 0;
            }
        }

        .viewer {
            width: 100%;
            height: 300%;
        }

        .viewer-wrapper:hover {
            cursor: pointer;
        }

    `

    render() {
        return html`
            <img src="${this.src}" @click=${this.show} class="img-btn">
            <div class="viewer-wrapper" @click=${this.hide}>
                <img src="${this.src}">
            </div>
        `
    }

    onMouseMove(event) {
        console.log(event.clientX)
    }

    onScroll(event) {
        let element = this.renderRoot.querySelector(".viewer-wrapper")
        let scrollTop = element.scrollTop
        let scrollHeight = element.scrollHeight
        // 0 to 1
        let scrollValue = scrollTop / (scrollHeight - document.documentElement.clientHeight)

        let image = element.querySelector("img")
        let sizeValue = 200 - (scrollValue * 100)
        image.style.height = `${sizeValue}vh`
        image.style.width = `${sizeValue}vw`
    }

    show() {
        // Show image viewer
        document.body.style.overflow = "hidden"
        this.renderRoot.querySelector(".viewer-wrapper").style.display = "block"

        // Reset image viewer scroll to bottom
        let element = this.renderRoot.querySelector(".viewer-wrapper")
        this.renderRoot.querySelector(".viewer-wrapper").scrollTop = element.scrollHeight
    }

    hide() {
        this.renderRoot.querySelector(".viewer-wrapper").style.display = "none"
        document.body.style.overflow = "auto" 
    }
}

customElements.define('viewable-image', ViewableImage)