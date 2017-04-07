# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_profile = Profile.create(name: 'admin',
                               users_permission: true,
                               indicators_permission: true,
                               reports_permission: true,
                               statistics_permission: true,
                               profiles_permission: true,
                               create_users: true,
                               list_users: true,
                               edit_users: true,
                               deactivate_users: true,
                               create_profiles: true,
                               list_profiles: true,
                               edit_profiles: true,
                               clone_profiles: true
                               )

owner = Profile.create(name: 'owner',
                       users_permission: false,
                       indicators_permission: false,
                       reports_permission: true,
                       statistics_permission: false,
                       profiles_permission: false)

typist = Profile.create(name: 'typist',
                        users_permission: false,
                        indicators_permission: true,
                        reports_permission: true,
                        statistics_permission: false,
                        profiles_permission: false)

evaluator = Profile.create(name: 'evaluator',
                           users_permission: false,
                           indicators_permission: true,
                           reports_permission: true,
                           statistics_permission: false,
                           profiles_permission: false)

admin_user = User.create(name: 'Juan',
                         email: 'juseve200@gmail.com',
                         profile_id: 1,
                         password: '12341234',
                         password_confirmation: '12341234',
                         last_name: 'velasquez',
                         document: 1116264525,
                         address: 'Cra 10 #5-03')

# Indicators and variables

# Manejo de suelos

Indicator.create(name: 'Manejo de suelos')

# variables for manejo de suelos

Variable.create(name: 'Presencia de coberturas vivas y mulch (establecidas o espontaneas) en toda el área cultivada',
                optimun_rating: 1.2,
                indicator_id: 1)

Variable.create(name: 'Labranza mínima o de conservación en las áreas de cultivos (Solo el sitio sembrado, curvas a nivel, terrazas etc)',
                optimun_rating: 1.2,
                indicator_id: 1)

Variable.create(name: 'Barreras vivas y zanjas de infiltración',
                optimun_rating: 0.8,
                indicator_id: 1)

Variable.create(name: 'Rotación de cultivos o rotación del pastoreo ',
                optimun_rating: 0.8,
                indicator_id: 1)

Variable.create(name: 'Estructura granular y color pardo oscuro',
                optimun_rating: 0.5,
                indicator_id: 1)

Variable.create(name: 'Abundancia de vida visible ',
                optimun_rating: 0.5,
                indicator_id: 1)

# Manejo de aguas

Indicator.create(name: 'Manejo de aguas')

Variable.create(name: 'Disponibilidad de agua',
                optimun_rating: 0.5,
                indicator_id: 2)

Variable.create(name: 'Cantidad de agua producida en la finca',
                optimun_rating: 0.5,
                indicator_id: 2)

Variable.create(name: 'Cobertura y protección de las fuentes de agua',
                optimun_rating: 1,
                indicator_id: 2)

Variable.create(name: 'Grado de contaminación producida en la finca',
                optimun_rating: 1,
                indicator_id: 2)

Variable.create(name: 'Eficiencia en el uso racional del agua',
                optimun_rating: 1,
                indicator_id: 2)

Variable.create(name: 'Existencia de sistemas de tratamiento y descontaminación de agua',
                optimun_rating: 1,
                indicator_id: 2)

# Diversidad del componente pecuario para el autoconsumo.

Indicator.create(name: 'Diversidad del componente pecuario para el autoconsumo')

Variable.create(name: 'Hay  producción y consumo permanente, suficiente de conejos, cuyes y peces',
                optimun_rating: 1,
                indicator_id: 3)

Variable.create(name: 'Hay producción y consumo permanente y suficiente de aves como gallinas, huevos, pollos de engorde',
                optimun_rating: 2.3,
                indicator_id: 3)

Variable.create(name: 'Hay producción y consumo permanente y suficiente  de leche',
                optimun_rating: 1.5,
                indicator_id: 3)

Variable.create(name: 'Hay producción y consumo permanente y suficiente  de carne de cerdos',
                optimun_rating: 0.2,
                indicator_id: 3)

# Diversidad del componente pecuario para el mercado.

Indicator.create(name: 'Diversidad del componente pecuario para el mercado')

Variable.create(name: 'Se recibe un ingreso promedio mensual de $140.000 por concepto de venta de bovinos cebados',
                optimun_rating: 1.2,
                indicator_id: 4)

