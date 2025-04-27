package routes

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"free_food_backend/database"
	"free_food_backend/models"
)

// SetupRoutes initializes all API endpoint routes
func SetupRoutes(router *gin.Engine) {
	router.GET("/api/health", HealthCheck)
	router.GET("/api/listings", GetListings)
	router.POST("/api/listings", CreateListing)
	router.POST("/api/claim", ClaimListing)
}

// HealthCheck returns a simple alive message
func HealthCheck(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{"message": "Backend is alive!"})
}

// GetListings returns all unclaimed food listings
func GetListings(c *gin.Context) {
	var listings []models.FoodListing
	database.DB.Where("claimed = ?", false).Find(&listings)
	c.JSON(http.StatusOK, listings)
}

// CreateListing allows a business to post new food listings
func CreateListing(c *gin.Context) {
	var listing models.FoodListing
	if err := c.ShouldBindJSON(&listing); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	database.DB.Create(&listing)
	c.JSON(http.StatusOK, listing)
}

// ClaimListing lets a customer claim a listing by ID
func ClaimListing(c *gin.Context) {
	var request struct {
		ID uint `json:"id"`
	}
	if err := c.ShouldBindJSON(&request); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var listing models.FoodListing
	database.DB.First(&listing, request.ID)
	listing.Claimed = true
	database.DB.Save(&listing)
	c.JSON(http.StatusOK, listing)
}
