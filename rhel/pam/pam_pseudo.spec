Summary:	PAM module for pseudouser authentication
Name:		pam_pseudo
Version:	0.5
Release:	1%{smg}
License:	distributable
Group:		System Environment/Base
URL:		http://www.feep.net/PAM/pam_pseudo/
Source0:	ftp://ftp.feep.net/pub/software/PAM/pam_pseudo/%{name}-%{version}.tar.gz
Patch0:		pam_pseudo-0.4-types.patch

BuildRequires:	pam-devel


%description
PAM module for pseudouser authentication


%prep
%setup -q
%patch0 -p1

# don't want authtest
%{__perl} -i -n -e 'next if /DESTDIR.+sbindir/; /^ALL\s*=/ && s/authtest//; print;' Makefile.in


%build
%configure --disable-encap --disable-epkg-install --libdir=/%{_lib}
%{__make}


%install
%{__rm} -rf %{buildroot}
%{__make} install-real DESTDIR=%{buildroot}


%clean
%{__rm} -rf %{buildroot}


%files
%defattr(-,root,root,-)
/%{_lib}/security/*
%{_mandir}/man5/*


%changelog
* Thu Aug 25 2011 Seth Leichter <leichter@illinois.edu> 0.5-1
- Initial package.

