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
struct ClickEventPropertyTest {
  @State resultText: string = 'Init';

  build() {
    Column() {
      Text('ClickEvent Property Test')
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
              Button('onClick distanceThreshold null')
                .id('onClickDistanceThresholdNull')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF00FF00')
                .onClick(() => {
                  this.resultText = 'onClickDistanceThresholdNull';
                }, null)
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Click')
                .id('targetOnClickDistanceThresholdNull')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('40%')

          Row() {
            Column() {
              Button('onClick distanceThreshold undefined')
                .id('onClickDistanceThresholdUndefined')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF00FF00')
                .onClick(() => {
                  this.resultText = 'onClickDistanceThresholdUndefined';
                }, undefined)
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Click')
                .id('targetOnClickDistanceThresholdUndefined')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('40%')
        }
      }
      .width('100%')
      .height('85%')
    }
    .width('100%')
    .height('100%')
  }
}
