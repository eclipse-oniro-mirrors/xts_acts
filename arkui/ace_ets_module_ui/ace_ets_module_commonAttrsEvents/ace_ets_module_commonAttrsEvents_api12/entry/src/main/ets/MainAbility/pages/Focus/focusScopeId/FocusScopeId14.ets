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
struct FocusScopeId14 {
  @State isShow: boolean = false

  @Builder myBuilder() {
    Column({space:5}) {
      Text('焦点组')
      Column({space:5}){
        Button('btn1').focusOnTouch(true).id('FocusScopeId14_btn1')
        Button('btn2').focusOnTouch(true).id('FocusScopeId14_btn2')
        Button('btn3').focusOnTouch(true)
      }.focusScopeId('FocusScopeId14_focusGroup1',true)
      .borderWidth(1)

      Button('btn4').focusOnTouch(true).id('FocusScopeId14_btn4')
        .onClick(()=>{
          this.isShow = false
        })

    }.padding(5)
  }

  build() {
    Column({space:5}){

      Button('bindSheet')
        .id('FocusScopeId14_open')
        .onClick(() => {
          this.isShow = true
        })
        .bindSheet($$this.isShow, this.myBuilder(), {
          backgroundColor: Color.Pink,
          showClose:true,
          dragBar:true
        })

    }.width('100%')
  }
}