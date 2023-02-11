#!/usr/bin/perl
 
use strict;
 
my %hash=();
 
open(RF,"C:/Users/tianr/Desktop/zhangqian/clinical.txt") or die $!;
while(my $line=<RF>){
	#print "my $line=<RF>";
	chomp($line);##去掉换行符(/n)
	#print "$line\n";
	my @arr = split(/\t/,$line);#\t:水平制表符（相当于TAB键空格效果）；将数据读入数组@arr
	my $sample = shift(@arr);#shift 后跟一个数组，表示将数组的第一个值返回。数组也被改变，其第一个元素被弹出。
	if($.==1){#判断数据的行号，数据的第一行即执行以下语句，否则跳出。
		#print "hello";
		$hash{"id"}=join("\t",@arr);#把数组@arr中的所有元素组合成一个字符串，元素间用函数给定的分隔符分割。
		next;#语句将返回到循环体的起始处开始执行下一次循环。
	}
	$hash{$sample}=join("\t",@arr);#key:$sample,value:@arr
	
	#print "world"
}
#print $hash{"TCGA-E5-A4TZ-01"};
#print %hash;
close(RF);
 
 
open(RF,"C:/Users/tianr/Desktop/zhangqian/singleGene.txt") or die $!;
open(WF,">C:/Users/tianr/Desktop/zhangqian/singleGeneClinical.txt") or die $!;
 
while(my $line=<RF>){
	chomp($line);
	my @arr = split(/\t/,$line);#将3数据分开，存入数组@arr
	my $sample=shift(@arr);
	my $tumor = pop(@arr);#把数组最后一个元素取出来并返回其值。
	my @sample = (localtime(time));#localtime(time):把time变成本地时间格式。
	if ($sample[5]>130){next;}
	#print $samp1e[5]."\n";
	if($.==1){
		print WF "id\t$hash{\"id\"}\t".join("\t",@arr)."\n";#写入文件singleGeneClinical.txt
		next;
	}
	my @sampleArr = split(/\-/,$sample);#以“-”拆分数据，并存入数组@sampleArr
	#print @sampleArr[3] =~/^0/."\n";
	if($sampleArr[3]=~/^0/){#匹配$sampleArr[3]中以0开头的字符。
		my $sampleName="$sampleArr[0]-$sampleArr[1]-$sampleArr[2]";#提取$sampleArr中前三个元素存入$sampleName
		if(exists $hash{$sampleName}){#判断哈希表中是否存在$sampleName,存在就读取。
			print WF "$sample\t$hash{$sampleName}\t".join("",@arr)."\n";#生成singleGeneClinical.txt
			delete($hash{$sampleName});#删除hash字典中$sampleName和其对应的值。
		}
	}
}
close(WF);
close(RF);