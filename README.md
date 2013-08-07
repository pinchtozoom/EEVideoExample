EEVideoExample
==============

Example project to demonstrate how to display media content on iOS without muting system audio (for example the iPod application).

Created for EE to prove that it can be done. Checking data usage in their app was annoying me.

Please note this is a hacked together project... please ignore the slap dash approach in the code!

The important code:

    NSError *setCategoryError = nil;
    BOOL success = [[AVAudioSession sharedInstance]
                    setCategory: AVAudioSessionCategoryAmbient
                    error: &setCategoryError];
    
    if (!success) { /* handle the error in setCategoryError */ }
