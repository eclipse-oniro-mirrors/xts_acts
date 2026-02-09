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
//   'ProgressType': 'Init',
//   'initialize': 'Init',
//   'attribute': 'Init',
// };
// let storage: LocalStorage = new LocalStorage(para);
let storage: LocalStorage = new LocalStorage();
storage.setOrCreate('ProgressType', 'Init');
storage.setOrCreate('initialize', 'Init');
storage.setOrCreate('attribute', 'Init');


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

    let progress = typeNode.createProgressNode(uiContext);
    progress.initialize({ value: 100 }).width('100%').height('100%').margin({ top: 5 } as Margin).padding(10);
    col.appendChild(progress);
    storage.set('ProgressType', '' + progress.getNodeType());
    storage.set('initialize', '' + JSON.stringify(progress.getUserConfigPadding()));
    //取值不对"top":{"unit":{},"value":0},"left":{"unit":{},"value":0},"right":{"unit":{},"value":0},"bottom":{"unit":{},"value":0}
    console.log('+++++++++initialize',JSON.stringify(progress.getUserConfigPadding()))

    let text1 = typeNode.createTextNode(uiContext);
    text1.attribute.padding(5).fontColor(Color.Blue).fontSize(10);
    col.appendChild(text1);
    storage.set('attribute', '' + JSON.stringify(text1.getUserConfigPadding()));
    console.log('+++++++++attribute',JSON.stringify(text1.getUserConfigPadding()))
    //取值不对"top":{"unit":{},"value":0},"left":{"unit":{},"value":0},"right":{"unit":{},"value":0},"bottom":{"unit":{},"value":0}
    return node;
  }
}

@Entry
@Component
struct TypeNodeProgress {
  private myNodeController: MyNodeController = new MyNodeController();
  @State nodeType: string = "Init"
  @State initializeFlag: string = "Init"
  @State attributeFlag: string = "Init"

  build() {
    Column() {
      Button(this.nodeType).id("TypeNode_Progress")
        .onClick((e:ClickEvent)=>{
          this.nodeType = storage.get<string>('ProgressType') as string
        })
      Button(this.initializeFlag).id("TypeNode_initialize")
        .onClick((e:ClickEvent)=>{
          this.initializeFlag = storage.get<string>('initialize') as string
        })
      Button(this.attributeFlag).id("TypeNode_attribute")
        .onClick((e:ClickEvent)=>{
          this.attributeFlag = storage.get<string>('attribute') as string
        })
      NodeContainer(this.myNodeController);

    }
  }
}