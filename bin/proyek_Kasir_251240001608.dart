import 'dart:io';

void main(){
Map<String, int> menu_makanan = {
  'Nasi Goreng'  : 15000,
  'Kwitaw Goreng': 20000,
  'Mie Goreng'   : 12000,
};

print('-------- Daftar Menu Makanan -------');
menu_makanan.forEach((key, value) {
  print("$key : Rp$value");
});

//Inputan_Makanan
stdout.write("Masukkan Nama Menu Makanan : ");
String? namamenu = stdin.readLineSync() ?? "";

//Inputan_Jumlah
stdout.write("Masukkan Jumlah Pesanan : ");
int jumlahpesanan = int.parse (stdin.readLineSync() ?? "0");

if(!menu_makanan.containsKey(namamenu)) {
  print("Menu Tidak Tersedia");
  return;
}

int harga = menu_makanan[namamenu]!;

// hitung total
int subtotal = harga * jumlahpesanan;
double ppn   = subtotal * 0.11;
double total = subtotal + ppn;

// diskon 
double diskon = 0;
if (total  >= 100000) {
    diskon    =10000;
    total     -=diskon;
}

  // Struk Pembayaran
  print("======= Struk Pembayaran =========");
  print("Nama Menu      : $namamenu");
  print("Jumlah Pesanan : $jumlahpesanan");
  print("Harga Satuan   : Rp$harga");
  print("Subtotal       : Rp$subtotal");
  print("PPN (11%)      : Rp${ppn.toStringAsFixed(0)}");
  print("Diskon         : Rp${diskon.toStringAsFixed(0)}");
  print("======= Terima Kasih Sudah Berbelanja ======= ");
  print("Total Bayar    : Rp${total.toStringAsFixed(0)}");
}