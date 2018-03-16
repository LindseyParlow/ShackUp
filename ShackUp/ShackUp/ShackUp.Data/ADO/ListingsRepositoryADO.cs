using ShackUp.Data.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ShackUp.Models.Tables;
using System.Data.SqlClient;
using System.Data;

namespace ShackUp.Data.ADO
{
    public class ListingsRepositoryADO : IListingsRepository
    {
        public void Delete(int listingId)
        {
            throw new NotImplementedException();
        }

        public Listing GetById(int listingId)
        {
            Listing listing = null;

            using (var cn = new SqlConnection(Settings.GetConnectionString()))
            {
                SqlCommand cmd = new SqlCommand("ListingsSelect", cn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ListingId", listingId);

                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        listing = new Listing();
                        listing.ListingId = (int)dr["ListingId"];
                        listing.UserId = dr["UserId"].ToString();
                        listing.StateId = dr["StateId"].ToString();
                        listing.BathroomTypeId = (int)dr["BathroomTypeId"];
                        listing.Nickname = dr["Nickname"].ToString();
                        listing.City = dr["City"].ToString();
                        listing.Rate = (decimal)dr["Rate"];
                        listing.SquareFootage = (decimal)dr["SquareFootage"];
                        listing.HasElectric = (bool)dr["HasElectric"];
                        listing.HasHeat = (bool)dr["HasHeat"];

                        if(dr["ImageFileName"] != DBNull.Value)
                        {
                            listing.ImageFileName = dr["ImageFileName"].ToString();
                        }
                    }
                }
            }
            return listing;
        }

        public void Insert(Listing listing)
        {
            throw new NotImplementedException();
        }

        public void Update(Listing listing)
        {
            throw new NotImplementedException();
        }
    }
}
