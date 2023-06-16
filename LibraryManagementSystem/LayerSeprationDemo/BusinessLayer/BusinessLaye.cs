using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer;
using Model;

namespace BusinessLayer
{
    public class BusinessLaye
    {
        DataLaye dataLayer = new DataLaye();
        public List<Book> GetBooksDetail()
        {
          List<Book> booksList=  dataLayer.GetBookDetail();
          return booksList; 
        }
        public void AddBook(Book book)
        {
            dataLayer.AddBook(book);
        }
        public void DeleteBook(int? bookId)
        {
            dataLayer.DeleteBook(bookId);
        }
        public Book FetchUpdateDetail(int? updateId)
        {
           Book book= dataLayer.FetchUpdateBook(updateId);
            return book;
        }
        public void UpdateDetail(Book book)
        {
            dataLayer.UpdateDetail(book);
        }
    }
}
