using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CiniciFinal.Migrations
{
    public partial class CreateUsersadasdsasdasd : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Size",
                table: "BasketItems",
                type: "nvarchar(max)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Size",
                table: "BasketItems");
        }
    }
}
