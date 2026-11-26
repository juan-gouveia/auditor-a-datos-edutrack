-- Q1: Inscripciones curso 'Intro to Python'

SELECT
  public.students.name,
  public.students.email,
  public.enrollments.completion_percentage
FROM public.enrollments
JOIN public.students
  ON public.students.id = public.enrollments.student_id
WHERE public.enrollments.course_id = 1
ORDER BY public.students.name;


-- Q2: Inscripciones completion_percentage < 10

SELECT
  public.students.name,
  public.students.email,
  public.enrollments.completion_percentage
FROM public.enrollments
JOIN public.students
  ON public.students.id = public.enrollments.student_id
WHERE public.enrollments.completion_percentage < 10;


-- Q3: Inscripciones con campo instructor = NULL

SELECT public.enrollments.*
FROM public.enrollments
JOIN public.courses
  ON public.courses.id = public.enrollments.course_id
WHERE public.courses.instructor_name IS NULL;


-- Q4: 5 estudiantes con mayor completion_percentage y passed = false

SELECT
  public.enrollments.student_id,
  public.enrollments.student_name,
  MAX(public.enrollments.completion_percentage)
FROM public.enrollments
WHERE public.enrollments.passed = false
GROUP BY public.enrollments.student_id, public.enrollments.student_name
ORDER BY MAX(public.enrollments.completion_percentage) DESC
LIMIT 5;


-- Q5: Inscripciones con enrollment_date desde '2024-07-01', ordenado por enrollment_date descendente

SELECT public.enrollments.*
FROM public.enrollments
WHERE public.enrollments.enrollment_date >= DATE '2024-07-01'
ORDER BY public.enrollments.enrollment_date DESC;


-- Q6: Insertar registro faltante

INSERT INTO public.enrollments (
  id,
  student_id,
  student_name,
  student_email,
  course_id,
  course_title,
  category,
  enrollment_date,
  completion_percentage,
  passed,
  monthly_fee_paid,
  instructor
)
VALUES (
  18,
  3,
  'Lucia Fernandes',
  'lucia.fernandes@student.edutrack.com',
  5,
  'Advanced Python',
  'Programming',
  DATE '2025-04-01',
  0,
  false,
  69.99,
  'Carlos Vega'
);


-- Q7: Update inscripciones con instructor = NULL a 'Pending assignment'

UPDATE public.enrollments
SET instructor = 'Pending assignment'
WHERE instructor IS NULL
RETURNING id, instructor;


-- Q8: DELETE inscripciones ligadas a cuentas de prueba (@test.com), confirmar filas afectdads con SELECT previo

SELECT id, student_name, student_email
FROM public.enrollments
WHERE student_email ILIKE '%@test.com';

DELETE FROM public.enrollments
WHERE student_email ILIKE '%@test.com'
RETURNING id, student_name, student_email;


-- Q9: Contar número de inscripciones agrupado por category

SELECT category, COUNT(*) AS total_inscripciones
FROM public.enrollments
GROUP BY category
ORDER BY category;


-- Q10: Calcular promedio de completion_percentage agrupado por course_title, de menor a mayor

SELECT
  course_title,
  ROUND(AVG(completion_percentage), 2) AS promedio_completion_percentage
FROM public.enrollments
GROUP BY course_title
ORDER BY promedio_completion_percentage ASC;


-- Q11: Mostrar solo cursos con más de 3 inscripciones (usando HAVING)

SELECT
  course_title,
  COUNT(*) AS total_inscripciones
FROM public.enrollments
GROUP BY course_title
HAVING COUNT(*) > 3
ORDER BY total_inscripciones DESC;


-- Q12: Calcular ingresos totales (SUM de monthly_fee_paid) agrupados por category, de mayor a menor

SELECT category, SUM(monthly_fee_paid) AS ingresos_totales
FROM public.enrollments
GROUP BY category
ORDER BY ingresos_totales DESC;


-- Auditoría de Datos en EduTrack — Tablas Relacionadas


-- Q13: Inscripciones con nombre completo, curso y porcentage completado

SELECT
  public.students.name,
  public.courses.title,
  public.enrollments.completion_percentage
