select
A.lot, A.id_barang, C."NAMA BARANG",
A.jumlah AS "JUMLAH MASUK",
A.berat AS "BERAT MASUK",
SUM(Iif (B.jumlah IS NULL, 0, B.JUMLAH)) AS "JUMLAH KELUAR",
SUM(Iif (B.berat IS null, 0, B.BERAT)) AS "BERAT KELUAR",
A.jumlah - SUM(Iif (B.jumlah IS NULL, 0, B.JUMLAH)) AS "JUMLAH SISA",
A.berat - SUM(iIF(B.berat IS null, 0, B.BERAT)) AS "BERAT SISA"

from "DATA MASUK" A
LEFT JOIN "DATA KELUAR DETAIL" B ON A.lot = B.lot
LEFT JOIN "BARANG" C ON C.id = A.id_barang

group by a.lot, a.id_barang,  C."NAMA BARANG", A.JUMLAH, A.BERAT