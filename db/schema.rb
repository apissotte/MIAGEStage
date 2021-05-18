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

ActiveRecord::Schema.define(version: 2021_05_18_075517) do

  create_table "etudiants", force: :cascade do |t|
    t.string "num_etudiant"
    t.string "nom"
    t.string "prenom"
    t.string "email_universitaire"
    t.string "email_personnelle"
    t.string "statut_arrivant_L3", limit: 5
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email_personnelle"], name: "index_etudiants_on_email_personnelle", unique: true
    t.index ["email_universitaire"], name: "index_etudiants_on_email_universitaire", unique: true
    t.index ["num_etudiant"], name: "index_etudiants_on_num_etudiant", unique: true
    t.check_constraint "statut_arrivant_L3 IN (\"DSPEG\", \"MIAGE\")"
  end

  create_table "etudiants_formations", id: false, force: :cascade do |t|
    t.integer "formation_id", null: false
    t.integer "etudiant_id", null: false
    t.index ["etudiant_id"], name: "index_etudiants_formations_on_etudiant_id"
    t.index ["formation_id"], name: "index_etudiants_formations_on_formation_id"
  end

  create_table "formations", force: :cascade do |t|
    t.string "mention"
    t.string "libelle"
    t.string "email"
    t.string "code_ue"
    t.integer "promotion_id"
    t.index ["promotion_id"], name: "index_formations_on_promotion_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "annee", limit: 4
    t.index ["annee"], name: "index_promotions_on_annee", unique: true
  end

  add_foreign_key "formations", "promotions"
end
