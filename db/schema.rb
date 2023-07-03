# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_09_205623) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "nutritionist_id"
    t.string "profile_pic"
    t.string "health_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nutritionist_id"], name: "index_clients_on_nutritionist_id"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "daily_meals", force: :cascade do |t|
    t.bigint "nutritionist_id", null: false
    t.bigint "meal_plan_id", null: false
    t.bigint "meal_type_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "meal_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_plan_id"], name: "index_daily_meals_on_meal_plan_id"
    t.index ["meal_type_id"], name: "index_daily_meals_on_meal_type_id"
    t.index ["nutritionist_id"], name: "index_daily_meals_on_nutritionist_id"
    t.index ["recipe_id"], name: "index_daily_meals_on_recipe_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.bigint "nutritionist_id", null: false
    t.string "macro_nutrients"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nutritionist_id"], name: "index_ingredients_on_nutritionist_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", precision: nil, null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "meal_plans", force: :cascade do |t|
    t.string "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "client_id", null: false
    t.bigint "nutritionist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_meal_plans_on_client_id"
    t.index ["nutritionist_id"], name: "index_meal_plans_on_nutritionist_id"
  end

  create_table "meal_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nutritionists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "profile_pic"
    t.index ["user_id"], name: "index_nutritionists_on_user_id"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "ingredient_id", null: false
    t.float "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.bigint "nutritionist_id", null: false
    t.string "title"
    t.string "picture"
    t.string "description"
    t.string "instructions", array: true
    t.boolean "isPublic", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nutritionist_id"], name: "index_recipes_on_nutritionist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "role", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clients", "users"
  add_foreign_key "daily_meals", "meal_plans"
  add_foreign_key "daily_meals", "meal_types"
  add_foreign_key "daily_meals", "recipes"
  add_foreign_key "ingredients", "nutritionists"
  add_foreign_key "meal_plans", "clients"
  add_foreign_key "meal_plans", "nutritionists"
  add_foreign_key "nutritionists", "users"
  add_foreign_key "recipe_ingredients", "ingredients"
  add_foreign_key "recipe_ingredients", "recipes"
  add_foreign_key "recipes", "nutritionists"
end
