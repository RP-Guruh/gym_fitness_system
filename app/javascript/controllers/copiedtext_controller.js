import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2';

// Connects to data-controller="copiedtext"
export default class extends Controller {
  static targets = [ "source" ]
  connect() {
    
  }

  copy(event) {
    event.preventDefault()
    navigator.clipboard.writeText(this.sourceTarget.value)
    Swal.fire({
      icon: "success",
      title: "Copied...",
      showConfirmButton: false,
      timer: 1300
    });
  }

  generate(event) {
    fetch("/generate_new_password", {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      }
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        this.sourceTarget.value = data.password;
      } else {
        console.error("Password generation failed:", data.message);
      }
    })
    .catch(error => console.error("Error:", error));
  }
}
