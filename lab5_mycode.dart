
class Book {
  String title;
  String author;

  Book(this.title, this.author);

  void displayInfo() {
    print('Book Title: $title');
    print('Author: $author');
  }

  Future<void> downloadBook() async {
    print('Starting download for "$title"...');
    
    await Future.delayed(Duration(seconds: 2));
    
    print('Download complete: "$title" is ready!');
  }
}

class EBook extends Book {
  int fileSizeMB;

  EBook(String title, String author, this.fileSizeMB) : super(title, author);
}

void main() async {
  print('=== ASYNC PROGRAM ===\n');

  EBook myEBook = EBook('Mobile Development', 'Warren A.', 25);

  myEBook.displayInfo();
  print('');

  Future<void> downloadTask = myEBook.downloadBook();

  print('-> Other task: User is browsing the library menu...');
  print('-> Other task: The program did not freeze while downloading!');

  await downloadTask;
  print('\n=== Program Finished Successfully ===');
}