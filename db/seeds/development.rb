# frozen_string_literal: true

unless Client.count.positive?
  Client.create(first_name: 'Gisely',
                last_name: 'Rosa',
                phone_number: 11_978_228_466,
                birthday: Time.zone.now - 20.years)
end

unless Worker.count.positive?
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
      instagram: 'silvianaildesigner7',
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
      instagram: 'lucianamonteiro6148',
      image_url: 'https://firebasestorage.googleapis.com/v0/b/dondoca-a6bd8.appspot.com/o/profile_images%2Fluciana.jpeg?alt=media&token=60ce99c0-5c18-459a-b00d-42e042535746'
    },
    {
      first_name: 'Marcela',
      job: 'Estética',
      instagram: 'marcelasantos_esteticista',
      image_url: 'https://firebasestorage.googleapis.com/v0/b/dondoca-a6bd8.appspot.com/o/profile_images%2Fmarcela.jpeg?alt=media&token=935785ae-ffd3-4264-9328-02cdc04a845b'
    },
    {
      first_name: 'Midiã',
      job: 'Manicure/Pedicure',
      instagram: 'miicarvalho.20',
      image_url: 'https://firebasestorage.googleapis.com/v0/b/dondoca-a6bd8.appspot.com/o/profile_images%2Fmidia.jpeg?alt=media&token=4d23c220-b5ff-4964-b9ee-8bd92cb4571d'
    },
    {
      first_name: 'Sandra',
      job: 'Manicure/Pedicure',
      image_url: 'https://firebasestorage.googleapis.com/v0/b/dondoca-a6bd8.appspot.com/o/profile_images%2Fsandra.jpeg?alt=media&token=c56d9531-9b37-450c-b6a1-c9e73abe0827'
    },
    {
      first_name: 'Daniela',
      job: 'Manicure/Pedicure',
      image_url: 'https://firebasestorage.googleapis.com/v0/b/dondoca-a6bd8.appspot.com/o/profile_images%2Fdaniela.jpeg?alt=media&token=6fff85a6-f1d3-49c5-8a4f-71cae0059f84'
    }
  ]

  Worker.create(workers)
end

unless Schedule.count.positive?
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
end

unless Category.count.positive?
  categories = [
    { name: 'Depilação' },
    { name: 'Mãos e Pés' },
    { name: 'Cabelo' },
    { name: 'Sobrancelha' },
    { name: 'Estética Corporal' },
    { name: 'Penteados' },
    { name: 'Estética Capilar' },
    { name: 'Maquiagem' }
  ]

  Category.create(categories)
end

