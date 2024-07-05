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
      category: 'ten',
      foods: [
        // { name: '红烧肉', category: 'ten', image: '../../images/hongshaorou.png' },
        // { name: '葱爆羊肉', category: 'ten', image: '../../images/cbyr.png' },
        // { name: '冬瓜排骨汤', category: 'ten', image: '../../images/hongshaorou.png' },
        // { name: '宫保鸡丁', category: 'six', image: '../../images/OIP.jpg' },
        // { name: '食物E', category: 'six', image: '/images/imageE.jpg' },
        // { name: '食物F', category: 'six', image: '/images/imageF.jpg' },
        // { name: '食物G', category: 'four', image: '/images/imageG.jpg' },
        // { name: '食物H', category: 'four', image: '/images/imageH.jpg' },
        // { name: '鸡蛋羹', category: 'four', image: '/images/imageI.jpg' },
        { name: '红烧肉', category: 'ten', image: '../../images/Food/OSK.jpg' },
        { name: '宫保鸡丁', category: 'ten', image: '../../images/Food/OIP.jpg' },
        { name: '鱼香茄子', category: 'ten', image: '../../images/Food/OIP1.jpg' },
        { name: '炒青菜', category: 'six', image: '../../images/Food/th.jpg' },
        { name: '西红柿炒鸡蛋', category: 'six', image: '../../images/Food/OSK1.jpg' },
        { name: '麻婆豆腐', category: 'six', image: '../../images/Food/OSK2.jpg' },
        { name: '蒸蛋', category: 'four', image: '../../images/Food/ega.jpg' },
        { name: '白菜豆腐汤', category: 'four', image: '../../images/Food/OSK3.jpg' },
        { name: '清炒豆芽', category: 'four', image: '../../images/Food/OSK4.jpg' }
      ],
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
  /* width: 100%; */
  /* height: auto; */
  width: 200px;
  height: 200px;
}
</style>
