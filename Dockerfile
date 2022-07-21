FROM perl:5.26
LABEL maintainer="NTLx <lx3325360@gmail.com>"
RUN if ! (perl -MCPAN -e 'CPAN::HandleConfig->load();' -e 'CPAN::HandleConfig->prettyprint("urllist")' | grep -qF 'https://mirrors.tuna.tsinghua.edu.cn/CPAN/'); then perl -MCPAN -e 'CPAN::HandleConfig->load();' -e 'CPAN::HandleConfig->edit("urllist", "unshift", "https://mirrors.tuna.tsinghua.edu.cn/CPAN/");' -e 'CPAN::HandleConfig->commit()' ; fi && cpanm -n Term::ReadLine::Perl Log::Log4perl Getopt::Long Date::Manip YAML::Any Statistics::Descriptive File::Basename Parallel::ForkManager POSIX JSON Data::Dumper Cwd List::Util PAR PAR::Packer && rm -rf ~/.cpan* && mkdir -p /workdir
WORKDIR /workdir
CMD ["perl","pp"]