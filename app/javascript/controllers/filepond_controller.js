import { Controller } from "@hotwired/stimulus"
import * as FilePond from "filepond"
import { DirectUpload } from "@rails/activestorage"
import FilePondPluginFileValidateType from "filepond-plugin-file-validate-type"
import FilePondPluginImageExifOrientation from "filepond-plugin-image-exif-orientation"
import FilePondPluginImagePreview from "filepond-plugin-image-preview"
import FilePondPluginImageCrop from "filepond-plugin-image-crop"
import FilePondPluginImageResize from "filepond-plugin-image-resize"
import FilePondPluginImageTransform from "filepond-plugin-image-transform"
import FilePondPluginImageEdit from "filepond-plugin-image-edit"

// Connects to data-controller="filepond"
export default class extends Controller {
  static targets = ["input"]
  connect() {
    console.log("filepond jalan");
    if (this.inputTarget) {

      FilePond.registerPlugin(
        FilePondPluginFileValidateType,
        FilePondPluginImageExifOrientation,
        FilePondPluginImagePreview,
        FilePondPluginImageCrop,
        FilePondPluginImageResize,
        FilePondPluginImageTransform,
        FilePondPluginImageEdit
      );

      FilePond.create(this.inputTarget, {

        labelIdle: `Upload photo here <span class="filepond--label-action">Browse</span>`,
        // imagePreviewHeight: 170,
        // imageCropAspectRatio: '1:1',
        // imageResizeTargetWidth: 200,
        // imageResizeTargetHeight: 200,
        // stylePanelLayout: 'compact circle',
        // styleLoadIndicatorPosition: 'center bottom',
        // styleProgressIndicatorPosition: 'right bottom',
        // styleButtonRemoveItemPosition: 'left bottom',
        // styleButtonProcessItemPosition: 'right bottom',
        // imagePreviewHeight: 170,
          server: {
            process: (fieldName, file, metadata, load, error, progress, abort, transfer, options) => {
              // URL direct upload dari Active Storage
              const directUploadUrl = this.inputTarget.dataset.directUploadUrl
  
              // Proses upload dengan DirectUpload
              const uploader = new DirectUpload(file, directUploadUrl, {
                directUploadWillStoreFileWithXHR: (request) => {
                  request.upload.addEventListener('progress', (event) => {
                    progress(event.lengthComputable, event.loaded, event.total)
                  })
                }
              })
  
              // Lakukan upload dan tangani respons blob
              uploader.create((errorResponse, blob) => {
                if (errorResponse) {
                  error(`Something went wrong: ${errorResponse}`)
                } else {
                  const hiddenField = document.createElement('input')
                  hiddenField.setAttribute('type', 'hidden')
                  hiddenField.setAttribute('value', blob.signed_id)
                  hiddenField.name = this.inputTarget.name  // Set nama field yang sesuai
                  document.querySelector('form').appendChild(hiddenField)
                  load(blob.signed_id)
                }
              })
  
              return {
                abort: () => {
                  abort()
                }
              }
            }
          }
      });
    }
  }
}
