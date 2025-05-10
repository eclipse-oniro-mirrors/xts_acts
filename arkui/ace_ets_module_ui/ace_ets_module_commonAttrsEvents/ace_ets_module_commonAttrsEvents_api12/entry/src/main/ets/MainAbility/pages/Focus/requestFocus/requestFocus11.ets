/*
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
struct requestFocus11 {
  @State text1:string = ''
  @State label:string = 'btn4'

  build() {
    Column({ space:20 }){
      Text('' + this.text1).id('requestFocus11_text1')
      Button('btn1').onClick((event: ClickEvent) => {
      }).tabIndex(0)
      Button('btn2').onClick((event: ClickEvent) => {
      }).tabIndex(1)
      Button('btn3').onClick((event: ClickEvent) => {
      }).tabIndex(2)
      Button(this.label).onClick((event: ClickEvent) => {
      }).id('requestFocus11_btn4')
        .onFocus(() => {
          this.label = 'btn4-1'
        })
        .onBlur(() => {
          this.label = 'btn4'
        })

      Button('Focus-btn4').onClick(() => {
        try{
          this.getUIContext().getFocusController().requestFocus('requestFocus11_btn4')
        }catch (error){
          this.text1 = '' + error.code
        }
      }).id('requestFocus11_btn5')

    }.width('100%').margin({ top:20 })
  }
}

