using NUnit.Framework;
using ShackUp.Data.ADO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShackUp.Tests.IntegrationTests
{
    [TestFixture]
    public class AdoTests
    {
        [Test]
        public void CanLoadStates()
        {
            var repo = new StatesRepositoryADO();

            var states = repo.GetAll();

            Assert.AreEqual(3, states.Count);
            Assert.AreEqual("KY", states[0].StateId);
            Assert.AreEqual("Kentucky", states[0].StateName);
        }

        [Test]
        public void CanLoadBathroomTypes()
        {
            var repo = new BathroomTypesRepositoryADO();

            var types = repo.GetAll();

            Assert.AreEqual(3, types.Count);
            Assert.AreEqual(1, types[0].BathroomTypeId);
            Assert.AreEqual("Indoor", types[0].BathroomTypeName);
        }

        [Test]
        public void CanLoadListing()
        {
            var repo = new ListingsRepositoryADO();

            var listing = repo.GetById(1);

            Assert.IsNotNull(listing);

            Assert.AreEqual(1, listing.ListingId);
            Assert.AreEqual("00000000-0000-0000-0000-000000000000", listing.UserId);
            Assert.AreEqual("OH", listing.StateId);
            Assert.AreEqual(3, listing.BathroomTypeId);
            Assert.AreEqual("Test shack 1", listing.Nickname);
            Assert.AreEqual("Cleveland", listing.City);
            Assert.AreEqual(120m, listing.Rate);
            Assert.AreEqual(400m, listing.SquareFootage);
            Assert.AreEqual(false, listing.HasElectric);
            Assert.AreEqual(true, listing.HasHeat);
            Assert.AreEqual("placeholder.png", listing.ImageFileName);
        }
    }
}
