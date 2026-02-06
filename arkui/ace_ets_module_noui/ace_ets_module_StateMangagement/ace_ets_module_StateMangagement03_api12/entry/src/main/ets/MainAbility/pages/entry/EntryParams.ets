/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

let para0001: Record<string, number> = { 'PropA': 47 };
let storage0001: LocalStorage = new LocalStorage(para0001);

@Component
struct Child0001 {
  @LocalStorageLink('PropA') childLinkNumber: number = 1;

  build() {
    Column({ space: 15 }) {
      Text(this.childLinkNumber.toString())
        .id('propA')
        .height('5%')
      Button(`Child from LocalStorage ${this.childLinkNumber}`)
        .id('btn2')
        .onClick(() => {
          this.childLinkNumber += 1;
        })
        .height('5%')
    }
  }
}
@Entry({routeName: 'EntryParams',storage: storage0001, useSharedStorage: false})
@Component
struct Parent0001 {
  @State flag: boolean = true;
  @State flag2: boolean = false;
  build() {
    Column({ space: 15 }) {
      Text(`${this.flag2 ? 'true': 'false'}`)
        .id('clear')
        .height('5%')
      Button(`flag`)
        .onClick(() => {
          this.flag = false;
        })
        .id('btn1')
        .height('5%')
      Button(`clear localStorage`)
        .onClick(() => {
          this.flag2 = storage0001.clear();
        })
        .id('btn3')
        .height('5%')
      if (this.flag) {
        Child0001()
      }
    }
  }
}