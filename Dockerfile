FROM perl:5.26.1
MAINTAINER NTLx <lx3325360@gmail.com>
LABEL software="bioperl" \
	base_image="perl:5.26" \
	container="bioperl" \
	about.summary="Perl tools for computational molecular biology" \
	about.home="https://www.cubicise.com"
RUN if ! (perl -MCPAN -e 'CPAN::HandleConfig->load();' -e 'CPAN::HandleConfig->prettyprint("urllist")' | grep -qF 'https://mirrors.tuna.tsinghua.edu.cn/CPAN/'); then perl -MCPAN -e 'CPAN::HandleConfig->load();' -e 'CPAN::HandleConfig->edit("urllist", "unshift", "https://mirrors.tuna.tsinghua.edu.cn/CPAN/");' -e 'CPAN::HandleConfig->commit()' ; fi && cpanm -n Term::ReadLine::Perl Log::Log4perl Getopt::Long Date::Manip YAML::Any Statistics::Descriptive File::Basename Parallel::ForkManager POSIX JSON Data::Dumper Cwd List::Util PAR::Packer && rm -rf ~/.cpan* && mkdir -p /workdir
WORKDIR /workdir
CMD ["perl","pp"]