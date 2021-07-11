namespace CodePainter {
    public static unowned Gtk.SourceStyleSchemeManager scheme_manager;
    public static unowned Gtk.SourceLanguageManager language_manager;
    public static unowned string scheme_path;
    public static Settings settings;
    
    public class Application : Gtk.Application {
        private MainWindow window;
        
        public Application() {
            application_id = "me.paladin.CodePainter";
            
            scheme_manager = Gtk.SourceStyleSchemeManager.get_default();
            language_manager = Gtk.SourceLanguageManager.get_default();
            
            settings = new Settings("me.paladin.CodePainter");
            scheme_path = scheme_manager.get_search_path()[0];
        }
        
        public override void activate() {
            base.activate();
            
            window = new MainWindow(this);
            window.present();
            
            setup_accels();
        }
        
        public void setup_accels() {
            // Main menu
            set_accels_for_action("win.preferences", { "<Primary>comma" });
            set_accels_for_action("win.inspector", { "<Primary><Shift>I" });
            
            // Create menu
            set_accels_for_action("win.create", { "<Primary>N" });
            set_accels_for_action("win.import", { "<Primary>I" });
        }
    }
}
