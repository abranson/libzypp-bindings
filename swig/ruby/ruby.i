

%rename *::asString "__str__";


namespace zypp
{
    // Not ignoring gives a very strange error in the "pokus" testsuite: SWIG
    // defines a Ruby module-function "==" which (when included into the main
    // namespace) is apparently used where is should not.
    %ignore operator==;

    // Just to avoid warnings.
    %ignore operator!=;
    %ignore operator<<;

    namespace filesystem
    {
	// Same as above.
	%ignore operator==;
	%ignore operator!=;
	%ignore operator<<;
    }
}


/*
 *  Extend cls with an ruby-like each iterator and a to_a method.  Yields
 *  objects of type storetype.  Parameter storetype must be a pointer type.
 */
#define iter2(cls, storetype) \
%mixin cls "Enumerable"; \
%extend cls \
{ \
    void each() { \
	cls::const_iterator i = self->begin(); \
        while (i != self->end()) { \
	    const storetype tmp = &**i; \
	    rb_yield(SWIG_NewPointerObj((void*) tmp, $descriptor(storetype), 0)); \
            i++; \
        } \
    } \
\
    VALUE to_a() { \
        VALUE ary = rb_ary_new(); \
	cls::const_iterator i = self->begin(); \
        while (i != self->end()) { \
	    const storetype tmp = &**i; \
            rb_ary_push(ary, SWIG_NewPointerObj((void*) tmp, $descriptor(storetype), 0)); \
            i++; \
        } \
        return ary; \
    } \
}


/*
 *  Like iter2, but does only one dereferencing from the iterator.
 */
#define iter3(cls, storetype) \
%mixin cls "Enumerable"; \
%extend cls \
{ \
    void each() { \
	cls::const_iterator i = self->begin(); \
        while (i != self->end()) { \
	    const storetype tmp = &*i; \
	    rb_yield(SWIG_NewPointerObj((void*) tmp, $descriptor(storetype), 0)); \
            i++; \
        } \
    } \
\
    VALUE to_a() { \
        VALUE ary = rb_ary_new(); \
	cls::const_iterator i = self->begin(); \
        while (i != self->end()) { \
	    const storetype tmp = &*i; \
            rb_ary_push(ary, SWIG_NewPointerObj((void*) tmp, $descriptor(storetype), 0)); \
            i++; \
        } \
        return ary; \
    } \
}


%exception
{
  try {
    $action
  }
  catch (const Exception& e) {
    static VALUE zyppexception = rb_define_class("ZYppException", rb_eStandardError);
    std::string tmp = e.asString() + e.asUserString();
    rb_raise(zyppexception, tmp.c_str());
  }
}

