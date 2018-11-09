Feature:
  As a referent, animator or simple adherent
  In order to see all my informations
  I should be able to acces my dashboard

  Background:
    Given the following fixtures are loaded:
      | LoadAdherentData        |
      | LoadTurnkeyProjectData  |
      | LoadCitizenProjectData  |
      | LoadEventData           |

  # Adherent
  Scenario: As an adherent, I can see information about me
    Given I am logged as "damien.schmidt@example.ch"
    When I am on "/espace-adherent/tableau-de-bord"
    Then I should see "Bienvenue, Damien !"
    And I should see "adhérent depuis"
    And I should see an "img" element

    # As an adherent, I should have an interests section
    Then I should see "Les thématiques qui m'intéressent"
    And I should see "Aucun intérèt pour l'instant, renseignez-en ici"

    # As an adherent, I should have 1 shortcut
    Then I should see "Raccourcis"
    And I should see 1 ".shortcuts ul li" elements
    And I should see "Mes documents"

    # As an adherent, I should have a skills section
    Then I should see "Mes compétences"
    And I should see "Aucune compétence pour l'instant, renseignez-en ici"

    # As an adherent, I should have a committee section
    Then I should see "Les comités dont je fais partie"
    And I should see "En Marche - Suisse"

    # As an adherent, I should have a citizen project section
    Then I should see "Mes projets citoyens"
    And I should see "Aucun projet citoyen pour l'instant, renseignez-en ici"

    # As an adherent, I should have an activity section
    Then I should see "Activité récente"
    And I should see "A rejoint le mouvement En Marche"

  # Referent
  Scenario: As a referent, I can see information about me
    Given I am logged as "referent@en-marche-dev.fr"
    When I am on "/espace-adherent/tableau-de-bord"
    Then I should see "Bienvenue, Referent !"
    And I should see "adhérent depuis janvier 2017"
    And I should see an "img" element

    # As a referent, I can see information about my departement
    Then I should see "Département 13, Département 76, Département 77, Département 92, Espagne, Suisse"
    And I should see "10 adhérents dans ce département, 10 acceptent de recevoir des e-mails."
    And I should see "Envoyer un e-mail"
    And I should see "Créer un événement"
    And I should see 3 ".localization .link--newblue" elements
    And I should see "Voir tous les adhérents"
    And I should see "Voir tous les événements"
    And I should see "Voir tous les comités"

    # As a referent, I should have an email section
    Then I should see "Les e-mails que j'ai envoyés"

    # As a referent, I should have an event section
    Then I should see "Les événements que j'ai créés"
    And I should see "Voir tous les événements"

    # As a referent, I should have an interest section
    Then I should see "Les thématiques qui m'intéressent"
    And I should see "Aucun intérèt pour l'instant, renseignez-en ici"

    # As a referent, I can see 2 shortcuts
    Then I should see 2 ".shortcuts ul li" elements
    And I should see "Mes documents"
    And I should see "Bug ? Nouveau besoin ? Faites-le nous savoir."

  # Animator
  Scenario: As an animator, I can see information about me
    Given I am logged as "jacques.picard@en-marche.fr"
    When I am on "/espace-adherent/tableau-de-bord"
    Then I should see "Bienvenue, Jacques !"
    And I should see "Animateur 🏅, adhérent depuis janvier 2017 "
    And I should see an "img" element

    # As an animator, I should have an e-mail section
    Then I should see "Les e-mails que j'ai envoyés"
    And I should see 2 ".emails ul li" elements
    And I should see "[Comité local] [Comité local] Nouveau message"
    And I should see "destinataires"

    # As an animator, I should have an events section
    Then I should see "Les événements que j'ai créés"
    And I should see 2 ".events ul li" elements
    And I should see "Réunion de réflexion parisienne"
    And I should see "Réunion de réflexion parisienne annulé"

    # As an animator, I should have an interests section
    Then I should see "Les thématiques qui m'intéressent"
    And I should see "Aucun intérèt pour l'instant, renseignez-en ici"

    # As an animator, I should have 2 shortcuts
    Then I should see "Raccourcis"
    And I should see 2 ".shortcuts ul li" elements
    And I should see "Tracts et posters"
    And I should see "Mes documents"

    # As an animator, I should have a skills section
    Then I should see "Mes compétences"
    And I should see "Aucune compétence pour l'instant, renseignez-en ici"

    # As an animator, I should have a committee section
    Then I should see "Les comités dont je fais partie"
    And I should see "En Marche - Comité de Singapour"
    And I should see "En Marche - Comité de New York City"

    # As an animator, I should have a citizen project section
    Then I should see "Mes projets citoyens"
    And I should see "En Marche - Projet citoyen"
    And I should see "Projet citoyen à New York City"

    # As an animator, I should have an activity section
    Then I should see "Activité récente"
    And I should see "A participé à l'événement \"Meeting de Singapour\""
    And I should see "A créé l'événement \"Réunion de réflexion parisienne\""

  # Coordinator de comité
  Scenario: As a committee coordinator, I should have a link to go to my own space
    Given I am logged as "coordinateur@en-marche-dev.fr"
    When I am on "/espace-adherent/tableau-de-bord"
    Then I should see "coordinateur de comité"

  # Coordinator de projet citoyen
  Scenario: As a cp coordinator, I should have a link to go to my own space
    Given I am logged as "coordinatrice-cp@en-marche-dev.fr"
    When I am on "/espace-adherent/tableau-de-bord"
    Then I should see "coordinateur de projet citoyen"

  # Responsable de procuration
  Scenario: As a procuration manager, I should have a link to go to my own space
    Given I am logged as "luciole1989@spambox.fr"
    When I am on "/espace-adherent/tableau-de-bord"
    Then I should see "responsable procuration"
