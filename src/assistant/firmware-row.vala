// This file is part of LINGMO VirtualPC. License: LGPLv2+

[GtkTemplate (ui = "/org/lingmo/VirtualPC/ui/assistant/firmware-row.ui")]
private class VirtualPC.FirmwareRow : Hdy.ActionRow {
    [GtkChild]
    private unowned Gtk.RadioButton uefi_button;

    public bool is_uefi {
        get {
            return uefi_button.get_active ();
        }
    }
}
