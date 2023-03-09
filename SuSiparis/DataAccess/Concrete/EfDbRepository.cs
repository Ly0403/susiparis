using SuSiparis.DataAccess.Abstract;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace SuSiparis.DataAccess.Concrete
{
    public class EfDbRepository<TEntity, TContext> : IDatabaseRepository<TEntity>
        where TEntity : class,new()
        where TContext:DbContext,new()
    {
        public void Add(TEntity item)
        {
            using (TContext context=new TContext())
            {
                var addedEntity = context.Entry(item);
                addedEntity.State=EntityState.Added;
                context.SaveChanges();
            }
        }

        public void Delete(TEntity item)
        {
            using (TContext context = new TContext())
            {
                var deletedEntity = context.Entry(item);
                deletedEntity.State = EntityState.Deleted;
                context.SaveChanges();
            }
        }

        public TEntity Get(Expression<Func<TEntity, bool>> filter)
        {
            using (TContext context = new TContext())
            {
                return context.Set<TEntity>().FirstOrDefault(filter);
            }
        }

        public List<TEntity> GetAll(Expression<Func<TEntity, bool>> filter = null)
        {
            using (TContext context = new TContext())
            {
                return filter == null ? context.Set<TEntity>().ToList() : context.Set<TEntity>().Where(filter).ToList();
            }
            
        }

        public IQueryable<TEntity> GetItems(Expression<Func<TEntity, bool>> filter = null)
        {
            using (TContext context=new TContext())
            {
                return filter == null ? context.Set<TEntity>() : context.Set<TEntity>().Where(filter);
            }
        }

        public void Update(TEntity item)
        {
            using (TContext context = new TContext())
            {
                var updatedEntity = context.Entry(item);
                updatedEntity.State = EntityState.Modified;
                context.SaveChanges();
            }
        }
    }
}