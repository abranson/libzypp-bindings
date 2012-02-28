%ignore zypp::Target::reset;
namespace zypp
{
  // Redefine nested class in global scope for SWIG
  struct DistributionLabel {};
}
%include <zypp/Target.h>
namespace zypp
{
typedef intrusive_ptr<Target> Target_Ptr;
%template(Target_Ptr) intrusive_ptr<Target>;
}
%{
  namespace zypp
  {
    // Tell c++ compiler about SWIGs global class
    typedef Target::DistributionLabel DistributionLabel;
  }
%}
