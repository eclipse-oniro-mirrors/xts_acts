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
struct ConsumeArrayNumberChild {
  @Consume message: Array<number>

  build() {
    Column() {

      Button('Consume init array').id('consumeArrayNumber_init').height('5%')
        .onClick(() => {
          this.message = [5, 6, 7, 8, 9]
        })

      Button('Consume add new one').id('consumeArrayNumber_add').height('5%')
        .onClick(() => {
          let lastIndex = this.message.length - 1
          this.message.push(this.message[lastIndex] + 1)
        })

      Button('Consume clear').id('consumeArrayNumber_clear').height('5%')
        .onClick(() => {
          this.message = []
          if (Array.from(this.message.entries())) {
            this.message.push(0)
          }
        })

      Button('Consume replace').id('consumeArrayNumber_replace').height('5%')
        .onClick(() => {
          if (this.message.length > 0) {
            this.message[0] = 99
          }
        })

      Button('Consume delete last').id('consumeArrayNumber_delete').height('5%')
        .onClick(() => {
          this.message.pop()
        })

      ForEach(Array.from(this.message.entries()), (item: [number, number]) => {
        Text(`${item[1]} index: ${item[0]}`).fontSize(9).id('consumeArrayNumber_value_' + item[0])
          .height('5%')
        Divider()
      })
    }
  }
}

@Entry
@Component
struct ProvideArrayNumber {
  @Provide message: Array<number> = [1, 2, 3, 4, 5]

  build() {
    Row() {
      Column() {
        Button('Provide init array').id('provideArrayNumber_init').height('5%')
          .onClick(() => {
            this.message = [1, 2, 3, 4, 5]
          })
        ConsumeArrayNumberChild()
      }
      .width('100%')
    }
    .height('100%')
  }
}
