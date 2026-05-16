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
struct DragPreviewPropertyTest {
  @State resultText: string = 'Init';

  build() {
    Column() {
      Text('DragPreview Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.resultText)
        .id('resultText2')
        .width('90%')
        .height('5%')

      Scroll() {
        Column() {
          Row() {
            Column() {
              Text('dragPreview null')
                .id('api11FirstParamNull')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreview(null)
                .onDragStart(() => {
                  this.resultText = 'api11FirstParamNull';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetApi11FirstParamNull')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('8%')

          Row() {
            Column() {
              Text('dragPreview undefined')
                .id('api11FirstParamUndefined')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreview(undefined)
                .onDragStart(() => {
                  this.resultText = 'api11FirstParamUndefined';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetApi11FirstParamUndefined')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('8%')

          Row() {
            Column() {
              Text('dragPreview empty string')
                .id('api11FirstParamEmptyString')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreview('')
                .onDragStart(() => {
                  this.resultText = 'api11FirstParamEmptyString';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetApi11FirstParamEmptyString')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('8%')

          Row() {
            Column() {
              Text('config onlyForLifting true')
                .id('api15OnlyForLiftingTrue')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreview('preview', { onlyForLifting: true })
                .onDragStart(() => {
                  this.resultText = 'api15OnlyForLiftingTrue';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetApi15OnlyForLiftingTrue')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('8%')

          Row() {
            Column() {
              Text('config delayCreating false')
                .id('api15DelayCreatingFalse')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreview('preview', { delayCreating: false })
                .onDragStart(() => {
                  this.resultText = 'api15DelayCreatingFalse';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetApi15DelayCreatingFalse')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('8%')

          Row() {
            Column() {
              Text('api15 first param null')
                .id('api15FirstParamNull')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreview(null)
                .onDragStart(() => {
                  this.resultText = 'api15FirstParamNull';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetApi15FirstParamNull')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('8%')

          Row() {
            Column() {
              Text('api15 first param undefined')
                .id('api15FirstParamUndefined')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreview(undefined)
                .onDragStart(() => {
                  this.resultText = 'api15FirstParamUndefined';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetApi15FirstParamUndefined')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('8%')

          Row() {
            Column() {
              Text('api15 second param null')
                .id('api15SecondParamNull')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreview('preview', null)
                .onDragStart(() => {
                  this.resultText = 'api15SecondParamNull';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetApi15SecondParamNull')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('8%')

          Row() {
            Column() {
              Text('api15 second param undefined')
                .id('api15SecondParamUndefined')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreview('preview', undefined)
                .onDragStart(() => {
                  this.resultText = 'api15SecondParamUndefined';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetApi15SecondParamUndefined')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('8%')

          Row() {
            Column() {
              Text('api15 first param empty string')
                .id('api15FirstParamEmptyString')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreview('')
                .onDragStart(() => {
                  this.resultText = 'api15FirstParamEmptyString';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetApi15FirstParamEmptyString')
                .width('100%')
                .height('100%')
                .backgroundColor('#FF0000FF')
                .textAlign(TextAlign.Center)
            }
            .width('20%')
            .height('100%')
          }
          .width('100%')
          .height('8%')
        }
      }
      .width('100%')
      .height('85%')
    }
    .width('100%')
    .height('100%')
  }
}
