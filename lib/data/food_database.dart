import '../models/food_item.dart';

/// Built-in nutrition database. Values per 100 g unless noted.
/// Sources: USDA FoodData Central, Russian state composition tables (Скурихин).
class FoodDatabase {
  static const List<FoodItem> items = [
    // Fruits
    FoodItem(id: 'apple', name: 'Яблоко', nameEn: 'Apple', category: FoodCategory.fruit, calories: 52, protein: 0.3, fat: 0.2, carbs: 14),
    FoodItem(id: 'banana', name: 'Банан', nameEn: 'Banana', category: FoodCategory.fruit, calories: 89, protein: 1.1, fat: 0.3, carbs: 23),
    FoodItem(id: 'orange', name: 'Апельсин', nameEn: 'Orange', category: FoodCategory.fruit, calories: 47, protein: 0.9, fat: 0.1, carbs: 12),
    FoodItem(id: 'grape', name: 'Виноград', nameEn: 'Grapes', category: FoodCategory.fruit, calories: 69, protein: 0.7, fat: 0.2, carbs: 18),
    FoodItem(id: 'strawberry', name: 'Клубника', nameEn: 'Strawberry', category: FoodCategory.fruit, calories: 33, protein: 0.7, fat: 0.3, carbs: 8),
    FoodItem(id: 'pear', name: 'Груша', nameEn: 'Pear', category: FoodCategory.fruit, calories: 57, protein: 0.4, fat: 0.1, carbs: 15),
    FoodItem(id: 'pineapple', name: 'Ананас', nameEn: 'Pineapple', category: FoodCategory.fruit, calories: 50, protein: 0.5, fat: 0.1, carbs: 13),
    FoodItem(id: 'watermelon', name: 'Арбуз', nameEn: 'Watermelon', category: FoodCategory.fruit, calories: 30, protein: 0.6, fat: 0.2, carbs: 8),
    FoodItem(id: 'mango', name: 'Манго', nameEn: 'Mango', category: FoodCategory.fruit, calories: 60, protein: 0.8, fat: 0.4, carbs: 15),
    FoodItem(id: 'kiwi', name: 'Киви', nameEn: 'Kiwi', category: FoodCategory.fruit, calories: 61, protein: 1.1, fat: 0.5, carbs: 15),
    FoodItem(id: 'peach', name: 'Персик', nameEn: 'Peach', category: FoodCategory.fruit, calories: 39, protein: 0.9, fat: 0.3, carbs: 10),
    FoodItem(id: 'avocado', name: 'Авокадо', nameEn: 'Avocado', category: FoodCategory.fruit, calories: 160, protein: 2.0, fat: 14.7, carbs: 8.5),
    FoodItem(id: 'lemon', name: 'Лимон', nameEn: 'Lemon', category: FoodCategory.fruit, calories: 29, protein: 1.1, fat: 0.3, carbs: 9),
    FoodItem(id: 'cherry', name: 'Вишня', nameEn: 'Cherry', category: FoodCategory.fruit, calories: 50, protein: 1.0, fat: 0.3, carbs: 12),
    FoodItem(id: 'blueberry', name: 'Черника', nameEn: 'Blueberry', category: FoodCategory.fruit, calories: 57, protein: 0.7, fat: 0.3, carbs: 14),

    // Vegetables
    FoodItem(id: 'tomato', name: 'Помидор', nameEn: 'Tomato', category: FoodCategory.vegetable, calories: 18, protein: 0.9, fat: 0.2, carbs: 3.9),
    FoodItem(id: 'cucumber', name: 'Огурец', nameEn: 'Cucumber', category: FoodCategory.vegetable, calories: 16, protein: 0.7, fat: 0.1, carbs: 3.6),
    FoodItem(id: 'potato', name: 'Картофель', nameEn: 'Potato', category: FoodCategory.vegetable, calories: 77, protein: 2.0, fat: 0.1, carbs: 17),
    FoodItem(id: 'carrot', name: 'Морковь', nameEn: 'Carrot', category: FoodCategory.vegetable, calories: 41, protein: 0.9, fat: 0.2, carbs: 9.6),
    FoodItem(id: 'onion', name: 'Лук репчатый', nameEn: 'Onion', category: FoodCategory.vegetable, calories: 40, protein: 1.1, fat: 0.1, carbs: 9.3),
    FoodItem(id: 'garlic', name: 'Чеснок', nameEn: 'Garlic', category: FoodCategory.vegetable, calories: 149, protein: 6.5, fat: 0.5, carbs: 33),
    FoodItem(id: 'cabbage', name: 'Капуста белокочанная', nameEn: 'Cabbage', category: FoodCategory.vegetable, calories: 25, protein: 1.3, fat: 0.1, carbs: 5.8),
    FoodItem(id: 'broccoli', name: 'Брокколи', nameEn: 'Broccoli', category: FoodCategory.vegetable, calories: 34, protein: 2.8, fat: 0.4, carbs: 6.6),
    FoodItem(id: 'pepper', name: 'Перец болгарский', nameEn: 'Bell pepper', category: FoodCategory.vegetable, calories: 27, protein: 1.3, fat: 0.1, carbs: 6.0),
    FoodItem(id: 'beet', name: 'Свёкла', nameEn: 'Beetroot', category: FoodCategory.vegetable, calories: 43, protein: 1.6, fat: 0.2, carbs: 9.6),
    FoodItem(id: 'spinach', name: 'Шпинат', nameEn: 'Spinach', category: FoodCategory.vegetable, calories: 23, protein: 2.9, fat: 0.4, carbs: 3.6),
    FoodItem(id: 'lettuce', name: 'Салат листовой', nameEn: 'Lettuce', category: FoodCategory.vegetable, calories: 15, protein: 1.4, fat: 0.2, carbs: 2.9),
    FoodItem(id: 'corn', name: 'Кукуруза', nameEn: 'Corn', category: FoodCategory.vegetable, calories: 86, protein: 3.3, fat: 1.2, carbs: 19),
    FoodItem(id: 'mushroom', name: 'Шампиньоны', nameEn: 'Mushrooms', category: FoodCategory.vegetable, calories: 22, protein: 3.1, fat: 0.3, carbs: 3.3),
    FoodItem(id: 'zucchini', name: 'Кабачок', nameEn: 'Zucchini', category: FoodCategory.vegetable, calories: 17, protein: 1.2, fat: 0.3, carbs: 3.1),

    // Meat
    FoodItem(id: 'chicken_breast', name: 'Куриная грудка', nameEn: 'Chicken breast', category: FoodCategory.meat, calories: 165, protein: 31, fat: 3.6, carbs: 0),
    FoodItem(id: 'chicken_thigh', name: 'Куриное бедро', nameEn: 'Chicken thigh', category: FoodCategory.meat, calories: 209, protein: 26, fat: 11, carbs: 0),
    FoodItem(id: 'beef', name: 'Говядина', nameEn: 'Beef', category: FoodCategory.meat, calories: 250, protein: 26, fat: 17, carbs: 0),
    FoodItem(id: 'pork', name: 'Свинина', nameEn: 'Pork', category: FoodCategory.meat, calories: 242, protein: 27, fat: 14, carbs: 0),
    FoodItem(id: 'turkey', name: 'Индейка', nameEn: 'Turkey', category: FoodCategory.meat, calories: 189, protein: 29, fat: 7, carbs: 0),
    FoodItem(id: 'lamb', name: 'Баранина', nameEn: 'Lamb', category: FoodCategory.meat, calories: 294, protein: 25, fat: 21, carbs: 0),
    FoodItem(id: 'bacon', name: 'Бекон', nameEn: 'Bacon', category: FoodCategory.meat, calories: 541, protein: 37, fat: 42, carbs: 1.4),
    FoodItem(id: 'sausage', name: 'Сосиски', nameEn: 'Sausage', category: FoodCategory.meat, calories: 266, protein: 12, fat: 24, carbs: 1.6),
    FoodItem(id: 'ham', name: 'Ветчина', nameEn: 'Ham', category: FoodCategory.meat, calories: 145, protein: 21, fat: 6, carbs: 1.5),
    FoodItem(id: 'salami', name: 'Салями', nameEn: 'Salami', category: FoodCategory.meat, calories: 336, protein: 22, fat: 26, carbs: 2.4),

    // Fish
    FoodItem(id: 'salmon', name: 'Лосось', nameEn: 'Salmon', category: FoodCategory.fish, calories: 208, protein: 20, fat: 13, carbs: 0),
    FoodItem(id: 'tuna', name: 'Тунец', nameEn: 'Tuna', category: FoodCategory.fish, calories: 132, protein: 28, fat: 1.3, carbs: 0),
    FoodItem(id: 'cod', name: 'Треска', nameEn: 'Cod', category: FoodCategory.fish, calories: 82, protein: 18, fat: 0.7, carbs: 0),
    FoodItem(id: 'mackerel', name: 'Скумбрия', nameEn: 'Mackerel', category: FoodCategory.fish, calories: 191, protein: 19, fat: 13.2, carbs: 0),
    FoodItem(id: 'herring', name: 'Сельдь', nameEn: 'Herring', category: FoodCategory.fish, calories: 158, protein: 16, fat: 11, carbs: 0),
    FoodItem(id: 'shrimp', name: 'Креветки', nameEn: 'Shrimp', category: FoodCategory.fish, calories: 99, protein: 24, fat: 0.3, carbs: 0.2),
    FoodItem(id: 'trout', name: 'Форель', nameEn: 'Trout', category: FoodCategory.fish, calories: 148, protein: 21, fat: 7, carbs: 0),
    FoodItem(id: 'caviar', name: 'Икра красная', nameEn: 'Red caviar', category: FoodCategory.fish, calories: 252, protein: 24, fat: 18, carbs: 4),

    // Dairy
    FoodItem(id: 'milk', name: 'Молоко 3.2%', nameEn: 'Milk 3.2%', category: FoodCategory.dairy, calories: 60, protein: 2.9, fat: 3.2, carbs: 4.7),
    FoodItem(id: 'kefir', name: 'Кефир 2.5%', nameEn: 'Kefir 2.5%', category: FoodCategory.dairy, calories: 50, protein: 2.8, fat: 2.5, carbs: 3.9),
    FoodItem(id: 'yogurt', name: 'Йогурт натуральный', nameEn: 'Plain yogurt', category: FoodCategory.dairy, calories: 60, protein: 4.3, fat: 3.2, carbs: 6.2),
    FoodItem(id: 'cottage_cheese', name: 'Творог 5%', nameEn: 'Cottage cheese 5%', category: FoodCategory.dairy, calories: 121, protein: 17, fat: 5, carbs: 1.8),
    FoodItem(id: 'cheese_russian', name: 'Сыр Российский', nameEn: 'Russian cheese', category: FoodCategory.dairy, calories: 363, protein: 24, fat: 30, carbs: 0),
    FoodItem(id: 'mozzarella', name: 'Моцарелла', nameEn: 'Mozzarella', category: FoodCategory.dairy, calories: 280, protein: 18, fat: 22, carbs: 2.2),
    FoodItem(id: 'feta', name: 'Фета', nameEn: 'Feta', category: FoodCategory.dairy, calories: 264, protein: 14, fat: 21, carbs: 4.1),
    FoodItem(id: 'butter', name: 'Сливочное масло', nameEn: 'Butter', category: FoodCategory.dairy, calories: 717, protein: 0.9, fat: 81, carbs: 0.1),
    FoodItem(id: 'sour_cream', name: 'Сметана 20%', nameEn: 'Sour cream 20%', category: FoodCategory.dairy, calories: 206, protein: 2.8, fat: 20, carbs: 3.2),
    FoodItem(id: 'cream', name: 'Сливки 10%', nameEn: 'Cream 10%', category: FoodCategory.dairy, calories: 118, protein: 2.7, fat: 10, carbs: 4),
    FoodItem(id: 'egg', name: 'Яйцо куриное', nameEn: 'Chicken egg', category: FoodCategory.dairy, calories: 157, protein: 12.7, fat: 11.5, carbs: 0.7),

    // Grains
    FoodItem(id: 'rice', name: 'Рис белый (отварной)', nameEn: 'White rice (cooked)', category: FoodCategory.grain, calories: 130, protein: 2.7, fat: 0.3, carbs: 28),
    FoodItem(id: 'rice_brown', name: 'Рис бурый (отварной)', nameEn: 'Brown rice (cooked)', category: FoodCategory.grain, calories: 123, protein: 2.7, fat: 1.0, carbs: 25),
    FoodItem(id: 'buckwheat', name: 'Гречка (отварная)', nameEn: 'Buckwheat (cooked)', category: FoodCategory.grain, calories: 110, protein: 4.5, fat: 1.1, carbs: 21),
    FoodItem(id: 'oatmeal', name: 'Овсянка на воде', nameEn: 'Oatmeal (water)', category: FoodCategory.grain, calories: 88, protein: 3, fat: 1.7, carbs: 15),
    FoodItem(id: 'pasta', name: 'Макароны (отварные)', nameEn: 'Pasta (cooked)', category: FoodCategory.grain, calories: 131, protein: 5, fat: 1.1, carbs: 25),
    FoodItem(id: 'quinoa', name: 'Киноа (отварная)', nameEn: 'Quinoa (cooked)', category: FoodCategory.grain, calories: 120, protein: 4.4, fat: 1.9, carbs: 21),
    FoodItem(id: 'lentils', name: 'Чечевица (отварная)', nameEn: 'Lentils (cooked)', category: FoodCategory.grain, calories: 116, protein: 9, fat: 0.4, carbs: 20),
    FoodItem(id: 'chickpeas', name: 'Нут (отварной)', nameEn: 'Chickpeas (cooked)', category: FoodCategory.grain, calories: 164, protein: 8.9, fat: 2.6, carbs: 27),
    FoodItem(id: 'beans', name: 'Фасоль (отварная)', nameEn: 'Beans (cooked)', category: FoodCategory.grain, calories: 127, protein: 8.7, fat: 0.5, carbs: 23),
    FoodItem(id: 'semolina', name: 'Манная каша на молоке', nameEn: 'Semolina (milk)', category: FoodCategory.grain, calories: 98, protein: 3, fat: 3.2, carbs: 15),

    // Bakery
    FoodItem(id: 'bread_white', name: 'Хлеб белый', nameEn: 'White bread', category: FoodCategory.bakery, calories: 265, protein: 8, fat: 3.2, carbs: 49),
    FoodItem(id: 'bread_rye', name: 'Хлеб ржаной', nameEn: 'Rye bread', category: FoodCategory.bakery, calories: 174, protein: 6.6, fat: 1.2, carbs: 33),
    FoodItem(id: 'baguette', name: 'Багет', nameEn: 'Baguette', category: FoodCategory.bakery, calories: 274, protein: 9.0, fat: 1.6, carbs: 55),
    FoodItem(id: 'lavash', name: 'Лаваш', nameEn: 'Lavash', category: FoodCategory.bakery, calories: 277, protein: 7.9, fat: 1.0, carbs: 56),
    FoodItem(id: 'croissant', name: 'Круассан', nameEn: 'Croissant', category: FoodCategory.bakery, calories: 406, protein: 8.2, fat: 21, carbs: 46),
    FoodItem(id: 'bagel', name: 'Бейгл', nameEn: 'Bagel', category: FoodCategory.bakery, calories: 257, protein: 10, fat: 1.5, carbs: 50),
    FoodItem(id: 'pancake', name: 'Блины', nameEn: 'Pancakes', category: FoodCategory.bakery, calories: 233, protein: 6.1, fat: 8.5, carbs: 33),

    // Dishes
    FoodItem(id: 'borsch', name: 'Борщ', nameEn: 'Borsch', category: FoodCategory.dish, calories: 49, protein: 1.6, fat: 2.2, carbs: 6.2),
    FoodItem(id: 'olivier', name: 'Салат Оливье', nameEn: 'Olivier salad', category: FoodCategory.dish, calories: 198, protein: 5.5, fat: 16, carbs: 8.6),
    FoodItem(id: 'caesar', name: 'Салат Цезарь', nameEn: 'Caesar salad', category: FoodCategory.dish, calories: 192, protein: 9, fat: 14, carbs: 8),
    FoodItem(id: 'pelmeni', name: 'Пельмени', nameEn: 'Pelmeni', category: FoodCategory.dish, calories: 248, protein: 11.9, fat: 12.4, carbs: 22),
    FoodItem(id: 'plov', name: 'Плов', nameEn: 'Plov', category: FoodCategory.dish, calories: 196, protein: 5.7, fat: 9.1, carbs: 22),
    FoodItem(id: 'sushi', name: 'Суши', nameEn: 'Sushi', category: FoodCategory.dish, calories: 150, protein: 5.8, fat: 0.7, carbs: 30),
    FoodItem(id: 'pizza', name: 'Пицца Маргарита', nameEn: 'Pizza Margherita', category: FoodCategory.dish, calories: 266, protein: 11, fat: 10, carbs: 33),
    FoodItem(id: 'burger', name: 'Бургер', nameEn: 'Burger', category: FoodCategory.dish, calories: 295, protein: 17, fat: 14, carbs: 24),
    FoodItem(id: 'shawarma', name: 'Шаурма', nameEn: 'Shawarma', category: FoodCategory.dish, calories: 217, protein: 11, fat: 12, carbs: 18),
    FoodItem(id: 'pasta_bolognese', name: 'Паста Болоньезе', nameEn: 'Pasta Bolognese', category: FoodCategory.dish, calories: 158, protein: 8, fat: 5.7, carbs: 19),
    FoodItem(id: 'omelet', name: 'Омлет', nameEn: 'Omelet', category: FoodCategory.dish, calories: 184, protein: 9.6, fat: 15.4, carbs: 1.9),
    FoodItem(id: 'syrniki', name: 'Сырники', nameEn: 'Syrniki', category: FoodCategory.dish, calories: 220, protein: 16, fat: 8, carbs: 21),
    FoodItem(id: 'kotlety', name: 'Котлеты', nameEn: 'Cutlets', category: FoodCategory.dish, calories: 263, protein: 16, fat: 19, carbs: 8),
    FoodItem(id: 'sirniki', name: 'Греческий салат', nameEn: 'Greek salad', category: FoodCategory.dish, calories: 130, protein: 3.6, fat: 11.2, carbs: 4.7),
    FoodItem(id: 'mashed_potato', name: 'Картофельное пюре', nameEn: 'Mashed potato', category: FoodCategory.dish, calories: 88, protein: 2, fat: 3.3, carbs: 13),
    FoodItem(id: 'fries', name: 'Картофель фри', nameEn: 'French fries', category: FoodCategory.dish, calories: 312, protein: 3.4, fat: 15, carbs: 41),
    FoodItem(id: 'lasagna', name: 'Лазанья', nameEn: 'Lasagna', category: FoodCategory.dish, calories: 132, protein: 7, fat: 6, carbs: 12),

    // Drinks
    FoodItem(id: 'coffee', name: 'Кофе чёрный (без сахара)', nameEn: 'Black coffee', category: FoodCategory.drink, calories: 2, protein: 0.2, fat: 0, carbs: 0),
    FoodItem(id: 'cappuccino', name: 'Капучино', nameEn: 'Cappuccino', category: FoodCategory.drink, calories: 47, protein: 2.5, fat: 2.5, carbs: 3.4),
    FoodItem(id: 'latte', name: 'Латте', nameEn: 'Latte', category: FoodCategory.drink, calories: 56, protein: 3, fat: 3, carbs: 4.2),
    FoodItem(id: 'tea_black', name: 'Чай чёрный', nameEn: 'Black tea', category: FoodCategory.drink, calories: 1, protein: 0, fat: 0, carbs: 0.3),
    FoodItem(id: 'green_tea', name: 'Зелёный чай', nameEn: 'Green tea', category: FoodCategory.drink, calories: 1, protein: 0, fat: 0, carbs: 0.2),
    FoodItem(id: 'orange_juice', name: 'Апельсиновый сок', nameEn: 'Orange juice', category: FoodCategory.drink, calories: 45, protein: 0.7, fat: 0.2, carbs: 10),
    FoodItem(id: 'cola', name: 'Кока-кола', nameEn: 'Coca-Cola', category: FoodCategory.drink, calories: 42, protein: 0, fat: 0, carbs: 10.6),
    FoodItem(id: 'beer', name: 'Пиво светлое', nameEn: 'Beer', category: FoodCategory.drink, calories: 43, protein: 0.5, fat: 0, carbs: 3.6),
    FoodItem(id: 'wine_red', name: 'Вино красное сухое', nameEn: 'Red dry wine', category: FoodCategory.drink, calories: 68, protein: 0.2, fat: 0, carbs: 0.3),
    FoodItem(id: 'water', name: 'Вода', nameEn: 'Water', category: FoodCategory.drink, calories: 0, protein: 0, fat: 0, carbs: 0),

    // Sweets
    FoodItem(id: 'sugar', name: 'Сахар', nameEn: 'Sugar', category: FoodCategory.sweet, calories: 387, protein: 0, fat: 0, carbs: 100),
    FoodItem(id: 'honey', name: 'Мёд', nameEn: 'Honey', category: FoodCategory.sweet, calories: 304, protein: 0.3, fat: 0, carbs: 82),
    FoodItem(id: 'milk_chocolate', name: 'Шоколад молочный', nameEn: 'Milk chocolate', category: FoodCategory.sweet, calories: 535, protein: 7.6, fat: 30, carbs: 59),
    FoodItem(id: 'dark_chocolate', name: 'Шоколад тёмный', nameEn: 'Dark chocolate', category: FoodCategory.sweet, calories: 546, protein: 6.2, fat: 35, carbs: 52),
    FoodItem(id: 'icecream', name: 'Мороженое', nameEn: 'Ice cream', category: FoodCategory.sweet, calories: 207, protein: 3.5, fat: 11, carbs: 24),
    FoodItem(id: 'cheesecake', name: 'Чизкейк', nameEn: 'Cheesecake', category: FoodCategory.sweet, calories: 321, protein: 5.5, fat: 22, carbs: 26),
    FoodItem(id: 'tiramisu', name: 'Тирамису', nameEn: 'Tiramisu', category: FoodCategory.sweet, calories: 240, protein: 4, fat: 14, carbs: 24),
    FoodItem(id: 'cookie', name: 'Печенье овсяное', nameEn: 'Oatmeal cookie', category: FoodCategory.sweet, calories: 437, protein: 6.5, fat: 14, carbs: 71),
    FoodItem(id: 'donut', name: 'Пончик', nameEn: 'Donut', category: FoodCategory.sweet, calories: 452, protein: 5, fat: 25, carbs: 51),
    FoodItem(id: 'jam', name: 'Варенье', nameEn: 'Jam', category: FoodCategory.sweet, calories: 271, protein: 0.4, fat: 0.3, carbs: 70),

    // Nuts
    FoodItem(id: 'walnut', name: 'Грецкий орех', nameEn: 'Walnut', category: FoodCategory.nuts, calories: 654, protein: 15, fat: 65, carbs: 14),
    FoodItem(id: 'almond', name: 'Миндаль', nameEn: 'Almond', category: FoodCategory.nuts, calories: 575, protein: 21, fat: 49, carbs: 22),
    FoodItem(id: 'cashew', name: 'Кешью', nameEn: 'Cashew', category: FoodCategory.nuts, calories: 553, protein: 18, fat: 44, carbs: 30),
    FoodItem(id: 'hazelnut', name: 'Фундук', nameEn: 'Hazelnut', category: FoodCategory.nuts, calories: 628, protein: 15, fat: 61, carbs: 17),
    FoodItem(id: 'peanut', name: 'Арахис', nameEn: 'Peanut', category: FoodCategory.nuts, calories: 567, protein: 26, fat: 49, carbs: 16),
    FoodItem(id: 'pistachio', name: 'Фисташки', nameEn: 'Pistachio', category: FoodCategory.nuts, calories: 562, protein: 20, fat: 45, carbs: 28),
    FoodItem(id: 'sunflower_seeds', name: 'Семечки подсолнуха', nameEn: 'Sunflower seeds', category: FoodCategory.nuts, calories: 584, protein: 21, fat: 51, carbs: 20),

    // Other
    FoodItem(id: 'olive_oil', name: 'Оливковое масло', nameEn: 'Olive oil', category: FoodCategory.other, calories: 884, protein: 0, fat: 100, carbs: 0),
    FoodItem(id: 'sunflower_oil', name: 'Подсолнечное масло', nameEn: 'Sunflower oil', category: FoodCategory.other, calories: 884, protein: 0, fat: 100, carbs: 0),
    FoodItem(id: 'mayonnaise', name: 'Майонез', nameEn: 'Mayonnaise', category: FoodCategory.other, calories: 680, protein: 1, fat: 75, carbs: 1.6),
    FoodItem(id: 'ketchup', name: 'Кетчуп', nameEn: 'Ketchup', category: FoodCategory.other, calories: 112, protein: 1.7, fat: 0.4, carbs: 26),
    FoodItem(id: 'soy_sauce', name: 'Соевый соус', nameEn: 'Soy sauce', category: FoodCategory.other, calories: 53, protein: 8, fat: 0, carbs: 5),
    FoodItem(id: 'tofu', name: 'Тофу', nameEn: 'Tofu', category: FoodCategory.other, calories: 76, protein: 8, fat: 4.8, carbs: 1.9),
    FoodItem(id: 'hummus', name: 'Хумус', nameEn: 'Hummus', category: FoodCategory.other, calories: 166, protein: 7.9, fat: 9.6, carbs: 14),
  ];

