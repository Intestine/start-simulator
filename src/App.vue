<!-- eslint-disable no-debugger -->
<!-- eslint-disable no-debugger -->
<template>
  <div id="app">
    <el-col :span="9"> <el-form label-width="85px">
        <el-form-item label="生成数量(1-1000)">
          <el-input :maxlength="4" type="number" size="mini" style="width:40px" v-model="generTime"></el-input>
          <el-button size="mini" @click="generStarts">生成</el-button>
        </el-form-item>
        <el-form v-if="showLeft" style="max-height:80vh;overflow:auto;" label-width="85px">
          <el-form-item label="平均向听数">
            <span>{{ (shants.shantAver / (generTime * 4)).toFixed(3) }}</span>
          </el-form-item>
          <el-form-item label="平均亲家向听数">
            <span>{{ (shants.shantAverE / generTime).toFixed(3) }}</span>
          </el-form-item>
          <el-form-item label="平均闲家向听数">
            <span>{{(shants.shantAverOther / (generTime * 3)).toFixed(3)}}</span>
          </el-form-item>
          <el-form-item v-if="shants.tenhu" label="天胡">
            <span>{{ shants.tenhu }}</span>
            <div @click="toMount(item)" v-for="item in shants.tenhuStarts" :key="item">
              <el-form label-width="40px">
                <el-form-item label="序号">
                  <el-tag size="mini">{{ item.indNum + 1 }}</el-tag>
                </el-form-item>
                <el-form-item label="起手">
                  {{ item.maj.join(" ") }}
                </el-form-item>
                <!-- <el-form-item label="剩余牌山">
                  {{ item.nextMount }}
                </el-form-item> -->
              </el-form>

            </div>
          </el-form-item>
          <el-form-item v-if="shants.shant0" label="0向听数">
            <span>{{ shants.shant0 }}</span>
            <div class="moutback" @click="toMount(item)" v-for="item in shants.shant0starts" :key="item">
              <el-form label-width="40px">
                <el-form-item label="序号">
                  <el-tag size="mini">{{ item.indNum + 1 }}</el-tag>
                </el-form-item>
                <el-form-item label="起手">
                  <maj-pics :majString="item.maj"></maj-pics>
                  <!-- {{ item.maj.join(" ") }} -->
                </el-form-item>
                <el-form-item label="位置">
                  {{ item.position }}家
                </el-form-item>
                <!-- <el-form-item label="剩余牌山">
                  {{ item.nextMount }}
                </el-form-item> -->

              </el-form>

            </div>
          </el-form-item>
          <el-form-item v-if="shants.shant1" label="1向听数">
            <span>{{ shants.shant1 }}</span>

            <div @click="toMount(item)" class="moutback" v-for="(item, index) in shants.shant1starts" :key="index">
              <el-form label-width="40px">
                <el-form-item label="序号">
                  <el-tag size="mini">{{ item.indNum + 1 }}</el-tag>
                </el-form-item>
                <el-form-item label="起手">
                  <maj-pics :majString="item.maj"></maj-pics>
                  <!-- {{ item.maj.join(" ") }} -->
                </el-form-item>
                <el-form-item label="位置">
                  {{ item.position }}家
                </el-form-item>

                <!-- <el-form-item label="剩余牌山">
                  {{ item.nextMount }}
                </el-form-item> -->
              </el-form>

            </div>
          </el-form-item>
          <el-form-item v-if="shants.shant2" label="2向听数">
            <span>{{ shants.shant2 }}</span>
          </el-form-item>
          <el-form-item v-if="shants.shant3" label="3向听数">
            <span>{{ shants.shant3 }}</span>
          </el-form-item>
          <el-form-item v-if="shants.shant4" label="4向听数">
            <span>{{ shants.shant4 }}</span>
          </el-form-item>
          <el-form-item v-if="shants.shant5" label="5向听数">
            <span>{{ shants.shant5 }}</span>
          </el-form-item>
          <el-form-item v-if="shants.shant6" label="6向听数">
            <span>{{ shants.shant6 }}</span>
            <div @click="toMount(item)" class="moutback" v-for="(item, index) in shants.shant6starts" :key="index">
              <el-form label-width="40px">
                <el-form-item label="序号">
                  <el-tag size="mini">{{ item.indNum + 1 }}</el-tag>

                </el-form-item>
                <el-form-item label="起手">
                  <maj-pics :majString="item.maj"></maj-pics>
                  <!-- {{ item.maj.join(" ") }} -->
                </el-form-item>
                <el-form-item label="位置">
                  {{ item.position }}家
                </el-form-item>
                <!-- <el-form-item label="剩余牌山">
                  {{ item.nextMount }}
                </el-form-item> -->
              </el-form>

            </div>
          </el-form-item>

        </el-form>
      </el-form></el-col>
    <el-col :span="15">
      <div style="max-height:90vh;overflow:auto;" ref="mounts">
        <div v-for="(item, index) in starts" :id="index" :key="index"
          style="margin-bottom:20px;background-color:whitesmoke;font-size:18px;font-weight:bold">
          <el-form label-width="60px">
            <el-form-item label="序号">
              <el-tag size="mini">
                {{ index+ 1 }}
              </el-tag>
            </el-form-item>
            <el-form-item label="东">
             <maj-pics :majString="item.e"></maj-pics>
              <!-- <span>{{ item.e.join(" ") }}</span> -->
            </el-form-item>
            <el-form-item label="南">
              <maj-pics :majString="item.s"></maj-pics>
              <!-- <span>{{ item.s.join(" ") }}</span> -->
            </el-form-item>
            <el-form-item label="西">
              <maj-pics :majString="item.w"></maj-pics>
              <!-- <span>{{ item.w.join(" ") }}</span> -->
            </el-form-item>
            <el-form-item label="北">
              <maj-pics :majString="item.n"></maj-pics>
              <!-- <span>{{ item.n.join(" ") }}</span> -->
            </el-form-item>
            <el-form-item label="dora指示牌">
              <maj-pics :majString="item.dora"></maj-pics>
              <!-- <span>{{ item.dora }}</span> -->
            </el-form-item>
            <el-form-item label="剩余牌山">
              <div style="padding:0 10px">
                <maj-pics :majString="item.nextMount1"></maj-pics>
                <maj-pics :majString="item.nextMount2"></maj-pics>
              </div>
             
              <!-- <span>{{ item.nextMount.join(" ") }}</span> -->
            </el-form-item>
          </el-form>
        </div>
      </div>
    </el-col>


  </div>
