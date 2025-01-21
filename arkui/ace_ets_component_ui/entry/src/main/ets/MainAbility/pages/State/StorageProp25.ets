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
interface LocalStorageProp25 {
  propA: number
}
let storage25 = new LocalStorage({'propA': 47} as LocalStorageProp25)
storage25.setOrCreate('propB',9)

@Entry(storage25)
@Component
struct StorageProp25 {
  @LocalStorageProp('propA') storPropA: number = 1;
  @LocalStorageProp('propB') storPropB: number = 1;

  @State kuA: number|undefined = storage25.get('propA')
  @State kuB: number|undefined = storage25.get('propB')


  build() {
    Column({space: 10}) {
      Text(`LocalStorage值为${this.kuA}`).key('lseA')
      Text(`当前PropA值为${this.storPropA}`).margin(10)
        .key('sPropA')
      Text(`LocalStorage值为${this.kuB}`).key('lseB')
      Text(`当前PropB值为${this.storPropB}`).margin(10)
        .key('sPropB')

      Button(`button1`).margin(10).width('100%')
        .key('btn1_sto')
        .onClick(() => {
          this.storPropA += 1
          this.kuB = storage25.get('propA')
          this.storPropB += 1
          this.kuB = storage25.get('propB')
        })

      Child1()
      Text(`父组件ProC: ${storage25.get('propC')}`).fontColor(Color.Green)
        .key('sPropC')

    }
  }
}

@Component
struct Child1 {
  @LocalStorageProp('propC') c1: number = 11;
  @State kuC: number|undefined = 0;
  build() {
    Column({space: 20}) {
      Text(`LocalStorage值PropB为${this.kuC}`).key('lsePropB')
      Text(`子组件当前PropB值为${this.c1}`).margin(10)
        .key('sonPropB')
      Button(`Child1_button1`).margin(10).width('100%')
        .key('Child1_btn1')
        .onClick(() => {
          this.c1 += 1

        })
      Button(`点击LocalStorage能修改未被@Entry修饰的属性`).margin(10).width('100%')
        .key('Child1_btn2')
        .onClick(() => {
          storage25.set('propC',123)
          this.kuC = storage25.get('propC');
        })
      // Text(`兄弟组件PropD${storage.get('PropD')}`).fontColor(Color.Red)
      Child2()
    }
  }
}

@Component
struct Child2 {
  @LocalStorageProp('propD') d1: number = 22;
  @State kuD: number|undefined = storage25.get('propD');
  build() {
    Column({space: 20}) {
      Text(`子组件PropC: ${storage25.get('propC')}`).fontColor(Color.Red)
        .key('sonPropC')

      // Text(`孩子当前PropD值为${this.d1}LocalStorage值PropD为${this.kuD}`).margin(10)
      // Button(`Child2_button1`).margin(10).width("100%")
      //   .key('Child2_button1')
      //   .onClick(() => {
      //     this.d1 += 1
      //
      //   })
      // Button(`只有父组件能获取PropD`).margin(10).width("100%")
      //   .key('Child2_button2')
      //   .onClick(() => {
      //     storage.set('PropD',456)
      //     this.kuD = storage.get('PropD');
      //   })
    }
  }
}