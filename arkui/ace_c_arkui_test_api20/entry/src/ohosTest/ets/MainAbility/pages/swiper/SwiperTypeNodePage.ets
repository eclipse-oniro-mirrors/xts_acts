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

    const rootNode = typeNode.createNode(uiContext, 'Swiper');
    rootNode.attribute.index(2).id('SwiperCrossLanguage_typeNode')
      .width(200).height(100).backgroundColor(Color.Red)
      .nextMargin(20).prevMargin(20).itemSpace(40);

    let columnNode1 = typeNode.createNode(uiContext, 'Column');
    columnNode1.attribute.width(100).height(100).backgroundColor(Color.Yellow);
    rootNode.appendChild(columnNode1);

    let columnNode2 = typeNode.createNode(uiContext, 'Column');
    columnNode2.attribute.width(100).height(100).backgroundColor(Color.Pink);
    rootNode.appendChild(columnNode2);

    let columnNode3 = typeNode.createNode(uiContext, 'Column');
    columnNode3.attribute.width(100).height(100).backgroundColor(Color.Gray);
    rootNode.appendChild(columnNode3);

    rootNode.setCrossLanguageOptions({
      attributeSetting: true
    });
    return rootNode;
  }
}

@Entry
@Component
struct SwiperTypeNodePage {
  @State myNodeController: MyNodeController = new MyNodeController();
  swiperController: SwiperController = new SwiperController()

  build() {
    Column() {
      Button('CAPINode_TS侧').onClick(() => {
        const node = this.getUIContext().getFrameNodeById('SwiperCrossLanguage_typeNode');
        console.info('Swiper isModifiable:' + node?.isModifiable());
        if (node) {
          console.info('Swiper TypeNode is exist')
          const a = typeNode.getAttribute(node, 'Swiper');
          if (a != undefined) {
            console.info('Swiper TypeNode background Yellow')
            a.backgroundColor(Color.Yellow)
            a.size({width: 150, height: 120})
          }
          console.info('Swiper bindController CAPINode is exist:new Scroller')

          try {
            typeNode.bindController(node, this.swiperController, 'Swiper')
            this.swiperController.showNext()
          } catch (e) {
            console.error('Swiper CAPINode error:' + e.message)
          }

        } else {
          console.info('Swiper TypeNode is null')
        }
      }).id('SwiperTypeNodePage_Btn')

      Button('undefined').onClick(() => {
        const attrs1 = typeNode.getAttribute(undefined, 'Swiper');
        AppStorage.SetOrCreate('SwiperTypeNodeUn', attrs1);
      }).id('SwiperTypeNodePage_undefined')

      NodeContainer(this.myNodeController)
    }
    .width('100%')
    .height('100%')
  }
}