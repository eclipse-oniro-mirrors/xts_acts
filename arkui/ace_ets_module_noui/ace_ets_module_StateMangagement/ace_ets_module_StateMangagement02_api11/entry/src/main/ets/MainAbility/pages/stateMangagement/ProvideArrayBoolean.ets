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
struct ConsumeArrayBooleanChild {
  @Consume message: Array<boolean>

  build() {
    Column() {

      Button('Consume init array').id('consumeArrayBoolean_init')
        .height('5%')
        .onClick(() => {
          this.message = [true, false, false, true, false]
        })

      Button('Consume add new one').id('consumeArrayBoolean_add')
        .height('5%')
        .onClick(() => {
          let lastIndex = this.message.length - 1
          this.message.push(this.message[lastIndex] == true ? false : true)
        })

      Button('Consume clear').id('consumeArrayBoolean_clear')
        .height('5%')
        .onClick(() => {
          this.message = []
          if (Array.from(this.message.entries())) {
            this.message.push(true)
          }
        })

      Button('Consume replace').id('consumeArrayBoolean_replace')
        .height('5%')
        .onClick(() => {
          if (this.message.length > 0) {
            this.message[0] = this.message[0] === true ? false : true
          }
        })

      Button('Consume delete last').id('consumeArrayBoolean_delete')
        .height('5%')
        .onClick(() => {
          this.message.pop()
        })

      ForEach(Array.from(this.message.entries()), (item: [number, boolean]) => {
        Text(`${item[1]} index: ${item[0]}`).fontSize(9).id('consumeArrayBoolean_value_' + item[0])
          .height('5%')
        Divider()
      })
    }
  }
}

@Entry
@Component
struct ProvideArrayBoolean {
  @Provide message: Array<boolean> = [false, true, true, false, true]

  build() {
    Row() {
      Column() {
        Button('Provide init array').id('provideArrayBoolean_init')
          .height('5%')
          .onClick(() => {
            this.message = [false, true, true, false, true]
          })

        ConsumeArrayBooleanChild()
      }
      .width('100%')
    }
    .height('100%')
  }
}
