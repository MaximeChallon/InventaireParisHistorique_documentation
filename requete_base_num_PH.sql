SELECT Series."Designation",a."Id",a."Designation",a."IdSite","IdSousLocalisation","IdEvenementGenerateur","IdPhotographe","IdDroits","IdSupport","IdCouleur","DatePriseDeVue",
        "AnneePriseDeVue","CaracteristiquesOriginal",a."Commentaires",a."Commentaires_rtf","Cote","Documentee","ASupprimer","DateEntreeBase","NomFichier",a."ACompleter",
        a."Origine",a."FM_Serie","FM_Droits","FM_Support","FM_Photographe",a."FM_MotsCles","FM_Couleur","NaturePhoto",a."Solde","FM_Id","APublier","NumeroContrecolle",
        "StatutContrecolle","AVendre",a."Supprimer",b."Id",b."Designation","IdTypeClassement","Architectes","SiecleConstruction",b."Commentaires",b."Commentaires_rtf",
        b."ACompleter",b."Origine","DateCreation",b."FM_Serie","FM_TypeClassement",b."FM_MotsCles",b."Solde",b."Supprimer",Photographes."Id",Photographes."Designation",
        Droits."Id",Droits."Designation",PhotosMotsCles."Id","IdPhoto","IdpMotCle",PhotosMotsCles."FM_MotCle",PhotosMotsCles."Solde",Adresses."Id",Adresses."IdSite",
        Voies."Designation","Numero","SuffixeNumero","Principale","CodePostal","Ville",Voies."FM_Voie",Adresses."Solde",Adresses."Supprimer","NumeroDebut","NumeroFin","Erreur",
        "libErreur","Paire","Latitude","Longitude",Couleurs."Id",Couleurs."Designation",Supports."Id",Supports."Designation",SitesMotsCles."Id",SitesMotsCles."IdSite",
        "IdsMotCle",SitesMotsCles."FM_MotCle",SitesMotsCles."Solde",MotsCles."Id",MotsCles."Designation","Niveau","Synonyme"
        FROM ((((((((photos AS a INNER JOIN sites AS b ON a.idSite = b.id) 
        LEFT JOIN Photographes ON a.IdPhotographe = Photographes.Id) 
        LEFT JOIN Droits ON a.IdDroits = Droits.Id) LEFT JOIN PhotosMotsCles ON a.Id = PhotosMotsCles.IdPhoto) LEFT JOIN Adresses ON b.Id = Adresses.IdSite)
        LEFT JOIN Couleurs ON a.IdCouleur = Couleurs.Id) LEFT JOIN Supports ON a.IdSupport = Supports.Id) left JOIN SitesMotsCles ON b.Id = SitesMotsCles.IdSite) 
        left JOIN MotsCles ON SitesMotsCles.IdsMotCle = MotsCles.Id
        left join Voies ON Voies.Id = Adresses.IdVoie
        left join Series ON Series.Id = b.IdSerie;