Variable.create(name: 'Se recibe un ingreso promedio mensual de $70.000 por concepto de venta de cerdos cebados',
                optimun_rating: 1.1,
                indicator_id: 4)

Variable.create(name: 'Se recibe un ingreso promedio mensual de $60.000 por concepto de venta de pollos, gallinas y huevos',
                optimun_rating: 1.2,
                indicator_id: 4)

Variable.create(name: 'Se recibe un ingreso promedio mensual de $30.000 por concepto de venta de conejos, cuyes y peces',
                optimun_rating: 0.5,
                indicator_id: 4)

Variable.create(name: 'Se recibe un ingreso promedio mensual de $70.000 por concepto de venta de leche',
                optimun_rating: 1,
                indicator_id: 4)

# Diversidad del componente agrícola para el autoconsumo

Indicator.create(name: 'Diversidad del componente agrícola para el autoconsumo')

Variable.create(name: 'Hay producción y autoconsumo permanente y suficiente de maíz, frijol y plátano',
                optimun_rating: 1.5,
                indicator_id: 5)

Variable.create(name: 'Hay producción y autoconsumo permanente y suficiente de yuca y arracacha',
                optimun_rating: 1,
                indicator_id: 5)

Variable.create(name: 'Hay producción y autoconsumo permanente y suficiente de hortalizas',
                optimun_rating: 1.3,
                indicator_id: 5)

Variable.create(name: 'Hay producción y autoconsumo permanente y suficiente de frutas',
                optimun_rating: 1,
                indicator_id: 5)

Variable.create(name: 'Hay consumo de otras especies alimenticias (Yacón, quinua, achira, zagu, mamafa, papachina, etc)',
                optimun_rating: 0.2,
                indicator_id: 5)

#  Diversidad del componente agrícola para el mercado

Indicator.create(name: 'Diversidad del componente agrícola para el mercado')

Variable.create(name: 'Se recibe ingreso promedio mensual de $280.000 por concepto de venta de café',
                optimun_rating: 2,
                indicator_id: 6)

Variable.create(name: 'Se recibe ingreso promedio mensual de $90.000 por concepto de venta de plátano',
                optimun_rating: 1.5,
                indicator_id: 6)

Variable.create(name: 'Se recibe ingreso promedio mensual de $55.000 por concepto de venta de frutas (Mora, lulo, curuba, tomate de árbol, uchuva, aguacate, naranja, mandarina, limón)',
                optimun_rating: 1,
                indicator_id: 6)

Variable.create(name: 'Se recibe ingreso promedio mensual de $50.000 por concepto de venta de maíz, frijol, yuca y hortalizas',
                optimun_rating: 0.5,
                indicator_id: 6)

#  Grado de compromiso de la familia con la producción 

Indicator.create(name: 'Grado de compromiso de la familia con la producción')

Variable.create(name: 'El hombre aplica sus conocimientos en el manejo integral de la finca',
                optimun_rating: 1.7,
                indicator_id: 7)

Variable.create(name: 'Las mujeres se encargan de la siembra y cuidado de la huerta, el jardín y del manejo de los animales de la finca',
                optimun_rating: 1.7,
                indicator_id: 7)

Variable.create(name: 'Las mujeres, los jóvenes, los niños y las niñas aplican controles culturales, participan en la preparación de los abonos orgánicos y usan controles biológicos',
                optimun_rating: 0.8,
                indicator_id: 7)

Variable.create(name: 'Los jóvenes, los niños y las niñas colaboran con el establecimiento de las huertas, jardines y manejo de los animales',
                optimun_rating: 0.8,
                indicator_id: 7)

#  Estado de la vivienda (infraestructura y entorno.)

Indicator.create(name: 'Estado de la vivienda (infraestructura y entorno.)')

Variable.create(name: 'La vivienda ofrece buenas condiciones para ser habitada',
                optimun_rating: 2,
                indicator_id: 8)

Variable.create(name: 'La vivienda cuenta con batería sanitaria',
                optimun_rating: 1.5,
                indicator_id: 8)

Variable.create(name: 'La vivienda cuenta con jardines',
                optimun_rating: 1,
                indicator_id: 8)

Variable.create(name: 'La vivienda cuenta con áreas para el esparcimiento',
                optimun_rating: 0.5,
                indicator_id: 8)

#  Grado de interacción con la comunidad

Indicator.create(name: 'Grado de interacción con la comunidad')

