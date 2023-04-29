# frozen_string_literal: true

Doorkeeper::Application.create!(name: 'Dondoca Web', redirect_uri: '', scopes: '') if Doorkeeper::Application.count.zero?

User.first_or_create(email: 'example@email.com',
                     password: 'password',
                     password_confirmation: 'password',
                     role: User.roles[:admin])

Client.first_or_create(first_name: 'Gisely',
                       last_name: 'Rosa',
                       phone_number: 11_978_228_466,
                       birthday: Time.zone.now - 20.years)

workers = [
  {
    first_name: 'Gisely',
    last_name: 'Rosa',
    job: 'Proprietaria e Hairstylist',
    phone_number: 11_974_000_738,
    instagram: 'giselyr',
    image_url: 'https://firebasestorage.googleapis.com/v0/b/dondoca-a6bd8.appspot.com/o/profile_images%2Fgisely.jpeg?alt=media&token=0ac4b8e2-5ea2-452e-b61c-554b22dbae1d'
  },
  {
    first_name: 'Juarezita',
    last_name: 'Rosa',
    job: 'Proprietaria, Manicure/Pedicure e Sobrancelha',
    phone_number: 11_971_190_391,
    instagram: 'juarezita_rosa',
    image_url: 'https://firebasestorage.googleapis.com/v0/b/dondoca-a6bd8.appspot.com/o/profile_images%2Fjuarezita.jpeg?alt=media&token=abbfe054-86cc-4543-a7c0-a50be8f5ee53'
  },
  {
    first_name: 'Silvia',
    job: 'Manicure/Pedicure',
    image_url: 'https://firebasestorage.googleapis.com/v0/b/dondoca-a6bd8.appspot.com/o/profile_images%2Fsilvia.jpeg?alt=media&token=8c187b3b-f77c-4140-bdb5-76be4fbd85c1'
  },
  {
    first_name: 'Elisangela',
    job: 'Manicure/Pedicure',
    image_url: 'https://firebasestorage.googleapis.com/v0/b/dondoca-a6bd8.appspot.com/o/profile_images%2Felisangela.jpeg?alt=media&token=1f5eea51-2c08-4c75-85bf-8951a07b30f0'
  },
  {
    first_name: 'Josiane',
    job: 'Secretária',
    image_url: 'https://firebasestorage.googleapis.com/v0/b/dondoca-a6bd8.appspot.com/o/profile_images%2Fjosi.jpeg?alt=media&token=baa99954-3509-48bb-b3ba-5f3dc687a88d'
  },
  {
    first_name: 'Luciana',
    job: 'Manicure/Pedicure',
    image_url: 'https://firebasestorage.googleapis.com/v0/b/dondoca-a6bd8.appspot.com/o/profile_images%2Fluciana.jpeg?alt=media&token=60ce99c0-5c18-459a-b00d-42e042535746'
  },
  {
    first_name: 'Marcela',
    job: 'Estética',
    image_url: 'https://firebasestorage.googleapis.com/v0/b/dondoca-a6bd8.appspot.com/o/profile_images%2Fmarcela.jpeg?alt=media&token=935785ae-ffd3-4264-9328-02cdc04a845b'
  },
  {
    first_name: 'Midiã',
    job: 'Manicure/Pedicure',
    image_url: 'https://firebasestorage.googleapis.com/v0/b/dondoca-a6bd8.appspot.com/o/profile_images%2Fmidia.jpeg?alt=media&token=4d23c220-b5ff-4964-b9ee-8bd92cb4571d'
  },
  {
    first_name: 'Sandra',
    job: 'Manicure/Pedicure',
    image_url: 'https://firebasestorage.googleapis.com/v0/b/dondoca-a6bd8.appspot.com/o/profile_images%2Fsandra.jpeg?alt=media&token=c56d9531-9b37-450c-b6a1-c9e73abe0827'
  }
]

Worker.destroy_all
Worker.create(workers)

scheduling = [
  {
    start_at: Time.zone.now,
    end_at: Time.zone.now + 30.minutes,
    worker: Worker.first,
    client: Client.first
  },
  {
    start_at: Time.zone.now + 1.hour,
    end_at: Time.zone.now + 2.hours,
    worker: Worker.first,
    client: Client.first
  },
  { start_at: Time.zone.now + 1.hour,
    end_at: Time.zone.now + 2.hours,
    worker: Worker.first,
    client: Client.first },
  {
    start_at: Time.zone.now + 2.hours,
    end_at: Time.zone.now + 3.hours,
    worker: Worker.last,
    client: Client.last
  },
  {
    start_at: Time.zone.now + 1.hour,
    end_at: Time.zone.now + 2.hours,
    worker: Worker.last,
    client: Client.last
  },
  {
    start_at: Time.zone.now + 3.hours,
    end_at: Time.zone.now + 3.hours,
    worker: Worker.last,
    client: Client.last
  },
  {
    start_at: Time.zone.now + 4.hours,
    end_at: Time.zone.now + 4.hours,
    worker: Worker.last,
    client: Client.last
  }
]

Schedule.create(scheduling)
