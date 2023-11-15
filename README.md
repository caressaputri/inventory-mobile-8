hello
tugas 8 ada di branch master
1. **Perbedaan antara Navigator.push() dan Navigator.pushReplacement():**
   - `Navigator.push()` digunakan untuk menambahkan halaman baru ke dalam tumpukan navigasi. Halaman sebelumnya tetap ada di tumpukan.
   - `Navigator.pushReplacement()` menggantikan halaman terkini dengan halaman baru. Ini berguna ketika Anda ingin mengganti halaman tanpa menyimpan halaman sebelumnya di dalam tumpukan.

   Contoh:
   ```dart
   // Navigator.push()
   Navigator.push(
     context,
     MaterialPageRoute(builder: (context) => HalamanBaru()),
   );

   // Navigator.pushReplacement()
   Navigator.pushReplacement(
     context,
     MaterialPageRoute(builder: (context) => HalamanGanti()),
   );
   ```

2. **Layout Widgets pada Flutter dan Konteks Penggunaannya:**
   - `Container`: Digunakan untuk menempatkan widget lain di dalamnya dan memberikan batasan dan dekorasi.
   - `Row` dan `Column`: Digunakan untuk menyusun widget secara horizontal (Row) atau vertikal (Column).
   - `Stack`: Menempatkan widget di atas satu sama lain.
   - `ListView`: Digunakan untuk menampilkan daftar widget secara berurutan.

3. **Elemen Input pada Form dan Penggunaannya:**
   - `TextField`: Untuk input teks.
   - `Checkbox`: Untuk pilihan biner (dipilih atau tidak).
   - `RadioButton`: Untuk pilihan tunggal dalam grup.
   - `DropdownButton`: Untuk memilih satu opsi dari daftar.
   - `DatePicker`: Untuk memilih tanggal.

   Penggunaannya tergantung pada kebutuhan formulir, misalnya, `TextField` untuk input teks dan `Checkbox` untuk persetujuan.

4. **Penerapan Clean Architecture pada Aplikasi Flutter:**
   Clean Architecture membagi aplikasi menjadi beberapa lapisan (domain, data, dan presentation) untuk menjaga independensi dan mengurangi ketergantungan. Flutter sendiri belum memiliki standar clean architecture, tetapi prinsipnya dapat diikuti.

5. **Implementasi Checklist Secara Step-by-Step:**
  Berikut adalah langkah-langkah implementasi checklist tersebut:

1. **Membuat Halaman Formulir Tambah Item Baru:**
   - Buat halaman baru dengan elemen input `name`, `amount`, dan `description`.
   - Tambahkan tombol "Save" untuk menyimpan data.

   ```dart
   // Contoh menggunakan TextFormField untuk elemen input
   TextFormField(
     decoration: InputDecoration(labelText: 'Name'),
     validator: (value) {
       if (value.isEmpty) {
         return 'Name cannot be empty';
       }
       return null;
     },
   ),
   // Elemen input amount dan description ditambahkan dengan cara yang serupa
   ```

2. **Validasi Elemen Input:**
   - Gunakan properti `validator` pada masing-masing elemen input untuk menambahkan validasi.
   - Pastikan tidak boleh ada data yang kosong dan sesuai dengan tipe data atribut model.

   ```dart
   TextFormField(
     decoration: InputDecoration(labelText: 'Amount'),
     validator: (value) {
       if (value.isEmpty) {
         return 'Amount cannot be empty';
       }
       if (!isNumeric(value)) {
         return 'Amount must be a number';
       }
       return null;
     },
   ),
   // Validasi untuk elemen description
   ```

3. **Mengarahkan Pengguna:**
   - Tambahkan navigasi untuk mengarahkan pengguna dari halaman utama ke halaman formulir tambah item baru.

   ```dart
   // Pada tombol "Tambah Item" di halaman utama
   ElevatedButton(
     onPressed: () {
       Navigator.push(context, MaterialPageRoute(builder: (context) => FormTambahItem()));
     },
     child: Text('Tambah Item'),
   ),
   ```

4. **Menampilkan Data dalam Pop-up:**
   - Setelah pengguna menekan tombol "Save," tampilkan data yang diisi dalam sebuah pop-up.

   ```dart
   // Setelah validasi berhasil pada tombol "Save"
   onPressed: () {
     if (_formKey.currentState.validate()) {
       // Simpan data dan tampilkan pop-up
       showDialog(
         context: context,
         builder: (BuildContext context) {
           return AlertDialog(
             title: Text('Data Tersimpan'),
             content: Text('Nama: $_name\nAmount: $_amount\nDescription: $_description'),
             actions: [
               TextButton(
                 onPressed: () {
                   Navigator.of(context).pop();
                 },
                 child: Text('OK'),
               ),
             ],
           );
         },
       );
     }
   }
   ```

5. **Membuat Drawer:**
   - Tambahkan drawer dengan dua opsi: "Halaman Utama" dan "Tambah Item."

   ```dart
   Drawer(
     child: ListView(
       children: [
         ListTile(
           title: Text('Halaman Utama'),
           onTap: () {
             Navigator.pop(context); // Tutup drawer
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HalamanUtama()));
           },
         ),
         ListTile(
           title: Text('Tambah Item'),
           onTap: () {
             Navigator.pop(context); // Tutup drawer
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FormTambahItem()));
           },
         ),
       ],
     ),
   )
   ```

   Ini adalah panduan umum untuk implementasi checklist tersebut. Pastikan untuk menyesuaikan dengan struktur dan kebutuhan spesifik aplikasi Flutter Anda.
