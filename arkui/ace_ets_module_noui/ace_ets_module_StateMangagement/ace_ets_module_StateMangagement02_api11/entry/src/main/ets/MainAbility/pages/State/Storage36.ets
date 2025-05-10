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
AppStorage.setOrCreate('PropA', 160);
let storage36 = new LocalStorage();
let link361: SubscribedAbstractProperty<number> = AppStorage.SetAndLink('PropA',48)
let link362: SubscribedAbstractProperty<number> = AppStorage.SetAndLink('sss',48)

@Entry(storage36)
@Component
struct LocalStorage36 {
  //@LocalStorageLink变量装饰器与LocalStorage中的'PropA'属性建立双向绑定
  // @StorageLink('PropA') storLink1: number = 1;
  @State link1Date: number | undefined = 0;
  @State link1Date2: number | undefined = 0;

  build() {
    Column() {
      Text('' + this.link1Date).id("text36_link1Date").height('5%')
      Text('' + this.link1Date2).id("text36_link1Date2").height('5%')
      Button(`click`).width('100%').height('5%')
        .key("Storage36Btn")
        .onClick(() => {
          this.link1Date = link361.get()
          this.link1Date2 = link362.get()

        })
    }
  }
}