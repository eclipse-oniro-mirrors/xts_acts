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
import {
  Entry, Component, Column, Text, Color, CopyOptions, TextSelectableMode, Margin, ClickEvent, TextAreaOptions, TextArea, Button
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'

@Entry
@Component
struct TextSelectableMode1{
  @State message:string="texttexttexttezrrtyhyhlyheyllreyl"
  build() {
    Column(){
    Text(this.message)
      .width(300)
      .height(100)
      .maxLines(5)
      .fontColor(Color.Black)
      .copyOption(CopyOptions.InApp)
      .selection(3,8)
      .textSelectable(TextSelectableMode.SELECTABLE_FOCUSABLE)
      .key("TypeNode_TextSelectableMode1")
    TextArea({text:this.message} as TextAreaOptions)
    Button("获取属性").onClick((event:ClickEvent)=>{
      let strJson=inspector.getInspectorByKey("TypeNode_TextSelectableMode1");
      this.message=JSON.stringify(JSON.parseJsonElement(strJson))
      })
    }
  }
}