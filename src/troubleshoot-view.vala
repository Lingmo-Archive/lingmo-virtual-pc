// This file is part of LINGMO VirtualPC. License: LGPLv2+

[GtkTemplate (ui = "/org/lingmo/VirtualPC/ui/troubleshoot-view.ui")]
private class VirtualPC.TroubleshootView : Gtk.Stack, VirtualPC.UI {
    public UIState previous_ui_state { get; protected set; } 
    public UIState ui_state { get; protected set; }

    private AppWindow window;

    public void setup_ui (AppWindow window) {
        this.window = window;
    }
}
