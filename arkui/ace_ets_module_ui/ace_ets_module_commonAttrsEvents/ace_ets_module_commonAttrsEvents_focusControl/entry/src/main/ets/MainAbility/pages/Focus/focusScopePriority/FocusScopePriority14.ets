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
struct FocusScopePriority14 {
  @State customPopup: boolean = false

  @Builder popupBuilder() {
    Column({space:5}) {
      Text('焦点组')
      Column({space:5}){
        Button('btn1')
          .focusOnTouch(true)

        Button('FocusPriority.PREVIOUS')
          .focusOnTouch(true)
          .focusScopePriority('FocusScopePriority14_focusGroup1', FocusPriority.PREVIOUS)
          .id('FocusScopePriority14_btn2_1')

        Button('btn3')
          .focusOnTouch(true)

      }.focusScopeId('FocusScopePriority14_focusGroup1',true)
      .borderWidth(1)

      Button('btn4')
        .focusOnTouch(true)

      Text('非焦点组')
      Column({space:5}){
        Button('btn5')
          .focusOnTouch(true)
          .id('FocusScopePriority14_btn1_2')

        Button('FocusPriority.PRIOR')
          .focusOnTouch(true)
          .focusScopePriority('FocusScopePriority14_focusGroup2', FocusPriority.PRIOR)
          .id('FocusScopePriority14_btn2_2')

        Button('btn7')
          .focusOnTouch(true)
          .id('FocusScopePriority14_btn3_2')

      }.focusScopeId('FocusScopePriority14_focusGroup2',false)
      .borderWidth(1)

      Button('close')
        .id('FocusScopePriority14_close')
        .focusOnTouch(true)
        .onClick(() => {
          this.customPopup = false
        })

    }.padding(20)
  }

  build() {
    Column({space:5}){

      Button('CustomPopupOptions1')
        .id('FocusScopePriority14_open')
        .onClick(() => {
          this.customPopup = !this.customPopup
        })
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder,
          placement: Placement.Bottom,
          focusable:true,
          showInSubWindow: false,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.customPopup = false
            }
          }
        })
    }.width('100%')
  }
}