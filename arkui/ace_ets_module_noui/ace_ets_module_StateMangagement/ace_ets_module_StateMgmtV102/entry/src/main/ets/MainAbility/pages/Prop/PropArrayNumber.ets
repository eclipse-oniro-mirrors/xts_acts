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
@Component
struct PropArrayNumberChild {
  @Prop message: Array<number> = [1, 2, 3]

  build() {
    Column() {

      Button('init array').id('propArrayNumber_init').height('5%')
        .onClick(() => {
          this.message = [1, 2, 3]
        })

      Button('add new one').id('propArrayNumber_add').height('5%')
        .onClick(() => {
          let lastIndex = this.message.length - 1
          this.message.push(this.message[lastIndex] + 1)
        })

      Button('clear').id('propArrayNumber_clear').height('5%')
        .onClick(() => {
          this.message = []
          if (Array.from(this.message.entries())) {
            this.message.push(0)
          }
        })

      Button('delete the first one').id('propArrayNumber_delete').height('5%')
        .onClick(() => {
          this.message.shift()
        })

      ForEach(Array.from(this.message.entries()), (item: [number, number]) => {
        Text(`${item[1]} index: ${item[0]}`).fontSize(9).id('propArrayNumber_value_' + item[0]).height('5%')
        Divider()
      })
    }
    .width('100%')
  }
}

@Entry
@Component
struct PropArrayNumber {
  @State message: Array<number> = [4, 5, 6]

  build() {
    Row() {
      Column() {
        PropArrayNumberChild({ message: this.message })
      }
      .width('100%')
    }
    .height('100%')
  }
}