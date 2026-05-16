'use static';
/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';
import {
  Entry,
  Component,
  Builder,
  NodeContainer,
  CheckBoxShape,
  Column,
  ColumnOptions,
  ImageAnalyzerType,
  CheckboxGroup,
  Checkbox,
  HorizontalAlign,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  ImageAIOptions,
  ImageAnalyzerController,
  ImageBitmap,
  ImageAnalyzerConfig,
  Text,
  Button,
  FontWeight,
  ClickEvent,
  Margin,
  Color,
  Row,
  RenderingContextSettings,
  CanvasRenderingContext2D,
  Canvas,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

export class MyNodeController extends NodeController {
  public errorCode: string = '';
  private worker: EAWorker = new EAWorker();
  private myNode: typeNode.ListItem | null = null;

  constructor() {
    super();
    this.worker.start();
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    let col = typeNode.createColumnNode(uiContext);
    col.initialize();
    this.worker.postTask(() => {
      try {
        let listItem = typeNode.createListItemNode(uiContext, { supportMultiThread: true });
        EAWorker.main().postTask(() => {
          col.appendChild(listItem);
          this.myNode = listItem;
          this.errorCode = 'createListItemNode success';
        });
      } catch (e) {
        this.errorCode = 'createListItemNode error';
      }
    });
    node.appendChild(col);
    return node;
  }

  triggerError() {
    this.errorCode = ''
    this.worker.postTask(() => {
      try {
        this.myNode!.commonAttribute.backgroundColor('#ffffff00');
        this.errorCode = 'change listItem backgroundColor success'
      } catch (e) {
        this.errorCode = 'change listItem backgroundColor error'
      }
    });
    this.worker.quit();
  }
}

@Entry
@Component
struct createListItemNode {
  private myNodeController: MyNodeController = new MyNodeController()
  @State message: string = ''
  private timer: int = 0;

  aboutToAppear() {
    this.timer = setInterval(() => {
      if (this.myNodeController.errorCode != '') {
        this.message = this.myNodeController.errorCode;
        clearInterval(this.timer)
      }
    }, 800)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      NodeContainer(this.myNodeController).height('30%')
      Text(this.message).key('error_listItem_key').height('30%')
      Button('error')
        .id('error_listItem_id')
        .height('30%')
        .onClick(() => {
          this.timer = setInterval(() => {
            this.myNodeController.triggerError();
            if (this.myNodeController.errorCode != '') {
              this.message = this.myNodeController.errorCode;
              clearInterval(this.timer)
            }
          }, 800)
        })
    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}