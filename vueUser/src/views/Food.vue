<template>
  <div class="food-container">
    <div class="category-buttons">
      <button @click="setCategory('ten')">十元区</button>
      <button @click="setCategory('six')">六元区</button>
      <button @click="setCategory('four')">四元区</button>
    </div>
    <div class="food-items">
      <div v-for="food in filteredFoods" :key="food.name" class="food-item">
        <img :src="food.image" :alt="food.name" />
        <p>{{ food.name }}</p>
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
        { id: 1, name: '红烧肉', category: '10元区', image: '../../public/Food/OSK.jpg' },
        { id: 2, name: '宫保鸡丁', category: '10元区', image: '../assets/Food/OIP.jpg' },
        { id: 3, name: '鱼香茄子', category: '10元区', image: '../assets/Food/OIP1.jpg' },
        { id: 4, name: '炒青菜', category: '6元区', image: '../assets/Food/th.jpg' },
        { id: 5, name: '西红柿炒鸡蛋', category: '6元区', image: '../assets/Food/OSK1.jpg' },
        { id: 6, name: '麻婆豆腐', category: '6元区', image: '../assets/Food/OSK2.jpg' },
        { id: 7, name: '蒸蛋', category: '4元区', image: '../assets/Food/ega.jpg' },
        { id: 8, name: '白菜豆腐汤', category: '4元区', image: '../assets/Food/OSK3.jpg' },
        { id: 9, name: '清炒豆芽', category: '4元区', image: '../assets/Food/OSK4.jpg' }
      ]
    };
  },
  computed: {
    filteredFoods() {
      return this.foods.filter(food => food.category === this.category);
    },
  },
  methods: {
    setCategory(category) {
      this.category = category;
    },
  },
};
</script>

<style scoped>
.food-container {
  text-align: center;
}

.category-buttons {
  margin-bottom: 20px;
}

.category-buttons button {
  margin: 0 10px;
  padding: 10px 20px;
  cursor: pointer;
}

.food-items {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

.food-item {
  width: 25%;
  margin: 10px;
  text-align: center;
}

.food-item img {
  width: 100%;
  height: auto;
}
</style>
