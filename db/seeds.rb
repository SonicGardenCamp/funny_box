User.create!(name:  "AAA",
            email: "a@a.a",
            password:              "gurukun",
            password_confirmation: "gurukun")

User.create!(name:  "BBB",
            email: "b@b.b",
            password:              "gurukun",
            password_confirmation: "gurukun")


Group.create!(name: "ぐるくん後援会北京支部",
              description: "愚瑠君最高！",
              host_user_id: 1)

Group.create!(name: "ぐるくん後援会大阪支部",
              description: "ぐるくんは最高や！",
              host_user_id: 1)

Group.create!(name: "ぐるくん後援会アラスカ支部",
              description: "Gurukun is wonderful!!",
              host_user_id: 1)

Group.create!(name: "ぐるくん後援会ミュンヘン支部",
              description: "Gurukun ist das Beste!!",
              host_user_id: 1)

15.times do |m|
  group = Group.create(name: Faker::Lorem.word,
                        host_user_id: 1
                        )

  3.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1+(3*m)}@railstutorial.org"
    password = "password"
    user = User.create(name:  name,
                        email: email,
                        password:              password,
                        password_confirmation: password)
    group.users << user

    3.times do
      post = user.posts.create(content: Faker::Lorem.sentence(word_count: 5))
      group.posts << post
    end
  end

  # グループに関連するタグを生成
  3.times do
    tag = Tag.create(name: Faker::Lorem.word)
    group.tags << tag
  end

end

