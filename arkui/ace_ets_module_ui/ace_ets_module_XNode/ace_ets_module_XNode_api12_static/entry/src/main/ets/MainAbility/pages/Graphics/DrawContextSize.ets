'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry, Component, Column, Text, Button, ClickEvent, NodeContainer,
} from '@ohos.arkui.component'
import { UIContext } from '@ohos.arkui.UIContext';
import { RenderNode, FrameNode, NodeController, DrawContext } from '@ohos.arkui.node';
import { State, AppStorage } from '@ohos.arkui.stateManagement';

const uiContext =  AppStorage.get<UIContext>('uiContext');
const vp2px = uiContext!.vp2px;

export class TestRenderNode extends RenderNode {
  private sizeWidth: number = 0;
  private sizeHeight: number = 0;
  private sizeInPixelWidth: number = 0;
  private sizeInPixelHeight: number = 0;
  private canvasValid: boolean = false;

  draw(context: DrawContext): void {
    const size = context.size;
    this.sizeWidth = size.width;
    this.sizeHeight = size.height;

    const sizeInPixel = context.sizeInPixel;
    this.sizeInPixelWidth = sizeInPixel.width;
    this.sizeInPixelHeight = sizeInPixel.height;

    const canvas = context.canvas;
    this.canvasValid = canvas !== null && canvas !== undefined;
  }

  getSizeWidth(): number {
    return this.sizeWidth;
  }

  getSizeHeight(): number {
    return this.sizeHeight;
  }

  getSizeInPixelWidth(): number {
    return this.sizeInPixelWidth;
  }

  getSizeInPixelHeight(): number {
    return this.sizeInPixelHeight;
  }

  isCanvasValid(): boolean {
    return this.canvasValid;
  }
}

export class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private testRenderNode: TestRenderNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    this.testRenderNode = new TestRenderNode();
    this.testRenderNode!.frame = { x: 0, y: 0, width: 100, height: 100 };
    this.testRenderNode!.backgroundColor = 0XFF00FF00.toInt();

    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode!.appendChild(this.testRenderNode!);
    }

    return this.rootNode;
  }

  getTestRenderNode(): TestRenderNode | null {
    return this.testRenderNode;
  }
}

@Entry
@Component
struct DrawContextSize {
  private myNodeController: MyNodeController = new MyNodeController();
  @State sizeWidth: number = 0;
  @State sizeHeight: number = 0;
  @State sizeInPixelWidth: number = 0;
  @State sizeInPixelHeight: number = 0;
  @State canvasValid: boolean = false;
  readonly expectedWidthPx: number = vp2px(100);
  readonly expectedHeightPx: number = vp2px(100);

  build() {
    Column() {
      NodeContainer(this.myNodeController)
        .width('100%')
        .height(200)
        .margin(10)

      Text('size width: ' + this.sizeWidth)
        .id('textSizeWidth')
        .margin(5)

      Text('size height: ' + this.sizeHeight)
        .id('textSizeHeight')
        .margin(5)

      Text('sizeInPixel width: ' + this.sizeInPixelWidth + ', expected: ' + this.expectedWidthPx)
        .id('textSizeInPixelWidth')
        .margin(5)

      Text('sizeInPixel height: ' + this.sizeInPixelHeight + ', expected: ' + this.expectedHeightPx)
        .id('textSizeInPixelHeight')
        .margin(5)

      Text('canvas valid: ' + this.canvasValid)
        .id('textCanvasValid')
        .margin(5)

      Button('Get DrawContext properties')
        .id('buttonGetProps')
        .onClick((e: ClickEvent) => {
          const testNode = this.myNodeController.getTestRenderNode();
          if (testNode !== null) {
            this.sizeWidth = testNode.getSizeWidth();
            this.sizeHeight = testNode.getSizeHeight();
            this.sizeInPixelWidth = testNode.getSizeInPixelWidth();
            this.sizeInPixelHeight = testNode.getSizeInPixelHeight();
            this.canvasValid = testNode.isCanvasValid();
          }
        })
        .margin(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}