unless Service.count.positive?
  services = [
    {
      name: 'Depilação de Axilas com Linha',
      duration: 30,
      description: 'Depilação de Axilas com Linha.',
      category: Category.find_by(name: 'Depilação'),
      price: 25
    },
    {
      name: 'Depilação de Buço',
      duration: 20,
      description: 'Depilação com cera do Buço. Ideal para mulheres que estão incomodadas com pelos no rosto.',
      category: Category.find_by(name: 'Depilação'),
      price: 20
    },
    {
      name: 'Depilação de Coxas',
      duration: 30,
      description: 'Depilação das Coxas, com cera.',
      category: Category.find_by(name: 'Depilação'),
      price: 35
    },
    {
      name: 'Depilação de Meia Perna',
      duration: 30,
      description: 'Meia Perna',
      category: Category.find_by(name: 'Depilação'),
      price: 35
    },
    {
      name: 'Depilação de Meia Perna + Virilha',
      duration: 60,
      description: 'Meia Perna + Virilha',
      category: Category.find_by(name: 'Depilação'),
      price: 100
    },
    {
      name: 'Depilação de Meia Perna + Virilha + Axila',
      duration: 60,
      description: 'Meia Perna + Virilha + Axila',
      category: Category.find_by(name: 'Depilação'),
      price: 125
    },
    {
      name: 'Depilação de Perna Inteira',
      duration: 30,
      description: 'Perna Inteira',
      category: Category.find_by(name: 'Depilação'),
      price: 55
    },
    {
      name: 'Depilação de Perna Inteira + Virilha',
      duration: 60,
      description: 'Perna Inteira + Virilha',
      category: Category.find_by(name: 'Depilação'),
      price: 120
    },
    {
      name: 'Depilação de Rosto Feminino',
      duration: 30,
      description: 'Depilação de Rosto Feminino',
      category: Category.find_by(name: 'Depilação'),
      price: 30
    },
    {
      name: 'Depilação de Virilha Completa',
      duration: 60,
      description: 'Depilação Virilha Completa',
      category: Category.find_by(name: 'Depilação'),
      price: 65
    },
    {
      name: 'Depilação Íntima',
      duration: 45,
      description: 'Depilação Íntima',
      category: Category.find_by(name: 'Depilação'),
      price: 65
    },
    {
      name: 'Blindagem',
      duration: 60,
      description: 'A Blindagem, é um procedimento de cobrir o leito da unha com uma camada fina de gel, visando maior resistência das unhas naturais. Cutilagem das unhas das mãos.',
      category: Category.find_by(name: 'Mãos e Pés'),
      price: 75
    },
    {
      name: 'Fibra de Vidro',
      duration: 240,
      description: 'A fibra de vidro, é um alongament, para deixar as unhas com aspecto de unhas naturais. Cutilagem e esmaltação da unhas das mãos.',
      category: Category.find_by(name: 'Mãos e Pés'),
      price: 155
    },
    {
      name: 'Manicure',
      duration: 60,
      description: 'Cutilação e esmaltação das unhas das mãos.',
      category: Category.find_by(name: 'Mãos e Pés'),
      price: 30
    },
    {
      name: 'Manicure e Pedicure',
      duration: 120,
      description: 'Cutilação e esmaltação das unhas das mãos e dos pés.',
      category: Category.find_by(name: 'Mãos e Pés'),
      price: 65
    },
    {
      name: 'Manutenção - Banho de Gel',
      duration: 240,
      description: 'Feita novamente a cada 15 a 20 dias. Cutilagem e esmaltação das unhas das mãos.',
      category: Category.find_by(name: 'Mãos e Pés'),
      price: 75
    },
    {
      name: 'Manutenção - Fibra',
      duration: 240,
      description: 'Manutenção feita a cada 20 dias, para manter a naturalidade da unha. Cutilagem e esmaltação das unhas das mãos.',
      category: Category.find_by(name: 'Mãos e Pés'),
      price: 85
    },
    {
      name: 'Pedicure',
      duration: 60,
      description: 'Cutilação e esmaltação das unhas dos pés. Opções de esmaltes nacionais e internationais.',
      category: Category.find_by(name: 'Mãos e Pés'),
      price: 35,
      min_price: true
    },
    {
      name: 'Escova Modelada c/ Babyliss',
      duration: 60,
      category: Category.find_by(name: 'Cabelo'),
      price: 65
    },
    {
      name: 'Hidratação',
      duration: 90,
      category: Category.find_by(name: 'Cabelo'),
      price: 80
    },
    {
      name: 'Hidratação com Ozônio',
      duration: 100,
      category: Category.find_by(name: 'Cabelo'),
      price: 110
    },
    {
      name: 'Plástica Capilar',
      duration: 150,
      category: Category.find_by(name: 'Cabelo'),
      price: 170
    },
    {
      name: 'Selante Franja',
      duration: 120,
      category: Category.find_by(name: 'Cabelo'),
      price: 120
    },
    {
      name: 'Tonalização de Mechas',
      duration: 120,
      category: Category.find_by(name: 'Cabelo'),
      price: 150
    },
    {
      name: 'Aplicação de Coloração',
      duration: 90,
      description: 'Aplicação de Coloração. Produto levado pelo cliente.',
      category: Category.find_by(name: 'Cabelo'),
      price: 80,
      min_price: true
    },
    {
      name: 'Avaliação',
      duration: 30,
      description: 'Reunião ou avaliação com cliente',
      category: Category.find_by(name: 'Cabelo'),
      price: 0
    },
    {
      name: 'Hidratação Simples',
      duration: 10,
      description: 'Hidratação dos Cabelos + Escova.',
      category: Category.find_by(name: 'Cabelo'),
      price: 20
    },
    {
      name: 'Mechas',
      duration: 120,
      description: 'Clareamento ou coloração de mechas largas. Normalmente os tons contrastam com a cor natural dos fios.',
      category: Category.find_by(name: 'Cabelo'),
      price: 400,
      min_price: true
    },
    {
      name: 'Teste de Mecha',
      duration: 30,
      description: 'Teste de descoloração de mecha',
      category: Category.find_by(name: 'Cabelo'),
      price: 0
    },
    {
      name: 'Design de Sobrancelha',
      duration: 30,
      category: Category.find_by(name: 'Sobrancelha'),
      price: 35
    },
    {
      name: 'Pintura Sobrancelhas - Henna',
      duration: 30,
      category: Category.find_by(name: 'Sobrancelha'),
      price: 20
    },
    {
      name: 'Pintura Sobrancelhas com Refectocil',
      duration: 30,
      category: Category.find_by(name: 'Sobrancelha'),
      price: 20
    },
    {
      name: 'Sobrancelha',
      duration: 30,
      category: Category.find_by(name: 'Sobrancelha'),
      price: 30,
      min_price: true
    },
    {
      name: 'Limpeza de Pele',
      duration: 90,
      category: Category.find_by(name: 'Estética Corporal'),
      price: 120
    },
    {
      name: 'Drenagem Linfática',
      duration: 60,
      category: Category.find_by(name: 'Estética Corporal'),
      price: 90,
      min_price: true
    },
    {
      name: 'Massagem Modeladora ou Lipomodeladora',
      duration: 60,
      description: 'A massagem modeladora é executada utilizando movimentos rápidos, repetitivos e firmes sobre os tecidos do corpo favorecendo a quebra das células de gordura localizada que são
      eliminadas pela corrente sanguínea.',
      category: Category.find_by(name: 'Estética Corporal'),
      price: 120,
      min_price: true
    },
    {
      name: 'Massagem Relaxante',
      duration: 60,
      category: Category.find_by(name: 'Estética Corporal'),
      price: 90,
      min_price: true
    },
    {
      name: 'Baby Liss / Cachos',
      duration: 60,
      description: 'Cachos nos cabelos. Técnica pode ser realizada manualmente ou com babyliss. Os cachos estão em alta e dão um ar informal ao visual.',
      category: Category.find_by(name: 'Penteados'),
      price: 60,
      min_price: true
    },
    {
      name: 'Teste de Noiva',
      duration: 180,
      category: Category.find_by(name: 'Penteados'),
      price: 0
    },
    {
      name: 'Estética Capilar',
      duration: 60,
      description: 'O estudo da estética capilar envolve tricologia, anatomia capilar, patologias dos fios e do couro cabeludo e suas formas de tratamento, terapias capilares, tipos de alisamentos
      e químicas utilizadas no fio de cabelo, hidratações dos cabelos, modo correto de fazer a higienização, diagnosticar o fio de cabelo.',
      category: Category.find_by(name: 'Estética Capilar'),
      price: 100,
      min_price: true
    },
    {
      name: 'Maquiagem',
      duration: 60,
      category: Category.find_by(name: 'Maquiagem'),
      price: 150,
      min_price: true
    }
  ]

  Service.create(services)
end
