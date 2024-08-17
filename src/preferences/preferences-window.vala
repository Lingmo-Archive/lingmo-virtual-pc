// This file is part of LINGMO VirtualPC. License: LGPLv2+
using Gtk;

[GtkTemplate (ui = "/org/lingmo/VirtualPC/ui/preferences/preferences-window.ui")]
private class VirtualPC.PreferencesWindow : Hdy.PreferencesWindow {
    public Machine machine {
        set {
            resources_page.setup (value as LibvirtMachine);
            devices_page.setup (value as LibvirtMachine);
            snapshots_page.setup (value as LibvirtMachine);
        }
    }

    [GtkChild]
    private unowned VirtualPC.ResourcesPage resources_page;
    [GtkChild]
    private unowned VirtualPC.DevicesPage devices_page;
    [GtkChild]
    private unowned VirtualPC.SnapshotsPage snapshots_page;

    public void show_troubleshoot_logs () {
        resources_page.show_logs ();
    }
}
