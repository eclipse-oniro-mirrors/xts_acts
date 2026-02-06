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
import { BuilderNode, FrameNode, NodeController,typeNode, RenderNode } from '@ohos.arkui.node'
import { Entry, Column, Component,Builder,Text,ColumnOptions,Margin,Button,NodeContainer,
  Visibility,wrapBuilder,FontWeight,Color,WrappedBuilder,Scroll,Scroller,ColumnOptions,
  HorizontalAlign,ColumnOptions,Stack,Row,Position

} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

const renderNode = new RenderNode();
renderNode.frame = { x: 0, y: 0, width: 100, height: 50 };
renderNode.backgroundColor = 0xffff0000.toInt();

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    let rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.size = { width: 200, height: 50 };
      rootRenderNode.backgroundColor = 0xff00ff00.toInt();
      rootRenderNode.appendChild(renderNode);
    }

    return this.rootNode;
  }

  disposeRenderNode() {
    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.removeChild(renderNode);
    }
    rootRenderNode?.dispose();
  }

  getRenderNode() {
    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null && renderNode !== null ) {
      return true
    } else {
      return false
    }
  }
}

@Entry
@Component
struct RenderNodeDisposeIndex {
  private myNodeController: MyNodeController = new MyNodeController();
  @State flag: boolean | null = null
  @State result: string = '99999'

  build() {
    Column() {
      NodeContainer(this.myNodeController)
      Button('RenderNode dispose')
        .id('dispose_id')
        .onClick((e:ClickEvent) => {
          this.myNodeController.disposeRenderNode();
        })
        .width('100%')
      Button('result').id('result_id').height('10%')
        .onClick((e:ClickEvent) => {
          this.flag = this.myNodeController.getRenderNode(); //期望是false，实际是true
          if(this.flag){
            this.result = 'dispose fail'
          }else{
            this.result = 'Init'
          }
        }).width('100%')
      Text(this.result).id('dispose_result').height('10%')
    }
  }
}