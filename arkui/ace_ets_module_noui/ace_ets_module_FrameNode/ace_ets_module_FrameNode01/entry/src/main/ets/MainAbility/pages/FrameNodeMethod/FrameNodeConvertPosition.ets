/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { NodeController, Position, FrameNode } from '@ohos.arkui.node';
import { UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog';

@Builder
export function BaseNodeContainerTest(name: string, param: Object) {
  FrameNodeConvertPosition()
}

class MyNodeController extends NodeController {
  private testNodeA: FrameNode | null = null
  private scaleX: number = 0
  private scaleY: number = 0
  private rootNode: FrameNode | null = null

  constructor() {
    super()
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    if (!this.testNodeA && !this.rootNode) {
      let testNode = new FrameNode(uiContext)
      testNode.commonAttribute
        .width(100)
        .height(50)
        .backgroundColor(Color.Pink)
      this.testNodeA = testNode
      hilog.error(0x003900, "asd", "123")
    }
    if (!this.rootNode) {
      this.rootNode = new FrameNode(uiContext);
      this.rootNode.appendChild(this.testNodeA)
    }
    return this.rootNode
  }

  getFrameNode(): FrameNode | null {
    return this.testNodeA
  }

  setScaleX(scaleX: number): void {
    if (!this.testNodeA) {
      return;
    }
    this.scaleX = scaleX
    this.testNodeA.commonAttribute.scale({
      x: this.scaleX,
      y: this.scaleY,
      centerX: 0,
      centerY: 0
    })
  }

  setScaleY(scaleY: number): void {
    if (!this.testNodeA) {
      return;
    }
    this.scaleY = scaleY
    this.testNodeA.commonAttribute.scale({
      x: this.scaleX,
      y: this.scaleY,
      centerX: 0,
      centerY: 0
    })
  }
}

@Entry
@Component
export struct FrameNodeConvertPosition {
  private uiContext: UIContext = this.getUIContext();
  @State str: string = 'hello'
  @State str1: string = 'hello'

  private myNodeController: MyNodeController = new MyNodeController()

  build() {
    NavDestination() {
      Column() {
        NodeContainer(this.myNodeController).alignSelf(ItemAlign.Start)
        Text(this.str).height(25).id('getToWindowPostion')
        Text(this.str1).height(25).id('getFromWindowPostion')
        Row() {
          Button('result_0')
            .id('SetResult_0')
            .width(70)
            .height(25)
            .onClick(() => {
              if (!this.uiContext) {
                return
              }
              const nodeA = this.myNodeController.getFrameNode();
              if (!nodeA) {
                return;
              }
              let result: Position = nodeA.convertPositionToWindow({ x: 0, y: 0 })
              result.x = 0
              result.y = 0
              let result1: Position = nodeA.convertPositionFromWindow({ x: 0, y: 0 })
              result1.x = 0
              result1.y = 0
              this.str = JSON.stringify(result)
              this.str1 = JSON.stringify(result1)
            })
          Button('result_10')
            .id('SetResult_10')
            .width(70)
            .height(20)
            .onClick(() => {
              if (!this.uiContext) {
                return
              }
              const nodeA = this.myNodeController.getFrameNode();
              if (!nodeA) {
                return;
              }
              let result: Position = nodeA.convertPositionToWindow({ x: 0, y: 0 })
              result.x = 10
              result.y = 10
              let result1: Position = nodeA.convertPositionFromWindow({ x: 0, y: 0 })
              result1.x = 10
              result1.y = 10
              this.str = JSON.stringify(result)
              this.str1 = JSON.stringify(result1)
            })
        }
      }
      .height(100)
      .width(200)
    }
    .height('100%')
    .width('100%')
  }
}
