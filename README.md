This guide describes how to use techniques to hide processes, specifically by creating multiple users with RDPWrap to hide the `todesk` program. Here’s a straightforward explanation and step-by-step guide:

### Overview

The process hiding guide can be used not only for the `todesk` program but also for other programs, as long as these programs are installed under a specific user account rather than for all users.

### Principle

This method leverages RDPWrap to create multiple users. By switching from the currently logged-in user to another user, the `todesk` program window remains on the desktop of the original user. This way, when other computers connect to this computer via `todesk`, no connection prompt will appear, even if the `todesk` account isn't logged in on this computer.

### Batch Scripts

#### handoff.bat

This batch script checks if a `log.txt` marker file exists in the `C:\Windows\Temp\` directory. If it doesn't exist, it will execute the `tsdiscon` command to switch users and create the `log.txt` file as a marker.

#### delete.bat

This script is used to delete the `log.txt` marker file.

### Implementation Steps

1. **Download the Scripts**: Download and place `handoff.bat` and `delete.bat` in a location that's hard to find.
   
2. **Create a Task Schedule**:
   - In the Task Scheduler, create a task set to run regardless of whether a user is logged in or not.
   - The trigger should be set to activate when any user logs in, and the action should be to run `handoff.bat`.

3. **Set Up Another Task Schedule**:
   - The trigger should be set to "When a specific event is logged."
   - Event filter: Log - System, Source - USER32, Event ID - 1074.
   - The action should be to start a program and input the path to `delete.bat`.

Through these steps, the computer will run `handoff.bat` at startup to switch users and delete the marker file at shutdown. This way, even if the `todesk` account isn't logged in, no connection prompt will appear when other computers connect via `todesk`.

### Notes

- **Visibility in Task Manager**: While the `todesk` process is visible in the Task Manager, additional steps can be taken to hide it further.
- **Visibility of User Sessions**: Since RDPWrap creates multiple users, multiple user sessions will be visible in the Task Manager. Specific measures can be taken to hide these as well.
- **Screen Switching Impact**: When using `handoff.bat` to switch users, the screen will jump to the login interface.

### Disclaimer

This README provides a conceptual implementation guide, and the actual implementation results depend on the user's specific actions and optimizations.