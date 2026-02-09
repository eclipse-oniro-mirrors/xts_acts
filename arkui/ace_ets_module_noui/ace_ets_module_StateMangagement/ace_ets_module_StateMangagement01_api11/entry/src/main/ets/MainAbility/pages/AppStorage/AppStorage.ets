/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import router from '@system.router'

AppStorage.setOrCreate("PropC", 1)
let link3: SubscribedAbstractProperty<number> = AppStorage.link("PropC");

AppStorage.setOrCreate("PropA", 47);
let link1: SubscribedAbstractProperty<number> = AppStorage.link("PropA");
let link2: SubscribedAbstractProperty<number> = AppStorage.link("PropA");
let prop1: SubscribedAbstractProperty<number> = AppStorage.prop("PropA");

AppStorage.setAndLink("PropB", 50)
let PropBValue = String(AppStorage.get("PropB"))

AppStorage.setAndProp("PropA", 47)
let PropAValue = String(AppStorage.get("PropA"))
let kays: string = '';
for (let key of AppStorage.keys()) {
  kays = key
}
let setPropAValue = String(AppStorage.set("PropA", 20))
let deleteValue = String(AppStorage.delete("PropC"))
let hasValue = String(AppStorage.has("PropB"))
let isMutableValue = String(AppStorage.IsMutable("PropB"))


@Entry
@Component
struct appStorage_test {
  private content: string = "appStorage Page";
  @State str1: string = link1.get().toString();
  @State str2: string = link2.get().toString();
  @State str3: string = prop1.get().toString()
  @State str6: string = link3.get().toString();
  @State PropB: string = PropBValue
  @State PropA: string = PropAValue
  @State keys: string = kays
  @State str4: string = link1.get().toString()
  @State str5: string = setPropAValue
  @State str7: string = deleteValue
  @State str8: string = hasValue
  @State str9: string = isMutableValue

  onPageShow() {
    console.info('appStorage page show called');
  }

  onBuildDone() {
    console.info('appStorage page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Scroll() {
        Column() {
          Text(`${this.content}`)
            .fontSize(9)
            .fontWeight(FontWeight.Bold)
            .height('5%')
          Button(this.str1)
            .height('5%')
            .key('Button0_1')
            .fontWeight(FontWeight.Bold)
            .fontSize(9)
          Button(this.str3)
            .height('5%')
            .key('Button0_2')
            .fontWeight(FontWeight.Bold)
            .fontSize(9)
          Button(this.PropB)
            .height('5%')
            .key('Button0_3')
            .fontWeight(FontWeight.Bold)
            .fontSize(9)
          Button(this.PropA)
            .height('5%')
            .key('Button0_4')
            .fontWeight(FontWeight.Bold)
            .fontSize(9)
          Button(this.str8)
            .height('5%')
            .key('Button0_5')
            .fontWeight(FontWeight.Bold)
            .fontSize(9)
          Button(this.keys)
            .height('5%')
            .key('Button0_6')
            .fontWeight(FontWeight.Bold)
            .fontSize(9)
          Button(this.str4)
            .height('5%')
            .key('Button0_7')
            .fontWeight(FontWeight.Bold)
            .fontSize(9)
          Button(this.str5)
            .height('5%')
            .key('Button0_8')
            .fontWeight(FontWeight.Bold)
            .fontSize(9)
          Button(this.str6)
            .height('5%')
            .key('Button0_9')
            .fontWeight(FontWeight.Bold)
            .fontSize(9)
          Button(this.str7)
            .height('5%')
            .key('Button0_10')
            .fontWeight(FontWeight.Bold)
            .fontSize(9)
          Text(this.str9)
            .height('5%')
            .key('Button0_12')
            .fontWeight(FontWeight.Bold)
            .fontSize(9)
        }
      }
    }
    .key('flex')
    .width('100%')
    .height('100%')
  }
}
