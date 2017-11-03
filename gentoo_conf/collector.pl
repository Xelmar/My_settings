#!/usr/bin/perl
use File::Path qw(make_path);

sub rsync {
	$out_dir = "conf";
	$path = $out_dir;
	@string = split("/",$_[0]);
	for ($i = 1; $i < @string -1; $i++){
		$path .= "/" . $string[$i];
		}
	make_path($path);
	system("rsync -r $_[0] $path");

	return 0;
	}

@mass = ();
$i = 0;

open(IN,"list.conf") or die "Can't open the file!\n"; # Only global path to file will be understude
while($str = <IN>){
	chomp($str);

	$first = substr($str,0,1);
	
	$last = substr ($str,length($str)-1,1);

	if ($first ne "#" && $str ne ''){
		rsync($str);
		}
	}


