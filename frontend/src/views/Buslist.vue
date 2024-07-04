<template>
<div style="display: flex; flex-direction: column">
    <div class="box">
        <div class="cell"><a href="/#/index" class="a-link">首页</a><span> › </span><span>班车列表</span>
        </div>
    </div>
    <div class="tabs">
        <button v-for="(tab, index) in tabs" :key="index" :class="{ active: activeTab === tab }" @click="activeTab = tab">
            {{ tab }}
        </button>
    </div>
    <div>
        <div class="filters">
            车次
            <select v-model="selectedBus">
                <option value="全部">全部</option>
                <option value="班车">班车</option>
                <option value="公交车">公交车</option>
            </select>
            始发站
            <select v-model="selectedStart">
                <option value="全部">全部</option>
                <option value="国科大南京研究院">国科大南京研究院</option>
                <option value="未来能源研究院">未来能源研究院</option>
                <option value="空间大数据">空间大数据</option>
                <option value="天旺路">天旺路</option>
                <option value="金马路地铁站">金马路地铁站</option>
            </select>
            终点站
            <select v-model="selectedEnd">
                <option value="全部">全部</option>
                <option value="国科大南京研究院">国科大南京研究院</option>
                <option value="未来能源研究院">未来能源研究院</option>
                <option value="空间大数据">空间大数据</option>
                <option value="天旺路">天旺路</option>
                <option value="金马路地铁站">金马路地铁站</option>
            </select>
            经过国科大时间：From
            <select v-model="timeFrom">
                <option value="全部">全部</option>
                <option value="6:00">6:00</option>
                <option value="7:00">7:00</option>
                <option value="8:00">8:00</option>
                <option value="9:00">9:00</option>
                <option value="10:00">10:00</option>
                <option value="11:00">11:00</option>
                <option value="12:00">12:00</option>
                <option value="13:00">13:00</option>
                <option value="14:00">14:00</option>
                <option value="15:00">15:00</option>
                <option value="16:00">16:00</option>
                <option value="17:00">17:00</option>
                <option value="18:00">18:00</option>
                <option value="19:00">19:00</option>
                <option value="20:00">20:00</option>
                <option value="21:00">21:00</option>
                <option value="22:00">22:00</option>
                <option value="23:00">23:00</option>
            </select>
            To
            <select v-model="timeEnd">
                <option value="全部">全部</option>
                <option value="6:00">6:00</option>
                <option value="7:00">7:00</option>
                <option value="8:00">8:00</option>
                <option value="9:00">9:00</option>
                <option value="10:00">10:00</option>
                <option value="11:00">11:00</option>
                <option value="12:00">12:00</option>
                <option value="13:00">13:00</option>
                <option value="14:00">14:00</option>
                <option value="15:00">15:00</option>
                <option value="16:00">16:00</option>
                <option value="17:00">17:00</option>
                <option value="18:00">18:00</option>
                <option value="19:00">19:00</option>
                <option value="20:00">20:00</option>
                <option value="21:00">21:00</option>
                <option value="22:00">22:00</option>
                <option value="23:00">23:00</option>
            </select>
        </div>
        <table>
            <thead>
                <tr>
                    <th>车次</th>
                    <th>始发站</th>
                    <th>终点站</th>
                    <th>经过国科大</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(item, index) in filteredSchedules" :key="index">
                    <td>{{ item.车次 }}</td>
                    <td>{{ item.始发站 }}</td>
                    <td>{{ item.终点站 }}</td>
                    <td>{{ item.经过国科大 }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
</template>

<script>
function filterByBus(schedules, selectedBus) {
    if (selectedBus === '全部') {
        return schedules
    }
    return schedules.filter(
        (item) => {
            return (
                item.车次.includes(selectedBus)
            )
        }
    )
}

function filterByStart(schedules, selectedStart) {
    if (selectedStart === '全部') {
        return schedules
    }
    return schedules.filter(
        (item) => {
            return (
                item.始发站.includes(selectedStart)
            )
        }
    )
}
function filterBystop(schedules, selectedStop) {
    if (selectedStop === '全部') {
        return schedules
    }
    return schedules.filter(
        (item) => {
            return (
                item.终点站.includes(selectedStop)
            )
        }
    )
}

function filterByTime(schedules, start, end) {
    return schedules
}

export default {
    data() {
        return {
            search: '',
            selectedBus: '全部',
            selectedStart: '全部',
            selectedEnd: '全部',
            timeFrom: '全部',
            timeEnd: '全部',
            activeTab: '工作日',
            tabs: ['节假日', '工作日'],
            weekdayschedules: [{
                    车次: '公交车',
                    始发站: '国科大南京研究院',
                    终点站: '天旺路',
                    经过国科大: '6:30'
                },
                {
                    车次: '班车',
                    始发站: '未来能源研究院',
                    终点站: '金马路地铁站',
                    经过国科大: '6:50'
                },
                {
                    车次: '班车',
                    始发站: '未来能源研究院',
                    终点站: '金马路地铁站',
                    经过国科大: '6:50'
                }
                // 添加更多数据...
            ],
            holidayschedules: [{
                    车次: '班车',
                    始发站: '国科大南京研究院',
                    终点站: '天旺路',
                    经过国科大: '6:30'
                },
                {
                    车次: '班车',
                    始发站: '未来能源研究院',
                    终点站: '金马路地铁站',
                    经过国科大: '6:50'
                },
                {
                    车次: '班车',
                    始发站: '未来能源研究院',
                    终点站: '金马路地铁站',
                    经过国科大: '6:50'
                }
            ]
        };
    },
    computed: {
        filteredSchedules() {
            let schedules = this.activeTab === '节假日' ? this.holidayschedules : this.weekdayschedules;
            let schedules1 = filterByBus(schedules, this.selectedBus)
            let schedules2 = filterByStart(schedules1, this.selectedStart)
            let schedules3 = filterBystop(schedules2, this.selectedEnd)
            let schedules4 = filterByTime(schedules3, this.timeFrom, this.timeEnd)
            return schedules4
            
        },
        getSchedules() {
            let schedules = this.activeTab === '节假日' ? this.holidayschedules : this.weekdayschedules;
            return schedules;
        }
    },
};
</script>

<style scoped>
table {
    width: 100%;
    border-collapse: collapse;
}

th,
td {
    border: 1px solid #ddd;
    padding: 8px;
}

th {
    background-color: #f2f2f2;
}

.tabs button {
    margin: 5px;
    padding: 10px;
    border: none;
    background-color: lightgray;
}

.tabs button.active {
    background-color: rgb(255, 0, 0);
    color: white;
}
</style>
