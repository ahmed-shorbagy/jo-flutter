abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

/// An abstract class that represents a failure that can occur during an operation.
///
/// This class is extended by other failure classes to represent specific types of failures.
/// For example, [FirebaseStorageFailure] is a class that represents a storage failure.
///
/// Subclasses of this class should not have public constructors. Instead, they should
/// provide factory constructors that create instances of the subclass with the appropriate
/// parameters.
///
/// The [errMessage] property is a message that describes the failure.
///
/// Subclasses of this class should override the [toString] method to provide a more
/// detailed description of the failure.

class FirebaseStorageFailure extends Failure {
  FirebaseStorageFailure({required super.errMessage});

  factory FirebaseStorageFailure.fromStorageError(String storageException) {
    switch (storageException) {
      case 'storage/unknown':
        return FirebaseStorageFailure(
            errMessage: 'An unknown error occurred. Please try again.');
      case 'storage/object-not-found':
        return FirebaseStorageFailure(
            errMessage: 'No object exists at the desired reference.');
      case 'storage/bucket-not-found':
        return FirebaseStorageFailure(
            errMessage: 'No bucket is configured for Cloud Storage.');
      case 'storage/project-not-found':
        return FirebaseStorageFailure(
            errMessage: 'No project is configured for Cloud Storage.');
      case 'storage/quota-exceeded':
        return FirebaseStorageFailure(
            errMessage:
                'Quota on your Cloud Storage bucket has been exceeded.');
      case 'storage/unauthenticated':
        return FirebaseStorageFailure(
            errMessage:
                'User is unauthenticated. Please authenticate and try again.');
      case 'storage/unauthorized':
        return FirebaseStorageFailure(
            errMessage:
                'User is not authorized to perform the desired action.');
      case 'storage/retry-limit-exceeded':
        return FirebaseStorageFailure(
            errMessage:
                'The maximum time limit on an operation has been exceeded. Try again.');
      case 'storage/invalid-checksum':
        return FirebaseStorageFailure(
            errMessage: 'File checksum does not match. Try uploading again.');
      case 'storage/canceled':
        return FirebaseStorageFailure(
            errMessage: 'User canceled the operation.');
      case 'storage/invalid-event-name':
        return FirebaseStorageFailure(
            errMessage: 'Invalid event name provided.');
      case 'storage/invalid-url':
        return FirebaseStorageFailure(
            errMessage:
                'Invalid URL provided. It must be in the form of gs://bucket/object or https://firebasestorage.googleapis.com/v0/b/bucket/o/object?token=<TOKEN>.');
      case 'storage/invalid-argument':
        return FirebaseStorageFailure(
            errMessage: 'Invalid argument passed to the storage operation.');
      case 'storage/no-default-bucket':
        return FirebaseStorageFailure(
            errMessage: 'No bucket has been set in your configuration.');
      case 'storage/cannot-slice-blob':
        return FirebaseStorageFailure(
            errMessage:
                'Cannot slice blob. Verify that the file hasn\'t changed.');
      case 'storage/server-file-wrong-size':
        return FirebaseStorageFailure(
            errMessage: 'File size mismatch. Try uploading again.');
      default:
        return FirebaseStorageFailure(errMessage: storageException);
    }
  }
}

class FirebaseFailure extends Failure {
  FirebaseFailure({required super.errMessage});
  factory FirebaseFailure.fromFirebaseAuth(String authException) {
    switch (authException) {
      case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
        return FirebaseFailure(errMessage: 'account already exists');
      case 'auth/email-already-exists':
        return FirebaseFailure(errMessage: 'account already exists');
      case 'auth/id-token-expired':
        return FirebaseFailure(errMessage: 'the ocde expired please try again');
      case 'auth/phone-number-already-exists':
        return FirebaseFailure(errMessage: 'the phone number already exists');
      case 'auth/session-cookie-expired':
        return FirebaseFailure(errMessage: 'session expired please try again');
      case 'auth/too-many-requests':
        return FirebaseFailure(
            errMessage: 'too many requests please try again later');
      case 'auth/user-not-found':
        return FirebaseFailure(errMessage: 'no account found please sign up ');
      case 'firebase_auth/invalid-verification-code':
        return FirebaseFailure(errMessage: 'invalid code please try again');
      case '[firebase_auth/invalid-verification-code] The verification code from SMS/TOTP is invalid. Please check and enter the correct verification code again.':
        return FirebaseFailure(errMessage: 'invalid code please try again');
      case '[firebase_auth/session-expired] The sms code has expired. Please re-send the verification code to try again.':
        return FirebaseFailure(
            errMessage: 'session-expired press re-send to try again');
      case '[firebase_auth/email-already-in-use] The email address is already in use by another account.':
        return FirebaseFailure(
            errMessage: 'The account already exists for that email.');
      case 'user-not-found':
        return FirebaseFailure(errMessage: 'No user found for that email.');
      case 'User not found':
        return FirebaseFailure(errMessage: 'User not found');
      case '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.':
        return FirebaseFailure(
            errMessage: 'Wrong password provided for that user.');

      case '[firebase_auth/invalid-email] The email address is badly formatted.':
        return FirebaseFailure(
            errMessage: 'invalid email format please try again');
      case 'network-request-failed':
        return FirebaseFailure(
            errMessage: 'networkRequest error please check your connection');
      case '[firebase_auth/weak-password] Password should be at least 6 characters':
        return FirebaseFailure(
            errMessage: 'Password should be at least 6 characters');
      case "invalid-credential":
        return FirebaseFailure(
            errMessage: 'Invalid Credential Please Try Again');
      case "The user cancelled the login flow.":
        return FirebaseFailure(errMessage: 'cancelled login flow');

      default:
        return FirebaseFailure(errMessage: authException);
    }
  }
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'Your request not found, please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: 'Internal server problem, please try again later!');
    } else {
      return ServerFailure(
          errMessage: 'Oops there was an error, please try again later!');
    }
  }
}
