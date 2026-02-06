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
import { Entry, Column, Component, ItemAlign, Text, Button, Row, ClickEvent, ContentSlot } from '@ohos.arkui.component'
import { NodeContent, typeNode,FrameNode } from '@ohos.arkui.node';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { State, Watch, Link, LocalStorage } from '@ohos.arkui.stateManagement'

let para: Record<string, number> = { 'NodeContentFlagAPI': 0 };
let storage: LocalStorage = new LocalStorage(para);


class NodeContentCtrl {
  content: NodeContent = new NodeContent()
  textNode: Array<typeNode.Text> = new Array<typeNode.Text>();
  uiContext: UIContext
  width: number
  textNode1: typeNode.Text | undefined = undefined

  constructor(uiContext: UIContext) {
    this.content = new NodeContent()
    this.uiContext = uiContext
    this.width = Infinity
  }

  AddNode() {
    let node = typeNode.createTextNode(this.uiContext)
    node.initialize("ContentText:" + this.textNode.length).fontSize(20)
    this.textNode.push(node)
    // this.textNode1 = node
    storage.set<Int>('NodeContentFlagAPI', this.textNode.length);
    this.content.addFrameNode(node)
  }

  RemoveNode() {
      let node = this.textNode.pop()
      storage.set<Int>('NodeContentFlagAPI', this.textNode.length);
      if(node != undefined){
        this.content.removeFrameNode(node as FrameNode)
      }
  }

  GetContent(): NodeContent {
    return this.content
  }
}

@Entry
@Component
struct APINodeContent {
  @State message: string = 'Hello World';
  controller:NodeContentCtrl = new NodeContentCtrl(this.getUIContext());
  @State text1: Int = 0;

  build() {
    Row() {
      Column() {
        Text(`${this.text1}`).id('APINodeContent_Text')
        Button('get context').width('50%').id('APINodeContent_Button_get')
          .onClick((event: ClickEvent) => {
            console.log('+++++++++++++++++storage.get1')
            this.text1 = storage.get<Int>('NodeContentFlagAPI') as Int
            console.log('+++++++++++++storage.get',storage.get<Int>('NodeContentFlagAPI') as Int,', this.text1:',this.text1)
            console.log('+++++++++++++++++storage.get2: '  + this.text1)
      })
        ContentSlot(this.controller.GetContent())

        Button("AddToSlot").id('APINodeContent_Button_AddToSlot')
          .onClick((event: ClickEvent) => {
            console.log('++++++++++3')
            this.controller.AddNode()
            console.log('++++++++++4')
          })
        Button("RemoveBack").id('APINodeContent_Button_RemoveBack')
          .onClick((event: ClickEvent) => {
            console.log('++++++++++5')
            this.controller.RemoveNode()
            console.log('++++++++++6')
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}