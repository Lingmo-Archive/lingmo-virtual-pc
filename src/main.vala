// This file is part of LINGMO VirtualPC. License: LGPLv2+
using Config;
using Posix;

private static bool version;
private static bool checks;

private const OptionEntry[] local_options = {
    { "version", 0, 0, OptionArg.NONE, ref version, N_("Display version number"), null },
    { "checks", 0, 0, OptionArg.NONE, ref checks, N_("Check virtualization capabilities"), null },
    { null }
};

private static void parse_local_args (ref unowned string[] args) {
    var opt_context = new OptionContext (null);
    opt_context.set_ignore_unknown_options (true);
    opt_context.add_main_entries (local_options, null);
    opt_context.set_help_enabled (false);

    try {
        opt_context.parse (ref args);
    } catch (OptionError error) {
    }

    if (version) {
        GLib.stdout.printf ("%s\n", Config.PACKAGE_VERSION);
        exit (0);
    }

    if (checks) {
        var loop = new GLib.MainLoop ();
        run_checks.begin ((obj, res) => {
            run_checks.end (res);
            loop.quit ();
        });
        loop.run ();
        exit (0);
    }
}

private async void run_checks () {
    string selinux_context_diagnosis = "";
    string storage_pool_diagnosis = "";

    // FIXME do all this in parallel, but how?
    var cpu = yield VirtualPC.check_cpu_vt_capability ();
    var kvm = yield VirtualPC.check_module_kvm_loaded ();
    var libvirt_kvm = yield VirtualPC.check_libvirt_kvm ();
    var selinux_context_default = yield VirtualPC.check_selinux_context_default (out selinux_context_diagnosis);
    var storage_pool = yield VirtualPC.check_storage_pool (out storage_pool_diagnosis);

    // FIXME: add proper UI & docs
    GLib.stdout.printf (_("• The CPU is capable of virtualization: %s\n").printf (VirtualPC.yes_no (cpu)));
    GLib.stdout.printf (_("• The KVM module is loaded: %s\n").printf (VirtualPC.yes_no (kvm)));
    GLib.stdout.printf (_("• Libvirt KVM guest available: %s\n").printf (VirtualPC.yes_no (libvirt_kvm)));
    GLib.stdout.printf (_("• VirtualPC storage pool available: %s\n").printf (VirtualPC.yes_no (storage_pool)));
    if (storage_pool_diagnosis.length != 0)
        GLib.stdout.printf (VirtualPC.indent ("    ", storage_pool_diagnosis) + "\n");

    GLib.stdout.printf (_("• The SELinux context is default: %s\n").printf (VirtualPC.yes_no (selinux_context_default)));
    if (selinux_context_diagnosis.length != 0)
        GLib.stdout.printf (VirtualPC.indent ("    ", selinux_context_diagnosis) + "\n");
    GLib.stdout.printf ("\n");
    GLib.stdout.printf (_("Report bugs to <%s>.\n"), Config.PACKAGE_BUGREPORT);
    GLib.stdout.printf (_("%s home page: <%s>.\n"), Environment.get_application_name (), Config.PACKAGE_URL);
}

public int main (string[] args) {
    Intl.bindtextdomain (GETTEXT_PACKAGE, LOCALEDIR);
    Intl.bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
    Intl.textdomain (GETTEXT_PACKAGE);
    GLib.Environment.set_application_name (_("VirtualPC"));
    GLib.Environment.set_prgname (Config.APPLICATION_ID);

    typeof (VirtualPC.WelcomeTutorial).ensure ();
    typeof (VirtualPC.WelcomeTutorialPage).ensure ();

    parse_local_args (ref args);

    try {
        GVir.init_object_check (ref args);
    } catch (GLib.Error err) {
        error (err.message);
    }

    var app = new VirtualPC.App ();

    var exit_status = app.run (args);

    return exit_status;
}
