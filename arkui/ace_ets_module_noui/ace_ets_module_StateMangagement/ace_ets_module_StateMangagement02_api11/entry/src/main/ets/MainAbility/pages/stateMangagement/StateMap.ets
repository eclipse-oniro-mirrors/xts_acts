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

@Entry
@Component
struct StateMapSample {
  @State message: Map<number, string> = new Map([[0, "a"], [1, "b"], [3, "c"]])

  build() {
    Row() {
      Column() {

        Button('init map').id("stateMap_init").height('5%')
          .onClick(() => {
            this.message = new Map([[0, "a"], [1, "b"], [3, "c"]])
          })

        Button('set new one').id("stateMap_set").height('5%')
          .onClick(() => {
            this.message.set(4, "d")
          })

        Button('clear').id("stateMap_clear").height('5%')
          .onClick(() => {
            this.message.clear()
            if (Array.from(this.message.entries())) {
              this.message.set(0, "K")
            }
          })

        Button('replace the first one').id("stateMap_replace").height('5%')
          .onClick(() => {
            this.message.set(0, "aa")
          })

        Button('delete the first one').id("stateMap_delete").height('5%')
          .onClick(() => {
            this.message.delete(0)
          })

        ForEach(Array.from(this.message.entries()), (item: [number, string]) => {
          Text(`${item[0]} ${item[1]}`).fontSize(9).id("stateMap_value_" + item[1])
            .height('5%')
          Divider()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}