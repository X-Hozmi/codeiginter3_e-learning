        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <h1 class="h3 font-weight-bold mb-4 text-primary"><?= $judul; ?></h1>

            <div class="col-lg-12">
                <div class="tab-content responsive">
                    <div class="tab-pane active" id="absensi">
                        <div class="card shadow mb-4">
                            <div class="table-responsive">
                                <div class="card-body">
                                    <table class="table table-bordered table-hover" id="dataTable" width="100%"
                                        cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Mata Kuliah</th>
                                                <th>Dosen</th>
                                                <th>Tanggal</th>
                                                <th>Kehadiran</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
												date_default_timezone_set('Asia/Jakarta');
                                                $i = 1;
                                                foreach ($matkul as $mat) :
                                            ?>
                                            <tr>
                                                <td><?= $i; ?></td>
                                                <td><?= $mat['matkul']; ?></td>
                                                <td><?= $mat['nama_dosen']; ?></td>
                                                <td><?= date("d F Y"); ?></td>
                                                <td>
                                                    <div id="btn_approval_<?= $mat['id_matkul']; ?>">
                                                        <?php if($absenhari > 0) {
															echo "Hadir";
															} else { ?>
                                                        <button type="button" class="btn btn-primary"
                                                            onclick="approve('<?= $mat['id_matkul']; ?>')">Hadir</button>
                                                        <?php } ?>
                                                    </div>
                                                </td>
                                            </tr>
                                            <?php
                                                $i++;
                                            	endforeach;
                                            ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <script>
function approve(id) {
    const approveAbsen = (data) => {
        $.ajax({
            url: "<?= base_url('mahasiswa/approveAbsensi'); ?>",
            type: 'post',
            data: data,
            dataType: "JSON",
            success: function(datas) {
                // document.location.href = "<?= base_url('mahasiswa/absensi'); ?>";
                var tombol = '#btn_approval_' + datas;
                $(tombol).children().hide();
                $(tombol).html('Kehadiran tersimpan');
            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert('Kesalahan saat melakukan absensi');
            }
        });
    };

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition((pos) => {
            approveAbsen({
                id: id,
                latitude: `${pos.coords.latitude}`,
                longitude: `${pos.coords.longitude}`
            })
        });
    } else {
        approveAbsen({
            id: id,
        })
    }
}
        </script>
