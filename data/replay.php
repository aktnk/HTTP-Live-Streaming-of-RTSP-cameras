<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recorded Videos List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg sticky-top" style="background-color: #ccc;">
        <div class="container-fluid">
            <a href="index.html" class="navbar-brand"><i class="bi bi-camera-reels me-1"></i>HomeCameras</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item"><a href="index.html" class="nav-link">Live</a></li>
                    <li class="nav-item"><a href="replay.php" class="nav-link active">Replay</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <main>
        <div class="container">
            <h3><i class="bi bi-camera-reels me-1"></i>Recorded Videos List</h3>
            <p>録画した映像の一覧から、映像を再生できます。</p>
        </div>
        <div class="container mt-3">
            <div class="row gy-2">
                <?php $mp4files = glob('hls/*.mp4'); ?>
                <?php foreach( $mp4files as $file) : ?>
                <div class="col-lg-4 col-sm-6">
                    <video controls playsinline muted preload="metadata" width="360">
                        <source src="<?php echo $file; ?>">
                    </video>
                </div>
                <?php endforeach; ?>
            </div>
        </div>
    </main>
    <footer class="py-3 mt-4 text-center" style="background-color: #ccc;">
        <div class="container">
            <p class="small">HTTP Live Streaming of RTSP cameras</p>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>