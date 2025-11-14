import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["nav"]

  connect() {
    this.lastScroll = 0
    window.addEventListener("scroll", this.handleScroll.bind(this))
  }

  disconnect() {
    window.removeEventListener("scroll", this.handleScroll.bind(this))
  }

  handleScroll() {
    const current = window.scrollY

    if (current > this.lastScroll && current > 20) {
      // Scroll down → encoger navbar
      this.navTarget.classList.add("nav-mini")
    } else {
      // Scroll up → restaurar
      this.navTarget.classList.remove("nav-mini")
    }

    this.lastScroll = current
  }
}
