/* Quartus Prime Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Ign)
		Device PartName(SOCVHPS) MfrSpec(OpMask(0));
	P ActionCode(Cfg)
		Device PartName(5CSEMA5F31) Path("/home/ec2020-ceb/ra165429/mc613/2024s1-mc613-projeto-futari/meikyuu/output_files/") File("meikyuu.sof") MfrSpec(OpMask(1));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;