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
import nativeNode from 'libnativerender.so'
import { FrameNode, NodeController, typeNode, NodeContent } from '@kit.ArkUI'

class MyNodeController extends NodeController {
  public root: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode {
    this.root = new FrameNode(uiContext);

    let row = typeNode.createNode(uiContext, 'Row');
    row.attribute.id('RowTypeNodePage_typeNode').width(100).height(100).backgroundColor(Color.Pink);

    row.setCrossLanguageOptions({
      attributeSetting: true
    });

    this.root.appendChild(row)

    return this.root;
  }
}

@Entry
@Component
struct RowTypeNodePage {
  @State myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Button('CAPINode_TS侧').onClick(() => {
        const node = this.getUIContext().getFrameNodeById('RowTypeNodePage_typeNode');
        console.info('RowTypeNodePage isModifiable:' + node?.isModifiable());
        if (node) {
          console.info('RowTypeNodePage TypeNode is exist')
          const a = typeNode.getAttribute(node, 'Row');
          if (a != undefined) {
            console.info('RowTypeNodePage TypeNode background Yellow')
            a.backgroundColor(Color.Yellow)
            a.size({width: 150, height: 150})
          } else {
            console.info('RowTypeNodePage TypeNode is null')
          }
        }
      }).id('RowTypeNodePage_Btn')

      Button('undefined').onClick(() => {
        const attrs1 = typeNode.getAttribute(undefined, 'Row');
        AppStorage.SetOrCreate('RowTypeNodePage', attrs1);
      }).id('RowTypeNodePage_undefined')

      NodeContainer(this.myNodeController)
    }
    .width('100%')
    .height('100%')
  }
}