// This file is part of LINGMO VirtualPC. License: LGPLv2+

[GtkTemplate (ui = "/org/lingmo/VirtualPC/ui/preferences/device-list-row.ui")]
private class VirtualPC.DeviceListRow : Hdy.ActionRow {
    [GtkChild]
    private unowned Gtk.Switch toggle;

    public DeviceListRow (VirtualPC.UsbDevice device) {
        title = device.title;

        toggle.set_active (device.active);
        device.bind_property ("active", toggle, "active", BindingFlags.BIDIRECTIONAL);
    }
}

class VirtualPC.UsbDevice : GLib.Object {
    public string title;
    public bool active { get; set; }
}
