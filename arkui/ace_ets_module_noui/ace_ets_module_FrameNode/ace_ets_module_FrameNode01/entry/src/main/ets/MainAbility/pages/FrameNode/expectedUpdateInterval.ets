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
import { NodeController, FrameNode } from '@ohos.arkui.node';
import { UIContext } from '@ohos.arkui.UIContext';

class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode.commonAttribute.width(100)
      .height(100)
      .backgroundColor(Color.Pink)
    return this.rootNode
  }

  addCommonEvent(frameNode: FrameNode, ratios: Array<number>, expectedUpdateInterval?: number) {
    frameNode.commonEvent.setOnVisibleAreaApproximateChange({
      ratios, expectedUpdateInterval: expectedUpdateInterval
    }, (isVisible: boolean, currentRatio: number) => {
      console.info('Test FrameNode isVisible:' + isVisible + ', currentRatio:' + currentRatio)
      if(isVisible && currentRatio >= 1.0) {
        console.info('Test FrameNode is fully visible')
      }
      if(!isVisible && currentRatio >= 0.0) {
        console.info('Test FrameNode is completely invisible')
      }
    })
  }

  resetCommonEvent(buttonNode: FrameNode) {
    buttonNode.commonEvent.setOnVisibleAreaApproximateChange({ ratios: [] }, undefined);
  }
}

@Entry
@Component
struct FrameNodeTypeTest {
  @State index: number = 0
  scroller: Scroller = new Scroller()
  @State ratios: Array<number> = []
  @State expectedUpdateInterval: number | undefined = undefined
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Text(`expectedUpdateInterval : ${this.expectedUpdateInterval ? this.expectedUpdateInterval : 'undefined'}`).id('expectedUpdateIntervalValue')
        .height('3%')
      Scroll(this.scroller) {
        Column() {
          Text('This is A TextNode')
            .borderWidth(1)
            .width(300)
            .height('5%')
            .fontSize(20)
            .backgroundColor(0x70FF0000)
            .onVisibleAreaChange([0, 0.5, 1], (isVisible: boolean, currentRatio: number) => {
              if(isVisible && currentRatio >= 1.0) {
                console.info('Test Text is fully visible.')
              }
              if(!isVisible && currentRatio <= 0.0) {
                console.info('Test Text is completely invisible.')
              }
            })
          NodeContainer(this.myNodeController)
            .borderWidth(1)
            .width(300)
            .height('30%')

          Button("ADD commonEvent to FrameNode change expectedUpdateInterval")
            .id('expectedUpdateInterval')
            .height('5%')
            .fontSize(16)
            .borderWidth(1)
            .onClick(() => {
              this.ratios = [0, 0.6, 0.8, 1.0];
              this.expectedUpdateInterval = 2000;
              this.myNodeController.addCommonEvent(this.myNodeController.rootNode!, [0, 0.6, 0.8, 1.0], 2000);
            })
          Button('Reset commonEvent to FrameNode')
            .height('5%')
            .onClick(() => {
              this.myNodeController.resetCommonEvent(this.myNodeController.rootNode!)
            })
        }.height('100%')
      }
      .backgroundColor(0x70317aff)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Gray)
      .scrollBarWidth(10)
      .height('97%')
    }.width('100%')
  }
}