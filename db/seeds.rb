user1 = User.create!(name:  "ぐるくん皇帝",
            email: "a@a.a",
            password:              "gurukun",
            password_confirmation: "gurukun")


group1 = Group.create!(name: "ぐるくん後援会東北支部",
              description: "ぐるくん最高！",
              category: "ぐるくん",
              host_user_id: user1.id)

group2 = Group.create!(name: "女子会",
              description: "週6で活動します",
              category: "その他",
              host_user_id: user1.id)

group3 = Group.create!(name: "ぐるくん後援会アラスカ支部",
              description: "Gurukun is wonderful!!",
              category: "ぐるくん",
              host_user_id: user1.id)

group1.users << user1              
group2.users << user1              
group3.users << user1

group_names = %w(
                  ぐるくんアンチの会
                  ダンス仲間
                  麻雀狂いの会
                  自然愛好者
                  お寿司愛好会
                  ハイパーカジュアルゲーム
                  ニコニコ動画研究会
                  rep.Osaka
                )

8.times do |m|
  group = Group.create(name: group_names[m],
                        host_user_id: user1.id,
                        category: Group::CATEGORIES[m],
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

    4.times do
      post = user.posts.create(content: Faker::JapaneseMedia::StudioGhibli.quote)
      group.posts << post
    end
  end
  
  group.users << user1
  
  # グループに関連するタグを生成
  3.times do
    tag = Tag.create(name: Faker::Lorem.word)
    group.tags << tag
  end

end

