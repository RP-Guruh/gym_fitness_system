import { Controller } from "@hotwired/stimulus"

//<div data-controller="reset">
//  <input data-reset-target=clearme>
//  <button data-action="click->reset#clean">clear</button>
//</div>

export default class extends Controller {
  static targets = [ "clearme" ]

  connect() { console.log("reset controller connected") }

  clean() {
    console.log(this.clearmeTarget)
    this.clearmeTarget.value=''
  }
}