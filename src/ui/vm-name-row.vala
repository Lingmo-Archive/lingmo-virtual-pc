// This file is part of LINGMO VirtualPC. License: LGPLv2+

[GtkTemplate (ui = "/org/lingmo/VirtualPC/ui/vm-name-row.ui")]
private class VirtualPC.VMNameRow : Hdy.PreferencesRow {
    [GtkChild]
    private unowned Gtk.Entry entry;
    public string text { get; set; }

    construct {
        bind_property ("text", entry, "text", BindingFlags.BIDIRECTIONAL);
    }
}
