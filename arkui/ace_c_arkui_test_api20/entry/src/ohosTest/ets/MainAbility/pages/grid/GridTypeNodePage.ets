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
  makeNode(uiContext: UIContext): FrameNode {
    const rootNode = typeNode.createNode(uiContext, 'Grid');
    rootNode.attribute.id('GridCrossLanguage_typeNode')
      .width(200).height(100)
      .backgroundColor(Color.Red)
      .scrollBarWidth(4)
      .columnsTemplate('1fr 1fr 1fr 1fr');

    let gridItemNode1 = typeNode.createNode(uiContext, 'GridItem')
    gridItemNode1.attribute.id('gridItemNode1').backgroundColor(Color.Green);
    rootNode.appendChild(gridItemNode1);

    let columnNode1 = typeNode.createNode(uiContext, 'Column');
    columnNode1.attribute.width(30).height(50).backgroundColor(Color.Yellow);
    gridItemNode1.appendChild(columnNode1);

    let gridItemNode2 = typeNode.createNode(uiContext, 'GridItem')
    gridItemNode2.attribute.id('gridItemNode2').backgroundColor(Color.Pink);
    rootNode.appendChild(gridItemNode2);

    let columnNode2 = typeNode.createNode(uiContext, 'Column');
    columnNode2.attribute.width(30).height(50).backgroundColor(Color.Yellow);
    gridItemNode2.appendChild(columnNode2);

    let gridItemNode3 = typeNode.createNode(uiContext, 'GridItem')
    gridItemNode3.attribute.id('gridItemNode3').backgroundColor(Color.Blue);
    rootNode.appendChild(gridItemNode3);

    let columnNode3 = typeNode.createNode(uiContext, 'Column');
    columnNode3.attribute.width(30).height(50).backgroundColor(Color.Yellow);
    gridItemNode3.appendChild(columnNode3);

    let gridItemNode4 = typeNode.createNode(uiContext, 'GridItem')
    gridItemNode4.attribute.id('gridItemNode4').backgroundColor(Color.Grey);
    rootNode.appendChild(gridItemNode4);

    let columnNode4 = typeNode.createNode(uiContext, 'Column');
    columnNode4.attribute.width(30).height(50).backgroundColor(Color.Yellow);
    gridItemNode4.appendChild(columnNode4);

    rootNode.setCrossLanguageOptions({
      attributeSetting: true
    });
    return rootNode;
  }
}

@Entry
@Component
struct GridTypeNodePage {
  @State myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Button('CAPINode_TS侧').onClick(() => {
        const node = this.getUIContext().getFrameNodeById('GridCrossLanguage_typeNode');
        console.info('Grid isModifiable:' + node?.isModifiable());
        if (node) {
          console.info('Grid TypeNode is exist')
          const a = typeNode.getAttribute(node, 'Grid');
          if (a != undefined) {
            console.info('Grid TypeNode background Orange')
            a.backgroundColor(Color.Orange)
            a.size({width: 200, height: 120})
          } else {
            console.info('Grid TypeNode is null')
          }

          const gridItemNode1 = this.getUIContext().getFrameNodeById('gridItemNode1');
          console.info('GridItem isModifiable:' + gridItemNode1?.isModifiable());
          if (gridItemNode1) {
            console.info('GridItem TypeNode is exist')
            const b = typeNode.getAttribute(gridItemNode1, 'GridItem');
            if (b != undefined) {
              console.info('GridItem TypeNode backgroundColor Color.Red')
              b.backgroundColor(Color.Red);
              b.size({width: 50, height: 80})
            }
          } else {
            console.info('GridItem TypeNode is null')
          }
        }
      }).id('GridTypeNodePage_Btn')

      Button('undefined').onClick(() => {
        const attrs1 = typeNode.getAttribute(undefined, 'Grid');
        AppStorage.SetOrCreate('GridTypeNodeUn', attrs1);

        const attrs2 = typeNode.getAttribute(undefined, 'GridItem');
        AppStorage.SetOrCreate('GridItemTypeNodeUn', attrs2);
      }).id('GridTypeNodePage_undefined')

      NodeContainer(this.myNodeController)
    }
    .width('100%')
    .height('100%')
  }
}