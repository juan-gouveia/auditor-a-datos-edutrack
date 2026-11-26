## Q1: Inscripciones curso 'Intro to Python'

| name         | email                             | completion_percentage |
| ------------ | --------------------------------- | --------------------- |
| Emily Watson | emily.watson@student.edutrack.com | 85                    |
| James Miller | james.miller@test.com             | 30                    |
| Klaus Weber  | klaus.weber@student.edutrack.com  | 92                    |
| Marco Rossi  | marco.rossi@student.edutrack.com  | 88                    |
| Priya Sharma | priya.sharma@student.edutrack.com | 55                    |


## Q2: Inscripciones completion_percentage < 10

| name            | email                                | completion_percentage |
| --------------- | ------------------------------------ | --------------------- |
| Lucia Fernandes | lucia.fernandes@student.edutrack.com | 3                     |
| Lucia Fernandes | lucia.fernandes@student.edutrack.com | 5                     |
| Yuki Nakamura   | yuki.nakamura@student.edutrack.com   | 0                     |
| Pierre Dubois   | pierre.dubois@student.edutrack.com   | 0                     |


## Q3: Inscripciones con Campo instructor = NULL

| id | student_id | student_name  | student_email                      | course_id | course_title       | category | enrollment_date | completion_percentage | passed | monthly_fee_paid | instructor |
| -- | ---------- | ------------- | ---------------------------------- | --------- | ------------------ | -------- | --------------- | --------------------- | ------ | ---------------- | ---------- |
| 10 | 5          | Yuki Nakamura | yuki.nakamura@student.edutrack.com | 6         | UI/UX Fundamentals | Design   | 2024-10-11      | 0                     | false  | 44.99            | null       |
| 11 | 6          | Pierre Dubois | pierre.dubois@student.edutrack.com | 6         | UI/UX Fundamentals | Design   | 2024-11-05      | 0                     | false  | 44.99            | null       |


## Q4: 5 estudiantes con mayor completion_percentage y passed = false

| student_id | student_name  | max |
| ---------- | ------------- | --- |
| 1          | Emily Watson  | 60  |
| 7          | Priya Sharma  | 55  |
| 5          | Yuki Nakamura | 45  |
| 8          | James Miller  | 30  |
| 6          | Pierre Dubois | 20  |


## Q5: Inscripciones con enrollment_date desde '2024-07-01', ordenado por enrollment_date descendente

| id | student_id | student_name    | student_email                        | course_id | course_title           | category    | enrollment_date | completion_percentage | passed | monthly_fee_paid | instructor   |
| -- | ---------- | --------------- | ------------------------------------ | --------- | ---------------------- | ----------- | --------------- | --------------------- | ------ | ---------------- | ------------ |
| 17 | 1          | Emily Watson    | emily.watson@student.edutrack.com    | 5         | Advanced Python        | Programming | 2025-03-05      | 40                    | false  | 69.99            | Carlos Vega  |
| 16 | 6          | Pierre Dubois   | pierre.dubois@student.edutrack.com   | 3         | Data Analysis with SQL | Data        | 2025-02-20      | 20                    | false  | 59.99            | Marta López  |
| 15 | 7          | Priya Sharma    | priya.sharma@student.edutrack.com    | 1         | Intro to Python        | Programming | 2025-01-10      | 55                    | false  | 49.99            | Marta López  |
| 12 | 7          | Priya Sharma    | priya.sharma@student.edutrack.com    | 4         | Digital Marketing 101  | Marketing   | 2024-12-01      | 70                    | true   | 29.99            | Lucia Prades |
| 11 | 6          | Pierre Dubois   | pierre.dubois@student.edutrack.com   | 6         | UI/UX Fundamentals     | Design      | 2024-11-05      | 0                     | false  | 44.99            | null         |
| 10 | 5          | Yuki Nakamura   | yuki.nakamura@student.edutrack.com   | 6         | UI/UX Fundamentals     | Design      | 2024-10-11      | 0                     | false  | 44.99            | null         |
| 9  | 5          | Yuki Nakamura   | yuki.nakamura@student.edutrack.com   | 3         | Data Analysis with SQL | Data        | 2024-09-03      | 45                    | false  | 59.99            | Marta López  |
| 8  | 4          | Marco Rossi     | marco.rossi@student.edutrack.com     | 1         | Intro to Python        | Programming | 2024-08-09      | 88                    | true   | 49.99            | Marta López  |
| 6  | 3          | Lucia Fernandes | lucia.fernandes@student.edutrack.com | 4         | Digital Marketing 101  | Marketing   | 2024-07-01      | 3                     | false  | 29.99            | Lucia Prades |


## Q6: Insertar registro faltante

Success. No rows returned


## Q7: Update inscripciones con instructor = NULL a 'Pending assignment'

| id | instructor         |
| -- | ------------------ |
| 10 | Pending assignment |
| 11 | Pending assignment |


## Q8: DELETE inscripciones ligadas a cuentas de prueba (@test.com), confirmar filas afectdads con SELECT previo

| id | student_name | student_email         |
| -- | ------------ | --------------------- |
| 13 | James Miller | james.miller@test.com |
| 14 | Alex Chen    | alex.chen@test.com    |

| id | student_name | student_email         |
| -- | ------------ | --------------------- |
| 13 | James Miller | james.miller@test.com |
| 14 | Alex Chen    | alex.chen@test.com    |


## Q9: Contar número de inscripciones agrupado por category

| category    | total_inscripciones |
| ----------- | ------------------- |
| Data        | 3                   |
| Design      | 4                   |
| Marketing   | 2                   |
| Programming | 7                   |


