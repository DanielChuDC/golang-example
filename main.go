package main

import (
	// "net/http"
	controllers "golang-example/controllers" // new
	"golang-example/models"                  // new

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	db := models.SetupModels() // new

	// Provide db variable to controllers
	r.Use(func(c *gin.Context) {
		c.Set("db", db)
		c.Next()
	})

	r.GET("/books", controllers.FindBooks)

	r.POST("/books", controllers.CreateBook) // create

	r.GET("/books/:id", controllers.FindBook) // find by id

	r.PATCH("/books/:id", controllers.UpdateBook) // update by id

	r.DELETE("/books/:id", controllers.DeleteBook) // delete by id

	r.Run()
}
