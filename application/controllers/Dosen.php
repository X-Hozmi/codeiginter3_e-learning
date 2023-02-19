<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

	class Dosen extends CI_Controller {

		public function __construct() {
			// Method ini akan berjalan di semua function (lebih praktis karena hanya perlu sekali memanggil saja)
			parent::__construct();
			apakah_login();
			$this->load->library('form_validation');
			$this->load->model('M_Auth');
			$this->load->model('M_Mahasiswa');
			$this->load->model('M_Dosen');
			$this->load->model('M_Jurusan');
			$this->load->model('M_Matkul');
			$this->load->model('M_Studi');
			$this->load->model('M_Berkas');
			// $data['user'] = $this->M_Auth->ceksesi();
		}

		public function index() {
			// Mengambil data dari sesi login user berdasarkan email
			$data = [
				'user' => $this->M_Auth->ceksesi(),
				'judul' => 'Siakad Dosen',
			];
			$this->load->view('templates/session/header', $data);
			$this->load->view('templates/session/sidebar', $data);
			$this->load->view('templates/session/topbar', $data);
			$this->load->view('dosen/index', $data);
			$this->load->view('templates/session/footer');
		}

		public function studi() {
			$data = [
				'user' => $this->M_Auth->ceksesi(),
				'sedo' => $this->M_Dosen->sedo(),
				'studidos' => $this->M_Dosen->studidos(),
				'matkul' => $this->M_Matkul->getAllMatkul(),
				'jurusan' => $this->M_Jurusan->getAllJurusan(),
				'mahasiswa' => $this->M_Mahasiswa->getAllMahasiswa(),
				'dosen' => $this->M_Dosen->getAllDosen(),
				'hasil' => $this->M_Studi->getAllStudi(),
				'judul' => 'Hasil Studi',
			];

			$this->form_validation->set_rules('kehadiran', 'Kehadiran', 'required|trim');
			$this->form_validation->set_rules('uts', 'UTS', 'required|trim');
			$this->form_validation->set_rules('tugas', 'Tugas', 'required|trim');
			$this->form_validation->set_rules('uas', 'UAS', 'required|trim');

			if($this->form_validation->run() == false) {
				$this->load->view('templates/session/header', $data);
				$this->load->view('templates/session/sidebar', $data);
				$this->load->view('templates/session/topbar', $data);
				$this->load->view('dosen/hasilstudi', $data);
				$this->load->view('templates/session/footer');
			} else {
				$this->M_Studi->create();
				$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Laporan studi berhasil diinput!</div>');
					redirect('dosen/studi');
			}
		}

		public function editStudi() {
			$this->form_validation->set_rules('kehadiran', 'Kehadiran', 'required|trim');
			$this->form_validation->set_rules('uts', 'UTS', 'required|trim');
			$this->form_validation->set_rules('tugas', 'Tugas', 'required|trim');
			$this->form_validation->set_rules('uas', 'UAS', 'required|trim');

			if($this->form_validation->run() == false) {
				$data = [
					'user' => $this->M_Auth->ceksesi(),
					'sedo' => $this->M_Dosen->sedo(),
					'studidos' => $this->M_Dosen->studidos(),
					'matkul' => $this->M_Matkul->getAllMatkul(),
					'jurusan' => $this->M_Jurusan->getAllJurusan(),
					'mahasiswa' => $this->M_Mahasiswa->getAllMahasiswa(),
					'dosen' => $this->M_Dosen->getAllDosen(),
					'hasil' => $this->M_Studi->getAllStudi(),
					'judul' => 'Hasil Studi',
				];
				$this->load->view('templates/session/header', $data);
				$this->load->view('templates/session/sidebar', $data);
				$this->load->view('templates/session/topbar', $data);
				$this->load->view('dosen/hasilstudi', $data);
				$this->load->view('templates/session/footer');
			} else {
				$this->M_Studi->update();
				$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Laporan studi berhasil diubah!</div>');
					redirect('dosen/studi');
			}
		}

		public function hapusStudi($id) {
			$this->M_Studi->delete($id);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data dihapus!</div>');
				redirect('dosen/studi');
		}

		public function dokumen() {
			$this->form_validation->set_rules('nama_doc', 'Nama Dokumen', 'required|trim');
			$this->form_validation->set_rules('title_doc', 'Judul Dokumen', 'required|trim');
			$this->form_validation->set_rules('kode_doc', 'Kode Dokumen', 'required|trim');

			if($this->form_validation->run() == false) {
				$data = [
					'user' => $this->M_Auth->ceksesi(),
					'dokumen' => $this->M_Berkas->getAllDokumen(),
					'sedo' => $this->M_Dosen->sedo(),
					'studidos' => $this->M_Dosen->studidos(),
					'matkul' => $this->M_Matkul->getAllMatkul(),
					'jurusan' => $this->M_Jurusan->getAllJurusan(),
					'mahasiswa' => $this->M_Mahasiswa->getAllMahasiswa(),
					'dosen' => $this->M_Dosen->getAllDosen(),
					'tipe' => ['1', '2', '3'],
					'judul' => 'Dokumen Ajar',
				];
				$this->load->view('templates/session/header', $data);
				$this->load->view('templates/session/sidebar', $data);
				$this->load->view('templates/session/topbar', $data);
				$this->load->view('dosen/dokumen', $data);
				$this->load->view('templates/session/footer');
			} else {
				$this->M_Berkas->insert();
				$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Berhasil upload file!</div>');
					redirect('dosen/dokumen');
			}
		}

		public function editDokumen() {
			$this->form_validation->set_rules('nama_doc', 'Nama Dokumen', 'required|trim');
			$this->form_validation->set_rules('title_doc', 'Judul Dokumen', 'required|trim');
			$this->form_validation->set_rules('kode_doc', 'Kode Dokumen', 'required|trim');

			if($this->form_validation->run() == false) {
				$data = [
					'user' => $this->M_Auth->ceksesi(),
					'dokumen' => $this->M_Berkas->getAllDokumen(),
					'sedo' => $this->M_Dosen->sedo(),
					'studidos' => $this->M_Dosen->studidos(),
					'matkul' => $this->M_Matkul->getAllMatkul(),
					'jurusan' => $this->M_Jurusan->getAllJurusan(),
					'mahasiswa' => $this->M_Mahasiswa->getAllMahasiswa(),
					'dosen' => $this->M_Dosen->getAllDosen(),
					'tipe' => ['1', '2', '3'],
					'judul' => 'Dokumen Ajar',
				];
				$this->load->view('templates/session/header', $data);
				$this->load->view('templates/session/sidebar', $data);
				$this->load->view('templates/session/topbar', $data);
				$this->load->view('dosen/dokumen', $data);
				$this->load->view('templates/session/footer');
			} else {
				$this->M_Berkas->update();
				$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Dokumen berhasil dipudate!</div>');
					redirect('dosen/dokumen');
			}
		}

		public function downloadDokumen($id) {
			$data = $this->db->get_where('dokumen',['id_doc'=>$id])->row();
			force_download('assets/dokumen/'.$data->berkas,NULL);
		}

		public function hapusDokumen($id) {
			$this->M_Berkas->delete($id);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Dokumen dihapus!</div>');
				redirect('dosen/dokumen');
		}
	}
