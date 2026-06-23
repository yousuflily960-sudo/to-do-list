// Needed because we use StreamSubscription.
//
// A Stream is like a pipe that sends data/events over time.
//
// Example:
//
// Firebase auth changes
//      ↓
// Event sent through Stream
//
// StreamSubscription is the object that listens
// to those events.
import 'dart:async';

// Contains ChangeNotifier.
//
// ChangeNotifier is a Flutter class that can
// notify other objects when something changes.
import 'package:flutter/foundation.dart';


// This class connects a Stream to GoRouter.
//
// Its job:
//
// Listen to a Stream
//        ↓
// Something changes
//        ↓
// notifyListeners()
//        ↓
// GoRouter refreshes
class GoRouterRefreshStream extends ChangeNotifier {

  // Constructor
  //
  // Runs when the object is created.
  //
  // Example:
  //
  // GoRouterRefreshStream(
  //   firebaseAuth.authStateChanges()
  // )
  //
  // The stream parameter receives
  // Firebase's authentication stream.
  GoRouterRefreshStream(Stream<dynamic> stream) {

    // Listen to the stream.
    //
    // asBroadcastStream()
    // converts the stream into a broadcast stream.
    //
    // A normal stream often allows only one listener.
    //
    // A broadcast stream allows multiple listeners.
    //
    // Think:
    //
    // Normal stream:
    // One person can hear announcements.
    //
    // Broadcast stream:
    // Everyone can hear announcements.
    //
    // listen(...)
    //
    // Starts listening for events.
    //
    // (_) means:
    // "I receive the event but don't need its value."
    //
    // Every time an event arrives:
    //
    // notifyListeners()
    //
    // is called.
    _subscription =
        stream
            .asBroadcastStream()
            .listen((_) => notifyListeners());
  }

  // Stores the active listener.
  //
  // late means:
  // "I promise to initialize this later."
  //
  // final means:
  // "Once assigned, it cannot change."
  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {

    // Stop listening to the stream.
    //
    // This prevents memory leaks.
    //
    // Always cancel subscriptions when done.
    _subscription.cancel();

    // Run the parent's dispose method.
    super.dispose();
  }
}


/*
=================================================
WHAT IS ACTUALLY HAPPENING?
=================================================

Imagine:

User opens app
      ↓
GoRouter is running
      ↓
User signs in
      ↓
Firebase sends auth event
      ↓
authStateChanges() stream emits event
      ↓
GoRouterRefreshStream hears it
      ↓
notifyListeners()
      ↓
GoRouter refreshes
      ↓
redirect() runs again
      ↓
User sent to correct screen


=================================================
KEY WORDS
=================================================

Stream
---------------------------------

A source of events over time.

Example:

Event 1
Event 2
Event 3

Firebase auth changes are sent through a stream.


StreamSubscription
---------------------------------

The listener attached to a stream.

Example:

TV channel
     ↓
You subscribe
     ↓
You receive broadcasts


ChangeNotifier
---------------------------------

Object that can tell others:

"Something changed!"


notifyListeners()
---------------------------------

Sends the message:

"Something changed!"


dispose()
---------------------------------

Cleanup method.

Used to:

- Close streams
- Cancel subscriptions
- Free memory


=================================================
WHY DO WE NEED THIS CLASS?
=================================================

Without this class:

User logs in
      ↓
Firebase knows
      ↓
GoRouter DOES NOT know


With this class:

User logs in
      ↓
Firebase knows
      ↓
GoRouterRefreshStream knows
      ↓
notifyListeners()
      ↓
GoRouter knows
      ↓
redirect() runs
      ↓
Navigation updates automatically

*/