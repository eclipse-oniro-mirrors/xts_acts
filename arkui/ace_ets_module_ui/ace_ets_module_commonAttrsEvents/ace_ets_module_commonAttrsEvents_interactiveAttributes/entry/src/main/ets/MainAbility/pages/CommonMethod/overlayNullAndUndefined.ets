/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct CommonMethodOverlayNullAndUndefined {
  @State resultText: string = '';

  build() {
    Column() {
      Text('CommonMethod overlay Test')
        .width('100%')
        .height('10%')

      Row() {
        Text('Result:')
          .width('30%')
          .height('100%')
        Text(this.resultText)
          .width('60%')
          .height('100%')
      }
      .width('100%')
      .height('10%')

      Button('Test null parameter')
        .width('90%')
        .height('10%')
        .id('testNullBtn')
        .overlay(null)
        .onClick(() => {
          this.resultText = 'null parameter applied';
        })

      Button('Test undefined parameter')
        .width('90%')
        .height('10%')
        .id('testUndefinedBtn')
        .overlay(undefined)
        .onClick(() => {
          this.resultText = 'undefined parameter applied';
        })
    }
    .width('100%')
    .height('100%')
  }
}
