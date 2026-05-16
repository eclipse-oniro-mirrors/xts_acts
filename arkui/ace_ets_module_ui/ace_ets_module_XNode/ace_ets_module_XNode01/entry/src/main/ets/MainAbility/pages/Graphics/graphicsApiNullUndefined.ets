/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { RenderNode, FrameNode, NodeController, ShapeMask, ShapeClip, edgeColors, edgeWidths, borderStyles,
  borderRadiuses,
  LengthMetrics,ColorMetrics} from '@kit.ArkUI';

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    const mask = new ShapeMask();
    mask.fillColor = 0X55FF0000;

    mask.setRectShape(null);
    mask.setRoundRectShape(null);
    mask.setCircleShape(null);
    mask.setOvalShape(null);
    mask.setCommandPath(null);

    const renderNode = new RenderNode();
    renderNode.frame = { x: 0, y: 0, width: 100, height: 100 };
    renderNode.backgroundColor = 0XFF00FF00;
    renderNode.shapeMask = mask;

    renderNode.borderColor = edgeColors(null);
    renderNode.borderWidth  = edgeWidths(null);
    renderNode.borderStyle = borderStyles(null);
    renderNode.borderRadius = borderRadiuses(null);

    const rootRenderNode = this.rootNode.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.appendChild(renderNode);
    }

    return this.rootNode;
  }
}

class MyNodeController2 extends NodeController {
  private rootNode1: FrameNode | null = null;

  makeNode(uiContext1: UIContext): FrameNode | null {
    this.rootNode1 = new FrameNode(uiContext1);

    const mask1 = new ShapeMask();
    mask1.fillColor = 0X55FF0000;

    mask1.setRectShape(undefined);
    mask1.setRoundRectShape(undefined);
    mask1.setCircleShape(undefined);
    mask1.setOvalShape(undefined);
    mask1.setCommandPath(undefined);

    const renderNode1 = new RenderNode();
    renderNode1.frame = { x: 0, y: 0, width: 100, height: 100 };
    renderNode1.backgroundColor = 0XFF00FF00;
    renderNode1.shapeMask = mask1;
    renderNode1.borderColor = edgeColors(undefined);
    renderNode1.borderWidth  = edgeWidths(undefined);
    renderNode1.borderStyle = borderStyles(undefined);
    renderNode1.borderRadius = borderRadiuses(undefined);

    const rootRenderNode1 = this.rootNode1.getRenderNode();
    if (rootRenderNode1 !== null) {
      rootRenderNode1.appendChild(renderNode1);
    }

    return this.rootNode1;
  }
}

class MyNodeController3 extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    const clip = new ShapeClip();
    clip.setRectShape(null);
    clip.setRoundRectShape(null);
    clip.setCircleShape(null);
    clip.setOvalShape(null);
    clip.setCommandPath(null);
    const renderNode = new RenderNode();
    renderNode.frame = {
      x: 0,
      y: 0,
      width: 100,
      height: 100
    };
    renderNode.backgroundColor = 0XFF00FF00;
    renderNode.shapeClip = clip;

    const rootRenderNode = this.rootNode.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.appendChild(renderNode);
    }

    return this.rootNode;
  }
}

class MyNodeController4 extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    const clip = new ShapeClip();
    clip.setRectShape(undefined);
    clip.setRoundRectShape(undefined);
    clip.setCircleShape(undefined);
    clip.setOvalShape(undefined);
    clip.setCommandPath(undefined);
    const renderNode = new RenderNode();
    renderNode.frame = {
      x: 0,
      y: 0,
      width: 100,
      height: 100
    };
    renderNode.backgroundColor = 0XFF00FF00;
    renderNode.shapeClip = clip;

    const rootRenderNode = this.rootNode.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.appendChild(renderNode);
    }

    return this.rootNode;
  }
}

@Entry
@Component
struct graphicsApiNullUndefined {
  private myNodeController: MyNodeController = new MyNodeController();
  private myNodeController2: MyNodeController2 = new MyNodeController2();
  private myNodeController3: MyNodeController3 = new MyNodeController3();
  private myNodeController4: MyNodeController4 = new MyNodeController4();

  build() {
    Column({space:3}) {
      Row({space:3}){
        NodeContainer(this.myNodeController)
          .id('graphicsApiNullUndefinedFirst')
          .margin({
            top: LengthMetrics.percent(null),
          })
          .backgroundColor(ColorMetrics.numeric(null))
        NodeContainer(this.myNodeController2)
          .id('graphicsApiNullUndefinedSecond')
          .margin({
            top: LengthMetrics.percent(undefined),
          })
          .backgroundColor(ColorMetrics.numeric(undefined))
      }

      Row({space:3}){
        NodeContainer(this.myNodeController3)
          .id('graphicsApiShapeClipNullUndefinedFirst')
        NodeContainer(this.myNodeController4)
          .id('graphicsApiShapeClipNullUndefinedSecond')
      }
    }.width('100%').height('100%')
  }
}