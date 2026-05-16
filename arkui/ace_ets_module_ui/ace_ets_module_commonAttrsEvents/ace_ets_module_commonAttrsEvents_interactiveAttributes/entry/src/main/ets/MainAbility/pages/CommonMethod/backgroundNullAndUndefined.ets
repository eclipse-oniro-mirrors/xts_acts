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

@Entry
@Component
struct CommonMethodBackgroundNullAndUndefined {
  @State resultText: string = '';

  build() {
    Scroll() {
      Column() {
        Text('CommonMethod background Test')
          .width('100%')

        Row() {
          Text('Result:')
            .width('30%')
          Text(this.resultText)
            .width('60%')
        }
        .width('90%')
        .height('5%')
        .justifyContent(FlexAlign.SpaceBetween)

        Button('Test null first parameter')
          .width('90%')
          .height('5%')
          .id('testNullFirstBtn')
          .background(null)
          .onClick(() => {
            this.resultText = 'null first parameter applied';
          })

        Button('Test undefined first parameter')
          .width('90%')
          .height('5%')
          .id('testUndefinedFirstBtn')
          .background(undefined)
          .onClick(() => {
            this.resultText = 'undefined first parameter applied';
          })

        Button('Test null second parameter')
          .width('90%')
          .height('5%')
          .id('testNullSecondBtn')
          .background('#FF0000', null)
          .onClick(() => {
            this.resultText = 'null second parameter applied';
          })

        Button('Test undefined second parameter')
          .width('90%')
          .height('5%')
          .id('testUndefinedSecondBtn')
          .background('#FF0000', undefined)
          .onClick(() => {
            this.resultText = 'undefined second parameter applied';
          })

        Button('Test empty array ignoresLayoutSafeAreaEdges')
          .width('90%')
          .height('5%')
          .id('testEmptyArrayBtn')
          .background('#FF0000', { ignoresLayoutSafeAreaEdges: [] })
          .onClick(() => {
            this.resultText = 'empty array ignoresLayoutSafeAreaEdges applied';
          })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}
