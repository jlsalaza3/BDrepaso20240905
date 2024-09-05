USE patentOffice1


SELECT *
FROM Assistants
FULL OUTER JOIN AssistantsCompanies ON Assistants.idAssistant=AssistantsCompanies.idAssistant

-- otra forma de hacerlo es juntando un LEFT JOIN con un RIGHT JOIN asi:

SELECT *
FROM Assistants
LEFT JOIN AssistantsCompanies ON Assistants.idAssistant=AssistantsCompanies.idAssistant
UNION
SELECT *
FROM Assistants
RIGHT JOIN AssistantsCompanies ON Assistants.idAssistant=AssistantsCompanies.idAssistant



-- diferencia simetrica, lo que está en A que no está en B y lo que esta en B que no esta en A

SELECT *
FROM Assistants
LEFT JOIN AssistantsCompanies ON Assistants.idAssistant=AssistantsCompanies.idAssistant
WHERE AssistantsCompanies.idAssistant IS NULL
UNION
SELECT *
FROM Assistants
RIGHT JOIN AssistantsCompanies ON Assistants.idAssistant=AssistantsCompanies.idAssistant
WHERE AssistantsCompanies.idAssistant IS NULL