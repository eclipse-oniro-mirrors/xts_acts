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
struct DragPreviewOptionsPropertyTest {
  @State resultText: string = 'Init';

  build() {
    Column() {
      Text('DragPreviewOptions Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Text(this.resultText)
        .id('resultText3')
        .width('90%')
        .height('5%')

      Scroll() {
        Column() {
          Row() {
            Column() {
              Text('mode ENABLE_DEFAULT_SHADOW')
                .id('modeEnableDefaultShadow')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions({ mode: DragPreviewMode.ENABLE_DEFAULT_SHADOW })
                .onDragStart(() => {
                  this.resultText = 'modeEnableDefaultShadow';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetModeEnableDefaultShadow')
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
              Text('mode ENABLE_DEFAULT_RADIUS')
                .id('modeEnableDefaultRadius')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions({ mode: DragPreviewMode.ENABLE_DEFAULT_RADIUS })
                .onDragStart(() => {
                  this.resultText = 'modeEnableDefaultRadius';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetModeEnableDefaultRadius')
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
              Text('mode ENABLE_DRAG_ITEM_GRAY')
                .id('modeEnableDragItemGrayEffect')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions({ mode: DragPreviewMode.ENABLE_DRAG_ITEM_GRAY_EFFECT })
                .onDragStart(() => {
                  this.resultText = 'modeEnableDragItemGrayEffect';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetModeEnableDragItemGrayEffect')
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
              Text('mode ENABLE_MULTI_TILE')
                .id('modeEnableMultiTileEffect')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions({ mode: DragPreviewMode.ENABLE_MULTI_TILE_EFFECT })
                .onDragStart(() => {
                  this.resultText = 'modeEnableMultiTileEffect';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetModeEnableMultiTileEffect')
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
              Text('mode ENABLE_TOUCH_POINT')
                .id('modeEnableTouchPointCalculation')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions({ mode: DragPreviewMode.ENABLE_TOUCH_POINT_CALCULATION_BASED_ON_FINAL_PREVIEW })
                .onDragStart(() => {
                  this.resultText = 'modeEnableTouchPointCalculation';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetModeEnableTouchPointCalculation')
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
              Text('numberBadge true')
                .id('numberBadgeTrue')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions({ numberBadge: true })
                .onDragStart(() => {
                  this.resultText = 'numberBadgeTrue';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetNumberBadgeTrue')
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
              Text('numberBadge false')
                .id('numberBadgeFalse')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions({ numberBadge: false })
                .onDragStart(() => {
                  this.resultText = 'numberBadgeFalse';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetNumberBadgeFalse')
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
              Text('isMultiSelectionEnabled false')
                .id('isMultiSelectionEnabledFalse')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions({}, { isMultiSelectionEnabled: false })
                .onDragStart(() => {
                  this.resultText = 'isMultiSelectionEnabledFalse';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetIsMultiSelectionEnabledFalse')
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
              Text('defaultAnimationBeforeLifting false')
                .id('defaultAnimationBeforeLiftingFalse')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions({}, { defaultAnimationBeforeLifting: false })
                .onDragStart(() => {
                  this.resultText = 'defaultAnimationBeforeLiftingFalse';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetDefaultAnimationBeforeLiftingFalse')
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
              Text('enableHapticFeedback true')
                .id('enableHapticFeedbackTrue')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions({}, { enableHapticFeedback: true })
                .onDragStart(() => {
                  this.resultText = 'enableHapticFeedbackTrue';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetEnableHapticFeedbackTrue')
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
              Text('enableHapticFeedback false')
                .id('enableHapticFeedbackFalse')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions({}, { enableHapticFeedback: false })
                .onDragStart(() => {
                  this.resultText = 'enableHapticFeedbackFalse';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetEnableHapticFeedbackFalse')
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
              Text('enableEdgeAutoScroll true')
                .id('enableEdgeAutoScrollTrue')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions({}, { enableEdgeAutoScroll: true })
                .onDragStart(() => {
                  this.resultText = 'enableEdgeAutoScrollTrue';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetEnableEdgeAutoScrollTrue')
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
              Text('enableEdgeAutoScroll false')
                .id('enableEdgeAutoScrollFalse')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions({}, { enableEdgeAutoScroll: false })
                .onDragStart(() => {
                  this.resultText = 'enableEdgeAutoScrollFalse';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetEnableEdgeAutoScrollFalse')
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
              Text('isLiftingDisabled true')
                .id('isLiftingDisabledTrue')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions({}, { isLiftingDisabled: true })
                .onDragStart(() => {
                  this.resultText = 'isLiftingDisabledTrue';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetIsLiftingDisabledTrue')
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
              Text('first param null')
                .id('firstParamNull')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions(null)
                .onDragStart(() => {
                  this.resultText = 'firstParamNull';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetFirstParamNull')
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
              Text('first param undefined')
                .id('firstParamUndefined')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions(undefined)
                .onDragStart(() => {
                  this.resultText = 'firstParamUndefined';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetFirstParamUndefined')
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
              Text('second param null')
                .id('secondParamNull')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions({}, null)
                .onDragStart(() => {
                  this.resultText = 'secondParamNull';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetSecondParamNull')
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
              Text('second param undefined')
                .id('secondParamUndefined')
                .width('100%')
                .height('100%')
                .draggable(true)
                .backgroundColor('#FF00FF00')
                .textAlign(TextAlign.Center)
                .dragPreviewOptions({}, undefined)
                .onDragStart(() => {
                  this.resultText = 'secondParamUndefined';
                })
            }
            .width('40%')
            .height('100%')

            Column() {
              Text('Drop')
                .id('targetSecondParamUndefined')
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
