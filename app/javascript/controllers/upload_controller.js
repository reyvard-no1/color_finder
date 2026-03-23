import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "canvas", "error"]

  connect() {}

  handleFile(event) {
    const file = event.target.files[0]

    if (file.size > 5 * 1024 * 1024) {
      console.error("File above the authorized size.")
      return
    }

    const reader = new FileReader()
    reader.onload = (e) => {
      const img = new Image()
      img.onload = () => {
        if (img.width > 2000 || img.height > 2000) {
          this.errorTarget.textContent = "Image too large — 2000px max"
          this.errorTarget.classList.remove("hidden")
          return
        }
        this.canvasTarget.width = img.width
        this.canvasTarget.height = img.height
        this.canvasTarget.classList.remove("hidden")
        const ctx = this.canvasTarget.getContext("2d")
        ctx.drawImage(img, 0, 0)
      }
      img.src = e.target.result
    }
    reader.readAsDataURL(file)
  }
}
