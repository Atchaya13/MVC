using Model;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;




namespace DataLayer
{
    public class DataLaye:ILibraryManagementSystem
    {
        LibraryManagementSystemNewEntities1 libraryManagementSystemEntities = new LibraryManagementSystemNewEntities1();
       public List<Book> GetBookDetail()
       {
            List<Book> books = libraryManagementSystemEntities.Books.ToList();
            return books;
       }
        public void AddBook(Book book)
        {
            libraryManagementSystemEntities.Books.Add(book);
            libraryManagementSystemEntities.SaveChanges();
        }
        public void DeleteBook(int? bookId)
        {
            var book = libraryManagementSystemEntities.Books.Find(bookId);
            if (book != null)
            {
               libraryManagementSystemEntities.Books.Remove(book);
               libraryManagementSystemEntities.SaveChanges();

            }
           
        }
        public Book FetchUpdateBook(int? bookId)
        {
            var book = libraryManagementSystemEntities.Books.Find(bookId);
            return book;
        }
        public void UpdateDetail(Book book)
        {
            libraryManagementSystemEntities.Books.AddOrUpdate(book);
            libraryManagementSystemEntities.SaveChanges();
        }
    }
}
