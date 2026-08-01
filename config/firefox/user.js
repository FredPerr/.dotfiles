// Privacy & Telemetry
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.ping-centre.telemetry", false);

// Tracking Protection
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.socialtracking.enabled", true);
user_pref("network.cookie.cookieBehavior", 5);
user_pref("privacy.annotate_channels.strict_list.enabled", true);

// HTTPS
user_pref("dom.security.https_only_mode", false);
user_pref("dom.security.https_only_mode_ever_enabled", false);

// Disable prefetching & speculative connections
user_pref("network.prefetch-next", false);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.predictor.enabled", false);
user_pref("browser.urlbar.speculativeConnect.enabled", false);

// Fingerprinting resistance (light — won't break most sites)
user_pref("privacy.resistFingerprinting", false);
user_pref("webgl.disabled", false);
user_pref("privacy.firstparty.isolate", true);

// UI & Behavior
user_pref("browser.startup.page", 3);
user_pref("browser.startup.homepage_override.mstone", "ignore");
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.default.sites", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.shell.checkDefaultBrowser", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);

// Disable autofill (using 1Password instead)
user_pref("signon.rememberSignons", false);
user_pref("signon.autofillForms", false);
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);

// Performance
user_pref("gfx.webrender.all", true);
user_pref("layers.acceleration.force-enabled", true);
user_pref("media.hardware-video-decoding.force-enabled", true);
