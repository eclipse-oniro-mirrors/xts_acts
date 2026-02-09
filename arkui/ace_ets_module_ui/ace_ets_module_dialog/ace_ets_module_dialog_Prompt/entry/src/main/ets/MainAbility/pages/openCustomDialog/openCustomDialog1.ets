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
import promptAction from '@ohos.promptAction'
let customDialogId: number = 0
@Builder
function customDialogBuilder1() {
  Column() {
    Text('Custom dialog Message').fontSize(10)
    Row() {
      Button("确认").onClick(() => {
        promptAction.closeCustomDialog(customDialogId)
      })
      Blank().width(50)
      Button("取消").onClick(() => {
        promptAction.closeCustomDialog(customDialogId)
      })
    }
  }.height(200).padding(5)
}

@Entry
@Component
struct openCustomDialog1 {
  @State text: string = 'openCustomDialog1';

  build() {
    Row() {
      Column() {
        Button("Reset")
          .id("openCustomDialog1Text")
          .backgroundColor("#ff0000")
          .margin(30)
          .onClick(() => {
            this.text = "openCustomDialog1"
          })
        Button(this.text)
          .id("openCustomDialog1")
          .onClick(() => {
            promptAction.openCustomDialog({
              isModal: true,
              builder: customDialogBuilder1.bind(this),
              onWillDismiss:(dismissDialog: DismissDialogAction)=> {
                console.info("reason=" + JSON.stringify(dismissDialog.reason))
                this.text = "reason=" + JSON.stringify(dismissDialog.reason)
                console.log("dialog onWillDismiss")
                if (dismissDialog.reason == DismissReason.PRESS_BACK) {

                }
                if (dismissDialog.reason == DismissReason.TOUCH_OUTSIDE) {

                }
              }
            }).then((dialogId: number) => {
              customDialogId = dialogId
            })
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}