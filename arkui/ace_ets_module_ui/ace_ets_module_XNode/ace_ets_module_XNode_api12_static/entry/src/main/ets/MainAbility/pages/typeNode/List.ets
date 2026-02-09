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
  Entry, Component, Builder,NodeContainer,
  Column, ColumnOptions, ListOptions,
  Flex, FlexDirection, ItemAlign, FlexAlign,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row,
} from '@ohos.arkui.component'
import { AppStorage, State, LocalStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';

// let para: Record<string> = {
//   'ListType': 'Init',
// };
// let storage: LocalStorage = new LocalStorage(para);
let storage: LocalStorage = new LocalStorage();
storage.setOrCreate('ListType', 'Init');

class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute.width(400)
      .height(100)
      .borderColor(Color.Gray)
      .borderWidth(1)
      .margin({ left: 10 } as Margin);
    let col = typeNode.createColumnNode(uiContext);
    col.initialize({ space: 5 } as ColumnOptions).width('100%').height('100%').margin({ top: 5 } as Margin);
    node.appendChild(col);

    let list = typeNode.createListNode(uiContext);
    list.initialize({ space: 5 } as ListOptions).width('100%').height('100%').margin({ top: 5 } as Margin);
    col.appendChild(list);
    storage.set('ListType', '' + list.getNodeType());

    let listItem1 = typeNode.createListItemNode(uiContext);
    listItem1.initialize().width('100%').height('100%').margin({ top: 5 } as Margin);
    list.appendChild(listItem1);

    let text1 = typeNode.createTextNode(uiContext);
    text1.initialize("ListItem Text1").fontColor(Color.Blue).fontSize(10);
    listItem1.appendChild(text1);

    let listItem2 = typeNode.createListItemNode(uiContext);
    listItem2.initialize().width('100%').height('100%').margin({ top: 5 } as Margin);
    list.appendChild(listItem2);

    let text2 = typeNode.createTextNode(uiContext);
    text2.initialize("ListItem Text2").fontColor(Color.Blue).fontSize(10);
    listItem2.appendChild(text2);
    return node;
  }
}

@Entry
@Component
struct TypeNodeList {
  private myNodeController: MyNodeController = new MyNodeController();
  @State nodeType: string = "Init"

  build() {
    Row() {
      Button(this.nodeType).id("TypeNode_List")
        .onClick((e:ClickEvent)=>{
          this.nodeType = storage.get<string>('ListType') as string
        })
      NodeContainer(this.myNodeController);

    }
  }
}