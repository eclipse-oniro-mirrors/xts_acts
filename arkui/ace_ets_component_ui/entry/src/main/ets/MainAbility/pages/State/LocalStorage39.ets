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
interface LocalStorage39Type {
  propA: number
}
let storage1 = new LocalStorage({'propA':47} as LocalStorage39Type)
let storage39 = new LocalStorage();
storage39['propA'] = 47;
storage39['propB'] = 1;

@Entry(storage39)
@Component
struct LocalStorage39 {
  @LocalStorageProp('propA') storProp1: number = 1
  @LocalStorageProp('propB') storProp2: number = 2
  @State sizenum: number = 0;
  @State value1: string|undefined = 'Init'
  @State value2: string|undefined = 'Init'
  @State keys1: string = 'Init'


  build() {
    Column({ space: 20 }) {

      Text(`Keys：${this.keys1}`).key('keysText1')
      Button('获取键值对的keys')
        .key('button1')
        .onClick(() => {
          this.keys1 = JSON.stringify(Object.keys(storage39)) + ''
        })

      Text(`get propA：${this.value1}`).key('getText1')
      //get获取LocalStorage中存在键值对的个数
      Button('get propA')
        .key('button2')
        .onClick(() => {
          this.value1 = storage39.get('propA')+''
        })

      Text(`get propE：${this.value2}`).key('getText2')
      Button('get propE')
        .key('button3')
        .onClick(() => {
          this.value2 = storage39.get('propE')+''
        })

      //Size获取LocalStorage中存在键值对的个数
      Text(`size是：${this.sizenum}`).key('sizeText')
      Button('获取键值对的个数')
        .key('button4')
        .onClick(() => {
          this.sizenum = storage39.size()
        })
    }
  }
}