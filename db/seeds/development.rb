# frozen_string_literal: true

Doorkeeper::Application.create!(name: 'Dondoca Web', redirect_uri: '', scopes: '') if Doorkeeper::Application.count.zero?

User.first_or_create(email: 'example@email.com',
                     password: 'password',
                     password_confirmation: 'password',
                     role: User.roles[:admin])

client = Client.first_or_create(first_name: 'Gisely',
                                last_name: 'Rosa',
                                phone_number: 11_978_228_466,
                                birthday: Time.zone.now - 20.years)

worker = Worker.first_or_create(first_name: 'Bruno',
                                last_name: 'Leite',
                                job: 'Dev',
                                phone_number: 11_978_228_466,
                                instagram: 'brmariano13',
                                image_url: 'https://firebasestorage.googleapis.com/v0/b/dondoca-a6bd8.appspot.com/o/profile_images%2F1628710359214.jpeg?alt=media&token=b53d24ea-e392-4536-a4dd-de1961d99a18')

Schedule.create(start_at: Time.zone.now,
                end_at: Time.zone.now + 30.minutes,
                client:,
                worker:)

Schedule.create(start_at: Time.zone.now + 1.hour,
                end_at: Time.zone.now + 2.hours,
                client:,
                worker:)