Variable.create(name: 'La familia participa activamente en espacios organizativos amplios (Asociaciones campesinas, JAC, Grupos ecológicos, entre otros)',
                optimun_rating: 2,
                indicator_id: 9)

Variable.create(name: 'Asisten y participa en los CMDR',
                optimun_rating: 0.5,
                indicator_id: 9)

Variable.create(name: 'Colaboran en actividades solidarias en su comunidad',
                optimun_rating: 1,
                indicator_id: 9)

Variable.create(name: 'Colaboran en actividades para mejorar el entorno comunitario (arreglo de vías, embellecimiento de escuelas y colegios y otros espacios)',
                optimun_rating: 1.5,
                indicator_id: 9)

# Dependencia de insumos externo

Indicator.create(name: 'Dependencia de insumos externo')

Variable.create(name: 'La familia produce el 80% de la alimentación para los animales',
                optimun_rating: 1,
                indicator_id: 10)

Variable.create(name: 'Produce el 100% de los abonos orgánicos',
                optimun_rating: 1,
                indicator_id: 10)

Variable.create(name: 'Produce y aplica el 100% de los controles de plagas y enfermedades',
                optimun_rating: 1,
                indicator_id: 10)

Variable.create(name: 'Aplica controles culturales para el manejo de arvenses',
                optimun_rating: 1,
                indicator_id: 10)

Variable.create(name: 'Siembra y aprovecha de manera racional sus propias maderas',
                optimun_rating: 0.5,
                indicator_id:  10)

Variable.create(name: 'Siembra y conserva las semillas nativas alimenticias, medicinales y aromáticas',
                optimun_rating: 0.5,
                indicator_id: 10)

# Manejo administrativo de la finca

Indicator.create(name: 'Manejo administrativo de la finca')

Variable.create(name: 'Planifica adecuadamente sus sistemas de producción (Costos de producción, área sembrada, rentabilidad)',
                optimun_rating: 1.5,
                indicator_id: 11)

Variable.create(name: 'Toma adecuadamente registros de mano de obra',
                optimun_rating: 0.5,
                indicator_id: 11)

Variable.create(name: 'Toma adecuadamente  registros de compra de insumos',
                optimun_rating: 0.5,
                indicator_id: 11)

Variable.create(name: 'Toma adecuadamente  registros de venta de productos',
                optimun_rating: 0.5,
                indicator_id: 11)

Variable.create(name: 'Maneja análisis de rentabilidad por renglón productivo',
                optimun_rating: 1,
                indicator_id:  11)

Variable.create(name: 'Maneja inventario de la finca (Herramientas, equipos, cultivos, muebles, enseres, etc)',
                optimun_rating: 1,
                indicator_id: 11)

#  Disponibilidad de mano de obra

Indicator.create(name: 'Disponibilidad de mano de obra')

Variable.create(name: 'Existe mano de obra familiar',
                optimun_rating: 2,
                indicator_id: 12)

Variable.create(name: 'Existen recursos económicos para ser contratada',
                optimun_rating: 1.2,
                indicator_id: 12)

Variable.create(name: 'Existe la cultura de las mingas',
                optimun_rating: 1.3,
                indicator_id: 12)

Variable.create(name: 'Existe la oferta de mano de obra en la zona',
                optimun_rating: 0.5,
                indicator_id: 12)

# Color codes

ColorCode.create(state: 'Critico',
                 min: 0.0,
                 max: 1.0,
                 color: '#f44336',
                 alert: 'Atención Urgente',
                 attention_time: 'Corto Plazo')

ColorCode.create(state: 'Moderadamente Critico',
                 min: 1.1,
                 max: 2.0,
                 color: '#ff9800',
                 alert: 'Atención Urgente',
                 attention_time: 'Corto Plazo')

ColorCode.create(state: 'Levemente Critico',
                 min: 2.1,
                 max: 3.0,
                 color: '#ffeb3b',
                 alert: 'Atención Urgente',
                 attention_time: 'Corto Plazo')

ColorCode.create(state: 'Susceptible de mejora',
                 min: 3.1,
                 max: 4.0,
                 color: '#03a9f4',
                 alert: 'Gestión de Mejora',
                 attention_time: 'Mediano Plazo')

ColorCode.create(state: 'Sostenibilidad Avanzada',
                 min: 4.1,
                 max: 5.0,
                 color: '#4caf50',
                 alert: 'Mejora Sostenida',
                 attention_time: 'Continuo')