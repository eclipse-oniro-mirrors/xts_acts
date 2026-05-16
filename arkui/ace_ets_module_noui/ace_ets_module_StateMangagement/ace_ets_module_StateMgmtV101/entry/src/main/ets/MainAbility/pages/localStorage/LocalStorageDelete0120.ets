/*
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

let para0120: Record<string, number> = { 'prop0120': 10 }
let storage0120: LocalStorage = new LocalStorage(para0120)

@Entry(storage0120)
@Component
struct LocalStorageDelete0120 {
  @State isDel: boolean = false

  build() {
    Column() {
      Text(this.isDel.toString()).id('tvIsDel').height('5%')
      Button('Click')
        .id('btnDel')
        .height('5%')
        .onClick(() => {
          this.isDel = storage0120.delete('prop0120')
        })
    }
  }
}