## Q10: Calcular promedio de completion_percentage agrupado por course_title, de menor a mayor

| course_title           | promedio_completion_percentage |
| ---------------------- | ------------------------------ |
| UI/UX Fundamentals     | 0.00                           |
| Web Design Basics      | 32.50                          |
| Digital Marketing 101  | 36.50                          |
| Advanced Python        | 45.00                          |
| Data Analysis with SQL | 47.67                          |
| Intro to Python        | 80.00                          |


## Q11: Mostrar solo cursos con más de 3 inscripciones (usando HAVING)

| course_title    | total_inscripciones |
| --------------- | ------------------- |
| Intro to Python | 4                   |


## Q12: Calcular ingresos totales (SUM de monthly_fee_paid) agrupados por category, de mayor a menor

| category    | ingresos_totales |
| ----------- | ---------------- |
| Programming | 409.93           |
| Data        | 179.97           |
| Design      | 169.96           |
| Marketing   | 59.98            |


# Auditoría de Datos en EduTrack — Tablas Relacionadas


## Q13: Inscripciones con nombre completo, curso y porcentage completado

| name            | title                  | completion_percentage |
| --------------- | ---------------------- | --------------------- |
| Emily Watson    | Intro to Python        | 85                    |
| Emily Watson    | Web Design Basics      | 60                    |
| Klaus Weber     | Intro to Python        | 92                    |
| Klaus Weber     | Data Analysis with SQL | 78                    |
| Lucia Fernandes | Web Design Basics      | 5                     |
| Lucia Fernandes | Digital Marketing 101  | 3                     |
| Marco Rossi     | Advanced Python        | 95                    |
| Marco Rossi     | Intro to Python        | 88                    |
| Yuki Nakamura   | Data Analysis with SQL | 45                    |
| Yuki Nakamura   | UI/UX Fundamentals     | 0                     |
| Pierre Dubois   | UI/UX Fundamentals     | 0                     |
| Priya Sharma    | Digital Marketing 101  | 70                    |
| Priya Sharma    | Intro to Python        | 55                    |
| Pierre Dubois   | Data Analysis with SQL | 20                    |
| Emily Watson    | Advanced Python        | 40                    |
| Lucia Fernandes | Advanced Python        | 0                     |


## Q14: Nombre y email de estudiantes con al menos un curso aprobado, junto con el título de dicho curso

| name         | email                             | title                  |
| ------------ | --------------------------------- | ---------------------- |
| Emily Watson | emily.watson@student.edutrack.com | Intro to Python        |
| Klaus Weber  | klaus.weber@student.edutrack.com  | Intro to Python        |
| Klaus Weber  | klaus.weber@student.edutrack.com  | Data Analysis with SQL |
| Marco Rossi  | marco.rossi@student.edutrack.com  | Advanced Python        |
| Marco Rossi  | marco.rossi@student.edutrack.com  | Intro to Python        |
| Priya Sharma | priya.sharma@student.edutrack.com | Digital Marketing 101  |


## Q15: Calcular porcentaje de completado medio por instructor, ordenado de mayor a menor

| instructor_name    | avg                    |
| ------------------ | ---------------------- |
| Marta López        | 66.1428571428571429    |
| Carlos Vega        | 40.0000000000000000    |
| Lucia Prades       | 36.5000000000000000    |
| Pending assignment | 0.00000000000000000000 |


## Q16: Encontrar todos los estudiantes que **no tienen ninguna inscripción**

| name          | email                              |
| ------------- | ---------------------------------- |
| Giulia Romano | giulia.romano@student.edutrack.com |


## Q17: Encontrar todos los cursos que **no tienen ninguna inscripción**

| id | title           |
| -- | --------------- |
| 7  | Email Campaigns |


## Q18: Contar cuantos cursos tiene inscrito cada estudiante, mostrando solo los estudiantes con más de un curso inscrito

| id | name            | count |
| -- | --------------- | ----- |
| 1  | Emily Watson    | 3     |
| 2  | Klaus Weber     | 2     |
| 3  | Lucia Fernandes | 3     |
| 4  | Marco Rossi     | 2     |
| 5  | Yuki Nakamura   | 2     |
| 6  | Pierre Dubois   | 2     |
| 7  | Priya Sharma    | 2     |


## Q19: Calcular ingresos totales por categoría usando monthly_fee, no el histórico de enrollments

| category    | ingresos_mensuales |
| ----------- | ------------------ |
| Marketing   | 59.98              |
| Programming | 409.93             |
| Design      | 169.96             |
| Data        | 179.97             |


## Q20: Mostrar cada instructor junto con el número de estudiantes inscritos en sus cursos

### Solución contando a cada estudiante una sola vez, aunque esté inscrito en varios cursos del mismo profesor:

| instructor_name    | estudiantes_inscritos |
| ------------------ | --------------------- |
| Carlos Vega        | 3                     |
| Lucia Prades       | 2                     |
| Marta López        | 6                     |
| Pending assignment | 2                     |

### Solución contando todas las veces que un estudiante coincide con un profesor:

| instructor_name    | estudiantes_inscritos |
| ------------------ | --------------------- |
| Carlos Vega        | 5                     |
| Pending assignment | 2                     |
| Lucia Prades       | 2                     |
| Marta López        | 7                     |


## Q21: Comprobar la existencia de inscripciones cuyo student_id no corresponda a ningún estudiante existente

Success. No rows returned


## Q22: Comprobar la existencia de inscripciones cuyo course_id no corresponda a un curso existente

Success. No rows returned