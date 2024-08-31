import { Controller } from "@hotwired/stimulus"
import SlimSelect from "slim-select"
// Connects to data-controller="select-option-slim"
export default class extends Controller {

  connect() {
    console.log("connect to stimulus slim_select_option")
    new SlimSelect({
      select: this.element,
      closeOnSelect: false
    })
  }
}
