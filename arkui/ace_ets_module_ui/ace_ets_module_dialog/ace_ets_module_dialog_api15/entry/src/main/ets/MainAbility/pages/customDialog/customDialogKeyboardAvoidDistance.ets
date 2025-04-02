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
class Tmp {
  public keyBoardHeight: Length = 200

  constructor(keyBoardHeight: Length) {
    this.keyBoardHeight = keyBoardHeight
  }
  public getKeyBoardHeight() {
    return this.keyBoardHeight
  }
}
@Entry
@Component
struct prompt {
  private customDialogComponentId: number = 0
  @State keyBoardHeight: Length= 300
  @State textValue: string = 'click me'
  @State distanceId: number = 0
  @State modal: boolean = true
  @State mode: KeyboardAvoidMode = KeyboardAvoidMode.DEFAULT
  @State keyboardAvoidDistance :LengthMetrics = LengthMetrics.px(200)
  @State modeIndex: number = 0
  @State showInSub: boolean = false
  @State heigh: Dimension = 200
  @State focus: boolean = false
  @State mText1: string = ''
  @State mText2: string = ''
  @State mText3: string = ''
  controller1: TextInputController = new TextInputController()
  @Builder CustomKeyboardBuilder(params: Tmp) {
    Column() {
      Button('x').onClick(() => {
        this.controller1.stopEditing()
      }).id('close')
      Grid() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'], (item:number|string) => {
          GridItem() {
            Button(item + '')
              .width(110).onClick(() => {
              this.textValue += item
            })
          }
        })
      }.maxCount(3).columnsGap(10).rowsGap(10).padding(5)
      .height(params.getKeyBoardHeight())
    }.backgroundColor(Color.Gray).id('keyboard')
  }
  @Builder customDialogComponent() {
    Column() {
      Text('弹窗').fontSize(30)
      TextInput({ placeholder: '', text: this.textValue }).height(60).width('90%')
        .customKeyboard(this.CustomKeyboardBuilder(new Tmp(this.keyBoardHeight)),{supportAvoidance:true})
    .id('input1')
      .onChange((value: string) => {
        this.textValue = value
      }).defaultFocus(this.focus)
    Row({ space: 20 }) {
      Button('确认').onClick(() => {
        promptAction.closeCustomDialog(this.customDialogComponentId)
      })
      Button('取消').onClick(() => {
        promptAction.closeCustomDialog(this.customDialogComponentId)
      })
    }
  }.height(200).padding(5).justifyContent(FlexAlign.SpaceBetween).id('customDialog')
}

build() {
  Row() {
    Column({ space: 20 }) {
      Button('200')
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
            keyboardAvoidDistance:this.keyboardAvoidDistance,
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
      Text(this.mText1)
        .id('text1')

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
            keyboardAvoidDistance:undefined,
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
      Text(this.mText2)
        .id('text2')

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
            keyboardAvoidDistance:null,
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
      Text(this.mText3)
        .id('text3')
    }
    .width('100%')
  }
  .height('100%')
}
}