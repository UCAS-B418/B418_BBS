<template>
  <div class="food">
    <h1>今日美食</h1>
    <div class="price-buttons">
      <button @click="filterDishes('10元区')">十元区</button>
      <button @click="filterDishes('6元区')">六元区</button>
      <button @click="filterDishes('4元区')">四元区</button>
    </div>
    <div class="dishes">
      <div v-for="dish in filteredDishes" :key="dish.id" class="dish">
        <img :src="dish.image" :alt="dish.name" class="dish-image">
        <p class="dish-name">{{ dish.name }}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      selectedCategory: '10元区',
      dishes: [
        { id: 1, name: '红烧肉', category: '10元区', image: 'path/to/image1.jpg' },
        { id: 2, name: '宫保鸡丁', category: '10元区', image: 'path/to/image2.jpg' },
        { id: 3, name: '鱼香茄子', category: '10元区', image: 'path/to/image3.jpg' },
        { id: 4, name: '炒青菜', category: '6元区', image: 'path/to/image4.jpg' },
        { id: 5, name: '西红柿炒鸡蛋', category: '6元区', image: 'path/to/image5.jpg' },
        { id: 6, name: '麻婆豆腐', category: '6元区', image: 'path/to/image6.jpg' },
        { id: 7, name: '蒸蛋', category: '4元区', image: 'path/to/image7.jpg' },
        { id: 8, name: '白菜豆腐汤', category: '4元区', image: 'path/to/image8.jpg' },
        { id: 9, name: '清炒豆芽', category: '4元区', image: 'path/to/image9.jpg' }
      ]
    };
  },
  computed: {
    filteredDishes() {
      return this.dishes.filter(dish => dish.category === this.selectedCategory);
    }
  },
  methods: {
    filterDishes(category) {
      this.selectedCategory = category;
    }
  }
};
</script>

<style scoped>
.food {
  padding: 20px;
  text-align: center;
}

.price-buttons {
  margin-bottom: 20px;
}

.price-buttons button {
  margin: 0 10px;
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
}

.dishes {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

.dish {
  width: 30%;
  margin: 10px;
  text-align: center;
}

.dish img {
  width: 100%;
  height: auto;
  border-radius: 8px;
}

.dish-name {
  margin-top: 10px;
  font-size: 18px;
  font-weight: bold;
}
</style>
