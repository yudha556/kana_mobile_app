class UploadType {
  final List<String> allowedExtensions;
  final int maxSizeMB;
  final String label;

  const UploadType({
    required this.allowedExtensions,
    required this.maxSizeMB,
    required this.label,
  });

  static const pdf = UploadType(
    allowedExtensions: ['pdf'],
    maxSizeMB: 10,
    label: "PDF Material",
  );

  static const image = UploadType(
    allowedExtensions: ['png', 'jpg', 'jpeg'],
    maxSizeMB: 5,
    label: "Image",
  );
}
