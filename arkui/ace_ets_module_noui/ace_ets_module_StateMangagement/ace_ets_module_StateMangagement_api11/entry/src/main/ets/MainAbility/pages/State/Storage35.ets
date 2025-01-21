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
AppStorage.setOrCreate('PropA', 121);
let storage35 = new LocalStorage();
let link351: SubscribedAbstractProperty<number> = AppStorage.link('PropA')
let link352: SubscribedAbstractProperty<number> = AppStorage.link('sss')
let link353 = link351.get()

@Entry(storage35)
@Component
struct LocalStorage35 {
  //@LocalStorageLink变量装饰器与LocalStorage中的'PropA'属性建立双向绑定
  @StorageLink('PropA') storLink1: number = 1;
  @State link1Date2: number | undefined = 0;

  build() {
    Column({ space: 10 }) {
      Text('' + link353).id("text35_link")
      Text('' + link352).id("text35_link2")
      Text('' + this.link1Date2).id("text35_link1Date2")
      Button(`click`).margin(10).width('100%')
        .key("Storage35Btn")
        .onClick(() => {
          this.link1Date2 = this.storLink1
        })
    }
  }
}