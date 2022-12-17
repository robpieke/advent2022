<?php

function mapXY($x, $y)
{
    return sprintf("%d,%d", $x, $y);
}

$map = [];
$maxy = -PHP_INT_MAX;

$f = fopen("input.txt", "r");
while (($line = fgets($f)) !== false) {
    $coords = explode(" -> ", $line);
    for ($i = 1; $i < count($coords); $i++) {
        $start = explode(",", $coords[$i - 1]);
        $end = explode(",", $coords[$i]);
        $sx = intval($start[0]);
        $sy = intval($start[1]);
        $ex = intval($end[0]);
        $ey = intval($end[1]);
        $dx = $sx < $ex ? 1 : -1;
        $dy = $sy < $ey ? 1 : -1;
        for ($x = $sx; $x != $ex + $dx; $x += $dx) {
            for ($y = $sy; $y != $ey + $dy; $y += $dy) {
                $map[mapXY($x, $y)] = 1;
                $maxy = max($maxy, $y);
            }
        }
    }
}
fclose($f);

$grains = 0;
$done = false;
while (!$done) {
    $x = 500;
    $y = 0;
    while (true) {
        if ($y > $maxy) {
            $done = true;
            break;
        }
        if (!array_key_exists(mapXY($x, $y + 1), $map)) {
            $y++;
            continue;
        }
        if (!array_key_exists(mapXY($x - 1, $y + 1), $map)) {
            $x--;
            $y++;
            continue;
        }
        if (!array_key_exists(mapXY($x + 1, $y + 1), $map)) {
            $x++;
            $y++;
            continue;
        }
        $map[mapXY($x, $y)] = 1;
        $grains++;
        break;
    }
}

printf("%d\n", $grains);

?>
