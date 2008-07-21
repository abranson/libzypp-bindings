// Ignore member functions shadowed by static versions
%ignore zypp::Edition::match(Edition const &) const;
%ignore zypp::Edition::match(IdString const &) const;
%ignore zypp::Edition::match(std::string const &) const;
%ignore zypp::Edition::match(char const *) const;

// ma@: Why do we need this?
//namespace zypp
//{
//   %rename Edition::compare(const Edition& lhs, const Edition& rhs) compare2;
//   %rename Edition::match(const Edition& lhs, const Edition& rhs) match2;
//}

%include <zypp/Edition.h>
%ignore zypp::Edition::match(Edition const &);