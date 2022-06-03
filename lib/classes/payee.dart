class Payee {
  String? profileImagePath;
  String? name;
  String? contactNumber;

  Payee(
      {required String profileImagePath,
      required String name,
      required String contactNumber}) {
    this.profileImagePath = profileImagePath;
    this.name = name;
    this.contactNumber = contactNumber;
  }
}

Payee johnDoe = Payee(
  profileImagePath: 'images/demo_profile_images/john-doe.jpg',
  name: 'John Doe',
  contactNumber: '5420 6391',
);

Payee jackDoe = Payee(
  profileImagePath: 'images/demo_profile_images/jack-doe.jpg',
  name: 'Jack Doe',
  contactNumber: '5626 4165',
);

Payee janeDoe = Payee(
  profileImagePath: 'images/demo_profile_images/jane-doe.jpg',
  name: 'Jane Doe',
  contactNumber: '9591 8250',
);

Payee sarahDoe = Payee(
  profileImagePath: 'images/demo_profile_images/sarah-doe.jpg',
  name: 'Sarah Doe',
  contactNumber: '7921 5222',
);

Payee jakeDoe = Payee(
  profileImagePath: 'images/demo_profile_images/jake-doe.jpg',
  name: 'Jake Doe',
  contactNumber: '3917 4177',
);

List<Payee> payees = [johnDoe, jackDoe, janeDoe, sarahDoe, jakeDoe];
