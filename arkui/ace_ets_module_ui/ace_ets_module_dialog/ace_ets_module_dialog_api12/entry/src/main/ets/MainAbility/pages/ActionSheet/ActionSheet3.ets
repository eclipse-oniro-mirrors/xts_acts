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
struct ActionSheet3Example {
  @State text: string = 'ActionSheet3';

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Button("Reset")
        .id("ActionSheet3Text")
        .backgroundColor("#ff0000")
        .margin(30)
        .onClick(() => {
          this.text = "ActionSheet3"
        })
      Button(this.text)
        .id("ActionSheet3")
        .onClick(() => {
          ActionSheet.show({
            title: 'ActionSheet title',
            subtitle: 'ActionSheet subtitle',
            message: 'message',
            autoCancel: false,
            showInSubWindow: true,
            confirm: {
              defaultFocus: true,
              value: 'Confirm',
              action: () => {
                console.log('Get Alert Dialog handled')
              }
            },
            cancel: () => {
              console.log('actionSheet canceled')
            },
            onWillDismiss:(dismissDialog: DismissDialogAction)=> {
              console.info("reason=" + JSON.stringify(dismissDialog.reason))
              this.text = "reason=" + JSON.stringify(dismissDialog.reason)
              console.log("dialog onWillDismiss")
              if (dismissDialog.reason == DismissReason.PRESS_BACK) {
                dismissDialog.dismiss()
              }
              if (dismissDialog.reason == DismissReason.TOUCH_OUTSIDE) {
                dismissDialog.dismiss()
              }
            },
            alignment: DialogAlignment.Center,
            offset: { dx: 0, dy: -10 },
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
    }.width('100%')
    .height('100%')
  }
}