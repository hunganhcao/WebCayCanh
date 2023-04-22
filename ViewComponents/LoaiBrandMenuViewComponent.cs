

using BTThucTap.Models;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Mvc;
using BtThucTapFinal.Responsitory;
using System.Reflection.Metadata.Ecma335;

namespace BtThucTapFinal.ViewComponents
{
    public class LoaiBrandMenuViewComponent : ViewComponent
    {
        private readonly ILoaiBrandResponsitory _loaiBrand;

        public LoaiBrandMenuViewComponent(ILoaiBrandResponsitory loaiBrandResponsitory)
        {
            _loaiBrand = loaiBrandResponsitory;
        }
        public IViewComponentResult Invoke()
        {
            var loaibrand = _loaiBrand.GetAllLoaiBrand().OrderBy(x => x.Name);
          
            return View(loaibrand);
      
        }
       

    
    

    }
    }