</template>

<script>
const syanten = require('syanten')


const mountHash = {
  1: "1m", 2: "2m", 3: "3m", 4: "4m", 5: "5m", 6: "0m", 7: "6m", 8: "7m", 9: "8m", 10: "9m",
  11: "1s", 12: "2s", 13: "3s", 14: "4s", 15: "5s", 16: "0s", 17: "6s", 18: "7s", 19: "8s", 20: "9s",
  21: "1p", 22: "2p", 23: "3p", 24: "4p", 25: "5p", 26: "0p", 27: "6p", 28: "7p", 29: "8p", 30: "9p",
  31: "1z", 32: "2z", 33: "3z", 34: "4z", 35: "5z", 36: "6z", 37: "7z",
}
const majHash = {
  1: "1m", 2: "2m", 3: "3m", 4: "4m", 5: "5m", 6: "6m", 7: "7m", 8: "8m", 9: "9m",
  11: "1s", 12: "2s", 13: "3s", 14: "4s", 15: "5s", 16: "6s", 17: "7s", 18: "8s", 19: "9s",
  21: "1p", 22: "2p", 23: "3p", 24: "4p", 25: "5p", 26: "6p", 27: "7p", 28: "8p", 29: "9p",
  31: "1z", 32: "2z", 33: "3z", 34: "4z", 35: "5z", 36: "6z", 37: "7z",
}
let numMountHash = {}
for (let key in mountHash) {
  numMountHash[mountHash[key]] = key * 1
}
let newMajhash = {}
for (let key in majHash) {
  newMajhash[majHash[key]] = key * 1
}
import majPics from "./components/majs.vue"
export default {
  name: "app",
  components: { majPics },
  watch:{
    
    generTime:{
        handler(val) {
         if(val>1000){
          this.generTime=1000
         }
         if(val<0){
          this.generTime=1
         }
        },
        deep: true
    },
  },
  data() {
    return {
      majMount: [],
      generTime: 1,
      starts: [],
      shants: {
        tenhuStarts: [],
        tenhu: 0,
        shantMin: 0,
        shant0: 0,
        shant0starts: [],
        shant1: 0,
        shant1starts: [],
        shant2: 0,
        shant3: 0,
        shant4: 0,
        shant5: 0,
        shant6: 0,
        shantAver: 0,
        shantAverE: 0,
        shantAverOther: 0,
        shant6starts: []
      },
      showLeft: false
    }
  },
  methods: {
    generStarts() {
      this.showLeft = false
      this.starts = []
      this.shants = {
        tenhuStarts: [],
        tenhu: 0,
        shantMin: 0,
        shant0: 0,
        shant0starts: [],
        shant1: 0,
        shant1starts: [],
        shant2: 0,
        shant3: 0,
        shant4: 0,
        shant5: 0,
        shant6: 0,
        shantAver: 0,
        shantAverE: 0,
        shantAverOther: 0,
        shant6starts: []
      }
      for (let i = 0; i < this.generTime; i++) {
        let nowMount = this.generMajo()

        let e = nowMount.slice(0, 14)
        let w = nowMount.slice(14, 27)
        let s = nowMount.slice(27, 40)
        let n = nowMount.slice(40, 53)
        let nextMount1 = nowMount.slice(53, 122)
        let nextMount2 = nowMount.slice(122, 136)
        let dora =nowMount.slice(130, 132)

        e = this.arr2maj(this.maj2arr(e).sort(function (a, b) { return a - b }))
        s = this.arr2maj(this.maj2arr(s).sort(function (a, b) { return a - b }))
        w = this.arr2maj(this.maj2arr(w).sort(function (a, b) { return a - b }))
        n = this.arr2maj(this.maj2arr(n).sort(function (a, b) { return a - b }))
        this.checkSyanten(e, "e", i)
        this.checkSyanten(s, "s", i)
        this.checkSyanten(w, "w", i)
        this.checkSyanten(n, "n", i)
        this.starts.push({
          e: e, w: w, s: s, n: n, nextMount1: nextMount1,nextMount2: nextMount2, dora: dora
        })
      }
      this.showLeft = true
    },
    maj2arr(arr) {
      let narr = []
      arr.forEach(ele => {
        narr.push(numMountHash[ele])
      });
      return narr
    },
    arr2maj(arr) {
      let narr = []
      arr.forEach(ele => {
        narr.push(mountHash[ele])
      });
      return narr
    },
    maj2arr1(arr) {
      let narr = []
      arr.forEach(ele => {
        narr.push(newMajhash[ele])
      });
      return narr
    },
    generMajo() {
      //生成牌山
      let majMount = []
      for (let i = 0; i < 4; i++) {
        majMount = majMount.concat(['1m', '2m', '3m', '4m', '6m', '7m', '8m', '9m'])
        majMount = majMount.concat(['1s', '2s', '3s', '4s', '6s', '7s', '8s', '9s'])
        majMount = majMount.concat(['1p', '2p', '3p', '4p', '6p', '7p', '8p', '9p'])
        majMount = majMount.concat(['1z', '2z', '3z', '4z', '5z', '6z', '7z'])
      }
      majMount = majMount.concat(['0s', '0m', '0p', '5s', '5s', '5s', '5m', '5m', '5m', '5p', '5p', '5p'])
      for (let i = 0; i < 13; i++) {
        majMount = this.shuffle(majMount)
      }
      return majMount
    },
    shuffle(arr) {
      //乱序
      let temp, length = arr.length;
      for (let i = 0; i < length - 1; i++) {
        let index = Math.floor(Math.random() * (length--));
        temp = arr[index];
        arr[index] = arr[length];
        arr[length] = temp;
      }
      return arr;
    },
    checkSyanten(arr, position, index) {
      let posi = { e: "东", w: "西", s: "南", n: "北" }
      let newarr = []
      arr.forEach(ele => {
        if (ele == "0m") {
          newarr.push("5m")
        }
        else if (ele == "0p") {
          newarr.push("5p")
        }
        else if (ele == "0s") {
          newarr.push("5s")
        }
        else {
          newarr.push(ele)
        }
      })
      let hai = [
        [0, 0, 0, 0, 0, 0, 0, 0, 0], //萬子
        [0, 0, 0, 0, 0, 0, 0, 0, 0], //筒子
        [0, 0, 0, 0, 0, 0, 0, 0, 0], //索子
        [0, 0, 0, 0, 0, 0, 0]        //字牌
      ]
      let nums = this.maj2arr1(newarr)
      nums.forEach(ele => {
        let eleindex1 = ele / 10
        eleindex1 = Math.floor(eleindex1)
        let eleindex2 = ele % 10
        eleindex2 = eleindex2 - 1
        hai[eleindex1][eleindex2]++
      })
      let shayt = {}
      shayt.syanten = syanten.syanten(hai)
      shayt.syanten7 = syanten.syanten7(hai)
      shayt.syanten13 = syanten.syanten13(hai)
      shayt.minNum = syanten(hai)
      if (shayt.minNum == -1) {
        this.shants.tenhu++
        this.shants.tenhuStarts.push({ maj: arr, position: posi[position], indNum: index, })
      }
      if (shayt.minNum == 0) {
        this.shants.shant0++
        this.shants.shant0starts.push({ maj: arr, position: posi[position], indNum: index, })
      }
      if (shayt.minNum == 1) {
        this.shants.shant1++
        this.shants.shantAver += 1
        if (position == "e") {
          this.shants.shantAverE += 1
        }
        else {
          this.shants.shantAverOther += 1
        }
        this.shants.shant1starts.push({ maj: arr, position: posi[position], indNum: index, })
      }
      if (shayt.minNum == 2) {
        this.shants.shant2++
        this.shants.shantAver += 2
        if (position == "e") {
          this.shants.shantAverE += 2
        }
        else {
          this.shants.shantAverOther += 2
        }
      }
      if (shayt.minNum == 3) {
        this.shants.shant3++
        this.shants.shantAver += 3
        if (position == "e") {
          this.shants.shantAverE += 3
        }
        else {
          this.shants.shantAverOther += 3
        }
      }
      if (shayt.minNum == 4) {
        this.shants.shant4++
        this.shants.shantAver += 4
        if (position == "e") {
          this.shants.shantAverE += 4
        }
        else {
          this.shants.shantAverOther += 4
        }
      }
      if (shayt.minNum == 5) {
        this.shants.shant5++
        this.shants.shantAver += 5
        if (position == "e") {
          this.shants.shantAverE += 5
        }
        else {
          this.shants.shantAverOther += 5
        }
      }
      if (shayt.minNum == 6) {
        this.shants.shant6++
        this.shants.shantAver += 6
        if (position == "e") {
          this.shants.shantAverE += 6
        }
        else {
          this.shants.shantAverOther += 6
        }
        this.shants.shant6starts.push({ maj: arr, position: posi[position], indNum: index, })
      }
      // return shayt
    },
    toMount(item) {
      document.getElementById(item.indNum).scrollIntoView()
    }
  },
  mounted() {
    console.log(majPics);
  }
}
</script>

<style scoped>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;

}

.moutback {
  padding-left: 2px;
  margin: 0 10px 10px 0;
  background-color: whitesmoke;
  cursor: pointer;
}
</style>
