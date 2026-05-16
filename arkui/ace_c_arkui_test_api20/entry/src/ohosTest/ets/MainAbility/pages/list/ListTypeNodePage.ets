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
    const rootNode = typeNode.createNode(uiContext, 'List');
    rootNode.attribute.id('ListCrossLanguage_typeNode').width(200).height(150).backgroundColor(Color.Pink).scrollBarWidth(4);

    let listItemGroupNode1 = typeNode.createNode(uiContext, 'ListItemGroup')
    listItemGroupNode1.attribute.id('listItemGroupNode1').width(200).height(100).backgroundColor(Color.Grey);
    rootNode.appendChild(listItemGroupNode1);

    let listItemNode1 = typeNode.createNode(uiContext, 'ListItem')
    listItemNode1.attribute.id('listItemNode1').width(180).height(100).backgroundColor(Color.Yellow);
    listItemGroupNode1.appendChild(listItemNode1);

    let columnNode1 = typeNode.createNode(uiContext, 'Column');
    columnNode1.attribute.width(100).height(100)
    listItemNode1.appendChild(columnNode1);

    rootNode.setCrossLanguageOptions({
      attributeSetting: true
    });
    return rootNode;
  }
}

@Entry
@Component
struct ListTypeNodePage {
  @State myNodeController: MyNodeController = new MyNodeController();
  scroller: Scroller = new Scroller();

  build() {
    Column() {
      Button('CAPINode_TS侧').onClick(() => {
        const node = this.getUIContext().getFrameNodeById('ListCrossLanguage_typeNode');
        console.info('List isModifiable:' + node?.isModifiable());
        if (node) {
          console.info('List TypeNode is exist')
          const a = typeNode.getAttribute(node, 'List');
          if (a != undefined) {
            console.info('List TypeNode background Yellow')
            a.backgroundColor(Color.Yellow)
            a.size({width: 200, height: 130})
          } else {
            console.info('List TypeNode is null')
          }

          const listItemGroupNode1 = this.getUIContext().getFrameNodeById('listItemGroupNode1');
          console.info('ListItemGroup isModifiable:' + listItemGroupNode1?.isModifiable());
          if (listItemGroupNode1) {
            console.info('ListItemGroup TypeNode is exist')
            const b = typeNode.getAttribute(listItemGroupNode1, 'ListItemGroup');
            if (b != undefined) {
              console.info('ListItemGroup TypeNode backgroundColor Color.Orange')
              b.backgroundColor(Color.Orange);
              b.size({width: 150, height: 120})
            }
          } else {
            console.info('ListItemGroup TypeNode is null')
          }

          const listItemNode1 = this.getUIContext().getFrameNodeById('listItemNode1');
          console.info('ListItem isModifiable:' + listItemNode1?.isModifiable());
          if (listItemNode1) {
            console.info('ListItem TypeNode is exist')
            const c = typeNode.getAttribute(listItemNode1, 'ListItem');
            if (c != undefined) {
              console.info('ListItem TypeNode backgroundColor Color.Red')
              c.backgroundColor(Color.Red);
              c.size({width: 150, height: 100})
            }
          } else {
            console.info('ListItem TypeNode is null')
          }
        }
      }).id('ListTypeNodePage_Btn')

      Button('undefined').onClick(() => {
        const attrs1 = typeNode.getAttribute(undefined, 'List');
        AppStorage.SetOrCreate('ListTypeNodeUn', attrs1);

        const attrs2 = typeNode.getAttribute(undefined, 'ListItemGroup');
        AppStorage.SetOrCreate('ListItemGroupTypeNodeUn', attrs2);

        const attrs3 = typeNode.getAttribute(undefined, 'ListItem');
        AppStorage.SetOrCreate('ListItemTypeNodeUn', attrs3);
      }).id('ListTypeNodePage_undefined')

      NodeContainer(this.myNodeController)
    }
    .width('100%')
    .height('100%')
  }
}