# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@stimulus-components/notification", to: "@stimulus-components--notification.js" # @3.0.0
pin "sweetalert2" # @11.12.4
pin "slim-select" # @2.8.2
pin "filepond" # @4.31.2
pin "@rails/activestorage", to: "@rails--activestorage.js" # @7.2.100
pin "filepond-plugin-file-validate-type" # @1.2.9
pin "filepond-plugin-image-exif-orientation" # @1.0.11
pin "filepond-plugin-image-preview" # @4.6.12
pin "filepond-plugin-image-crop" # @2.0.6
pin "filepond-plugin-image-resize" # @2.0.10
pin "filepond-plugin-image-transform" # @3.8.7
pin "filepond-plugin-image-edit" # @1.6.3
pin "@stimulus-components/rails-nested-form", to: "@stimulus-components--rails-nested-form.js" # @5.0.0
