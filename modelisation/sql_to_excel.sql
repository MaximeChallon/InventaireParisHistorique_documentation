-- "N_inventaire"|"Rue"|"N_rue"|"Nom_site"|"Arrondissement"|"Ville"|"Departement"|"Latitude_x"|"Longitude_y"|"Support"|"Couleur"|"Taille"|"Date_prise_vue"|"Photographe"|"Droits"|"Mention_don"|"Mention_collection"|"Date_construction"|"Architecte"|"Classement_MH"|"Légende"|"Generalite_architecture"|"Mot_cle1"|"Mot_cle2"|"Mot_cle3"|"Mot_cle4"|"Mot_cle5"|"Mot_cle6"|"Autre_adresse"|"Notes"|"Cote_base"|"Cote_classement"|"Date_inventaire"|"Auteur

with cte as (
	select a.instanceid, a.conceptid, c.textvalue, rank() over(order by a.conceptid) as rang
	from instance_concept a
	inner join instance_identifier b  on b.instanceid = a.instanceid and b.identifiervalue = '78511' and b.identifiertype = 'Identifiant de la base de numérisations'
	left join concept_text c on c.conceptid = a.conceptid and c.texttype = 'Label' and c.textlang = 'fre'
	where a.relationtype = 'Mot clé'
)
select c.identifiervalue as N_inventaire, d.rue as Rue, d.numero as N_rue, e.textvalue as Nom_site, d.arrondissement as Arrondissement, d.ville as Ville, 
	d.departement as Departement, f.latitude as Latitude_x, f.longitude as Longitude_y, h.textvalue as Support, j.textvalue as Couleur, l.textvalue as Taille,
	n.datedebut as Date_prise_vue, p.textvalue as Photographe, null as Droits, r.textvalue as Mention_don, t.textvalue as Mention_collection,
	n.datedebut as Date_construction, x.textvalue as Architecte, z.textvalue as Classement_MH, aa.textvalue as Legende, ac.textvalue as Generalite_architecture,
	ad.textvalue as Mot_cle1, ae.textvalue as Mot_cle2, af.textvalue as Mot_cle3, ag.textvalue as Mot_cle4, ah.textvalue as Mot_cle5, ai.textvalue as Mot_cle6,
	aj.textvalue as Autre_adresse, ak.textvalue as Notes, al.identifiervalue as Cote_base, am.identifiervalue as Cote_classement, ao.activitedate as Date_inventaire, aq.textvalue as Auteur
from instance_identifier a inner join instance b on b.instanceid = a.instanceid inner join instance_identifier c on c.instanceid = a.instanceid and c.identifiertype = 'Numéro d''inventaire'
left join adresse d on d.instanceid = a.instanceid left join instance_text e on e.instanceid = a.instanceid and e.texttype = 'Site' left join geolocalisation f on f.instanceid = a.instanceid
left join instance_concept g on g.instanceid = a.instanceid and g.relationtype = 'Support' left join concept_text h on h.conceptid = g.conceptid and h.texttype = 'Label' and h.textlang = 'fre'
left join instance_concept i on i.instanceid = a.instanceid and i.relationtype = 'Couleur' left join concept_text j on j.conceptid = i.conceptid and j.texttype = 'Label' and j.textlang = 'fre'
left join instance_concept k on k.instanceid = a.instanceid and k.relationtype = 'Taille' left join concept_text l on l.conceptid = k.conceptid and l.texttype = 'Label' and l.textlang = 'fre'
left join instance_evenement m on m.instanceid = a.instanceid and m.relationtype = 'Prise de vue' left join evenement n on n.evenementid = m.evenementid 
left join instance_agent o on o.instanceid = a.instanceid and o.relationtype = 'Photographe' left join agent_text p on p.agentid = o.agentid and p.texttype = 'Identité civile' and p.textlang = 'fre'
left join instance_agent q on q.instanceid = a.instanceid and q.relationtype = 'Donateur' left join agent_text r on r.agentid = q.agentid and r.texttype = 'Identité civile' and r.textlang = 'fre'
left join instance_instance s on s.sourceinstanceid = a.instanceid and s.relationtype= 'Fait partie de' left join instance_text t on t.instanceid = s.targetinstanceid and t.texttype = 'Label' and t.textlang = 'fre'
left join instance_evenement u on u.instanceid = a.instanceid and u.relationtype = 'Construction' left join evenement v on v.evenementid = u.evenementid 
left join instance_agent w on w.instanceid = a.instanceid and w.relationtype = 'Architecte' left join agent_text x on w.agentid = x.agentid and x.texttype = 'Identité civile' and x.textlang = 'fre'
left join instance_concept y on y.instanceid = a.instanceid and y.relationtype = 'Classement MH' left join concept_text z on z.conceptid = y.conceptid and z.texttype = 'Label' and z.textlang = 'fre'
left join instance_text aa on aa.instanceid = a.instanceid and aa.texttype = 'Légende' and aa.textlang = 'fre'
left join instance_concept ab on ab.instanceid = a.instanceid and ab.relationtype = 'Généralité d''architecture' left join concept_text ac on ac.conceptid = ab.conceptid and ac.texttype = 'Label' and ac.textlang = 'fre'
left join cte ad on ad.instanceid = a.instanceid and ad.rang = 1 left join cte ae on ae.instanceid = a.instanceid and ae.rang = 2 left join cte af on af.instanceid = a.instanceid and af.rang = 3 left join cte ag on ag.instanceid = a.instanceid and ag.rang = 4 left join cte ah on ah.instanceid = a.instanceid and ah.rang = 5 left join cte ai on ai.instanceid = a.instanceid and ai.rang = 6
left join instance_text aj on aj.instanceid = a.instanceid and aj.texttype = 'Autre adresse' and aj.textlang = 'fre'
left join instance_text ak on ak.instanceid = a.instanceid and ak.texttype = 'Note' and ak.textlang = 'fre'
left join instance_identifier al on al.instanceid =a.instanceid and al.identifiertype = 'Cote de la base de numérisations'
left join instance_identifier am on am.instanceid =a.instanceid and am.identifiertype = 'Cote physique'
left join instance_activite an on an.instanceid = a.instanceid and an.relationtype = 'Inventaire' left join activite ao on ao.activiteid = an.activiteid left join agent_text aq on aq.agentid = ao.agentid and aq.texttype = 'Code inventaire'
where a.identifiervalue = '78511'
