// app/javascript/application.js
import "@hotwired/turbo-rails";
import "controllers"; // Ini harus sesuai dengan pengaturan di importmap.rb

// Skrip lainnya
import './plugins/datatables/js/jquery.dataTables.min';
import './plugins/jquery.min';
import './plugins/apexcharts/apexcharts.min';
import './plugins/datatables/js/dataTables.buttons.min';
import './plugins/datatables/js/dataTables.bootstrap4.min';
import './plugins/datatables/js/dataTables.responsive.min';
import './plugins/datatables/js/responsive.bootstrap4.min';
import './dashboard';

import 'datatables.net'