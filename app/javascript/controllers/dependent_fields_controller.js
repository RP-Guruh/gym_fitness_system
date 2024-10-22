// app/javascript/controllers/dependent_fields_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["provinceSelect", "regencySelect", "modelSelect"];

  loadRegencies() {
    const provinceId = this.provinceSelectTarget.value;
    const modelId = this.modelSelectTarget.value;
    if (provinceId) {
      fetch(`/cities?province_id=${provinceId}&model_id=${modelId}`, {
        headers: {
          "Accept": "text/vnd.turbo-stream.html"
        }
      })
      .then(response => response.text())
      .then(html => {
        const regencySelectContainer = document.getElementById('regency-select-container');
        regencySelectContainer.innerHTML = html; // Perbarui dropdown regency
      })
      .catch(error => {
        console.error('Error fetching regencies:', error);
      });
    } else {
      // Reset dropdown regency jika tidak ada province yang dipilih
      const regencySelectContainer = document.getElementById('regency-select-container');
      regencySelectContainer.innerHTML = '<select id="regency-select" name="city" class="form-control"><option value="">Select Regency</option></select>';
    }
  }

  // Memperbarui dropdown kabupaten dengan data yang diterima
  updateRegencySelect(regencies) {
    const regencySelect = this.regencySelectTarget; // Mengambil elemen dropdown kabupaten
    regencySelect.innerHTML = '<option value="">Select Regency</option>'; // Reset dropdown

    regencies.forEach(regency => {
      const option = document.createElement('option');
      option.value = regency.id; // ID dari kabupaten
      option.text = regency.name; // Nama kabupaten
      regencySelect.appendChild(option);
    });
  }

  // Reset dropdown kabupaten
  resetRegencySelect() {
    const regencySelect = this.regencySelectTarget; // Mengambil elemen dropdown kabupaten
    regencySelect.innerHTML = '<option value="">Select Regency</option>'; // Reset dropdown
  }
}
