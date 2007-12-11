  class Patch : public ResObject
  {
  public:
    typedef detail::PatchImplIf      Impl;
    typedef Patch                    Self;
    typedef ResTraits<Self>          TraitsType;
    typedef TraitsType::PtrType      Ptr;
    typedef TraitsType::constPtrType constPtr;

  public:
    typedef Impl::AtomList AtomList;

  public:
    /** Patch ID */
    std::string id() const;
    /** Patch time stamp */
    Date timestamp() const;
    /** Patch category (recommended, security,...) */
    std::string category() const;
    /** Does the system need to reboot to finish the update process? */
    bool reboot_needed() const;
    /** Does the patch affect the package manager itself? */
    bool affects_pkg_manager() const;
    /** The list of all atoms building the patch */
    AtomList atoms() const;
    /** Is the patch installation interactive? (does it need user input?) */
    bool interactive() const;

  protected:
    /** Ctor */
    Patch( const NVRAD & nvrad_r );
    /** Dtor */
    virtual ~Patch();

  private:
    /** Access implementation */
    virtual Impl & pimpl() = 0;
    /** Access implementation */
    virtual const Impl & pimpl() const = 0;
  };

