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
        { name: '红烧肉', category: 'ten', image: '../../images/hongshaorou.png' },
        { name: '葱爆羊肉', category: 'ten', image: '../../images/cbyr.png' },
        { name: '冬瓜排骨汤', category: 'ten', image: '/images/dgpgt.jpg' },
        { name: '食物D', category: 'six', image: '/images/imageD.jpg' },
        { name: '食物E', category: 'six', image: '/images/imageE.jpg' },
        { name: '食物F', category: 'six', image: '/images/imageF.jpg' },
        { name: '食物G', category: 'four', image: '/images/imageG.jpg' },
        { name: '食物H', category: 'four', image: '/images/imageH.jpg' },
        { name: '食物I', category: 'four', image: '/images/imageI.jpg' },
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
  width: 100%;
  height: auto;
}
</style>
