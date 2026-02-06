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
import nativeNode from "libnativeNode.so";
class MyNodeController extends NodeController {
  scroller: Scroller = new Scroller()

  makeNode(uiContext: UIContext): FrameNode {
    const rootNode = typeNode.createNode(uiContext, 'Scroll');
    rootNode.attribute
      .id('typeNode').width("5%").height("10%")
      .backgroundColor(Color.Red)
      .edgeEffect(EdgeEffect.None)
      .scrollBarWidth(4);

    let columnNode = typeNode.createNode(uiContext, 'Column');
    columnNode.attribute.width("10%").height("20%").backgroundColor(Color.Yellow);
    rootNode.appendChild(columnNode);

    rootNode.setCrossLanguageOptions({
      attributeSetting: false
    });
    return rootNode;
  }
}

@Entry
@Component
struct ScrollCrossAttribute_TS_False {
  private myNodeController: MyNodeController = new MyNodeController();
  private message: string = "no callback";
  private scroll_offset: number = 0;
  scroller: Scroller = new Scroller();
  build() {
    Column() {
      NodeContainer(this.myNodeController)
      Button("scroll TS node").onClick(() => {
        this.myNodeController.scroller.fling(-1000)
      })
        .size({width:"10%", height:"5%"})
        .id("TS_scroll")
      Row() {
        Text(this.scroll_offset.toString())
          .size({width:"10%", height:"10%"})
          .id("scroller_currentOffset")
        Text(this.message)
          .size({width:"10%", height:"10%"})
          .id("callback_msg")
      }
      XComponent({
        id: 'xcomponentId',
        type: "node",
        libraryname: 'nativeNode'
      })
        .onAppear(() => {
          nativeNode.createNativeNode("xcomponentId");
        }).width("13%").height("15%")
        .id("xcomponent")
        .backgroundColor(Color.Yellow)

      XComponent({
        id: 'xcomponentId1',
        type: "node",
        libraryname: 'nativeNode'
      })
        .onAppear(() => {
          nativeNode.createNativeNodeFalse("xcomponentId1");
        }).width("13%").height("15%")
        .id("xcomponent1")
        .backgroundColor(Color.Yellow)
    }
    .padding({ left: 35, right: 35, top: 35 })
    .width("100%")
    .height("100%")
  }
}
