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
  'RelativeContainerType': 'Init',
};
let storage: LocalStorage = new LocalStorage(para);

class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute.width(100)
      .height(50)
      .borderColor(Color.Gray)
      .borderWidth(1)
      .margin({ left: 10 });
    let col = typeNode.createNode(uiContext, 'Column');
    col.initialize({ space: 5 }).width('100%').height('100%').margin({ top: 5 });
    node.appendChild(col);

    let relativeContainer = typeNode.createNode(uiContext, 'RelativeContainer');
    relativeContainer.initialize().width('100%').height('100%').margin({ top: 5 }).backgroundColor(Color.Red);
    col.appendChild(relativeContainer);
    storage.set('RelativeContainerType', '' + relativeContainer.getNodeType());

    let row1 = typeNode.createNode(uiContext, 'Row');
    row1.initialize().width('100%').height('100%').margin({ top: 5 }).borderWidth(1).backgroundColor(Color.Red);
    relativeContainer.appendChild(row1);

    let row2 = typeNode.createNode(uiContext, 'Row');
    row2.initialize().width('100%').height('100%').margin({ top: 5 }).borderWidth(1).backgroundColor(Color.Blue);
    relativeContainer.appendChild(row2);
    return node;
  }
}

@Entry
@Component
struct TypeNodeRelativeContainer {
  private myNodeController: MyNodeController = new MyNodeController();
  @State nodeType: string = "Init"

  build() {
    Row() {
      Button(this.nodeType).id("TypeNode_RelativeContainer")
        .onClick(()=>{
          this.nodeType = storage.get('RelativeContainerType') as string
        })
      NodeContainer(this.myNodeController);

    }
  }
}