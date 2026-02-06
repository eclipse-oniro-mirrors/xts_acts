/**
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
@Entry
@Component
struct TextNumberTransitionTest {
  @State number: number = 100
  @State numberTransitionArr: NumericTextTransition[] = [{ flipDirection: FlipDirection.DOWN, enableBlur: false },{ flipDirection: FlipDirection.UP, enableBlur: true }]
  @State numberTransitionIndex: number = 0

  build() {
    Column() {
      Text(this.number + "")
        .borderWidth(1)
        .fontSize(40)
        .contentTransition(this.numberTransitionArr[this.numberTransitionIndex])
        .id('TextNumberTransition')
      Button("chang number")
        .onClick(() => {
          this.number++
        })
        .margin(10)
      Button('changeIndex').onClick(()=>{
        this.numberTransitionIndex=1
      }).id('changeIndex')
    }
    .height('100%')
    .width('100%')
  }
}