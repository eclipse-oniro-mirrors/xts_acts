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
struct DragEventPropertyTest {
  @State resultText: string = 'Init';

  build() {
    Column() {
      Text('DragEvent Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.resultText)
        .id('resultText1')
        .width('90%')
        .height('5%')

      Scroll() {
        Column() {
          Row() {
            Column() {
              Text('onDragStart null')
                .id('onDragStartNull')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .onDragStart(null)
                .onDrop(null)
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetOnDragStartNull')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('15%')

          Row() {
            Column() {
              Text('onDragStart undefined')
                .id('onDragStartUndefined')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .onDragStart(undefined)
                .onDrop(undefined)
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetOnDragStartUndefined')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('15%')

          Row() {
            Column() {
              Text('onDrop disableDataPrefetch true')
                .id('onDropDisableTrue')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .onDragStart(() => {
                  this.resultText = 'onDropDisableTrue';
                })
                .onDrop(() => {
                  this.resultText = 'onDropDisableTrue';
                }, { disableDataPrefetch: true })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetOnDropDisableTrue')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('15%')

          Row() {
            Column() {
              Text('onDrop disableDataPrefetch false')
                .id('onDropDisableFalse')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .onDragStart(() => {
                  this.resultText = 'onDropDisableFalse';
                })
                .onDrop(() => {
                  this.resultText = 'onDropDisableFalse';
                }, { disableDataPrefetch: false })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetOnDropDisableFalse')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('15%')

          Row() {
            Column() {
              Text('onDrop second param null')
                .id('onDropSecondParamNull')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .onDragStart(() => {
                  this.resultText = 'onDropSecondParamNull';
                })
                .onDrop(() => {
                  this.resultText = 'onDropSecondParamNull';
                }, null)
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetOnDropSecondParamNull')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('15%')

          Row() {
            Column() {
              Text('onDrop second param undefined')
                .id('onDropSecondParamUndefined')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .onDragStart(() => {
                  this.resultText = 'onDropSecondParamUndefined';
                })
                .onDrop(() => {
                  this.resultText = 'onDropSecondParamUndefined';
                }, undefined)
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetOnDropSecondParamUndefined')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('15%')
        }
      }
      .width('100%')
      .height('85%')
    }
    .width('100%')
    .height('100%')
  }
}
