// My overrides
user_pref("browser.startup.page", 1); // Set startup page to home
user_pref("browser.startup.homepage", "about:home"); // Set home and new tab open Firefox Home
user_pref("browser.newtabpage.enabled", true); // Set newtab page

// Translations
user_pref("browser.translations.enable", false); // Disable website translations
user_pref("browser.translations.panelShown", false); // Hide translation icon from the search bar
user_pref("browser.translations.automaticallyPopup", false); // Disable "Do you want to translate this site" Popup

// WARNING: The following may prevent websites to load / work normally, try disabling them if anything goes wrong
// user_pref("browser.contentblocking.category", "strict");
// user_pref("privacy.resistFingerprinting", true);

user_pref("privacy.resistFingerprinting", false);

/* override recipe: enable session restore ***/
user_pref("browser.startup.page", 3); // 0102
  // user_pref("browser.privatebrowsing.autostart", false); // 0110 required if you had it set as true
  // user_pref("browser.sessionstore.privacy_level", 0); // 1003 optional to restore cookies/formdata
user_pref("privacy.clearOnShutdown.history", false); // 2811
  // user_pref("privacy.cpd.history", false); // 2820 optional to match when you use Ctrl-Shift-Del

user_pref("privacy.resistFingerprinting.letterboxing", false); // Disable window borders (rounded width / height)

user_pref("signon.rememberSignons", false); // 5003: disable saving passwords
