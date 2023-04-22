using BTThucTap.Models;
namespace BtThucTapFinal.Responsitory
{
    public interface ILoaiBrandResponsitory
    {
        Manufacturer Add(Manufacturer manufacturerId);
        Manufacturer Update(Manufacturer manufacturerId);
        Manufacturer Delete(Manufacturer manufacturerId);
        Manufacturer GetLoaiBrand(Manufacturer manufacturerId);
        IEnumerable<Manufacturer> GetAllLoaiBrand();

        Category Add(Category categoryId);
        Category Update(Category categoryId);
        Category Delete(Category categoryId);
        Category GetLoaiCategory(Category category);
        IEnumerable<Category> GetAllLoaiCategory();

        Product Add(Product optionId);
        Product Update(Product optionId);
        Product Delete(Product optionId);
        Product GetLoaiPrice(Product optionId);
        IEnumerable<Product> GetAllLoaiPrice();

       





    }
}
