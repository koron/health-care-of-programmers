use PDF::API2;

if (@ARGV < 2) {
    print "USAGE: finish.pl {IN_PDF} {OUT_PDF}\n";
    exit 1;
}

$pdf = PDF::API2->open($ARGV[0]);
$pdf->{'catalog'}->{'PageLayout'} = PDF::API2::PDFName('TwoPageRight');
$pdf->{'pdf'}->out_obj($pdf->{'catalog'});

my $p1 = $pdf->page(2);
$p1->mediabox("A5");

my $p2 = $pdf->page();
$p2->mediabox("A5");

$pdf->saveas($ARGV[1]);
