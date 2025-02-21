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
let storage26: LocalStorage = new LocalStorage({"PropA":1} as Record<string, number>)

@Entry(storage26)
@Component
struct StorageProp26 {
  @LocalStorageProp('') storProp1: number = 1
  @State num: number = 0;
  @State a?: number = storage26.get("PropA");

  build() {
    Column({ space: 15 }) {
      Text(`childPropA: ${this.storProp1}`).key('childPropA')
      Button('点击连续改变storage的值').key('son1PropA')
        .onClick(() => {
          this.storProp1 += 1;
        })
      Text(`fatherPropA: ${this.a}`).key('fatherPropA')
      Button(`fatherPropA`)
        .key("button221")
        .onClick(() => {
          storage26.set('PropA', 34)
          this.a = storage26.get("PropA")
        })

    }
  }
}
