<?php
function fact(int $n): int
{
    $result = 1;
    $num = 1;
    while ($num <= $n) {
        $result = $result * $num;
        $num = $num + 1;
    }
    return $result;
}
?>