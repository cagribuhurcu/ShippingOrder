using Microsoft.EntityFrameworkCore;
using ShippingOrderProject.Domain.Abstraction;
using ShippingOrderProject.Domain.Repositories;

namespace ShippingOrderProject.Infrastructure.Repositories
{
    public class Repository<TEntity, TContext> : IRepository<TEntity> 
        where TEntity : Entity 
        where TContext : DbContext
    {
        protected readonly TContext _context;
        public Repository(TContext context)
        {
            _context = context;
        }

        public async Task AddAsync(TEntity entity)
        {
            await _context.Set<TEntity>().AddAsync(entity);
        }

        public void Delete(TEntity entity)
        {
            _context.Set<TEntity>().Remove(entity);
        }

        public IQueryable<TEntity> GetAll()
        {
            return _context.Set<TEntity>().AsNoTracking();
        }

        public async Task<IEnumerable<TEntity>> GetAllAsync()
        {
            return await _context.Set<TEntity>().ToListAsync();
        }

        public async Task<TEntity> GetByIdAsync(int id)
        {
            return await _context.Set<TEntity>().FindAsync(id);
        }

        public void Update(TEntity entity)
        {
            _context.Set<TEntity>().Update(entity);
        }
    }
}
