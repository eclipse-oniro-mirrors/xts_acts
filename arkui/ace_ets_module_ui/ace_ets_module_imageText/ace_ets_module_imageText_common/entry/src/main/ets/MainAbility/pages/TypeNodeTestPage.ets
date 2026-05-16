/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { FrameNode, NodeController, typeNode } from '@kit.ArkUI';

class TestNodeController extends NodeController {
  public uiContext: UIContext | null = null;
  public rootNode: FrameNode | null = null;
  public textNode: FrameNode | null = null;
  public progressNode: FrameNode | null = null;
  public loadingProgressNode: FrameNode | null = null;
  public textInputNode: FrameNode | null = null;
  public textAreaNode: FrameNode | null = null;
  public textController: TextController = new TextController();
  public textInputController: TextInputController = new TextInputController();
  public textAreaController: TextAreaController = new TextAreaController();

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    this.rootNode = new FrameNode(uiContext);
    let col = typeNode.createNode(uiContext, 'Column');
    col.initialize({ space: 10 });
    col.commonAttribute.width('100%').height('100%');
    this.rootNode.appendChild(col);

    this.textNode = typeNode.createNode(uiContext, 'Text');
    col.appendChild(this.textNode);

    this.progressNode = typeNode.createNode(uiContext, 'Progress');
    col.appendChild(this.progressNode);

    this.loadingProgressNode = typeNode.createNode(uiContext, 'LoadingProgress');
    col.appendChild(this.loadingProgressNode);

    this.textInputNode = typeNode.createNode(uiContext, 'TextInput');
    col.appendChild(this.textInputNode);

    this.textAreaNode = typeNode.createNode(uiContext, 'TextArea');
    col.appendChild(this.textAreaNode);

    return this.rootNode;
  }
}

@Entry
@Component
struct TypeNodeTestPage {
  private controller: TestNodeController = new TestNodeController();

  aboutToAppear(){
    try {
      AppStorage.setOrCreate<UIContext>('uiContext', this.getUIContext());
    } catch (error) {
      console.log('error ' + error);
    }
  }

  build() {
    Column({ space: 10 }) {
      Text('TypeNode Test Page')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      NodeContainer(this.controller)
        .width('100%')
        .height('100%')
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
