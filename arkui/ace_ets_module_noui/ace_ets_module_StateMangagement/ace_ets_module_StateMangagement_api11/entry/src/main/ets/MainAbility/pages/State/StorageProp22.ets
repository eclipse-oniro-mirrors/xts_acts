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
AppStorage.setOrCreate('propA',47)
let storage22: LocalStorage = new LocalStorage({'propA':47} as Record<string, number>)
let s: LocalStorage = new LocalStorage({'propB':32} as Record<string, number>)

@Entry(storage22)
@Component
struct StorageProp22 {
  @LocalStorageProp('propA') storProp: number = 12;
  @State ku?: number = storage22.get('propA')

  @LocalStorageProp('propB') storPropB: number = 4;
  @State kuB?: number = storage22.get('propB')

  build(){
    Column({space: 20}) {
      Text(`LocalStorage值为${this.ku}`).key('lse1')
      // 测试localstorage单向数据绑定
      Text(`当前值为${this.storProp}`).margin(10)
        .key('text_sp')

      Button(`button1`).margin(10).width('100%')
        .key('btn_lse1')
        .onClick(() => {
          this.storProp += 1
          this.ku = storage22.get('propA')
        })


      Text(`LocalStorage值为${this.kuB}`).key('lse2')
      // 测试页面存在多个localstorage的时候，组件只可访问被分配的localstorage
      Text(`当前值为${this.storPropB}`).margin(10)
        .key('text_spb')

      Button(`button2`).margin(10).width('100%')
        .key('btn_lse2')
        .onClick(() => {
          this.storPropB += 1
          this.kuB = storage22.get('propB')
        })
    }
  }
}