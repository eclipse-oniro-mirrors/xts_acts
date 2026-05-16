/**
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
import { promptAction } from '@kit.ArkUI'
import { LengthMetrics } from '@kit.ArkUI';
@Entry
@Component
struct promptKeyboard {
  private customDialogComponentId: number = 0
  @State textValue: string = 'click me'
  @State modal: boolean = true
  @State mode: KeyboardAvoidMode = KeyboardAvoidMode.DEFAULT
  @State keyboardAvoidDistance :LengthMetrics = LengthMetrics.vp(20)
  @State showInSub: boolean = false
  @State heigh: Dimension = 200
  controller1: TextInputController = new TextInputController()

  @Builder CustomKeyboardBuilder(): void {
    Column() {
      Button('x').onClick(() => {
        this.controller1.stopEditing()
      })
      Grid() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'], (item:number|string) => {
          GridItem() {
            Button(item + '')
              .width('30%').onClick(() => {
              this.textValue += item
            })
          }
        })
      }.maxCount(3).columnsGap(10).rowsGap(10)
      .padding(5)
      .height('50%')
    }.backgroundColor(Color.Gray).id('keyboard')
  }
  @Builder customDialogComponent(): void {
    Column() {
      Row({ space: 20 }) {
        Button('确认').onClick(() => {
          promptAction.closeCustomDialog(this.customDialogComponentId)
        })
        Button('取消').onClick(() => {
          promptAction.closeCustomDialog(this.customDialogComponentId)
        })
      }.margin({top:0})
      TextInput({ placeholder: '', text: this.textValue, controller: this.controller1 })
        .id('input1')
        .width('90%')
        .customKeyboard(this.CustomKeyboardBuilder(),{supportAvoidance:true})
        .border({ width: 1 })
        .onChange((value: string) => {
          this.textValue = value
        })
      Text('弹窗').fontSize(30)
    }.justifyContent(FlexAlign.SpaceBetween)
  }
  build() {
    Row() {
      Column({ space: 20 }) {
        Button('20')
          .margin({top:10})
          .id('btn1')
          .fontSize(30)
          .onClick(() => {
            promptAction.openCustomDialog({
              builder: () => {
                this.customDialogComponent()
              },
              showInSubWindow: this.showInSub,
              isModal:this.modal,
              keyboardAvoidMode: this.mode,
              keyboardAvoidDistance: this.keyboardAvoidDistance,
              height: this.heigh,
              maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
              maskColor: Color.Pink,
              onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
                console.info('reason' + JSON.stringify(dismissDialogAction.reason))
                console.log('dialog onWillDismiss')
                if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                  dismissDialogAction.dismiss()
                }
                if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                  dismissDialogAction.dismiss()
                }
              }
            }).then((dialogId: number) => {
              this.customDialogComponentId = dialogId
            })
          })
        Button('undefined')
          .margin({top:10})
          .id('btn2')
          .fontSize(30)
          .onClick(() => {
            promptAction.openCustomDialog({
              builder: () => {
                this.customDialogComponent()
              },
              showInSubWindow: this.showInSub,
              isModal:this.modal,
              keyboardAvoidMode: this.mode,
              keyboardAvoidDistance: undefined,
              height: this.heigh,
              maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
              maskColor: Color.Pink,
              onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
                console.info('reason' + JSON.stringify(dismissDialogAction.reason))
                console.log('dialog onWillDismiss')
                if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                  dismissDialogAction.dismiss()
                }
                if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                  dismissDialogAction.dismiss()
                }
              }
            }).then((dialogId: number) => {
              this.customDialogComponentId = dialogId
            })
          })
        Button('null')
          .margin({top:10})
          .id('btn3')
          .fontSize(30)
          .onClick(() => {
            promptAction.openCustomDialog({
              builder: () => {
                this.customDialogComponent()
              },
              showInSubWindow: this.showInSub,
              isModal:this.modal,
              keyboardAvoidMode: this.mode,
              keyboardAvoidDistance: null,
              height: this.heigh,
              maskRect: { x: 0, y: 0, width: '100%', height: '100%' },
              maskColor: Color.Pink,
              onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
                console.info('reason' + JSON.stringify(dismissDialogAction.reason))
                console.log('dialog onWillDismiss')
                if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
                  dismissDialogAction.dismiss()
                }
                if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
                  dismissDialogAction.dismiss()
                }
              }
            }).then((dialogId: number) => {
              this.customDialogComponentId = dialogId
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}