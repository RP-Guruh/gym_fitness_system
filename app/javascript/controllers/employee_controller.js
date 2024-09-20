import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="employee"
export default class extends Controller {

  static targets = ['email']

  connect() {
  
  }

  getAccountSelected(event) {
    const selectedOptions = Array.from(event.target.selectedOptions);
    const selectedTexts = selectedOptions.map(option => option.text);

    this.emailTarget.value = selectedTexts
  }


}
