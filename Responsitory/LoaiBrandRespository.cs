using BTThucTap.Models;

namespace BtThucTapFinal.Responsitory
{
    public class LoaiBrandRespository : ILoaiBrandResponsitory
    {
        private readonly QlbanCayContext _context;
        public LoaiBrandRespository(QlbanCayContext context)
        {
            _context = context;
        }

        public Manufacturer Add(Manufacturer manufacturerId)
        {
            _context.Manufacturers.Add(manufacturerId);
            _context.SaveChanges();
            return manufacturerId;
        }

        public Manufacturer Delete(Manufacturer manufacturerId)
        {
            throw new NotImplementedException();
        }
        public IEnumerable<Manufacturer> GetAllLoaiBrand()
        {
            return _context.Manufacturers;
        }

        public Manufacturer GetLoaiBrand(Manufacturer manufacturerId)
        {
            return _context.Manufacturers.Find(manufacturerId);
        }

        public Manufacturer Update(Manufacturer manufacturerId)
        {
            _context.Update(manufacturerId);
            _context.SaveChanges();
            return manufacturerId;
        }

        ////category
        //public Category Add(Category categoryId)
        //{
        //    _context.Categories.Add(categoryId);
        //    _context.SaveChanges();
        //    return categoryId;
        //}

        //public Category Delete(Category categoryId)
        //{
        //    throw new NotImplementedException();
        //}
        //public IEnumerable<Category> GetAllLoaiCategory()
        //{
        //    return _context.Categories;
        //}

        //public Category GetLoaiCategory(Category categoryId)
        //{
        //    return _context.Categories.Find(categoryId);
        //}

        //public Category Update(Category categoryId)
        //{
        //    _context.Update(categoryId);
        //    _context.SaveChanges();
        //    return categoryId;
        //}

        //Category ILoaiBrandResponsitory.GetLoaiCategory(Category category)
        //{
        //    throw new NotImplementedException();
        //}
        ////option price
        //public Option Add(Option optionId)
        //{
        //    _context.Options.Add(optionId);
        //    _context.SaveChanges();
        //    return optionId;
        //}

        //public Option Delete(Option optionId)
        //{
        //    throw new NotImplementedException();
        //}
        //public IEnumerable<Option> GetAllLoaiPrice()
        //{
        //    return _context.Options;
        //}

        //public Option GetLoaiPrice(Option optionId)
        //{
        //    return _context.Options.Find(optionId);
        //}

        //public Option Update(Option optionId)
        //{
        //    _context.Update(optionId);
        //    _context.SaveChanges();
        //    return optionId;
        //}

        //Option ILoaiBrandResponsitory.GetLoaiPrice(Option optionId)
        //{
        //    throw new NotImplementedException();
        //}
        ////size

        //public IEnumerable<Option> GetAllLoaiSize()
        //{
        //    return _context.Options;
        //}

        ////public Option GetLoaiSize(Option optionId)
        ////{
        ////    return _context.Options.Find(optionId);
        ////}
        //public IEnumerable<Option> GetAllLoaiColor()
        //{
        //    return _context.Options;
        //}
       

        public Category Add(Category categoryId)
        {
            _context.Categories.Add(categoryId);
                _context.SaveChanges();
                return categoryId;
        
        }

        public Product Add(Product optionId)
        {
            _context.Products.Add(optionId);
            _context.SaveChanges();
            return optionId;
        
        }

        

        public Category Delete(Category categoryId)
        {
            throw new NotImplementedException();
        }

        public Product Delete(Product optionId)
        {
            throw new NotImplementedException();
        }

       

        public IEnumerable<Category> GetAllLoaiCategory()
        {
            return _context.Categories;
        }

        public IEnumerable<Product> GetAllLoaiPrice()
        {
            return _context.Products;
        }

      

        public Category GetLoaiCategory(Category category)
        {
           return _context.Categories.Find(category);
        }

        public Product GetLoaiPrice(Product optionId)
        {
            return _context.Products.Find(optionId);
        }

        

        public Category Update(Category categoryId)
        {
            _context.Update(categoryId);
            _context.SaveChanges();
            return categoryId;
        }

        public Product Update(Product optionId)
        {
            _context.Update(optionId);
            _context.SaveChanges();
            return optionId;
        }
    }
}
