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
struct FocusScopeId13 {
  @State customPopup: boolean = false

  @Builder popupBuilder() {
    Column({space:5}) {
      Text('焦点组')
      Column({space:5}){
        Button('btn1').focusOnTouch(true).id('FocusScopeId13_btn1')
        Button('btn2').focusOnTouch(true)
        Button('btn3').focusOnTouch(true).id('FocusScopeId13_btn3')
      }.focusScopeId('FocusScopeId13_focusGroup1',true)
      .borderWidth(1)

      Button('btn4').focusOnTouch(true).id('FocusScopeId13_btn4')
        .onClick(()=>{
          this.customPopup = !this.customPopup
        })

    }.padding(5)
  }

  build() {
    Column({space:5}){

      Button('CustomPopupOptions1')
        .id('FocusScopeId13_open')
        .onClick(() => {
          this.customPopup = !this.customPopup
        })
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder,
          placement: Placement.Top,
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