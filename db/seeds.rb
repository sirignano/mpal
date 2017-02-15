fichier_intervenants = File.read(Rails.root.join('db/seed_intervenants.json'))
intervenants_json = JSON.parse(fichier_intervenants)
intervenants_json.each do |attributes|
  intervenant = Intervenant.find_or_initialize_by(raison_sociale: attributes["raison_sociale"])
  intervenant.assign_attributes(attributes)
  intervenant.save
end

autonomie = Theme.find_or_create_by(libelle: 'Autonomie')
Prestation.find_or_create_by(theme: autonomie, libelle: "Remplacement d’une baignoire par une douche")
Prestation.find_or_create_by(theme: autonomie, libelle: "Barre de maintien")
Prestation.find_or_create_by(theme: autonomie, libelle: "WC surélevé")
Prestation.find_or_create_by(theme: autonomie, libelle: "Lavabo adapté")
Prestation.find_or_create_by(theme: autonomie, libelle: "Monte Escalier - Ascenseur - Monte personne")
Prestation.find_or_create_by(theme: autonomie, libelle: "Meubles PMR")
Prestation.find_or_create_by(theme: autonomie, libelle: "Unité de vie")
Prestation.find_or_create_by(theme: autonomie, libelle: "Volets roulants")
Prestation.find_or_create_by(theme: autonomie, libelle: "Motorisation de volets roulants")
Prestation.find_or_create_by(theme: autonomie, libelle: "Élargissement de portes")
Prestation.find_or_create_by(theme: autonomie, libelle: "Transformation d’une pièce non habitable en salle de bain")
Prestation.find_or_create_by(theme: autonomie, libelle: "Création unité de vie dans annexe")
Prestation.find_or_create_by(theme: autonomie, libelle: "Élargissement cloisons")
Prestation.find_or_create_by(theme: autonomie, libelle: "Repères lumineux pour personne malentendante")
Prestation.find_or_create_by(theme: autonomie, libelle: "Cheminement extérieur")

habiter = Theme.find_or_create_by(libelle: 'Habiter mieux')
Prestation.find_or_create_by(theme: habiter, libelle: "Chaudière")
Prestation.find_or_create_by(theme: habiter, libelle: "Condensation")
Prestation.find_or_create_by(theme: habiter, libelle: "Basse température")
Prestation.find_or_create_by(theme: habiter, libelle: "Radiateurs")
Prestation.find_or_create_by(theme: habiter, libelle: "Régulation de chauffage")
Prestation.find_or_create_by(theme: habiter, libelle: "Vannes thermostatiques")
Prestation.find_or_create_by(theme: habiter, libelle: "Poëlle à pellets")
Prestation.find_or_create_by(theme: habiter, libelle: "Poëlle bois buches")
Prestation.find_or_create_by(theme: habiter, libelle: "Insert")
Prestation.find_or_create_by(theme: habiter, libelle: "Radiateurs électriques")
Prestation.find_or_create_by(theme: habiter, libelle: "Chauffe eau électrique")
Prestation.find_or_create_by(theme: habiter, libelle: "Chauffe eau thermodynamique")
Prestation.find_or_create_by(theme: habiter, libelle: "Production ECS")
Prestation.find_or_create_by(theme: habiter, libelle: "Chauffe eau solaire")
Prestation.find_or_create_by(theme: habiter, libelle: "VMC simple")
Prestation.find_or_create_by(theme: habiter, libelle: "VMC Double flux")
Prestation.find_or_create_by(theme: habiter, libelle: "VMC Hygro type A")
Prestation.find_or_create_by(theme: habiter, libelle: "VMC Hygro type B")
Prestation.find_or_create_by(theme: habiter, libelle: "Fenêtres")
Prestation.find_or_create_by(theme: habiter, libelle: "Volets")
Prestation.find_or_create_by(theme: habiter, libelle: "Porte d’entrée")
Prestation.find_or_create_by(theme: habiter, libelle: "Isolation mures + plancher +toit")
Prestation.find_or_create_by(theme: habiter, libelle: "Isolation plancher")
Prestation.find_or_create_by(theme: habiter, libelle: "Isolation des combles")
Prestation.find_or_create_by(theme: habiter, libelle: "Isolation sous toiture")
Prestation.find_or_create_by(theme: habiter, libelle: "Isolation murs extérieurs")
Prestation.find_or_create_by(theme: habiter, libelle: "Pompe à chaleur air/air")
Prestation.find_or_create_by(theme: habiter, libelle: "Pompe à chaleur air/eau")
Prestation.find_or_create_by(theme: habiter, libelle: "Pompe à chaleur eau/air")
Prestation.find_or_create_by(theme: habiter, libelle: "Pompe à chaleur eau/eau")
Prestation.find_or_create_by(theme: habiter, libelle: "Géothermie")

autres = Theme.find_or_create_by(libelle: 'Autres travaux')
Prestation.find_or_create_by(theme: autres, libelle: 'Couverture')
Prestation.find_or_create_by(theme: autres, libelle: 'Charpente')
Prestation.find_or_create_by(theme: autres, libelle: 'Fumisterie')
Prestation.find_or_create_by(theme: autres, libelle: 'Gros oeuvre (mur, dalles...)')
Prestation.find_or_create_by(theme: autres, libelle: 'Carrelages - Faïences')
Prestation.find_or_create_by(theme: autres, libelle: 'Plomberie sanitaires')
Prestation.find_or_create_by(theme: autres, libelle: 'Électricité')
Prestation.find_or_create_by(theme: autres, libelle: 'Mise en sécurité installation électrique')
Prestation.find_or_create_by(theme: autres, libelle: 'Plâtrerie')
Prestation.find_or_create_by(theme: autres, libelle: 'Menuiseries intérieurs')
Prestation.find_or_create_by(theme: autres, libelle: 'Réseaux')
Prestation.find_or_create_by(theme: autres, libelle: 'Assainissement non collectif')
Prestation.find_or_create_by(theme: autres, libelle: 'Peintures')
Prestation.find_or_create_by(theme: autres, libelle: 'Suppresssion peinture au plomb')

subventions = TypeAide.find_or_create_by(libelle: 'Subventions')
Aide.find_or_create_by(type_aide: subventions, libelle: "Subvention ANAH")
Aide.find_or_create_by(type_aide: subventions, libelle: "Subvention FART")
Aide.find_or_create_by(type_aide: subventions, libelle: "Subvention Commune / EPCI")
Aide.find_or_create_by(type_aide: subventions, libelle: "Subvention Département")
Aide.find_or_create_by(type_aide: subventions, libelle: "Subvention Région")
Aide.find_or_create_by(type_aide: subventions, libelle: "Subvention Europe")
Aide.find_or_create_by(type_aide: subventions, libelle: "Subvention ADEME")
Aide.find_or_create_by(type_aide: subventions, libelle: "Subvention Agende de l'eau")

regime_de_base = TypeAide.find_or_create_by(libelle: 'Regime de base')
Aide.find_or_create_by(type_aide: regime_de_base, libelle: "CNAV/CARSAT")
Aide.find_or_create_by(type_aide: regime_de_base, libelle: "MSA")
Aide.find_or_create_by(type_aide: regime_de_base, libelle: "RSI")

complementaire = TypeAide.find_or_create_by(libelle: 'Aides complémentaires')
Aide.find_or_create_by(type_aide: complementaire, libelle: "AGIRX")
Aide.find_or_create_by(type_aide: complementaire, libelle: "ARRCO")
Aide.find_or_create_by(type_aide: complementaire, libelle: "IRCANTEC")

Aide.find_or_create_by(type_aide: subventions, libelle: "Autres")
