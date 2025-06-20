/**
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
 
import { FrameNode, NodeController, typeNode } from '@kit.ArkUI';

class NodeControllerTest1 extends NodeController {
  private rootNode: FrameNode | null = null;
  // rotation
  private frameNode1: FrameNode | null = null;
  // translate
  private frameNode2: FrameNode | null = null;
  // scale
  private frameNode3: FrameNode | null = null;
  // opacity
  private frameNode4: FrameNode | null = null;
  private textNode: typeNode.Text | null = null;
  private textContent: string = 'Create:';
  private textNode2: typeNode.Text | null = null;
  private textContent2: string = 'Cancel:';
  private textNode3: typeNode.Text | null = null;
  private textContent3: string = 'Get:';

  updateText() {
    if (this.textNode) {
      this.textNode.initialize(this.textContent);
    }
  }

  updateText2() {
    if (this.textNode2) {
      this.textNode2.initialize(this.textContent2);
    }
  }

  updateText3() {
    if (this.textNode3) {
      this.textNode3.initialize(this.textContent3);
    }
  }

  createAnimationButtons(uiContext: UIContext):FrameNode {
    this.frameNode1 = new FrameNode(uiContext);
    this.frameNode1.commonAttribute.width(100).height('10%').backgroundColor(Color.Red);
    let row = typeNode.createNode(uiContext, 'Row');
    let startButton = typeNode.createNode(uiContext, 'Button');
    startButton.initialize('start');
    startButton.attribute.id('start')
    let cancelButton = typeNode.createNode(uiContext, 'Button');
    cancelButton.initialize('cancel');
    cancelButton.attribute.id('cancel')
    let getButton = typeNode.createNode(uiContext, 'Button');
    getButton.initialize('get');
    getButton.attribute.id('get')
    startButton.commonEvent.setOnClick(()=>{
      if (!this.frameNode1) {
        console.warn('frameNode1 is destroyed');
        return;
      }
      this.textContent = ''; //清空string
      let result1 = this.frameNode1.createAnimation(AnimationPropertyType.ROTATION, [0,0,0], [0,0,45],
        {duration:3000, iterations:-1, onFinish:()=>{
          console.info('SR20250220846850 animation finish', AnimationPropertyType.ROTATION);
        }});//创建动画
      let result2 = this.frameNode1.createAnimation(AnimationPropertyType.SCALE, [1,1], [0.5,0.5],
        {duration:3000, iterations:-1, onFinish:()=>{
          console.info('SR20250220846850 animation finish', AnimationPropertyType.SCALE);
        }});//创建动画
      let result3 = this.frameNode1.createAnimation(AnimationPropertyType.OPACITY, [1], [0.5],
        {duration:3000, iterations:-1, onFinish:()=>{
          console.info('SR20250220846850 animation finish', AnimationPropertyType.OPACITY);
        }});//创建动画

      let result4 = this.frameNode1.createAnimation(AnimationPropertyType.TRANSLATION, [0,0], [50,0],
        {duration:3000, iterations:-1, onFinish:()=>{
          console.info('SR20250220846850 animation finish', AnimationPropertyType.TRANSLATION);
        }});//创建动画
      if (result1 && result2 && result3 && result4){
        this.textContent = 'Create:Success'
        this.updateText();
      }
    });
    cancelButton.commonEvent.setOnClick(()=>{
      if (!this.frameNode1) {
        console.warn('frameNode1 is destroyed');
        return;
      }
      let result = this.frameNode1.cancelAnimations([AnimationPropertyType.ROTATION,AnimationPropertyType.TRANSLATION,
        AnimationPropertyType.OPACITY,AnimationPropertyType.SCALE]);//取消动画
      if (result) {
        this.textContent2 = 'Cancel:Success'
        this.updateText2();
      }
    })
    getButton.commonEvent.setOnClick(()=>{
      if (!this.frameNode1) {
        console.warn('frameNode1 is destroyed');
        return;
      }
      let value1 = this.frameNode1.getNodePropertyValue(AnimationPropertyType.ROTATION);
      let value2 = this.frameNode1.getNodePropertyValue(AnimationPropertyType.TRANSLATION);
      let value3 = this.frameNode1.getNodePropertyValue(AnimationPropertyType.SCALE);
      let value4 = this.frameNode1.getNodePropertyValue(AnimationPropertyType.OPACITY);
      let result1 = (value1[0] == 0 && value1[1] == 0 && value1[2] == 45)
      let result2 = (value2[0] == 50 &&value2[1] == 0)
      let result3 = (value3[0] == 0.5 &&value3[1] == 0.5)
      let result4 = (value4[0] == 0.5)
      if (result1 && result2 && result3 && result4){
        this.textContent3 = 'Get:Success'
        this.updateText3();
      }
    })
    row.appendChild(startButton);
    row.appendChild(cancelButton);
    row.appendChild(getButton);
    return row;
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    let rootTypeNode = typeNode.createNode(uiContext, 'Scroll');
    rootTypeNode.initialize();
    rootTypeNode.attribute.scrollable(ScrollDirection.Vertical).width('100%');
    this.rootNode = rootTypeNode;
    let column = typeNode.createNode(uiContext, 'Column');
    column.initialize({space: 15});
    column.attribute.padding({top: 50, bottom: 50});
    this.rootNode.appendChild(column);
    this.textNode = typeNode.createNode(uiContext, 'Text');
    this.textNode.attribute.width('100%').height('10%').backgroundColor(Color.Gray).id('CreateResultText');
    column.appendChild(this.textNode);
    this.textNode2 = typeNode.createNode(uiContext, 'Text');
    this.textNode2.attribute.width('100%').height('10%').margin({top:-15}).backgroundColor(Color.Orange).id('CancelResultText');
    column.appendChild(this.textNode2);
    this.textNode3 = typeNode.createNode(uiContext, 'Text');
    this.textNode3.attribute.width('100%').height('10%').margin({top:-15}).backgroundColor(Color.Pink).id('GetResultText');
    column.appendChild(this.textNode3);
    let row:FrameNode;
    row = this.createAnimationButtons(uiContext);
    column.appendChild(this.frameNode1);
    column.appendChild(row);
    return this.rootNode;
  }
}

@Entry
@Component
export struct FrameNodeAnimation {
  pageInfos: NavPathStack = new NavPathStack();
  private myNodeController: NodeControllerTest1 = new NodeControllerTest1();
  build() {
    Column(){
      NodeContainer(this.myNodeController)
    }
  }
}