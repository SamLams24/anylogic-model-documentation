# État des points scientifiques et techniques

## ISSUE-VSM-001

- Objet: concordance du Waiting Time global entre Excel et ABox.
- Résolution: les deux exports utilisent désormais l'attente issue du registre de commande.
- Preuve: 46 924,40300189 s dans les deux artefacts du run VSM.
- Statut: `CLOS_VALIDE_EXPERIMENTALEMENT`.

## ISSUE-TIME-001

- Objet: définition du Lead Time de commande.
- Résolution: le traitement propre à `CMD_1` et l'attente imputée depuis `REAPPRO_1` sont séparés, puis additionnés.
- Preuve: 18 116,83756052 s plus 46 924,40300189 s donnent exactement 65 041,24056241 s à la précision exportée.
- Statut: `CLOS_VALIDE_EXPERIMENTALEMENT`.

## ISSUE-PCE-001

- Objet: suppression du PCE global constant de 65 pour cent.
- Résolution: le PCE publié est limité au périmètre ZENER et calculé à partir des observations `ACT_4` et des taux VA de poste.
- Preuve: 0,70870898, soit 70,9 pour cent après arrondi.
- Statut: `CLOS_COMME_CONSTANTE_ARTIFICIELLE`.

## ISSUE-PI-001

- Objet: cohérence des entrées Responsiveness et du PI.
- Résolution: `RS.1.1` et `RS.3.94` agrègent respectivement le Lead Time et le Waiting Time corrigés.
- Preuve: scores RL 7,5, RS 5,94733671, AG 4,73462025, CO 0, AM 9,70588235 et PI 6,11881172.
- Statut: `CLOS_VALIDE_DANS_LE_CADRE_DU_MODELE`.

## ISSUE-NORM-001

- Objet: interprétation des profils Bottom/Perfect.
- Constat: les bornes sont des paramètres internes au modèle et ne constituent pas une norme externe ni une calibration métier de ZENER SA Togo.
- Statut: `LIMITE_INTERPRETATION_ABSOLUE`.
- Action future: calibrer les profils sur des historiques ou des objectifs validés par les responsables métier.

## ISSUE-VA-001

- Objet: nature de la valeur ajoutée utilisée pour le PCE.
- Constat: les temps de traitement et d'attente sont observés dans le modèle, mais la part de valeur ajoutée repose sur des taux configurés par poste.
- Statut: `PCE_ESTIME_NON_CHRONOMETRE`.
- Action future: conduire une campagne de chronométrage et documenter les règles VA poste par poste.

## ISSUE-JSON-001

- Objet: paramètres de reproduction du retard fournisseur.
- Constat: le manifeste exporte la configuration du run, mais la graine reste inaccessible dans `Main` et le SHA-256 du preset JSON n'est pas calculé automatiquement.
- Statut: `LIMITE_REPRODUCTIBILITE`.
- Action future: exposer la graine et intégrer l'empreinte du preset au manifeste runtime.

## ISSUE-REAPPRO-001

- Objet: ordre interne partagé par plusieurs commandes clientes.
- Constat: le mécanisme est implémenté, mais le run validé ne couvre qu'une commande et un ordre de reconstitution.
- Statut: `DISPONIBLE_SANS_VALIDATION_QUANTITATIVE`.
- Action future: exécuter un scénario multi-commandes avec couverture partielle et vérifier l'unicité des imputations.
