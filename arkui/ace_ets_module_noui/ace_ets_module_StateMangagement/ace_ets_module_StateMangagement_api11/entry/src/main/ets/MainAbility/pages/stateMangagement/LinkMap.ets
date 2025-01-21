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

@Component
struct LinkMapChild {
  @Link value: Map<number, string>

  build() {
    Column() {
      ForEach(Array.from(this.value.entries()), (item: [number, string]) => {
        Text(`${item[0]} ${item[1]}`).fontSize(20).id("LinkMap_value_" + item[1])
        Divider()
      })
      Button('child init map').id("LinkMap_init")
        .onClick(() => {
          this.value = new Map([[0, "a"], [1, "b"], [3, "c"]])
        }).margin(10)

      Button('child set new one').id("LinkMap_set")
        .onClick(() => {
          this.value.set(4, "d")
        }).margin(10)

      Button('child clear').id("LinkMap_clear")
        .onClick(() => {
          this.value.clear()
          if (Array.from(this.value.entries())) {
            this.value.set(0, "K")
          }
        }).margin(10)

      Button('child replace').id("LinkMap_replace")
        .onClick(() => {
          this.value.set(0, "aa")
        }).margin(10)

      Button('child delete').id("LinkMap_delete")
        .onClick(() => {
          this.value.delete(0)
        })
    }
  }
}


@Entry
@Component
struct LinkMapSample2 {
  @State message: Map<number, string> = new Map([[0, "a"], [1, "b"], [3, "c"]])

  build() {
    Row() {
      Column() {
        LinkMapChild({ value: this.message })
      }
      .width('100%')
    }
    .height('100%')
  }
}