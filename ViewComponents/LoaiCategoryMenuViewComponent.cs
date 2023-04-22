using Microsoft.AspNetCore.Mvc;
using BTThucTap.Models;
using BtThucTapFinal.Responsitory;

namespace BtThucTapFinal.ViewComponents
{
    public class LoaiCategoryMenuViewComponent : ViewComponent
    {
        private readonly ILoaiBrandResponsitory _loaiCategory;
        public LoaiCategoryMenuViewComponent(ILoaiBrandResponsitory loaiBrandResponsitory)
        {
            _loaiCategory = loaiBrandResponsitory;
        }
        public IViewComponentResult Invoke()
        {
            var loaicategory = _loaiCategory.GetAllLoaiCategory().OrderBy(x => x.Id);
            //categoty


            return View(loaicategory);

        }

        
    }
}
