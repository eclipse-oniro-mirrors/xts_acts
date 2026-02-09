'use static';
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
import { UIContext, Router } from "@ohos.arkui.UIContext";
import { Entry, Component, TextAreaController, TextAreaOptions , ColumnOptions, Column, NodeContainer, HorizontalAlign, Font, Color, ClickEvent,FontStyle, TextAlign } from '@ohos.arkui.component';
import {
  typeNode,
  NodeController,
  FrameNode,
} from '@ohos.arkui.node';
import { AppStorage } from '@ohos.arkui.stateManagement';


let text = '123'
let placeholder = 'The text area can hold an unlimited amount of text. input your word...'
let controller1 = new TextAreaController()
let controller2 = new TextAreaController()
let data1: TextAreaOptions = {
  text: text,
  placeholder: placeholder,
  controller: controller1
}
let data2: TextAreaOptions = {
  text: text,
  placeholder: placeholder,
  controller: controller2
}

class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col = typeNode.createColumnNode(uiContext)
    col.initialize({ space: 10 } as ColumnOptions).borderColor(Color.Black).alignItems(HorizontalAlign.Center)

    let textArea = typeNode.createTextAreaNode(uiContext)
    textArea.initialize(undefined)
    textArea.initialize(data2)
      .placeholderFont({ size: 16, weight: 400 } as Font)
      .width(336)
      .height(56)
      .margin(20)
      .fontSize(16)
      .fontStyle(FontStyle.Italic)
      .textAlign(TextAlign.Center)
      .key('key_textArea_Node_001')
      .onChange((value: string) => {
        text = value
      })
    let bt1 = typeNode.createButtonNode(uiContext)
    let bt2 = typeNode.createButtonNode(uiContext)
    let bt3 = typeNode.createButtonNode(uiContext)
    bt1.initialize('caretPosition').onClick((e:ClickEvent)=>{
      controller2.caretPosition(1);
    })
    bt2.initialize('setTextSelection').onClick((e:ClickEvent)=>{
      controller2.setTextSelection(1,3);
    })
    bt3.initialize('stopEditing').onClick((e:ClickEvent)=>{
      controller2.stopEditing();
    })
    let row = typeNode.createRowNode(uiContext)
    row.initialize().width('100%')
    row.appendChild(bt1);
    row.appendChild(bt2);
    row.appendChild(bt3);

    col.appendChild(textArea)
    col.appendChild(row)
    node.appendChild(col)
    return node
  }
}
@Entry
@Component
struct textArea {
  private myNodeController: MyNodeController = new MyNodeController()



  build(){
    Column({ space: 10 } as ColumnOptions) {
      NodeContainer(this.myNodeController)

    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}
