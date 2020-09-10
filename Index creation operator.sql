CREATE UNIQUE INDEX unique_category_of_diagnosis ON category_of_diagnosis (name);
DROP INDEX unique_category_of_diagnosis ON category_of_diagnosis;

// Создаёт уникальный индекс  для категории заболеваний



CREATE INDEX name_qualification ON doctor (name, qualification);
