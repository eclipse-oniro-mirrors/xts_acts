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
AppStorage.setOrCreate('PropA', 122);
let storage37 = new LocalStorage();
let prop: SubscribedAbstractProperty<number> = AppStorage.prop('PropA');
let prop137: SubscribedAbstractProperty<number> = AppStorage.prop('sss')

@Entry(storage37)
@Component
struct LocalStorage37 {
  //@LocalStorageLink变量装饰器与LocalStorage中的'PropA'属性建立双向绑定
  @StorageProp('PropA') storLink: number = 1;
  @StorageProp('PropA1') storLink1: number = 47;
  @State link1Date: number | undefined = 0;
  @State link1Date2: number | undefined = 0;

  build() {
    Column({ space: 10 }) {
      Text('' + prop137).id("text37_prop1")
      Text('' + this.link1Date).id("text37_link1Date")
      Text('' + this.link1Date2).id("text37_link1Date2")
      Button(`click`).margin(10).width('100%')
        .key("Storage37Btn")
        .onClick(() => {
          this.link1Date = prop.get()
          this.link1Date2 = this.storLink1
        })
    }
  }
}