#!/usr/bin/perl -X

$main_color="^fg(#6666cc)";

$excellent = " ^fg() ";
$good = " ^fg(#00ff00) ";
$normal = " ^fg(#FFFF00) ";
$bad = " ^fg(#FF00FF) ";
$very_bad = " ^fg(#FF0000) ";


$tab="     ";
$blank=" ^fg() ";
open(CONKY,"conky -c ~/.xmonad/conky/dzen2_conky_right |");
while(<CONKY>){
	
	#Getting some data
	@mass0 = split("\\|",$_);
	
	
	
	#Disks
	@mass1 = split($tab,$mass0[0]);

	
	#Disks
	#   --> SSD I/O
	@mass2 = split(" ",$mass1[0]);
	
	$str = $main_color;
	$str .= $mass2[0]." ".$mass2[1];
	
	if($mass2[2] =~ m/KiB/){$str .= $good;}
	   elsif($mass2[2] =~ m/MiB/){$str .= $normal;}
	      elsif($mass2[2] =~ m/GiB/){$str .= $bad;}
	         else{$str .= $blank;}
	$str .= " ".$mass2[2].$tab;

	#Disks
	#   --> HDD I/O
	@mass2 = split(" ",$mass1[1]);

	$str .= $main_color." ".$mass2[0]." ".$mass2[1];

	if($mass2[2] =~ m/KiB/){$str .= $good;}
	   elsif($mass2[2] =~ m/MiB/){$str .= $normal;}
	      elsif($mass2[2] =~ m/GiB/){$str .= $bad;}
	         else{$str .= $blank;}
	$str .= " ".$mass2[2].$tab;
	
	

	
	#Disks
	#   --> SSD Temp
	@mass2 = split(" ",$mass1[2]);
	
	$str .= $main_color." ".$mass2[0]." ".$mass2[1];

	@temp = split("°C",$mass2[2]);
	if( $temp[0] < 60 ){$str .= $excellent;}
	   elsif( $temp[0] < 70 ){$str .= $good;}
	      elsif( $temp[0] < 80 ){$str .= $normal;}
	         elsif( $temp[0] < 90 ){$str .= $bad;}
		    elsif( $temp[0] < 100 ){$str .= $very_bad;}
		    	else {$str .= $blank;}

	$str .= $temp[0]."^fg()°C".$tab;

	
	#Disks
	#   --> HDD Temp
		@mass2 = split(" ",$mass1[3]);
	
	$str .= $main_color." ".$mass2[0]." ".$mass2[1];

	@temp = split("°C",$mass2[2]);
	if( $temp[0] < 30 ){$str .= $excellent;}
	   elsif( $temp[0] < 40 ){$str .= $good;}
	      elsif( $temp[0] < 50 ){$str .= $normal;}
	         elsif( $temp[0] < 60 ){$str .= $bad;}
		    elsif( $temp[0] < 70 ){$str .= $very_bad;}
		    	else {$str .= $blank;}

	$str .= $temp[0]."^fg()°C".$tab."|".$tab;
	


	#CPU
	@mass1 = split(" ",$mass0[1]);

	$str .= $main_color.$mass1[0]." ".$mass1[1]." ".$mass1[2]." ";

	for($i=3;$i<7;$i++){
		if( $mass1[$i] < 40 ){$str .= $excellent;}
		   elsif( $mass1[$i] < 55 ){$str .= $good;}
		      elsif( $mass1[$i] < 70 ){$str .= $normal;}
		         elsif( $mass1[$i] < 85 ){$str .= $bad;}
			    elsif( $mass1[$i] < 95 ){$str .= $very_bad;}
			    	else {$str .= $blank;}
		$str .= $mass1[$i]." ";

		}
	
	$str .= "^fg()°C".$tab."|".$tab;
		
	
	#GPU
	@mass1 = split($tab,$mass0[2]);


	#GPU
	#  --> GPU Temp
	@mass2 = split(" ",$mass1[0]);

	$str .= $main_color." ".$mass2[0]." ".$mass2[1];

	@temp = split("°C",$mass2[2]);
	if( $temp[0] < 35 ){$str .= $excellent;}
	   elsif( $temp[0] < 45 ){$str .= $good;}
	      elsif( $temp[0] < 60 ){$str .= $normal;}
	         elsif( $temp[0] < 80 ){$str .= $bad;}
		    elsif( $temp[0] < 95 ){$str .= $very_bad;}
		    	else {$str .= $blank;}

	$str .= $temp[0]."^fg()°C".$tab;


	#GPU
	#  --> GPU Utilize
	@mass2 = split(" ",$mass1[1]);

	$str .= $main_color.$mass2[0]." ".$mass2[1]." ";

	@temp = split("%",$mass2[2]); # it is not temp, just lack of variables
	if( $temp[0] < 10 ){$str .= $excellent;}
	   elsif( $temp[0] < 30 ){$str .= $good;}
	      elsif( $temp[0] < 50 ){$str .= $normal;}
	         elsif( $temp[0] < 70 ){$str .= $bad;}
		    elsif( $temp[0] < 90 ){$str .= $very_bad;}
		    	else {$str .= $blank;}
	
	$str .= $temp[0]."^fg()%".$tab;

	 #GPU
         #  --> GPU Video
         @mass2 = split(" ",$mass1[2]);
 
         $str .= $main_color.$mass2[0]." ".$mass2[1]." ";
 
         @temp = split("%",$mass2[2]); # it is not temp, just lack of variables
         if( $temp[0] < 10 ){$str .= $excellent;}
            elsif( $temp[0] < 30 ){$str .= $good;}
               elsif( $temp[0] < 50 ){$str .= $normal;}
                  elsif( $temp[0] < 70 ){$str .= $bad;}
                     elsif( $temp[0] < 90 ){$str .= $very_bad;}
                         else {$str .= $blank;}
 
         $str .= $temp[0]."^fg()%".$tab;
	
	#GPU
	#  --> GPU Freq
	@mass2 = split(" ",$mass1[3]);

	$str .= $main_color.$mass2[0]." ".$mass2[1]." ";

	if( $mass2[2] < 200 ){$str .= $excellent;}
	   elsif( $mass2[2] < 600 ){$str .= $good;}
	      elsif( $mass2[2] < 1000 ){$str .= $normal;}
	         elsif( $mass2[2] < 1400 ){$str .= $bad;}
		    elsif( $mass2[2] < 18000 ){$str .= $very_bad;}
		    	else {$str .= $blank;}
	
	$str .= $mass2[2]."^fg() ".$mass2[3].$tab;


	#GPU
	#  --> Mem Freq
	@mass2 = split(" ",$mass1[4]);

	$str .= $main_color.$mass2[0]." ".$mass2[1]." ";

	if( $mass2[2] < 1000 ){$str .= $excellent;}
	   elsif( $mass2[2] < 2000 ){$str .= $good;}
	      elsif( $mass2[2] < 4000 ){$str .= $normal;}
	         elsif( $mass2[2] < 5100 ){$str .= $bad;}
		    elsif( $mass2[2] < 7200 ){$str .= $very_bad;}
		    	else {$str .= $blank;}
	
	$str .= $mass2[2]."^fg() ".$mass2[3].$tab;
	
	
	#GPU
	#  --> GPU Mem
	@mass2 = split(" ",$mass1[5]);

	$str .= $main_color.$mass2[0]." ";

	$i = $mass2[1] / $mass2[4];

	if($i < 0.07) {$str .= $excellent;}
	   elsif($i < 0.3) {$str .= $good;}
	      elsif($i < 0.50) {$str .= $normal;}
	         elsif($i < 0.0.85) {$str .= $bad;}
		    elsif($i < 0.95) {$str .= $very_bad;}
		       else{$str .= $blank;}

	$str .= $mass2[1].$blank." ".$mass2[2]." ".$mass2[3]." ^fg(#008000)".$mass2[4].$blank." ".$mass2[5]." ";

	print(<STDOUT>,"$str\n");

}
