/**
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

@Entry
@Component
struct StateArrayBoolean {
  @State message: Array<boolean> = [true, false, true, false, true]

  build() {
    Row() {
      Column() {

        Button('init array_number').id('stateArrayBoolean_init').height('5%')
          .onClick(() => {
            this.message = this.message = [false, true, false, true, false]
          })

        Button('push new one').id('stateArrayBoolean_push').height('5%')
          .onClick(() => {
            let lastIndex = this.message.length - 1
            this.message.push(this.message[lastIndex] == true ? false : true)
          })

        Button('clear').id('stateArrayBoolean_clear').height('5%')
          .onClick(() => {
            this.message = []
            if (Array.from(this.message.entries())) {
              this.message.push(true)
            }
          })

        Button('replace the first one').id('stateArrayBoolean_replace').height('5%')
          .onClick(() => {
            this.message[0] = this.message[0] == true ? false : true
          })

        Button('delete the first one').id('stateArrayBoolean_delete').height('5%')
          .onClick(() => {
            this.message.shift()
          })

        ForEach(Array.from(this.message.entries()), (item: [number, boolean]) => {
          Text(`${item[1]} index: ${item[0]}`).fontSize(9).id('stateArrayBoolean_value_' + item[0])
            .height('5%')
          Divider()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}