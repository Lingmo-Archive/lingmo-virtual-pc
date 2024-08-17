// This file is part of LINGMO VirtualPC. License: LGPLv2+

private class VirtualPC.ToastOverlay : Gtk.Overlay {
    private VirtualPC.Toast _toast;
    private VirtualPC.Toast toast {
        set {
            if (_toast != null) {
                _toast.dismiss ();
            }

            _toast = value;
            add_overlay (_toast);
        }

        get {
            return _toast;
        }
    }

    public void display_toast (VirtualPC.Toast toast) {
        this.toast = toast;
    }

    public void dismiss () {
        if (toast != null) {
            toast.dismiss ();
            _toast = null;
        }
    }
}
