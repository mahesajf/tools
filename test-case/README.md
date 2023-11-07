# test



## Aturan Pengerjaan

1. buat branch dengan nama isi/{username} misal "isi/nurhavid" 
2. commit tugas satu persatu dengan deskripsi yg mudah dipahami
3. durasi tugas selama 3 hari sampai tanggal 30 Agustus 2023 pukup 23:59
4. jika ada pertanyaan / isu bisa mengirim email ke nurhavid@ihsansolusi.com

## Tugas

1. buatlah nginx sebagai reverse proxy untuk ketiga service tersebut.
2. buat dockerfile untuk masing masing service
3. buat docker compose untuk menjalankan : 
    1. nginx
    2. service ui, trx dan report
    3. monitoring ( prometheus, grafana, loki dan promtail )
4. buatlah continue improvement dengan menggunakan .gitlab-ci.yml (test, build dan push )
5. buatlah dashboard metric untuk trx dan report dengan menggunakan prometheus dan grafana
6. integrasikan promtail, loki dan grafana untuk menampilkan log dari service ui, trx dan report

## Penjelasan

Project ini terdiri dari 3 service utama yaitu ui, trx dan report. Petunjuk menjalankan service ui ada di README.md. Petunjuk untuk menjalankan service trx dan report ada di Makefile. Service ui hanya dummy frontend dengan framework next js. Disisi ui anda perlu membuat dockerfile. Sedangkan untuk trx dan report dilengkapi dengan path /metrics. service Trx dilengkapi juga dengan unit test, point tambahan jika anda masukkan di pipeline ci cd.



## point tambahan

1. buat kubernetes manifest untuk docker compose diatas. Anda bisa memecah per service agar mudah dibaca. 

## selamat mengerjakan terima kasih