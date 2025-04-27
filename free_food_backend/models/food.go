package models

import "gorm.io/gorm"

type FoodListing struct {
    gorm.Model
    BusinessName string `json:"business_name"`
    ItemName     string `json:"item_name"`
    Quantity     int    `json:"quantity"`
    PickupTime   string `json:"pickup_time"`
    Address      string `json:"address"`
    Claimed      bool   `json:"claimed"`
}
