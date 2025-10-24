-- Buat schema bernama SALAM
CREATE SCHEMA IF NOT EXISTS SALAM AUTHORIZATION postgres;

-- Buat tabel mahasiswas
CREATE TABLE IF NOT EXISTS SALAM.mahasiswas (
  id SERIAL PRIMARY KEY,
  nim VARCHAR(12) NOT NULL UNIQUE,
  nama TEXT NOT NULL,
  angkatan INT NOT NULL CHECK (angkatan BETWEEN 2015 AND 2035),
  email TEXT UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Tambah constraint tambahan (pembeda): nim harus angka
ALTER TABLE SALAM.mahasiswas
  ADD CONSTRAINT nim_is_numeric CHECK (nim ~ '^[0-9]+$');

-- Tambah satu data contoh (untuk uji awal)
INSERT INTO SALAM.mahasiswas (nim, nama, angkatan, email)
VALUES ('202300001', 'Rizky Alamsyah', 2023, 'rizky@example.com')
ON CONFLICT DO NOTHING;
