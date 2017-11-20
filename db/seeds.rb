# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.delete_all
Source.delete_all

Source.create!(link: 'https://news.rambler.ru/rss/economics/', name: 'rambler#economics', rus_name: 'рамблер#экономика')
Source.create!(link: 'https://news.rambler.ru/rss/community/', name: 'rambler#community', rus_name: 'рамблер#общество')
Source.create!(link: 'https://news.rambler.ru/rss/tech/', name: 'rambler#tech', rus_name: 'рамблер#наука и техника')
Source.create!(link: 'https://news.yandex.ru/business.rss', name: 'yandex#business', rus_name: 'яндекс#экономика')
Source.create!(link: 'https://news.yandex.ru/politics.rss', name: 'yandex#politics', rus_name: 'яндекс#политика')
Source.create!(link: 'https://news.yandex.ru/computers.rss', name: 'yandex#computers', rus_name: 'яндекс#технологии и наука')
Source.create!(link: 'https://news.yandex.ru/cosmos.rss', name: 'yandex#cosmos', rus_name: 'яндекс#космос')
Source.create!(link: 'https://news.yandex.ru/science.rss', name: 'yandex#science', rus_name: 'яндекс#наука')
Source.create!(link: 'https://news.yandex.ru/society.rss', name: 'yandex#society', rus_name: 'яндекс#общество')
Source.create!(link: 'https://news.yandex.ru/culture.rss', name: 'yandex#culture', rus_name: 'яндекс#культура')
Source.create!(link: 'https://news.yandex.ru/sport.rss', name: 'yandex#sport', rus_name: 'яндекс#спорт')
Source.create!(link: 'https://news.yandex.ru/gadgets.rss', name: 'yandex#gadgets', rus_name: 'яндекс#гаджеты')
Source.create!(link: 'https://news.yandex.ru/football.rss', name: 'yandex#football', rus_name: 'яндекс#футбол')
