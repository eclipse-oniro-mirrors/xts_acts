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
  Column, ColumnOptions,
  Flex, FlexDirection, ItemAlign, FlexAlign,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, 
} from '@ohos.arkui.component'
import { AppStorage, State, LocalStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';

// let para: Record<string> = {
//   'GridColType': 'Init',
// };
// let storage: LocalStorage = new LocalStorage(para);
let storage: LocalStorage = new LocalStorage();
storage.setOrCreate('GridColType', 'Init');

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

    let gridRow = typeNode.createGridRowNode(uiContext);
    gridRow.initialize().width('100%').height('100%').margin({ top: 5 } as Margin).borderWidth(1);
    col.appendChild(gridRow);

    let gridCol = typeNode.createGridColNode(uiContext);
    gridCol.initialize().width('100%').height('100%').margin({ top: 5 } as Margin).borderWidth(1);
    gridRow.appendChild(gridCol);
    storage.set('GridColType', '' + gridCol.getNodeType());

    return node;
  }
}

@Entry
@Component
struct TypeNodeGridCol {
  private myNodeController: MyNodeController = new MyNodeController();
  @State nodeType: string = "Init"

  build() {
    Row() {
      Button(this.nodeType).id("TypeNode_GridCol")
        .onClick((e:ClickEvent)=>{
          this.nodeType = storage.get<string>('GridColType') as string
        })
      NodeContainer(this.myNodeController);

    }
  }
}