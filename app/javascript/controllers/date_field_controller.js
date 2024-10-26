import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="date-field"
export default class extends Controller {
  static targets = ["fields"]

  connect() {
    console.log("add date row berjalan")
  }

  addField() {
    console.log("add")
    const newField = document.createElement("div")
    newField.classList.add("date-field", "mb-2")
    newField.innerHTML = `
      <input type="date" name="class_package[available_date][]" class="form-control d-inline-block w-75" />
      <button type="button" data-action="click->date-field#removeField" class="btn btn-danger btn-sm d-inline-block">Remove</button>
    `
    this.fieldsTarget.appendChild(newField)
  }

  removeField(event) {
    event.target.closest(".date-field").remove()
  }
}
