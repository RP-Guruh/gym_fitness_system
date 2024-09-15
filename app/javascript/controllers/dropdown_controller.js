import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  connect() {
    
  }
  toggle() {
    let submenu = this.element.nextElementSibling;
    if (submenu) {
      submenu.classList.toggle('show');
    }
  }
}
