import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { collapsed: Boolean }
  static targets = ["label"]

  toggle() {
    this.collapsedValue = !this.collapsedValue
    this.update()
  }

  update() {
    if (this.collapsedValue) {
      this.element.classList.add("w-20")
      this.element.classList.remove("w-64")
    } else {
      this.element.classList.remove("w-20")
      this.element.classList.add("w-64")
    }

    this.labelTargets.forEach(label => {
      label.classList.toggle("hidden", this.collapsedValue)
    })
  }

  openMobile() {
    this.element.classList.remove("-translate-x-full")
  }

  closeMobile() {
    this.element.classList.add("-translate-x-full")
  }
}