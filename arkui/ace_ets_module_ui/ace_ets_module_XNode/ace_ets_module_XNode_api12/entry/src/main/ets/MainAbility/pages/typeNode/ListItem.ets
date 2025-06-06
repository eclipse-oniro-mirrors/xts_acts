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

import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';

let para: Record<string, string> = {
  'ListitemType': 'Init',
};
let storage: LocalStorage = new LocalStorage(para);

class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute.width(400)
      .height(100)
      .borderColor(Color.Gray)
      .borderWidth(1)
      .margin({ left: 10 });
    let col = typeNode.createNode(uiContext, 'Column');
    col.initialize({ space: 5 }).width('100%').height('100%').margin({ top: 5 });
    node.appendChild(col);

    let list = typeNode.createNode(uiContext, 'List');
    list.initialize({ space: 5 }).width('100%').height('100%').margin({ top: 5 });
    col.appendChild(list);

    let listItem1 = typeNode.createNode(uiContext, 'ListItem');
    listItem1.initialize().width('100%').height('100%').margin({ top: 5 });
    list.appendChild(listItem1);
    storage.set('ListitemType', '' + listItem1.getNodeType());

    let text1 = typeNode.createNode(uiContext, 'Text');
    text1.initialize("ListItem Text1").fontColor(Color.Blue).fontSize(10);
    listItem1.appendChild(text1);

    let listItem2 = typeNode.createNode(uiContext, 'ListItem');
    listItem2.initialize().width('100%').height('100%').margin({ top: 5 });
    list.appendChild(listItem2);

    let text2 = typeNode.createNode(uiContext, 'Text');
    text2.initialize("ListItem Text2").fontColor(Color.Blue).fontSize(10);
    listItem2.appendChild(text2);
    return node;
  }
}

@Entry
@Component
struct TypeNodeListItem {
  private myNodeController: MyNodeController = new MyNodeController();
  @State nodeType: string = "Init"

  build() {
    Row() {
      Button(this.nodeType).id("TypeNode_ListItem")
        .onClick(()=>{
          this.nodeType = storage.get('ListitemType') as string
        })
      NodeContainer(this.myNodeController);

    }
  }
}