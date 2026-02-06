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
  Column, ColumnOptions, XComponentParameters,
  Flex, FlexDirection, ItemAlign, FlexAlign, XComponentType,
  Text, Button, FontWeight, ClickEvent, Margin, Color, Row, Callback, NativeXComponentPointer,
} from '@ohos.arkui.component'
import { AppStorage, State, LocalStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';
import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';

// let para: Record<string> = {
//   'XComponentType': 'Init',
// };
// let storage: LocalStorage = new LocalStorage(para);
let storage: LocalStorage = new LocalStorage();
storage.setOrCreate('XComponentType', 'Init');


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

    // let XComponent = typeNode.createXComponentNode(uiContext);   10.27 编译不过
    // XComponent.initialize({
    //   id: 'XComponentTypeId',
    //   type: XComponentType.SURFACE,
    //   nativeXComponentHandler: (data:NativeXComponentPointer):void=>{},
    // } as XComponentParameters).margin({ top: 5 } as Margin);
    // col.appendChild(XComponent);
    // storage.set('XComponentType', '' + XComponent.getNodeType());

    return node;
  }
}

@Entry
@Component
struct TypeNodeXComponent {
  private myNodeController: MyNodeController = new MyNodeController();
  @State nodeType: string = "Init"

  build() {
    Row() {
      Button(this.nodeType).id("TypeNode_XComponent")
        .onClick((e:ClickEvent)=>{
          this.nodeType = storage.get<string>('XComponentType') as string
        })
      NodeContainer(this.myNodeController);

    }
  }
}