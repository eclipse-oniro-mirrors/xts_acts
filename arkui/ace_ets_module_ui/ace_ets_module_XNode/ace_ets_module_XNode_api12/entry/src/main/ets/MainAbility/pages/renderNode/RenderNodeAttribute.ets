/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { RenderNode, ShapeMask, FrameNode, NodeController } from "@ohos.arkui.node";
const renderNode = new RenderNode();
const mask = new ShapeMask();
mask.setRectShape({ left: 0, right: 150, top: 0, bottom: 150 });
mask.fillColor = 0X55FF0000;
mask.strokeColor = 0XFFFF0000;
mask.strokeWidth = 24;

renderNode.frame = { x: 0, y: 0, width: 150, height: 150 };
renderNode.backgroundColor = 0XFF00FF00;
renderNode.borderWidth = { left: 8, top: 8, right: 8, bottom: 8 };
renderNode.borderColor = { left: 0xFF0000FF, top: 0xFF0000FF, right: 0xFF0000FF, bottom: 0xFF0000FF };
renderNode.borderStyle = {
  left: BorderStyle.Solid,
  top: BorderStyle.Dotted,
  right: BorderStyle.Dashed,
  bottom: BorderStyle.Solid
}
renderNode.borderRadius = { topLeft: 32, topRight: 32, bottomLeft: 32, bottomRight: 32 };
const borderWidth = renderNode.borderWidth;
const borderColor = renderNode.borderColor;
const borderStyle = renderNode.borderStyle;
const borderRadius = renderNode.borderRadius;

renderNode.shapeMask = mask;
const shapeMask = renderNode.shapeMask;

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

@Entry
@Component
struct RenderNodeAttribute {
  private myNodeController: MyNodeController = new MyNodeController();
  @State text1: string = 'start'

  build() {
    Column({space: 10}) {
      NodeContainer(this.myNodeController)
      Row(){
        Text(`${borderWidth.left}`).key('RenderNodeAttribute_borderWidth_left')
          .fontWeight(700).fontSize(30).width('25%')
        Text(`${borderWidth.top}`).key('RenderNodeAttribute_borderWidth_top')
          .fontWeight(700).fontSize(30).width('25%')
        Text(`${borderWidth.bottom}`).key('RenderNodeAttribute_borderWidth_bottom')
          .fontWeight(700).fontSize(30).width('25%')
        Text(`${borderWidth.right}`).key('RenderNodeAttribute_borderWidth_right')
          .fontWeight(700).fontSize(30).width('25%')
      }

      Row(){
        Text(`${borderColor.left == 0xFF0000FF}`).key('RenderNodeAttribute_borderColor_left')
          .fontWeight(700).fontSize(30).width('25%')
        Text(`${borderColor.right == 0xFF0000FF}`).key('RenderNodeAttribute_borderColor_right')
          .fontWeight(700).fontSize(30).width('25%')
        Text(`${borderColor.top == 0xFF0000FF}`).key('RenderNodeAttribute_borderColor_top')
          .fontWeight(700).fontSize(30).width('25%')
        Text(`${borderColor.bottom == 0xFF0000FF}`).key('RenderNodeAttribute_borderColor_bottom')
          .fontWeight(700).fontSize(30).width('25%')
      }

      Row(){
        Text(`${borderStyle.left}`).key('RenderNodeAttribute_borderStyle_left')
          .fontWeight(700).fontSize(30).width('25%')
        Text(`${borderStyle.right}`).key('RenderNodeAttribute_borderStyle_right')
          .fontWeight(700).fontSize(30).width('25%')
        Text(`${borderStyle.top}`).key('RenderNodeAttribute_borderStyle_top')
          .fontWeight(700).fontSize(30).width('25%')
        Text(`${borderStyle.bottom}`).key('RenderNodeAttribute_borderStyle_bottom')
          .fontWeight(700).fontSize(30).width('25%')
      }

      Row(){
        Text(`${borderRadius.topRight}`).key('RenderNodeAttribute_borderRadius_topRight')
          .fontWeight(700).fontSize(30).width('25%')
        Text(`${borderRadius.topLeft}`).key('RenderNodeAttribute_borderRadius_topLeft')
          .fontWeight(700).fontSize(30).width('25%')
        Text(`${borderRadius.bottomLeft}`).key('RenderNodeAttribute_borderRadius_bottomLeft')
          .fontWeight(700).fontSize(30).width('25%')
        Text(`${borderRadius.bottomRight}`).key('RenderNodeAttribute_borderRadius_bottomRight')
          .fontWeight(700).fontSize(30).width('25%')
      }
      
      Row(){
        Text(`${shapeMask.strokeWidth}`).key('RenderNodeAttribute_shapeMask_strokeWidth')
          .fontWeight(700).fontSize(30).width('25%')
      }

    }
  }
}