class SrcPackage : public ResObject
{

  public:
    typedef detail::SrcPackageImplIf    Impl;
    typedef SrcPackage                  Self;
    typedef ResTraits<Self>          TraitsType;
    typedef TraitsType::PtrType      Ptr;
    typedef TraitsType::constPtrType constPtr;

  public:
    /** */
    ByteCount archivesize() const;
    /** Disk usage per directory */
    DiskUsage diskusage() const;
    /** location in source */
    Pathname location() const;

  protected:
    SrcPackage( const NVRAD & nvrad_r );
    /** Dtor */
    virtual ~SrcPackage();

  private:
    /** Access implementation */
    virtual Impl & pimpl() = 0;
    /** Access implementation */
    virtual const Impl & pimpl() const = 0;
};


