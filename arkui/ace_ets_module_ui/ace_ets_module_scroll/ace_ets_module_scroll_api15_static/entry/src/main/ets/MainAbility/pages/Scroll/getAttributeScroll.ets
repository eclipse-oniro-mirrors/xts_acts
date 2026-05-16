'use static';
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

import {
  Entry,
  Column,
  Component,
  Color,
  Text,
  LengthMetrics,
  Scroller,
  NodeContainer,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  FontWeight,
  Button,
  ButtonType,
  ClickEvent,
  Padding
} from '@ohos.arkui.component'
import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';
import { UIContext } from '@ohos.arkui.UIContext';
import { State } from '@ohos.arkui.stateManagement'

class MyNodeController extends NodeController {
  public scroller: Scroller = new Scroller()

  makeNode(uiContext: UIContext): FrameNode | null {
    const rootNode = typeNode.createScrollNode(uiContext);
    rootNode.initialize(this.scroller);
    rootNode.attribute.id('typeNode_scroll')
      .width(200)
      .height(200)
      .backgroundColor(Color.Red)
      .scrollBarWidth(4);

    let columnNode = typeNode.createColumnNode(uiContext);
    columnNode.attribute
      .width(100)
      .height(300)
      .backgroundColor(Color.Yellow);
    rootNode.appendChild(columnNode);

    rootNode.setCrossLanguageOptions({
      attributeSetting: true
    });
    console.log('jerry', rootNode.getCrossLanguageOptions());
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
    Column() {
      Button('clickTypeNode')
        .id('scroll_get_click')
        .onClick((e: ClickEvent) => {
          const node = this.getUIContext().getFrameNodeById('typeNode_scroll');
          console.info('isModifiable:' + node?.isModifiable());
          if (node) {
            console.info('ScrollAttribute1 TypeNode is exist')
            // const a = typeNode.getAttribute(node, 'Scroll');
            // if (a != undefined) {
            //   console.info('ScrollAttribute1 TypeNode scrollBarWidth 10')
            //   a.scrollBarWidth(30);
            //   a.enableScrollInteraction(true)
            //   a.fadingEdge(false,{fadingEdgeLength:LengthMetrics.vp(20)})
            // }
            console.info('bindController TypeNode is exist:new Scroller')

          } else {
            console.info('ScrollAttribute1 TypeNode is null')
          }
        })

      Button('clickTypeNode')
        .id('scroll_bind_click')
        .onClick((e: ClickEvent) => {
          const node = this.getUIContext().getFrameNodeById('typeNode_scroll');
          console.info('isModifiable:' + node?.isModifiable());
          if (node) {
            console.info('bindController TypeNode is exist:new Scroller')
            try {
              // typeNode.bindController(node, this.scroller, 'Scroll')
              this.scroller.fling(-1000)
              console.info('bindController TypeNode currentOffset:' + this.scroller.currentOffset()?.yOffset)
            } catch (e) {
              console.error('TypeNode error:' + e)
            }

          } else {
            console.info('ScrollAttribute1 TypeNode is null')
          }
        })

      Text('ScrollFling: ' + this.num1)
        .id('scroll_fling_text')
        .onClick((e: ClickEvent) => {
          this.num1 = Math.round(this.scroller.currentOffset()?.yOffset ?? 0.0)
        })
      NodeContainer(this.myNodeController)

    }
    .padding({ left: 35, right: 35, top: 35 } as Padding)
    .width('100%')
    .height('100%')
  }
}
