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

@CustomDialog
struct CustomDialogExampleFocusScopePriority13 {
  controller?: CustomDialogController
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }
  build() {
    Column({space:5}) {
      Text('焦点组')
      Column({space:5}){
        Button('btn1')
          .focusOnTouch(true)

        Button('FocusPriority.PREVIOUS')
          .focusOnTouch(true)
          .focusScopePriority('FocusScopePriority13_focusGroup1', FocusPriority.PREVIOUS)
          .id('FocusScopePriority13_btn2_1')

        Button('btn3')
          .focusOnTouch(true)

      }.focusScopeId('FocusScopePriority13_focusGroup1',true)
      .borderWidth(1)

      Button('btn4')
        .focusOnTouch(true)

      Text('非焦点组')
      Column({space:5}){
        Button('btn5')
          .focusOnTouch(true)
          .id('FocusScopePriority13_btn1_2')

        Button('FocusPriority.PRIOR')
          .focusOnTouch(true)
          .focusScopePriority('FocusScopePriority13_focusGroup2', FocusPriority.PRIOR)
          .id('FocusScopePriority13_btn2_2')

        Button('btn7')
          .focusOnTouch(true)
          .id('FocusScopePriority13_btn3_2')

      }.focusScopeId('FocusScopePriority13_focusGroup2',false)
      .borderWidth(1)

      Button('close')
        .id('FocusScopePriority13_close')
        .focusOnTouch(true)
        .onClick(() => {
          if (this.controller != undefined) {
            this.controller.close()
          }
        })

    }.padding(20)
  }
}

@Entry
@Component
struct FocusScopePriority13 {
  onCancel() {
    console.info('Callback when the first button is clicked')
  }

  onAccept() {
    console.info('Callback when the second button is clicked')
  }

  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExampleFocusScopePriority13({
      cancel: ()=> { this.onCancel() },
      confirm: ()=> { this.onAccept() },
    }),
    autoCancel: true,
    alignment: DialogAlignment.Top,
    customStyle: false,
  })


  build() {
    Column({space:5}) {
      Button('CustomDialog')
        .id('FocusScopePriority13_open')
        .onClick(()=>{
          this.dialogController?.open()
        })
    }.width('100%')
  }
}