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
struct fingerInfo {
  @State globalDisplayX: number = 0;
  @State globalDisplayY: number = 0;

  build() {
    Row() {
      Column() {
        Text('FingerInfo').textAlign(TextAlign.Center).margin({ bottom: 10 })

        Button('Button')
          .id('button')
          .type(ButtonType.ROUNDED_RECTANGLE)
          .width('80%')
          .height(100)
          .fontSize(30)
          .margin({ bottom: 15 })
          .gesture(
            TapGesture({ count: 1 })
              .onAction((event: GestureEvent) => {
                if (event.fingerInfos) {
                  if (event.fingerInfos[0].globalDisplayX !== undefined &&
                      event.fingerInfos[0].globalDisplayY !== undefined) {
                    this.globalDisplayX = event.fingerInfos[0].globalDisplayX;
                    this.globalDisplayY = event.fingerInfos[0].globalDisplayY;
                  }
                }
              })
          )

        Text(`${this.globalDisplayX}`).id('globalDisplayX').textAlign(TextAlign.Center).margin({ bottom: 10 })

        Text(`${this.globalDisplayY}`).id('globalDisplayY').textAlign(TextAlign.Center).margin({ bottom: 10 })
      }
      .width('100%')
    }
    .height('100%')
  }
}
