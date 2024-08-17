// This file is part of LINGMO VirtualPC. License: LGPLv2+

private class VirtualPC.LibvirtClonedMedia : VirtualPC.LibvirtMedia  {
    public LibvirtClonedMedia (string path, GVirConfig.Domain domain_config) throws GLib.Error {
        base (path, domain_config, true);
    }

    public override VMCreator get_vm_creator () {
        return new LibvirtVMCloner (this);
    }
}
