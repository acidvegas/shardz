Name:           shardz
Version:        1.0.1
Release:        1%{?dist}
Summary:        Utility that shards the output of any process for distributed processing

License:        ISC
URL:            https://github.com/acidvegas/shardz
Source0:        %{url}/archive/v%{version}/%{name}-%{version}.tar.gz

BuildRequires:  gcc
BuildRequires:  make

%description
Shardz is a lightweight C utility that shards (splits) the output of any process
for distributed processing. It allows you to easily distribute workloads across
multiple processes or machines by splitting input streams into evenly distributed chunks.

%prep
%autosetup

%build
%make_build

%install
%make_install

%files
%license LICENSE
%{_bindir}/shardz
%{_mandir}/man1/shardz.1*
%{_libdir}/pkgconfig/shardz.pc

%changelog
* Wed Dec 07 2024 acidvegas <acid.vegas@acid.vegas> - 1.0.1
- Initial package 