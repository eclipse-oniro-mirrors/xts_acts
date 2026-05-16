/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
struct alertDialogHoverMode {
  @State enableHoverMode: boolean = false
  @State hoverModeArea: HoverModeAreaType = HoverModeAreaType.TOP_SCREEN

  build() {
    Column({ space: 10 }) {
      Button('change enableHoverMode ' + this.enableHoverMode)
        .id('btn1')
        .onClick(() => {
        this.enableHoverMode = true
      })
      Button('change hoverModeArea ' + this.hoverModeArea)
        .id('btn2')
        .onClick(() => {
        this.hoverModeArea = HoverModeAreaType.BOTTOM_SCREEN
      })
      Button('one button dialog')
        .id('alertDialog')
        .onClick(() => {
          AlertDialog.show(
            {
              title: 'title',
              message: 'text',
              autoCancel: true,
              alignment: DialogAlignment.Bottom,
              gridCount: 3,
              confirm: {
                value: 'button',
                action: () => {
                  console.info('Button-clicking callback')
                }
              },
              cancel: () => {
                console.info('Closed callbacks')
              },
              onWillDismiss:(dismissDialogAction: DismissDialogAction)=> {
                console.info('reason=' + JSON.stringify(dismissDialogAction.reason));
                console.log('dialog onWillDismiss');
                if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                  dismissDialogAction.dismiss();
                }
                if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                  dismissDialogAction.dismiss();
                }
              },
              enableHoverMode: this.enableHoverMode,
              hoverModeArea: this.hoverModeArea
            }
          )
        })
    }
    .id('col')
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}