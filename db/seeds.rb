# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Adds two courses
Course.create(year: 2016)
Course.create(year: 2017)

# Adds some exams per course
# 2016
course16 = Course.first
Exam.create([{
              title: "Examen 1",
              description: "Sobre conceptos del lenguaje",
              min_grade: rand(4..6),
              exam_date: Date.new(2016,10,9),
              course: course16
            },{
              title: "Examen 2",
              description: "sobre gemas...",
              min_grade: rand(4..6),
              exam_date: Date.new(2016, 10, 25),
              course: course16
            },{
              title: "Examen 3",
              description: "sobre testing...",
              min_grade: rand(4..6),
              exam_date: Date.new(2016,11,15),
              course: course16
            },{
              title: "Trabajo integrador",
              description: "Rails",
              min_grade: rand(4..6),
              exam_date: Date.new(2016,12,11),
              course: course16
            }])

course17=Course.last()

Exam.create([{
              title: "Examen 1",
              description: "Sobre conceptos del lenguaje",
              min_grade: rand(4..6),
              exam_date: Date.new(2017,9,5),
              course: course17
            },{
              title: "Examen 2",
              description: "sobre gemas...",
              min_grade: rand(4..6),
              exam_date: Date.new(2017, 10, 7),
              course: course17
            },{
              title: "Examen 3",
              description: "sobre testing...",
              min_grade: rand(4..6),
              exam_date: Date.new(2017,11,15),
              course: course17
            },{
              title: "Examen 4",
              description: "Sinatra",
              min_grade: rand(4..6),
              exam_date: Date.new(2017,12,10),
              course: course17
            },{
              title: "Trabajo integrador",
              description: "Rails",
              min_grade: rand(4..6),
              exam_date: Date.new(2017,12,20),
              course: course17
            }])

## adds some Students

10.times do |i|
  Student.create(
    name: "Nombre #{i}",
    last_name: "Apellido #{i}",
    dni: rand(10000000..40000000),
    student_number: rand(0..100000),
    course: course16)
end

10.times do |i|
  Student.create(
    name: "Nombre #{i}",
    last_name: "Apellido #{i}",
    dni: rand(10000000..40000000),
    student_number: rand(0..100000),
    course: course17)
end

# Add grades.

Student.all.each do |student|
  Course.exams_by_year(student.course.year).each do |exam|
    Grade.create(exam: exam, student: student, grade: rand(0..10), course: student.course)
  end
end

