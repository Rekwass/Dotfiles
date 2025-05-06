// Arkenfox overrides

// WARNING: The following may prevent websites to load / work normally, try disabling it if anything goes wrong
// user_pref("privacy.resistFingerprinting", true);

user_pref("browser.startup.page", 3); // 0102 Set startup page to resume previous session
user_pref("browser.startup.homepage", "about:home"); // 0103 Set home and new tab open Firefox Home
user_pref("browser.newtabpage.enabled", true); // 0104 Set newtab page

user_pref("signon.autofillForms", false); // 0903 Disable auto-filling username & password form fields

user_pref("browser.contentblocking.category", "strict"); // 2701 Set content blocking to strict
// INFO: The following preference is required to enable session restore after shutdown
user_pref("privacy.clearOnShutdown_v2.historyFormDataAndDownloads", false); // 2811 Do not erase history, formdata nor download on shutdown
user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", false); // 2815 Do not erase cookie nor storage on shutdown

user_pref("privacy.resistFingerprinting", false); // 4501 Disable RFP
user_pref("privacy.resistFingerprinting.letterboxing", false); // 4504 Disable window borders (rounded width / height)
user_pref("webgl.disabled", false); // 4520 Enable WebGL

user_pref("signon.rememberSignons", false); // 5003 Disable saving passwords

// Miscellaneous

// Translations
user_pref("browser.translations.enable", false); // Disable website translations
user_pref("browser.translations.panelShown", false); // Hide translation icon from the search bar
user_pref("browser.translations.automaticallyPopup", false); // Disable "Do you want to translate this site" Popup
