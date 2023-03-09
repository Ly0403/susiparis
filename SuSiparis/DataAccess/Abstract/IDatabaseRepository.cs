using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace SuSiparis.DataAccess.Abstract
{
    public interface IDatabaseRepository<T> where T : class, new()
    {
        List<T> GetAll(Expression<Func<T, bool>> filter = null);
        T Get(Expression<Func<T, bool>> filter);

        void Add(T item);
        void Delete(T item);
        void Update(T item);
        IQueryable<T> GetItems(Expression<Func<T, bool>> filter = null);
    }
}