  static FoodItem? findById(String id) {
    for (final item in items) {
      if (item.id == id) return item;
    }
    return null;
  }

  static List<FoodItem> search(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return const [];
    final results = <_ScoredItem>[];
    for (final item in items) {
      final name = item.name.toLowerCase();
      final nameEn = item.nameEn.toLowerCase();
      int score = 0;
      if (name == q || nameEn == q) {
        score = 100;
      } else if (name.startsWith(q) || nameEn.startsWith(q)) {
        score = 80;
      } else if (name.contains(q) || nameEn.contains(q)) {
        score = 50;
      }
      if (score > 0) results.add(_ScoredItem(item, score));
    }
    results.sort((a, b) => b.score.compareTo(a.score));
    return results.map((e) => e.item).toList();
  }

  static List<FoodItem> byCategory(FoodCategory category) {
    return items.where((i) => i.category == category).toList();
  }

  static List<FoodItem> popular() {
    const popularIds = [
      'apple', 'banana', 'chicken_breast', 'rice', 'egg',
      'oatmeal', 'salmon', 'avocado', 'cheese_russian', 'buckwheat',
      'pizza', 'borsch',
    ];
    return popularIds
        .map(findById)
        .whereType<FoodItem>()
        .toList();
  }
}

class _ScoredItem {
  final FoodItem item;
  final int score;
  _ScoredItem(this.item, this.score);
}
