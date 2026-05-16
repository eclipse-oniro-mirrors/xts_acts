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
struct BackgroundImagePropertyTest {
  @State resultText: string = 'Init';

  build() {
    Column() {
      Text('BackgroundImage Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.resultText)
        .id('resultText')
        .width('90%')
        .height('5%')

      Scroll() {
        Column() {
          Row() {
            Column() {
              Image($r('app.media.icon'))
                .id('backgroundImagePositionNull')
                .width('100%')
                .height('100%')
                .backgroundImagePosition(null)
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Check')
                .id('targetBackgroundImagePositionNull')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('20%')

          Row() {
            Column() {
              Image($r('app.media.icon'))
                .id('backgroundImagePositionUndefined')
                .width('100%')
                .height('100%')
                .backgroundImagePosition(undefined)
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Check')
                .id('targetBackgroundImagePositionUndefined')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('20%')

          Row() {
            Column() {
              Image($r('app.media.icon'))
                .id('backgroundImageResizableNull')
                .width('100%')
                .height('100%')
                .backgroundImageResizable(null)
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Check')
                .id('targetBackgroundImageResizableNull')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('20%')

          Row() {
            Column() {
              Image($r('app.media.icon'))
                .id('backgroundImageResizableUndefined')
                .width('100%')
                .height('100%')
                .backgroundImageResizable(undefined)
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Check')
                .id('targetBackgroundImageResizableUndefined')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('20%')
        }
      }
      .width('100%')
      .height('85%')
    }
    .width('100%')
    .height('100%')
  }
}
