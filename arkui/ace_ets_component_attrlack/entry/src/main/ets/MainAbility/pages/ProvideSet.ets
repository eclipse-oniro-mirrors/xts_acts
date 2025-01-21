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
struct ConsumeSetChild {
  @Consume message: Set<number>;

  build() {
    Column() {
      ForEach(Array.from(this.message.entries()), (item: [number, string]) => {
        Text(`${item[0]}`).fontSize(20).id("provideSet_value_" + item[0])
        Divider()
      })
      Button('Consume init set').id("consumeSet_init")
        .onClick(() => {
          this.message = new Set([1, 2, 3])
        }).margin(10)

      Button('Consume set new one').id("consumeSet_set")
        .onClick(() => {
          this.message.add(5)
        }).margin(10)

      Button('Consume clear').id("consumeSet_clear")
        .onClick(() => {
          this.message.clear()
          if (Array.from(this.message.entries())) {
            this.message.add(0)
          }
        }).margin(10)

      Button('Consume delete').id("consumeSet_delete")
        .onClick(() => {
          this.message.delete(0)
        })
    }
    .width('100%')
  }
}


@Entry
@Component
struct ProvideSetSample {
  @Provide message: Set<number> = new Set([1, 2, 3])

  build() {
    Row() {
      Column() {
        Button('Provide init set').id("provideSet_add")
          .onClick(() => {
            this.message = new Set([1, 2, 3, 4])
          }).margin(10)

        ConsumeSetChild()
      }
      .width('100%')
    }
    .height('100%')
  }
}