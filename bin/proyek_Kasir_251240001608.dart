import 'dart:io';

void main() {
  Map<String, int> menu_makanan = {
    'nasi goreng': 15000,
    'kwitaw goreng': 20000,
    'mie goreng': 12000,
  };

  print('-------- Daftar Menu Makanan -------');
  menu_makanan.forEach((key, value) {
    print("$key : Rp$value");
  });

  stdout.write("Masukkan Nama Menu Makanan : ");
  String namamenu = (stdin.readLineSync() ?? "").toLowerCase().trim();

  stdout.write("Masukkan Jumlah Pesanan : ");
  int jumlahpesanan = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

  if (!menu_makanan.containsKey(namamenu)) {
    print("Menu Tidak Tersedia");
    return;
  }

  int harga = menu_makanan[namamenu]!;

  int subtotal = harga * jumlahpesanan;
  double ppn = subtotal * 0.11;
  double total = subtotal + ppn;

  // Diskon
  double diskon = 0;
  if (subtotal >= 100000) {
    diskon = 10000;
    total -= diskon;
  }

  print("======= Struk Pembayaran =========");
  print("Nama Menu      : $namamenu");
  print("Jumlah Pesanan : $jumlahpesanan");
  print("Harga Satuan   : Rp$harga");
  print("Subtotal       : Rp$subtotal");
  print("PPN (11%)      : Rp${ppn.toStringAsFixed(0)}");
  print("Diskon         : Rp${diskon.toStringAsFixed(0)}");
  print("======= Terima Kasih Sudah Berbelanja =======");
  print("Total Bayar    : Rp${total.toStringAsFixed(0)}");
}