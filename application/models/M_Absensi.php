<?php
class M_Absensi extends CI_Model {
	public function __construct() {
		// Method ini akan berjalan di semua function (lebih praktis karena hanya perlu sekali memanggil saja)
		parent::__construct();
		$this->load->model('M_Mahasiswa');
	}

	public function dailyAbsensiMahasiswa() {
		// Absensi mahasiswa berdasarkan mahasiswa yang login
		date_default_timezone_set('Asia/Jakarta');
		$tenggat = 1;
		$stuma = $this->M_Mahasiswa->sema();
		$npm = $stuma['npm'];
		$query = $this->db->query("SELECT *
									FROM absensi
									JOIN matkul
									ON absensi.kode_matkul = matkul.kode_matkul
									WHERE absensi.npm = '$npm'
									AND DATEDIFF(CURDATE(), absensi.tanggal_absen) > $tenggat
									AND absensi.kode_matkul = matkul.kode_matkul");
		return $query->result_array();
	}

	public function approveAbsensi() {
		date_default_timezone_set('Asia/Jakarta');
		$stuma = $this->M_Mahasiswa->sema();
		$npm = $stuma['npm'];
		$id_matkul = $this->input->post('id');
		$latitude = $this->input->post('latitude');
		$longitude = $this->input->post('longitude');

		$query = $this->db->query("SELECT * FROM matkul
									WHERE id_matkul = '$id_matkul'")->result_array()[0];

		$data = [
			'kode_matkul' => $query['kode_matkul'],
			'kode_dosen' => $query['kode_dosen'],
			'npm' => $npm,
			'latitude' => $latitude,
			'longitude' => $longitude,
			'status' => 'Hadir',
			'tanggal_absen' => date("Y-m-d h:i:s"),
		];

		if($query) {
			$this->db->insert('absensi', $data);
		}
		echo json_decode($id_matkul);
	}
}