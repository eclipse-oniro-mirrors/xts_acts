/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
AppStorage.setOrCreate('PropA', 47);
AppStorage.setOrCreate('LinkA', 47);
let LocalStorage12 = new LocalStorage();
LocalStorage12['PropA'] = 48;

//let AppStorageKeys12 = LocalStorage12.keys()

@Entry(LocalStorage12)
@Component
struct Storage12 {
  @StorageLink('PropA') storLink: number = 1;
  @LocalStorageLink('PropA') localStorLink: number = 1;
  @State text: string = 'Init'


  build() {
    Column({ space: 20 }) {

      Text(this.text).key('Storage12Content')

      //Size获取AppStorage中存在键值对的个数
      Button('获取键值对的个数')
        .onClick(() => {
          this.text = AppStorage.Size() + ''
      }).key('Storage12Button111')

      Text(`appKeys: ${Object.keys(LocalStorage12)}`).id("Storage12Text1")

      //IsMutable返回属性键值key对应的属性是否可变，可变返回true （不可变返回false，没有实现，暂时全部返回true）
      Button('IsMutable').onClick(() => {
        this.text = AppStorage.IsMutable('PropA') + ''
      }).key('Storage12Button2')

    }
  }
}