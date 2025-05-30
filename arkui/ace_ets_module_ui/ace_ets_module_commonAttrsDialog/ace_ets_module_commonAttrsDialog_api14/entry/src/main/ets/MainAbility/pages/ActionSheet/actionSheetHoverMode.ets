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
struct actionSheetHoverMode {
  @State enableHoverMode: boolean = false
  @State hoverModeArea: HoverModeAreaType = HoverModeAreaType.TOP_SCREEN

  build() {
    Column({space: 20}) {
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
      Button('Click to Show ActionSheet')
        .id('actionSheet')
        .onClick(() => {
          ActionSheet.show({
            title: 'ActionSheet title',
            subtitle: 'ActionSheet subtitle',
            message: 'message',
            autoCancel: true,
            confirm: {
              defaultFocus: true,
              value: 'confirm',
              action: () => {
                console.log('Get Alert Dialog handled')
              }
            },
            cancel: () => {
              console.log('actionSheet canceled')
            },
            onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
              console.info('reason=' + JSON.stringify(dismissDialogAction.reason))
              console.log('dialog onWillDismiss')
              if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                dismissDialogAction.dismiss()
              }
              if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                dismissDialogAction.dismiss()
              }
            },
            alignment: DialogAlignment.Bottom,
            offset: { dx: 0, dy: -10 },
            enableHoverMode: this.enableHoverMode,
            hoverModeArea: this.hoverModeArea,
            sheets: [
              {
                title: 'apples',
                action: () => {
                  console.log('apples')
                }
              },
              {
                title: 'bananas',
                action: () => {
                  console.log('bananas')
                }
              },
              {
                title: 'pears',
                action: () => {
                  console.log('pears')
                }
              }
            ]
          })
        })
    }
    .id('col')
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}