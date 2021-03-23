Item.create([{ name: 'Sugar' }, { name: 'Salt' }, { name: 'Flour' }, { name: 'Cinnamon' }, { name: 'Pasta' }])

User.create([{username: "user1"}, {username: "user2"}, {username: "user3"}])


Measurement.create([{item_id: 1, quantity: 1, unit: "Cup", user_id: 1}, {item_id: 2, quantity: 1, unit: "Container", user_id: 1},{item_id: 3, quantity: 3, unit: "Bags", user_id: 3},{item_id: 4, quantity: 2, unit: "Containers", user_id: 3},{item_id: 5, quantity: 1, unit: "Box", user_id: 1},{item_id: 5, quantity: 3, unit: "Boxes", user_id: 2}])
