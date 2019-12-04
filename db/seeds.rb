admin = User.create(email: 'test@test.com' , password: '12345678' , password_confirmation: '12345678', admin: true)
reader = User.create(email: 'test1@test.com' , password: '87654321' , password_confirmation: '87654321')

text1 = Text.create(content: 'Some text example', complexity_score: 124)
text2 = Text.create(content: 'Some text example qwerty qwerty qwerty qwerty', complexity_score: 120)

admin.texts << text1
reader.texts << text2
