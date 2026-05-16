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
  private frameNode1: FrameNode | null = null;

  createAnimationButtons(uiContext: UIContext):FrameNode {
    this.frameNode1 = new FrameNode(uiContext);
    this.frameNode1.commonAttribute.width(100).height('10%').backgroundColor(Color.Red);
    let row = typeNode.createNode(uiContext, 'Column');
    let creatFailButton = typeNode.createNode(uiContext, 'Button');
    creatFailButton.initialize('failBtn');
    creatFailButton.attribute.id('creatFailBtn').height('10%');
    let creatSuccButton = typeNode.createNode(uiContext, 'Button');
    creatSuccButton.initialize('succBtn');
    creatSuccButton.attribute.id('creatSuccBtn').height('10%');
    let cancelSuccButton = typeNode.createNode(uiContext, 'Button');
    cancelSuccButton.initialize('cancelSucc');
    cancelSuccButton.attribute.id('cancelSuccBtn').height('10%');
    let cancelFailButton = typeNode.createNode(uiContext, 'Button');
    cancelFailButton.initialize('cancelFail');
    cancelFailButton.attribute.id('cancel').height('10%');
    let getButton = typeNode.createNode(uiContext, 'Button');
    getButton.initialize('get');
    getButton.attribute.id('get').height('10%');
    let getNullButton = typeNode.createNode(uiContext, 'Button');
    getNullButton.initialize('getEmpty');
    getNullButton.attribute.id('getNullButton').height('10%');

    creatFailButton.commonEvent.setOnClick(()=>{
      if (!this.frameNode1) {
        console.warn('frameNode1 is destroyed');
        return;
      }
      let result1 = this.frameNode1.createAnimation(AnimationPropertyType.ROTATION, [0,0,0], [0,0,0],
        {duration:3000, iterations:-1, onFinish:()=>{
          console.info('SR20250220846850 animation finish', AnimationPropertyType.ROTATION);
        }});//创建动画
      console.log('FrameNodeAnimationPage creatFailButton result1: ', result1)
      AppStorage.setOrCreate('checkCreatFail', result1);
    });
    creatSuccButton.commonEvent.setOnClick(()=>{
      if (!this.frameNode1) {
        console.warn('frameNode1 is destroyed');
        return;
      }
      let result2 = this.frameNode1.createAnimation(AnimationPropertyType.ROTATION, [0,0,0], [0,0,45],
        {duration:3000, iterations:-1, onFinish:()=>{
          console.info('SR20250220846850 animation finish', AnimationPropertyType.ROTATION);
        }});//创建动画
      console.log('FrameNodeAnimationPage creatSuccButton result1: ', result2)
      AppStorage.setOrCreate('checkCreatSucc', result2);
    });

    cancelSuccButton.commonEvent.setOnClick(()=>{
      if (!this.frameNode1) {
        console.warn('frameNode1 is destroyed');
        return;
      }
      let result = this.frameNode1.cancelAnimations([AnimationPropertyType.ROTATION,AnimationPropertyType.TRANSLATION,
        AnimationPropertyType.OPACITY,AnimationPropertyType.SCALE]);
      console.log('FrameNodeAnimationPage result cancel: ', result)
      AppStorage.setOrCreate('checkCancelSucc', result);
    })

    cancelFailButton.commonEvent.setOnClick(()=>{
      if (!this.frameNode1) {
        console.warn('frameNode1 is destroyed');
        return;
      }
      let result = this.frameNode1.cancelAnimations([4]);
      console.log('FrameNodeAnimationPage result cancel: ', result)
      AppStorage.setOrCreate('checkCancelFail', result);
    })

    getButton.commonEvent.setOnClick(()=>{
      if (!this.frameNode1) {
        console.warn('frameNode1 is destroyed');
        return;
      }
      let value1 = this.frameNode1.getNodePropertyValue(AnimationPropertyType.ROTATION);
      console.log('FrameNodeAnimationPage value1: ', value1)
      AppStorage.setOrCreate('checkGetNodePropertyValue', value1);
    })

    getNullButton.commonEvent.setOnClick(()=>{
      if (!this.frameNode1) {
        console.warn('frameNode1 is destroyed');
        return;
      }
      let value1 = this.frameNode1.getNodePropertyValue(4);
      console.log('FrameNodeAnimationPage value1: ', value1)
      AppStorage.setOrCreate('checkNullNodePropertyValue', value1);
    })

    row.appendChild(creatFailButton);
    row.appendChild(creatSuccButton);
    row.appendChild(cancelSuccButton);
    row.appendChild(cancelFailButton);
    row.appendChild(getNullButton);
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
    let row:FrameNode;
    row = this.createAnimationButtons(uiContext);
    column.appendChild(this.frameNode1);
    column.appendChild(row);
    return this.rootNode;
  }
}

@Entry
@Component
export struct FrameNodeAnimationPage {
  pageInfos: NavPathStack = new NavPathStack();
  private myNodeController: NodeControllerTest1 = new NodeControllerTest1();
  build() {
    Column(){
      NodeContainer(this.myNodeController)
    }
  }
}