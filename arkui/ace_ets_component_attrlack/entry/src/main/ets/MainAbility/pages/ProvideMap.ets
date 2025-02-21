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
struct ConsumeMapChild {
  @Consume message: Map<number, string>

  build() {
    Column() {
      ForEach(Array.from(this.message.entries()), (item: [number, string]) => {
        Text(`${item[0]} ${item[1]}`).fontSize(20).id("provideMap_value_" + item[1])
        Divider()
      })
      Button('Consume init map').id("consumeMap_init")
        .onClick(() => {
          this.message = new Map([[0, "a"], [1, "b"], [3, "c"]])
        }).margin(10)

      Button('Consume set new one').id("consumeMap_set")
        .onClick(() => {
          this.message.set(4, "d")
        }).margin(10)

      Button('Consume clear').id("consumeMap_clear")
        .onClick(() => {
          this.message.clear()
          if (Array.from(this.message.entries())) {
            this.message.set(0, "K")
          }
        }).margin(10)

      Button('Consume replace').id("consumeMap_replace")
        .onClick(() => {
          this.message.set(0, "aa")
        }).margin(10)

      Button('Consume delete').id("consumeMap_delete")
        .onClick(() => {
          this.message.delete(0)
        })
    }
  }
}


@Entry
@Component
struct ProvideMapSample {
  @Provide message: Map<number, string> = new Map([[0, "a"], [1, "b"], [3, "c"]])

  build() {
    Row() {
      Column() {
        Button('Provide init map').id("provideMap_add")
          .onClick(() => {
            this.message = new Map([[0, "a"], [1, "b"], [3, "c"], [4, "d"]])
          }).margin(10)

        ConsumeMapChild()
      }
      .width('100%')
    }
    .height('100%')
  }
}