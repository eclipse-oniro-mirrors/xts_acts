/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
AppStorage.clear()
let storage139: LocalStorage = new LocalStorage({"PropA":47} as Record<string, number>)
let storage39: LocalStorage = new LocalStorage();
storage39['PropA'] = 47;
storage39['PropB'] = 1;

@Entry(storage39)
@Component
struct LocalStorage39 {
  @LocalStorageProp('PropA') storProp1: number = 1
  @LocalStorageProp('PropB') storProp2: number = 2
  @State sizenum: number = 0;
  @State value1: string = 'Init'
  @State value2: string = 'Init'
  @State keys1: string = 'Init'


  build() {
    Column() {

      Text(`Keys：${this.keys1}`).key('keysText1').height('5%')
      Button('获取键值对的keys')
        .height('5%')
        .key('button1')
        .onClick(() => {
          this.keys1 = JSON.stringify(Object.keys(storage39)) + ""
        })

      Text(`get PropA：${this.value1}`).key('getText1').height('5%')
      //get获取LocalStorage中存在键值对的个数
      Button('get PropA')
        .height('5%')
        .key('button2')
        .onClick(() => {
          this.value1 = storage39.get("PropA")+""
        })

      Text(`get PropE：${this.value2}`).key('getText2').height('5%')
      Button('get PropE')
        .height('5%')
        .key('button3')
        .onClick(() => {
          this.value2 = storage39.get("PropE")+""
        })

      //Size获取LocalStorage中存在键值对的个数
      Text(`size是：${this.sizenum}`).key('sizeText').height('5%')
      Button('获取键值对的个数')
        .height('5%')
        .key('button4')
        .onClick(() => {
          this.sizenum = storage39.size()
        })
    }
  }
}