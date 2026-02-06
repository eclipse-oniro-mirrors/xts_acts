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
struct requestFocus8 {
  @State backgroundColor1:Color = Color.Blue
  @State text1:string = ''

  build() {
    Column({ space:20 }){
      Text('' + this.text1).id('requestFocus8_text1')
      Button('btn1')
        .id('requestFocus8_btn1')
        .backgroundColor(this.backgroundColor1)
        .onFocus(() => {
          this.backgroundColor1 = Color.Green
        })
        .onBlur(() => {
          this.backgroundColor1 = Color.Red
        })
        .visibility(Visibility.None)

      Button('Focus-btn1').onClick(() => {
        try{
          this.getUIContext().getFocusController().requestFocus('requestFocus8_btn1')
        }catch (error){
          this.text1 = '' + error.code
        }
      }).id('requestFocus8_btn2')

    }.width('100%').margin({ top:20 })
  }
}

