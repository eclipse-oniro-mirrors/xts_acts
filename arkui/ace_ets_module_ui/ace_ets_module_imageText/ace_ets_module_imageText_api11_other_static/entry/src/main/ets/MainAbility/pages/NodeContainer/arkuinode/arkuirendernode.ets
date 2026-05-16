'use static';
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
import { State, } from '@ohos.arkui.stateManagement'
import { NodeController, BuilderNode, FrameNode, NodeRenderType } from "@ohos.arkui.node"
import { UIContext } from '@ohos.arkui.UIContext';
import {
  Builder,
  Entry,
  Component,
  Column,
  WrappedBuilder,
  Button,
  Color,
  Row,
  ClickEvent,
  NodeContainer,
  TouchEvent,
  Text,
  Margin,
  FontWeight,
  CustomBuilderT,
  wrapBuilder
} from "@ohos.arkui.component"

class Params {
  text: string = ""

  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
      .margin({ bottom: 36 } as Margin).key("nodetext")
  }
}

//todo 待修改 已上报
class TextNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private textNode: BuilderNode<Params> | null = null;
  private message: string = "DEFAULT";

  constructor(message: string) {
    super();
    this.message = message;
  }

  makeNode(context: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(context);

    this.textNode = new BuilderNode<Params>(context,
      { selfIdealSize: { width: 150, height: 150 }, type: NodeRenderType.RENDER_TYPE_TEXTURE });
    this.textNode?.build(new WrappedBuilder<CustomBuilderT<Params>>(buildText) , new Params(this.message), {useParallel: false});
    const textRenderNode = this.textNode?.getFrameNode()?.getRenderNode();

    const rootRenderNode = this.rootNode?.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode?.appendChild(textRenderNode!);
    }

    return this.rootNode;
  }
}

@Entry
@Component
struct IndexEvent {
  @State message: string = "hello"

  build() {
    Row() {
      Column() {
        NodeContainer(new TextNodeController(this.message))
          .width('100%')
          .height(100)
          .backgroundColor('#FFF0F0F0')
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}