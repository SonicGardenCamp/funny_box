user1 = User.create!(name:  "ぐるくん皇帝",
            email: "a@a.a",
            password:              "gurukun",
            password_confirmation: "gurukun")


# group1 = Group.create!(name: "ぐるくん後援会北京支部",
#               description: "愚瑠君最高！",
#               category: "ぐるくん",
#               host_user_id: 1)

# group2 = Group.create!(name: "ぐるくん後援会大阪支部",
#               description: "ぐるくんは最高や！",
#               category: "ぐるくん",
#               host_user_id: 1)

# group3 = Group.create!(name: "ぐるくん後援会アラスカ支部",
#               description: "Gurukun is wonderful!!",
#               category: "ぐるくん",
#               host_user_id: 1)

# group1.users << user1              
# group2.users << user1              
# group3.users << user1

# 10.times do |m|
#   group = Group.create(name: Faker::Hobby.activity,
#                         host_user_id: 1,
#                         category: Group::CATEGORIES[rand(Group::CATEGORIES.length)],
#                         )

#   3.times do |n|
#     name  = Faker::Name.name
#     email = "example-#{n+1+(3*m)}@railstutorial.org"
#     password = "password"
#     user = User.create(name:  name,
#                         email: email,
#                         password:              password,
#                         password_confirmation: password)
#     group.users << user

#     2.times do
#       post = user.posts.create(content: Faker::Lorem.sentence(word_count: 5))
#       group.posts << post
#     end
#   end
  
#   group.users << user1
  
#   # グループに関連するタグを生成
#   3.times do
#     tag = Tag.create(name: Faker::Lorem.word)
#     group.tags << tag
#   end

# end

