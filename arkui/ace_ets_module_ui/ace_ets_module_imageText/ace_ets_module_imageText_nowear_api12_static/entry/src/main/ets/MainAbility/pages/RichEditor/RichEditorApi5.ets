'use static';
/*
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
import { Entry, Column, Component,RichEditorController ,Column,
  Row,RichEditor,Padding,Button,FlexAlign,VerticalAlign,
  RichEditorOptions,Margin,Color

} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { ClickEvent } from '@ohos.arkui.component';
@Entry
@Component
struct RichEditorApi5 {
  controller: RichEditorController = new RichEditorController()
  @State height1:string|number = '80%'
  @State height2:number = 100
  @State supportAvoidance:boolean = true;

  build() {
    Column() {
      Row(){
        Button("20%")
          .fontSize(24)
          .onClick((e:ClickEvent)=>{
            this.height1 = "20%"
          })
        Button("80%")
          .fontSize(24)
          .margin({left:20} as Margin)
          .onClick((e:ClickEvent)=>{
            this.height1 = "80%"
          })
      }
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Bottom)
      .height(this.height1)
      .width("100%")
      .padding({bottom:50} as Padding)
      RichEditor({ controller: this.controller } as RichEditorOptions)
        // 绑定自定义键盘
        .borderWidth(1)
        .borderColor(Color.Red)
        .width("100%")
        .id('RichEditorApi5')
    }
  }
}