/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { BuilderNode, FrameNode, NodeController } from '@ohos.arkui.node';
import { Entry, Builder, Text, TextAttribute, Column, Component, Button, ClickEvent, wrapBuilder } from '@ohos.arkui.component' 
import { UIContext } from '@ohos.arkui.UIContext';
interface Params {
  text: string;
}

@Builder
function buildText(params: Params) {
  Column() {
    
    Text(params.text)
      .fontSize(20)
  }
  .width('100%') // 宽度方向充满画中画窗口
  .height('100%') // 高度方向充满画中画窗口
}

export class TextNodeController extends NodeController {
  private message: string;
  private textNode: BuilderNode<Params> | null = null;
  constructor(message: string) {
    super();
    this.message = message;
  }

  makeNode(context: UIContext): FrameNode | null {
    this.textNode = new BuilderNode<Params>(context);
    this.textNode!.build(wrapBuilder(buildText), { text: this.message } as Params);
    return this.textNode!.getFrameNode();
  }

}