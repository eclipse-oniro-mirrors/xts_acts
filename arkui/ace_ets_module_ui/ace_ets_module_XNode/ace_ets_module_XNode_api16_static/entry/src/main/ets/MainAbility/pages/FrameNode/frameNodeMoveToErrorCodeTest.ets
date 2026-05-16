'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { ColorMetrics } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';
import { ComponentContent } from '@kit.ArkUI';
import { BuilderNode, FrameNode, NodeController,typeNode } from '@ohos.arkui.node'
import { Entry, Column, Component,Builder,Text,ColumnOptions,Margin,Button,NodeContainer,
  Visibility,FontWeight,Color,WrappedBuilder,Scroll,Scroller,ColumnOptions,
  HorizontalAlign,ColumnOptions,Stack,Row,Position, CustomBuilderT,

} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

@Component
struct TestComponent {
  build() {
    Column() {
      Text('This is a BuilderNode.')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .backgroundColor(Color.Gray)
  }
}

@Builder
function buildComponent() {
  TestComponent()
}

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private builderNode: BuilderNode<[]> | null = null;
  public childrenCount: number = 0;
  private uiContext: UIContext | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    this.rootNode = new FrameNode(uiContext);
    this.builderNode = new BuilderNode<[]>(uiContext, { selfIdealSize: { width: 200, height: 100 } });
    this.builderNode?.build(new WrappedBuilder<CustomBuilderT<[]>>(buildComponent),[])

    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.size = { width: 200, height: 200 };
      rootRenderNode.backgroundColor = 0xff00ff00.toInt();
      rootRenderNode?.appendChild(this.builderNode!.getFrameNode()!.getRenderNode()!);
    }
    return this.rootNode;
  }

  builderNodeAppendChild(): string {
    let errorStr: string = '';
    let textNode = typeNode.createTextNode(this.uiContext!)
    try {
      this.builderNode?.getFrameNode()?.moveTo(textNode, 0);
    } catch (e) {
      //100021:The FrameNode is not modifiable.
      errorStr = (e as BusinessError).code + ':' + (e as BusinessError).message;
    }
    return errorStr
  }
}

@Entry
@Component
struct FrameNodeMoveToErrorCodeTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State errorStr: string = '66666';

  build() {
    Column() {
      NodeContainer(this.myNodeController)
      Text(`${this.errorStr}`).id('error_str_id')
      Button('checkError in BuilderNode')
        .id('check_error_id')
        .onClick((e:ClickEvent) => {
          this.errorStr = this.myNodeController.builderNodeAppendChild();
        })
        .width('100%')
    }
  }
}