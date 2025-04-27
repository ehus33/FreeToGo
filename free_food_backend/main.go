package main

import (
    "github.com/gin-gonic/gin"
    "free_food_backend/database"
    "free_food_backend/routes"
)

func main() {
    router := gin.Default()

    database.Connect()
    routes.SetupRoutes(router)

    router.Run(":8080")
}
