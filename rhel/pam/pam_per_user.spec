Summary:	PAM module for per-user authentication
Name:		pam_per_user
Version:	0.4
Release:	1%{smg}
License:	distributable
Group:		System Environment/Base
URL:		http://www.feep.net/PAM/pam_per_user/
Source0:	ftp://ftp.feep.net/pub/software/PAM/pam_per_user/%{name}-%{version}.tar.gz
Patch0:		pam_per_user-0.4-types.patch

BuildRequires:	pam-devel


%description
PAM module for per-user authentication


%prep
%setup -q
%patch0 -p1

# don't want authtest
%{__perl} -i -n -e 'next if /DESTDIR.+sbindir/; /^ALL\s*=/ && s/authtest//; print;' Makefile.in

# fix broken test (to define NULL) and regen configure script
%{__perl} -i -n -e 'print; /PSG_SHLIB/ && print "  #include <unistd.h>\n";' configure.ac
autoconf -I autoconf


%build
%configure --disable-encap --disable-epkg-install --libdir=/%{_lib}
%{__make}


%install
%{__rm} -rf %{buildroot}
%{__make} install DESTDIR=%{buildroot}


%clean
%{__rm} -rf %{buildroot}


%files
%defattr(-,root,root,-)
/%{_lib}/security/*
%{_mandir}/man5/*


%changelog
* Wed Aug 24 2011 Seth Leichter <leichter@illinois.edu> 0.4-1
- Initial package.
