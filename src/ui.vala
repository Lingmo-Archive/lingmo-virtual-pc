// This file is part of LINGMO VirtualPC. License: LGPLv2+

private enum VirtualPC.UIState {
    NONE,
    COLLECTION,
    CREDS,
    DISPLAY,
    WIZARD,
    PROPERTIES,
    TROUBLESHOOT
}

private interface VirtualPC.UI: GLib.Object {
    public abstract UIState previous_ui_state { get; protected set; }
    public abstract UIState ui_state { get; protected set; }

    public void set_state (UIState new_state) {
        if (ui_state == new_state)
            return;

        previous_ui_state = ui_state;
        ui_state = new_state;
    }
}

