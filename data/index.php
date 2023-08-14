<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recording Lists</title>
</head>
<body>
    <h1>Video Lists</h1>
    <p>録画した映像の一覧です</p>
    <?php $mp4files = glob('hls/*.mp4'); ?>
    <?php foreach( $mp4files as $file) : ?>
    <video controls playsinline muted preload="metadata" width="640">
        <source src="<?php echo $file; ?>">
    </video>
    <?php endforeach; ?>
</body>
</html>