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
struct requestFocus10 {
  @State text1:string = ''
  @State width1:number = 200

  build() {
    Column({ space:20 }){
      Text('' + this.text1).id('requestFocus10_text1')
      Image($r('app.media.icon'))
        .width(this.width1).height(200)
        .id('requestFocus10_img1')
        .clip(new Circle({ width: 100, height: 100 }))
        .focusable(true)
        .onFocus(() => {
          this.width1 = 250
        })
        .onBlur(() => {
          this.width1 = 200
        })

      Button('Focus-Image1').onClick(() => {
        try{
          this.getUIContext().getFocusController().requestFocus('requestFocus10_img1')
        }catch (error){
          this.text1 = '' + error.code
        }
      }).id('requestFocus10_btn1')

    }.width('100%').margin({ top:20 })
  }
}

