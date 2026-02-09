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
    const rootNode = typeNode.createNode(uiContext, 'WaterFlow');
    rootNode.attribute.id('WaterFlowCrossLanguage_typeNode')
      .width(200).height(100)
      .backgroundColor(Color.Red)
      .scrollBarWidth(4)

    let flowItemNode1 = typeNode.createNode(uiContext, 'FlowItem')
    flowItemNode1.attribute.id('flowItemNode1').width(80).height(50).backgroundColor(Color.Pink);
    rootNode.appendChild(flowItemNode1);

    let flowItemNode2 = typeNode.createNode(uiContext, 'FlowItem')
    flowItemNode2.attribute.id('flowItemNode2').width(80).height(50).backgroundColor(Color.Grey);
    rootNode.appendChild(flowItemNode2);

    let flowItemNode3 = typeNode.createNode(uiContext, 'FlowItem')
    flowItemNode3.attribute.id('flowItemNode3').width(80).height(50).backgroundColor(Color.Blue);
    rootNode.appendChild(flowItemNode3);

    rootNode.setCrossLanguageOptions({
      attributeSetting: true
    });
    return rootNode;
  }
}

@Entry
@Component
struct WaterFlowTypeNodePage {
  @State myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Button('CAPINode_TS侧').onClick(() => {
        const node = this.getUIContext().getFrameNodeById('WaterFlowCrossLanguage_typeNode');
        console.info('WaterFlow isModifiable:' + node?.isModifiable());
        if (node) {
          console.info('WaterFlow TypeNode is exist')
          const a = typeNode.getAttribute(node, 'WaterFlow');
          if (a != undefined) {
            console.info('WaterFlow TypeNode background Orange')
            a.backgroundColor(Color.Orange)
            a.size({width: 200, height: 120})
          } else {
            console.info('WaterFlow TypeNode is null')
          }

          const flowItemNode1 = this.getUIContext().getFrameNodeById('flowItemNode1');
          console.info('FlowItem isModifiable:' + flowItemNode1?.isModifiable());
          if (flowItemNode1) {
            console.info('FlowItem TypeNode is exist')
            const b = typeNode.getAttribute(flowItemNode1, 'FlowItem');
            if (b != undefined) {
              console.info('FlowItem TypeNode backgroundColor Color.Red')
              b.backgroundColor(Color.Red);
              b.size({width: 50, height: 80})
            }
          } else {
            console.info('FlowItem TypeNode is null')
          }
        }
      }).id('WaterFlowTypeNodePage_Btn')

      Button('undefined').onClick(() => {
        const attrs1 = typeNode.getAttribute(undefined, 'WaterFlow');
        AppStorage.SetOrCreate('WaterFlowTypeNodeUn', attrs1);

        const attrs2 = typeNode.getAttribute(undefined, 'FlowItem');
        AppStorage.SetOrCreate('FlowItemTypeNodeUn', attrs2);
      }).id('WaterFlowTypeNodePage_undefined')

      NodeContainer(this.myNodeController)
    }
    .width('100%')
    .height('100%')
  }
}