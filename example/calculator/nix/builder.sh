source $setup

$host-gcc $src_file -o calculator
$host-strip calculator

mkdir -p $out/bin

cp calculator $out/bin/
