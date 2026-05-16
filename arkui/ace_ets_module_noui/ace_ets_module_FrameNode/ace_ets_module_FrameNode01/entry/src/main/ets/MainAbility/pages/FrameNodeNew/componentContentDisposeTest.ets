/**
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
import { NodeController, FrameNode, ComponentContent } from '@kit.ArkUI';

@Builder
function buildText() {
  Column() {
    Text('Hello')
      .id('text_id')
      .fontSize(36)
      .fontWeight(FontWeight.Bold)
  }
  .width('100%')
  .alignItems(HorizontalAlign.Center)
  .padding(16)
}

const componentContentMap: ComponentContent<Object>[] = [];
class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    let component = new ComponentContent<Object>(uiContext, wrapBuilder(buildText));
    componentContentMap.push(component);
    this.rootNode.addComponentContent(component);

    return this.rootNode;
  }

  deleteNode() {
    let node = componentContentMap.pop();
    node?.dispose();
  }
}

@Entry
@Component
struct ComponentContentTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State flag: boolean | null = null
  @State ret: string = '5'

  build() {
    Column({ space: 16 }) {
      NodeContainer(this.myNodeController);
      Button('dispose')
        .id('dispose_id')
        .onClick(() => {
          this.myNodeController.deleteNode();
        })
      Button('result')
        .id('ret_id')
        .onClick(() => {
          const node = this.getUIContext().getFrameNodeById('text_id');
          if (node !== null) {
            this.ret = '1'
          } else {
            this.ret = '9'
          }
        })
      Text(this.ret).id('dispose_ret').height('10%')
    }
  }
}