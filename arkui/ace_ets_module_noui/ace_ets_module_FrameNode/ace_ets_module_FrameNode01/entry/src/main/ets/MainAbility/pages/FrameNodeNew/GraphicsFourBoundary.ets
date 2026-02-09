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

import { ColorMetrics, LengthMetrics, RenderNode, FrameNode, NodeController, edgeWidths, borderRadiuses, edgeColors } from '@kit.ArkUI';

const renderNode = new RenderNode();
renderNode.frame = { x: 0, y: 0, width: 120, height: 30 };
renderNode.backgroundColor = 0XFF00FF00;
renderNode.borderWidth = edgeWidths(0);
renderNode.borderRadius = borderRadiuses(0);
renderNode.borderColor = edgeColors(0xffffffff);

const renderNode1 = new RenderNode();
renderNode1.frame = { x: 0, y: 0, width: 150, height: 30 };
renderNode1.backgroundColor = 0XFF00FF00;
renderNode1.borderWidth = edgeWidths(-1);
renderNode1.borderRadius = borderRadiuses(-1);
renderNode.borderColor = edgeColors(0xffffffff+1);

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    const rootRenderNode = this.rootNode.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.appendChild(renderNode);
    }
    return this.rootNode;
  }
}

class MyNodeController1 extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    const rootRenderNode = this.rootNode.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.appendChild(renderNode1);
    }
    return this.rootNode;
  }
}

@Entry
@Component
struct GraphicsFourBoundary {
  private myNodeController: MyNodeController = new MyNodeController();
  private myNodeController1: MyNodeController1 = new MyNodeController1();

  build() {
    Column({ space: 3 }) {
      Row(){
        NodeContainer(this.myNodeController).id('rootRenderNode1')
      }
      Row(){
        NodeContainer(this.myNodeController1).id('rootRenderNode2')
      }
      Row(){
        Button('rgba_-1')
          .id('setRgba_-1')
          .width(80)
          .align(Alignment.Center)
          .height(30)
          .backgroundColor(ColorMetrics.rgba(-1,74,175,255).color)
        Button('rgba_0')
          .id('setRgba_0')
          .width(80)
          .align(Alignment.Center)
          .height(30)
          .backgroundColor(ColorMetrics.rgba(0,74,175,255).color)
      }
      Row(){
        Button('rgba_255')
          .id('setRgba_255')
          .width(80)
          .align(Alignment.Center)
          .height(30)
          .backgroundColor(ColorMetrics.rgba(255,74,175,255).color)
        Button('rgba_256')
          .id('setRgba_256')
          .width(80)
          .align(Alignment.Center)
          .height(30)
          .backgroundColor(ColorMetrics.rgba(256,74,175,255).color)
      }
      Button('percent_four')
        .id('setPercentFourNumber')
        .align(Alignment.Center)
        .width(100)
        .height(30)
        .padding({
          top: LengthMetrics.percent(0),
          bottom: LengthMetrics.percent(-1),
          start: LengthMetrics.percent(1),
          end: LengthMetrics.percent(2)
        })
    }
    .width('100%')
    .height('100%')
  }
}