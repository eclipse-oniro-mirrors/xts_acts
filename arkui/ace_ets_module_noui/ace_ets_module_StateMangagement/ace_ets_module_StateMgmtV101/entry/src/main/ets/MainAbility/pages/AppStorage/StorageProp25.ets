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
let storage25: LocalStorage = new LocalStorage({"PropA":47} as Record<string, number>)
storage25.setOrCreate('PropB',9)

@Entry(storage25)
@Component
struct StorageProp25 {
  @LocalStorageProp('PropA') storPropA: number = 1;
  @LocalStorageProp('PropB') storPropB: number = 1;

  @State kuA?: number = storage25.get('PropA')
  @State kuB?: number = storage25.get('PropB')


  build() {
    Column() {
      Text(`LocalStorage值为${this.kuA}`).key("lseA").height('5%')
      Text(`当前PropA值为${this.storPropA}`).height('5%')
        .key("sPropA")
      Text(`LocalStorage值为${this.kuB}`).key("lseB").height('5%')
      Text(`当前PropB值为${this.storPropB}`).height('5%')
        .key("sPropB")

      Button(`button1`).width('100%').height('5%')
        .key('btn1_sto')
        .onClick(() => {
          this.storPropA += 1
          this.kuB = storage25.get('PropA')
          this.storPropB += 1
          this.kuB = storage25.get('PropB')
        })

      Child125()
      Text(`父组件ProC: ${storage25.get('PropC')}`).fontColor(Color.Green)
        .key("sPropC").height('5%')

    }
  }
}

@Component
struct Child125 {
  @LocalStorageProp('PropC') c1: number = 11;
  @State kuC?: number = 0;
  build() {
    Column() {
      Text(`LocalStorage值PropB为${this.kuC}`).key("lsePropB").height('5%')
      Text(`子组件当前PropB值为${this.c1}`).height('5%')
        .key("sonPropB")
      Button(`Child1_button1`).width("100%").height('5%')
        .key('Child1_btn1')
        .onClick(() => {
          this.c1 += 1

        })
      Button(`点击LocalStorage能修改未被@Entry修饰的属性`).width("100%").height('5%')
        .key('Child1_btn2')
        .onClick(() => {
          storage25.set('PropC',123)
          this.kuC = storage25.get('PropC');
        })
      // Text(`兄弟组件PropD${storage.get('PropD')}`).fontColor(Color.Red)
      Child225()
    }
  }
}

@Component
struct Child225 {
  @LocalStorageProp('PropD') d1: number = 22;
  @State kuD?: number = storage25.get('PropD');
  build() {
    Column() {
      Text(`子组件PropC: ${storage25.get('PropC')}`).fontColor(Color.Red)
        .key("sonPropC").height('5%')

      // Text(`孩子当前PropD值为${this.d1}LocalStorage值PropD为${this.kuD}`)
      // Button(`Child2_button1`).width("100%")
      //   .key('Child2_button1')
      //   .onClick(() => {
      //     this.d1 += 1
      //
      //   })
      // Button(`只有父组件能获取PropD`).width("100%")
      //   .key('Child2_button2')
      //   .onClick(() => {
      //     storage.set('PropD',456)
      //     this.kuD = storage.get('PropD');
      //   })
    }
  }
}