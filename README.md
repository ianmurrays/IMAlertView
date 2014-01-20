IMAlertView
===========

IMAlertView adds a blocks-based interface to UIAlertView, allowing the developer to avoid implementing a delegate for it.

Example Uses
------------


    IMAlertView *alert = [IMAlertView alertViewWithTitle:@"What to do?" message:@"What do you want to do?"];
    
    // Add a button with no action, which dismisses the alert
    [alert addButtonWithTitle:@"Nothing"];
    
    // Add a button with an action, which executes the block when tapped.
    [alert addButtonWithTitle:@"Party!" handler:^{
      [PartyFactory partyHard];
    }];
    
