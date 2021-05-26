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

ActiveRecord::Schema.define(version: 2021_05_21_093500) do

  create_table "aides", force: :cascade do |t|
    t.boolean "cv_recu"
    t.boolean "lettre_recu"
    t.string "suivi"
    t.boolean "present_reunion"
    t.integer "etudiant_id"
    t.integer "formation_id"
    t.index ["etudiant_id", "formation_id"], name: "index_aides_on_etudiant_id_and_formation_id", unique: true
    t.index ["etudiant_id"], name: "index_aides_on_etudiant_id"
    t.index ["formation_id"], name: "index_aides_on_formation_id"
  end

  create_table "disponibilites", force: :cascade do |t|
    t.string "statut_reponse"
    t.integer "tuteur_universitaire_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "nb_etudiants_souhaite", default: 0
    t.integer "promotion_id"
    t.index ["promotion_id"], name: "index_disponibilites_on_promotion_id"
    t.index ["tuteur_universitaire_id", "promotion_id"], name: "index_disponibilites_on_tuteur_universitaire_id_and_promotion_id", unique: true
    t.index ["tuteur_universitaire_id"], name: "index_disponibilites_on_tuteur_universitaire_id"
    t.check_constraint "statut_reponse IN (\"OK\",\"ABANDON\",\"PAS_DE_REPONSE\")"
  end

  create_table "entreprises", force: :cascade do |t|
    t.string "siren", limit: 14
    t.string "raison_sociale"
    t.string "ville"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pays", default: "France"
    t.index ["siren"], name: "index_entreprises_on_siren", unique: true
  end

  create_table "etudiants", force: :cascade do |t|
    t.string "num_etudiant"
    t.string "nom"
    t.string "prenom"
    t.string "email_universitaire"
    t.string "email_personnel"
    t.string "statut_arrivant_L3", limit: 5
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_etudiants_on_email", unique: true
    t.index ["email_personnel"], name: "index_etudiants_on_email_personnel", unique: true
    t.index ["email_universitaire"], name: "index_etudiants_on_email_universitaire", unique: true
    t.index ["num_etudiant"], name: "index_etudiants_on_num_etudiant", unique: true
    t.index ["reset_password_token"], name: "index_etudiants_on_reset_password_token", unique: true
    t.check_constraint "statut_arrivant_L3 IN (\"DSPEG\", \"MIAGE\")"
  end

  create_table "etudiants_formations", id: false, force: :cascade do |t|
    t.integer "formation_id", null: false
    t.integer "etudiant_id", null: false
    t.index ["etudiant_id"], name: "index_etudiants_formations_on_etudiant_id"
    t.index ["formation_id"], name: "index_etudiants_formations_on_formation_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.text "contenu"
    t.boolean "auto_evalution"
    t.integer "stage_id"
    t.integer "ge_format_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ge_format_id"], name: "index_evaluations_on_ge_format_id"
    t.index ["stage_id"], name: "index_evaluations_on_stage_id"
  end

  create_table "fiche_stages", force: :cascade do |t|
    t.string "titre"
    t.string "type_stage"
    t.string "mention"
    t.date "date_debut"
    t.date "date_fin"
    t.string "statut"
    t.string "poste"
    t.string "taches"
    t.string "technologies"
    t.string "contact_nom"
    t.string "contact_prenom"
    t.string "contact_poste"
    t.string "tuteur_nom"
    t.string "tuteur_prenom"
    t.string "tuteur_fonction"
    t.string "tuteur_telephone"
    t.string "tuteur_email"
    t.string "entreprise_nom"
    t.string "entreprise_siren"
    t.string "entreprise_cp"
    t.string "entreprise_ville"
    t.string "entreprise_pays"
    t.string "commentaire_validation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "etudiant_id"
    t.index ["etudiant_id"], name: "index_fiche_stages_on_etudiant_id"
    t.check_constraint "mention IN (\"L3\",\"M1\",\"M2\")"
    t.check_constraint "statut IN (\"BROUILLON\", \"VALIDEE\",\"REFUSEE\",\"EN_ATTENTE_DE_VALIDATION\")"
    t.check_constraint "type_stage IN (\"ALTERNANCE\",\"STAGE\")"
  end

  create_table "formations", force: :cascade do |t|
    t.string "mention"
    t.string "libelle"
    t.string "email"
    t.string "code_ue"
    t.integer "promotion_id"
    t.index ["promotion_id"], name: "index_formations_on_promotion_id"
  end

  create_table "ge_formats", force: :cascade do |t|
    t.text "contenu"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "offres", force: :cascade do |t|
    t.string "titre"
    t.string "type"
    t.string "lien_url"
    t.string "mention"
    t.binary "pdf"
    t.date "date_publication"
    t.string "sujet"
    t.integer "entreprise_id"
    t.index ["entreprise_id"], name: "index_offres_on_entreprise_id"
    t.check_constraint "mention IN (\"L3\",\"M1\", \"M2\")"
    t.check_constraint "type IN (\"STAGE\",\"ALTERNANCE\")"
  end

  create_table "offres_technologies", id: false, force: :cascade do |t|
    t.integer "offre_id", null: false
    t.integer "technology_id", null: false
    t.index ["offre_id"], name: "index_offres_technologies_on_offre_id"
    t.index ["technology_id"], name: "index_offres_technologies_on_technology_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "annee", limit: 4
    t.string "statut"
    t.index ["annee"], name: "index_promotions_on_annee", unique: true
    t.check_constraint "statut IN (\"OUVERTE\", \"CLOTUREE\")"
  end

  create_table "stages", force: :cascade do |t|
    t.string "sujet"
    t.date "date_ratification_convention"
    t.float "gratification"
    t.string "type"
    t.string "commentaire"
    t.integer "etudiant_id"
    t.integer "formation_id"
    t.integer "entreprise_id"
    t.integer "tuteur_entreprise_id"
    t.integer "tuteur_universitaire_id"
    t.index ["entreprise_id"], name: "index_stages_on_entreprise_id"
    t.index ["etudiant_id"], name: "index_stages_on_etudiant_id"
    t.index ["formation_id"], name: "index_stages_on_formation_id"
    t.index ["tuteur_entreprise_id"], name: "index_stages_on_tuteur_entreprise_id"
    t.index ["tuteur_universitaire_id"], name: "index_stages_on_tuteur_universitaire_id"
    t.check_constraint "type IN (\"STAGE\", \"ALTERNANCE\")"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "tag"
    t.index ["tag"], name: "index_technologies_on_tag", unique: true
  end

  create_table "tuteur_entreprises", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "email"
    t.string "telephone", limit: 10
    t.integer "entreprise_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entreprise_id"], name: "index_tuteur_entreprises_on_entreprise_id"
  end

  create_table "tuteur_universitaires", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "alias"
    t.string "email"
    t.string "statut_encadrant"
    t.string "fonction"
    t.string "localisation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_tuteur_universitaires_on_email", unique: true
    t.index ["reset_password_token"], name: "index_tuteur_universitaires_on_reset_password_token", unique: true
    t.check_constraint "statut_encadrant IN (\"INDUSTRIE\", \"UNIVERSITAIRE\")"
  end

  create_table "visites", force: :cascade do |t|
    t.date "date"
    t.string "statut"
    t.boolean "relance"
    t.string "commentaire"
    t.integer "stage_id"
    t.index ["stage_id"], name: "index_visites_on_stage_id"
  end

  add_foreign_key "aides", "etudiants"
  add_foreign_key "aides", "formations"
  add_foreign_key "evaluations", "ge_formats"
  add_foreign_key "evaluations", "stages"
  add_foreign_key "fiche_stages", "etudiants"
  add_foreign_key "formations", "promotions"
  add_foreign_key "offres", "entreprises"
  add_foreign_key "stages", "entreprises"
  add_foreign_key "stages", "etudiants"
  add_foreign_key "stages", "formations"
  add_foreign_key "stages", "tuteur_entreprises"
  add_foreign_key "stages", "tuteur_universitaires"
  add_foreign_key "tuteur_entreprises", "entreprises"
  add_foreign_key "visites", "stages"
end
