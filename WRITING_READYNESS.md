# Préparation de la rédaction

## 1. Éléments désormais prouvés

Le modèle ALP confirme l'implémentation des politiques autonomes de stock produit fini et matière, la distinction `CMD_*` et `REAPPRO_*`, l'initialisation des stocks, le crédit et le décrément du stock fini, le réveil des commandes, l'exclusion des ordres internes des KPI clients, l'échelle temporelle, les mécanismes de qualité, de panne et de goulot, le Blackboard, AER, l'AHP local, le pipeline VSM vers SCOR puis PI, les exports, Return et la garde ISA-95 de 190 noeuds et 71 affectations.

Le JSON prouve la configuration ZENER de cinq acteurs, cinq scénarios, 71 postes, trois matières, la nomenclature du produit nominal, les stocks initiaux détaillés et les délais fournisseurs nominaux.

Le Run B est `VALIDE_EXPERIMENTALEMENT` pour une commande cliente de 20 unités, un ordre autonome `REAPPRO_1`, un approvisionnement GPL de 250 unités, un délai GPL de 6 h porté à 12 h, un retard de 6 h, la propagation des six messages de retard, la séquence Source puis Make puis Deliver, la livraison complète en retard et la clôture à T=1990 s. Excel et ABox portent le même `runId`.

## 2. Éléments encore secondaires

La chronologie de rupture simultanée de l'ancien document, la panne historique du carrousel, les anciens goulots, l'ancienne boucle complète de treize messages, les anciennes valeurs VSM et le PI historique restent `OBSERVE_SECONDAIRE`. Les deux noms DOCX désignent un même contenu binaire et ne constituent pas deux sources.

## 3. Éléments encore non validés

Le Run A de référence, les pics de demande, une campagne qualité avec défauts, un run Return, la comparaison centralisée, décentralisée et hybride, ainsi que toute conclusion d'optimisation globale restent `DISPONIBLE_NON_VALIDE`. Les artefacts historiques Excel et TTL manquent encore.

L'audit des KPI temporels établit que le Waiting Time Excel de 5 256,598 s est reconstruit à partir du Lead Time et du PCE, alors que l'ABox exporte l'attente enregistrée dans `kpiGlobal`, égale à 0 s. Le PCE global de 65 pour cent résulte algébriquement d'une valeur ajoutée fixée à 65 pour cent du Lead Time. Le Lead Time de 15 018,853 s est une durée reconstruite partielle qui exclut l'attente de `CMD_1` pendant la reconstitution et les durées Source et Make portées par `REAPPRO_1`. Ces trois valeurs ne sont pas publiables comme mesures VSM validées.

Le score RS dépend du Lead Time partiel et de l'attente reconstruite. Le PI de 6,227 est donc `CALCULE_MAIS_NON_VALIDABLE`. Le JSON ne contient ni `runId`, ni échelle temporelle, ni paramètres runtime structurés d'activation du retard. Ces paramètres sont visibles dans l'ALP et dans les sorties du Run B, mais le JSON seul ne permet pas de reproduire exactement le test.

## 4. Chapitres pouvant maintenant être rédigés sans réserve majeure

Les chapitres 1 à 5 peuvent rester rédigés après la correction éditoriale du lot existant. Leur contenu fonctionnel et la propagation du retard fournisseur ne dépendent pas de la publication des KPI temporels litigieux.

Le chapitre 6 ne peut pas être rédigé quantitativement avant correction du modèle et validation d'un nouveau run conforme à `sources/VSM_VALIDATION_RUN_PLAN.md`. La méthode du chapitre 7 peut être préparée, mais aucun PI final ne doit être publié tant que Responsiveness n'est pas stabilisé. Le chapitre 8 doit attendre les runs nécessaires. Les résultats historiques de panne et de goulot du chapitre 5 et la discussion quantitative générale restent soumis aux preuves manquantes ou aux réserves recensées.
