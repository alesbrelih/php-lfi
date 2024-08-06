<?php
// Simple LFI vulnerability example
$page = $_GET['page'] ?? 'home';
$ext = $_GET['ext'] ?? '.php';
include($page . $ext);
