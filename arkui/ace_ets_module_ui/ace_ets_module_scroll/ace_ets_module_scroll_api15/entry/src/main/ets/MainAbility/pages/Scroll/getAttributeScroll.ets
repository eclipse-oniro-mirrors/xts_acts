/**
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
import { FrameNode, LengthMetrics, NodeController, typeNode } from '@kit.ArkUI'
class MyNodeController extends NodeController {
  public scroller: Scroller = new Scroller()

  makeNode(uiContext: UIContext): FrameNode {
    const rootNode = typeNode.createNode(uiContext, 'Scroll');
    rootNode.initialize(this.scroller);
    rootNode.attribute.id('typeNode_scroll')
      .width(200)
      .height(200)
      .backgroundColor(Color.Red)
      .scrollBarWidth(4);

    let columnNode = typeNode.createNode(uiContext, 'Column');
    columnNode.attribute
      .width(100)
      .height(300)
      .backgroundColor(Color.Yellow);
    rootNode.appendChild(columnNode);

    rootNode.setCrossLanguageOptions({
      attributeSetting: true
    });
    console.log('jerry', JSON.stringify(rootNode.getCrossLanguageOptions()));
    return rootNode;
  }
}

@Entry
@Component
struct ScrollAttribute1 {
  private myNodeController: MyNodeController = new MyNodeController();
  scroller: Scroller = new Scroller();
  @State num1: number = 0
  build() {
    Column({space:5}) {
      Button('clickTypeNode')
        .id('scroll_get_click')
        .onClick(() => {
          const node = this.getUIContext().getFrameNodeById('typeNode_scroll');
          console.info('isModifiable:' + node?.isModifiable());
          if (node) {
            console.info('ScrollAttribute1 TypeNode is exist')
            const a = typeNode.getAttribute(node, 'Scroll');
            if (a != undefined) {
              console.info('ScrollAttribute1 TypeNode scrollBarWidth 10')
              a.scrollBarWidth(30);
              a.enableScrollInteraction(true)
              a.fadingEdge(false,{fadingEdgeLength:LengthMetrics.vp(20)})
            }
            console.info('bindController TypeNode is exist:new Scroller')

          } else {
            console.info('ScrollAttribute1 TypeNode is null')
          }
      })

      Button('clickTypeNode')
        .id('scroll_bind_click')
        .onClick(() => {
          const node = this.getUIContext().getFrameNodeById('typeNode_scroll');
          console.info('isModifiable:' + node?.isModifiable());
          if (node) {
            console.info('bindController TypeNode is exist:new Scroller')
            try {
              typeNode.bindController(node, this.scroller, 'Scroll')
              this.scroller.fling(-1000)
              console.info('bindController TypeNode currentOffset:' + this.scroller.currentOffset().yOffset)
            } catch (e) {
              console.error('TypeNode error:' + e.message)
            }

          } else {
            console.info('ScrollAttribute1 TypeNode is null')
          }
        })

      Text('ScrollFling: ' + this.num1)
        .id('scroll_fling_text')
        .onClick(()=>{
          this.num1 = Math.round(this.scroller.currentOffset().yOffset)
        })
      NodeContainer(this.myNodeController)
      
    }
    .padding({ left: 35, right: 35, top: 35 })
    .width('100%')
    .height('100%')
  }
}
