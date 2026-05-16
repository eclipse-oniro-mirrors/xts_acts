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

import { Position, FrameNode, NodeController } from '@ohos.arkui.node';

@Builder
export function ErrorTest(name: string, param: Object) {
  ConvertPositionErrorCode()
}

class MyNodeController extends NodeController {
  private testNodeA: FrameNode | null = null
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
    }
    if (!this.rootNode) {
      this.rootNode = new FrameNode(uiContext);
      this.rootNode.appendChild(this.testNodeA)
    }
    return this.rootNode
  }

  getTestNodeA(): FrameNode | null {
    return this.testNodeA
  }

  disposeTestNodeA(): void {
    this.testNodeA?.dispose();
    this.testNodeA = null
  }

  removeChild(): void {
    this.rootNode?.removeChild(this.testNodeA)
  }
}

@Entry
@Component
export struct ConvertPositionErrorCode {
  private testNodeA: FrameNode | null = null
  @State errorCode: string = 'hello'
  private myNodeController: MyNodeController = new MyNodeController()

  build() {
    NavDestination() {
      Column() {
        NodeContainer(this.myNodeController).alignSelf(ItemAlign.Start)
          .onAttach(() => {
            setTimeout(() => {
              this.testNodeA = this.myNodeController.getTestNodeA()
            }, 1000)
          })
        Text(this.errorCode).height(25).id('ConvertPositionErrorCode')
        Column({ space: 1 }) {
          Row(){
            Button('Reset')
              .onClick(() => {
                this.errorCode = 'hello'
              })
              .id('ErrorCodeReset')
              .width(70)
              .height(25)
          }
          Row() {
            Button("ToWindow_100026")
              .onClick(() => {
                if (!this.testNodeA) {
                  return
                }
                try {
                  let position: Position = { x: 0, y: 1 }
                  this.myNodeController.disposeTestNodeA()
                  this.testNodeA.convertPositionToWindow(position)
                } catch (e) {
                  let error = e as BusinessError<void>;
                  this.errorCode = error.code.toString()
                }
              })
              .id('ToWindowErrorCode_100026')
              .width(120)
              .height(25)
          }
          Row(){
            Button("FrameWindow_100026")
              .onClick(() => {
                if (!this.testNodeA) {
                  return
                }
                try {
                  let position: Position = { x: 0, y: 1 }
                  this.myNodeController.disposeTestNodeA()
                  this.testNodeA.convertPositionFromWindow(position)
                } catch (e) {
                  let error = e as BusinessError<void>;
                  this.errorCode = error.code.toString()
                }
              })
              .id('FrameWindowErrorCode_100026')
              .width(130)
              .height(25)
          }

          Row() {
            Button('ToWindow_100028')
              .onClick(() => {
                if (!this.testNodeA) {
                  return
                }
                this.myNodeController.removeChild()
                this.myNodeController.rebuild()
                setTimeout(() => {
                  try {
                    let position: Position = { x: 0, y: 1 }
                    this.testNodeA?.convertPositionToWindow(position)
                  } catch (e) {
                    let error = e as BusinessError<void>;
                    this.errorCode = error.code.toString()
                  }
                }, 100)
              })
              .id('ToWindowErrorCode_100028')
              .width(120)
              .height(25)
          }
          Row() {
            Button('FrameWindow_100028')
              .onClick(() => {
                if (!this.testNodeA) {
                  return
                }
                this.myNodeController.removeChild()
                this.myNodeController.rebuild()
                setTimeout(() => {
                  try {
                    let position: Position = { x: 0, y: 1 }
                    this.testNodeA?.convertPositionFromWindow(position)
                  } catch (e) {
                    let error = e as BusinessError<void>;
                    this.errorCode = error.code.toString()
                  }
                }, 100)
              })
              .id('FrameWindowErrorCode_100028')
              .width(130)
              .height(25)
          }
        }
      }
      .height(100)
      .width(200)
    }
    .height('100%')
    .width('100%')
  }
}