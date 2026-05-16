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

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Row,
  Color,
  Scroll
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import { NodeController, FrameNode, NodeAdapter, typeNode } from '@ohos.arkui.node';
import { NodeContainer } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

export class TestNodeAdapter extends NodeAdapter {
  uiContext: UIContext
  data: Array<string> = new Array<string>();
  hostNode?: FrameNode

  constructor(uiContext: UIContext, count: Int) {
    super();
    this.uiContext = uiContext;
    this.totalNodeCount = count;
    this.loadData();
  }

  loadData(): void {
    this.data = [];
    for (let i = 0; i < this.totalNodeCount; i++) {
      this.data.push('Test Item ' + i);
    }
  }

  onAttachToNode(target: FrameNode): void {
    this.hostNode = target;
  }

  onDetachFromNode(): void {
    this.hostNode = undefined;
  }

  onGetChildId(index: Int): Int {
    return index;
  }

  onCreateChild(index: Int): FrameNode {
    const textNode = typeNode.createTextNode(this.uiContext);
    textNode.initialize(this.data[index as Int]).fontSize(16);
    const listItemNode = typeNode.createListItemNode(this.uiContext);
    listItemNode.appendChild(textNode);
    return listItemNode;
  }

  onDisposeChild(id: Int, node: FrameNode): void {
    node.dispose();
  }

  onUpdateChild(id: Int, node: FrameNode): void {
    let text = node.getFirstChild();
    let textNode = text as typeNode.Text;
    textNode?.initialize(this.data[id as Int]).fontSize(16);
  }
}

export class MyNodeController extends NodeController {
  rootNode: FrameNode | null = null;
  nodeAdapter: TestNodeAdapter | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    let listNode = typeNode.createListNode(uiContext);
    listNode.initialize().borderColor(Color.Black);
    this.rootNode!.appendChild(listNode!);
    this.nodeAdapter = new TestNodeAdapter(uiContext, 10);
    NodeAdapter.attachNodeAdapter(this.nodeAdapter!, listNode);
    return this.rootNode;
  }

  updateTotalNodeCount(newCount: Int): void {
    if (this.nodeAdapter) {
      this.nodeAdapter!.totalNodeCount = newCount;
      this.nodeAdapter!.loadData();
      this.nodeAdapter!.reloadAllItems();
    }
  }

  getTotalNodeCount(): Int {
    if (this.nodeAdapter) {
      return this.nodeAdapter!.totalNodeCount;
    }
    return 0;
  }
}

@Entry
@Component
struct NodeAdapterTotalNodeCount {
  private nodeController: MyNodeController = new MyNodeController();
  @State totalCount: Int = 10;

  build() {
    Scroll() {
      Column() {
        Text('NodeAdapter totalNodeCount Method Test')
          .fontSize(8)
          .width('90%')
          .height('10%')

        Text(`Current totalNodeCount: ${this.totalCount}`)
          .id('totalNodeCount_display')
          .fontSize(8)
          .width('90%')
          .height('10%')

        Row() {
          Button('Set to 5')
            .id('button_count_5')
            .onClick((event: ClickEvent) => {
              this.nodeController.updateTotalNodeCount(5);
              this.totalCount = 5;
            })
            .width('30%')
            .height('30%')

          Button('Set to 10')
            .id('button_count_10')
            .onClick((event: ClickEvent) => {
              this.nodeController.updateTotalNodeCount(10);
              this.totalCount = 10;
            })
            .width('30%')
            .height('30%')
        }
        .width('90%')
        .height('10%')

        Row() {
          Button('Set to 15')
            .id('button_count_15')
            .onClick((event: ClickEvent) => {
              this.nodeController.updateTotalNodeCount(15);
              this.totalCount = 15;
            })
            .width('30%')
            .height('30%')

          Button('Set to 20')
            .id('button_count_20')
            .onClick((event: ClickEvent) => {
              this.nodeController.updateTotalNodeCount(20);
              this.totalCount = 20;
            })
            .width('30%')
            .height('30%')
        }
        .width('90%')
        .height('10%')

        Row() {
          Button('Set to 0')
            .id('button_count_0')
            .onClick((event: ClickEvent) => {
              this.nodeController.updateTotalNodeCount(0);
              this.totalCount = 0;
            })
            .width('30%')
            .height('30%')

          Button('Set to 1')
            .id('button_count_1')
            .onClick((event: ClickEvent) => {
              this.nodeController.updateTotalNodeCount(1);
              this.totalCount = 1;
            })
            .width('30%')
            .height('30%')
        }
        .width('90%')
        .height('10%')
      }
      .width('90%')
      .height('95%')
      .backgroundColor('#F5F5F5')
    }
    .height('100%')
    .width('100%')
  }
}