FROM public.enrollments
INNER JOIN public.students
  ON public.enrollments.student_id = public.students.id
INNER JOIN public.courses
  ON public.enrollments.course_id = public.courses.id;


-- Q14: Nombre y email de estudiantes con al menos un curso aprobado, junto con el título de dicho curso

SELECT
  public.students.name,
  public.students.email,
  public.courses.title
FROM public.students
INNER JOIN public.enrollments
  ON public.students.id = public.enrollments.student_id
INNER JOIN public.courses
  ON public.enrollments.course_id = public.courses.id
WHERE public.enrollments.passed = TRUE;


-- Q15: Calcular porcentaje de completado medio por instructor, ordenado de mayor a menor

SELECT
  public.courses.instructor_name,
  AVG(public.enrollments.completion_percentage)
FROM public.courses
INNER JOIN public.enrollments
  ON public.courses.id = public.enrollments.course_id
GROUP BY public.courses.instructor_name
ORDER BY AVG(public.enrollments.completion_percentage) DESC;


-- Q16: Encontrar todos los estudiantes que **no tienen ninguna inscripción**

SELECT
  public.students.name,
  public.students.email
FROM public.students
LEFT JOIN public.enrollments
  ON public.students.id = public.enrollments.student_id
WHERE public.enrollments.student_id IS NULL;


-- Q17: Encontrar todos los cursos que **no tienen ninguna inscripción**

SELECT
  public.courses.id,
  public.courses.title
FROM public.courses
LEFT JOIN public.enrollments
  ON public.courses.id = public.enrollments.course_id
WHERE public.enrollments.course_id IS NULL;


-- Q18: Contar cuantos cursos tiene inscrito cada estudiante, mostrando solo los estudiantes con más de un curso inscrito

SELECT
  public.students.id,
  public.students.name,
  COUNT(DISTINCT public.enrollments.course_id)
FROM public.students
INNER JOIN public.enrollments
  ON public.students.id = public.enrollments.student_id
GROUP BY public.students.id, public.students.name
HAVING COUNT(DISTINCT public.enrollments.course_id) > 1;


-- Q19: Calcular ingresos totales por categoría usando monthly_fee, no el histórico de enrollments

SELECT
  public.courses.category,
  SUM(public.courses.monthly_fee) AS ingresos_mensuales
FROM public.courses
INNER JOIN public.enrollments
  ON public.courses.id = public.enrollments.course_id
GROUP BY public.courses.category;


-- Q20: Mostrar cada instructor junto con el número de estudiantes inscritos en sus cursos

-- Esta solución cuenta a cada estudiante una sola vez por instructor, aunque esté inscrito en varios de sus cursos.
SELECT
  public.courses.instructor_name,
  COUNT(DISTINCT public.enrollments.student_id) AS estudiantes_inscritos
FROM public.courses
LEFT JOIN public.enrollments
  ON public.courses.id = public.enrollments.course_id
WHERE public.courses.instructor_name IS NOT NULL
GROUP BY public.courses.instructor_name;

-- Esta solución cuanta a cada estudiante en cada curso, sin importar si se repite en dos o más.
SELECT
  public.courses.instructor_name,
  COUNT(public.enrollments.student_id) AS estudiantes_inscritos
FROM public.courses
LEFT JOIN public.enrollments
  ON public.courses.id = public.enrollments.course_id
WHERE public.courses.instructor_name IS NOT NULL
GROUP BY public.courses.instructor_name;


-- Q21: Comprobar la existencia de inscripciones cuyo student_id no corresponda a ningún estudiante existente

SELECT public.enrollments.id AS enrollment_id, public.enrollments.student_id
FROM public.enrollments
LEFT JOIN public.students
  ON public.enrollments.student_id = public.students.id
WHERE public.students.id IS NULL;


-- Q22: Comprobar la existencia de inscripciones cuyo course_id no corresponda a un curso existente

SELECT public.enrollments.id AS enrollment_id, public.enrollments.course_id
FROM public.enrollments
LEFT JOIN public.courses
  ON public.enrollments.course_id = public.courses.id
WHERE public.courses.id IS NULL;