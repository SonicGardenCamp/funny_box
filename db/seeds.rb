# User.create!(name:  "AAA",
#             email: "a@a.a",
#             password:              "gurukun",
#             password_confirmation: "gurukun")

# User.create!(name:  "BBB",
#             email: "b@b.b",
#             password:              "gurukun",
#             password_confirmation: "gurukun")


# Group.create!(name: "ぐるくん後援会北京支部",
#               description: "愚瑠君最高！")

# Group.create!(name: "ぐるくん後援会大阪支部",
#               description: "ぐるくんは最高や！")

# Group.create!(name: "ぐるくん後援会アラスカ支部",
#               description: "Gurukun is wonderful!!")

# Group.create!(name: "ぐるくん後援会ミュンヘン支部",
#               description: "Gurukun ist das Beste!!")

15.times do
  group = Group.create(name: Faker::Lorem.sentence(word_count: 1))

  3.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    user = User.create(name:  name,
                        email: email,
                        password:              password,
                        password_confirmation: password)
    group.users << user

    3.times do
      post = user.posts.build(content: Faker::Lorem.sentence(word_count: 5))
      post.group = group
      if post.save
        puts "Post created successfully"
      else
        puts "Error creating post: #{post.errors.full_messages.join(', ')}"
      end
    end
  end

  # グループに関連するタグを生成
  3.times do
    tag = Tag.create(name: Faker::Lorem.word)
    group.tags << tag
  end

end

