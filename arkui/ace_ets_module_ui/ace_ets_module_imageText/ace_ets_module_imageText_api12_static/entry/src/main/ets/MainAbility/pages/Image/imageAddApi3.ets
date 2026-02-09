'use static';
/*
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
import { FrameNode, NodeController } from '@ohos.arkui.node'
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Text,
  Rating,
  Margin,
  Row,
  ClickEvent,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  Color,
  $r,
  ImageAnalyzerController,
  ImageAIOptions,
  Image,
  Button,
  Resource,
  StyledString,
  ImageFit,
  Padding
} from '@ohos.arkui.component';
import { UIContext } from "@ohos.arkui.UIContext";
import { State, AppStorage } from '@ohos.arkui.stateManagement'

class MyNodeController11 extends NodeController {
  public rootNode: FrameNode | null = null;
  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode?.commonAttribute.width(100)
      .height(100)
      .backgroundColor(Color.Pink);
    return this.rootNode;
  }
  addCommonEvent(frameNode: FrameNode) {
    frameNode.commonEvent.setOnVisibleAreaApproximateChange(
        { ratios: [0.0, 1.0],expectedUpdateInterval: 1000 },undefined)
  }
}
 class StyledStringTest {
      private testStr: string = ''
      constructor(str: string) {
        this.testStr = str
      }

      static convertHtmlToStyledString(input: string): Promise<StyledString|undefined> {
        return StyledString.fromHtml(input)
      }
      
}
@Entry
@Component
struct imageAddApi3 {
  build() {
    Column() {
      Image($r('app.media.icon'))
        .height(100)
        .width(100)
        .objectFit(ImageFit.TOP_START)
        .key('imageAddApi3')
      Image($r('app.media.icon'))
        .height(100)
        .width(100)
        .objectFit(ImageFit.TOP_END)
        .key('imageAddApi32')
      Image($r('app.media.icon'))
        .height(100)
        .width(100)
        .objectFit(ImageFit.BOTTOM_START)
        .key('imageAddApi33')
      Image($r('app.media.icon'))
        .height(100)
        .width(100)
        .objectFit(ImageFit.BOTTOM_END)
        .key('imageAddApi34')
    }.height(320).width(360).padding({ right: 10, top: 10 } as Padding)
  }
}