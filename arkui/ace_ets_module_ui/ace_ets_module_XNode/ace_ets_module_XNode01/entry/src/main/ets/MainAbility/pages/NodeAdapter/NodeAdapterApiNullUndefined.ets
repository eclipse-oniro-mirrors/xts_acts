/**
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

import { FrameNode, NodeController, NodeAdapter, typeNode } from '@kit.ArkUI';

class MyNodeAdapter extends NodeAdapter {
  public uiContext: UIContext
  public cachePool: Array<FrameNode> = [];
  public changed: boolean = false
  public reloadTimes: number = 0;
  public data: Array<string> = [];
  public hostNode?: FrameNode

  constructor(uiContext: UIContext, count: number) {
    super();
    this.uiContext = uiContext;
    this.totalNodeCount = count;
    this.loadData();
  }

  reloadData(count: number): void {
    this.reloadTimes++;
    NodeAdapter.attachNodeAdapter(this, this.hostNode);
    this.totalNodeCount = count;
    this.loadData();
    this.reloadAllItems();
  }

  refreshData(): void {
    let items = this.getAllAvailableItems()
    console.info(`UINodeAdapter get All items:${items.length}`);
    this.reloadAllItems();
  }

  detachDataNull(): void {
    NodeAdapter.detachNodeAdapter(null);
    this.reloadTimes = 0;
  }
  detachDataUndefined(): void {
    NodeAdapter.detachNodeAdapter(undefined);
    this.reloadTimes = 0;
  }

  loadData(): void {
    for (let i = 0; i < this.totalNodeCount; i++) {
      this.data[i] = 'Adapter ListItem ' + i + ' r:' + this.reloadTimes;
    }
  }

  changeData(from: number, count: number): void {
    this.changed = !this.changed;
    for (let i = 0; i < count; i++) {
      let index = i + from;
      this.data[index] = 'Adapter ListItem ' + (this.changed ? 'changed:' : '') + index + 'r:' + this.reloadTimes;
    }
    this.reloadItem(from, count);
  }

  insertDataNull(from: number, count: number): void {
    for (let i = 0; i < count; i++) {
      let index = i + from;
      this.data.splice(index, 0, 'Adapter ListItem ' + from + '-' + i);
    }
    this.insertItem(null, null);
    this.totalNodeCount += count;
    console.info(`UINodeAdapter after insert count:${this.totalNodeCount}`);
  }
  insertDataUndefined(from: number, count: number): void {
    for (let i = 0; i < count; i++) {
      let index = i + from;
      this.data.splice(index, 0, 'Adapter ListItem ' + from + '-' + i);
    }
    this.insertItem(undefined, undefined);
    this.totalNodeCount += count;
    console.info(`UINodeAdapter after insert count:${this.totalNodeCount}`);
  }

  removeDataNull(from: number, count: number): void {
    let arr = this.data.splice(from, count);
    this.removeItem(null, null);
    this.totalNodeCount -= arr.length;
    console.info(`UINodeAdapter after remove count:${this.totalNodeCount}`);
  }
  removeDataUndefined(from: number, count: number): void {
    let arr = this.data.splice(from, count);
    this.removeItem(undefined, undefined);
    this.totalNodeCount -= arr.length;
    console.info(`UINodeAdapter after remove count:${this.totalNodeCount}`);
  }

  moveDataNull(from: number, to: number): void {
    let tmp = this.data.splice(from, 1);
    this.data.splice(to, 0, tmp[0]);
    this.moveItem(null, null);
  }
  moveDataUndefined(from: number, to: number): void {
    let tmp = this.data.splice(from, 1);
    this.data.splice(to, 0, tmp[0]);
    this.moveItem(undefined, undefined);
  }

  onAttachToNode(target: FrameNode): void {
    console.info(`UINodeAdapter onAttachToNode id:${target.getUniqueId()}`);
    this.hostNode = target;
  }

  onDetachFromNode(): void {
    console.info('UINodeAdapter onDetachFromNode');
  }

  onGetChildId(index: number): number {
    console.info(`UINodeAdapter onGetChildId:${index}`);
    return index;
  }

  onCreateChild(index: number): FrameNode {
    console.info(`UINodeAdapter onCreateChild:${index}`);
    if (this.cachePool.length > 0) {
      let cacheNode = this.cachePool.pop();
      if (cacheNode !== undefined) {
        console.info(`UINodeAdapter onCreateChild reused id:${cacheNode.getUniqueId()}`);
        let text = cacheNode?.getFirstChild();
        let textNode = text as typeNode.Text;
        textNode?.initialize(this.data[index]).fontSize(20);
        return cacheNode;
      }
    }
    console.info('UINodeAdapter onCreateChild createNew');
    let itemNode = typeNode.createNode(this.uiContext, 'ListItem');
    let textNode = typeNode.createNode(this.uiContext, 'Text');
    textNode.initialize(this.data[index]).fontSize(20);
    itemNode.appendChild(textNode);
    return itemNode;
  }

  onDisposeChild(id: number, node: FrameNode): void {
    console.info(`UINodeAdapter onDisposeChild:${id}`);
    if (this.cachePool.length < 10) {
      if (!this.cachePool.includes(node)) {
        console.info(`UINodeAdapter caching node id:${node.getUniqueId()}`);
        this.cachePool.push(node);
      }
    } else {
      node.dispose();
    }
  }

  onUpdateChild(id: number, node: FrameNode): void {
    let index = id;
    let text = node.getFirstChild();
    let textNode = text as typeNode.Text;
    textNode?.initialize(this.data[index]).fontSize(20);
  }
}

class MyNodeAdapterController extends NodeController {
  public rootNode: FrameNode | null = null;
  public nodeAdapter: MyNodeAdapter | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    let listNode = typeNode.createNode(uiContext, 'List');
    listNode.initialize({ space: 3 }).borderWidth(2).borderColor(Color.Black);
    this.rootNode.appendChild(listNode);
    this.nodeAdapter = new MyNodeAdapter(uiContext, 100);
    NodeAdapter.attachNodeAdapter(null, null);
    NodeAdapter.attachNodeAdapter(undefined, undefined);
    return this.rootNode;
  }
}

@Entry
@Component
struct NodeAdapterApiNullUndefined {
  adapterController: MyNodeAdapterController = new MyNodeAdapterController();

  aboutToDisappear(): void {
    this.adapterController.nodeAdapter?.dispose();
  }

  build() {
    Column({space:3}) {
      NodeContainer(this.adapterController)
        .width(200).height(50)
        .borderColor(Color.Black)
        .id('NodeAdapterApiNullUndefined')

      Row({space:3}) {
        Button('RemoveNull')
          .onClick(() => {
            this.adapterController.nodeAdapter?.removeDataNull(10, 10);
          })
          .width(90)
          .height(20)
          .id('nodeAdapterRemoveDataNull')
        Button('RemoveUndefined')
          .onClick(() => {
            this.adapterController.nodeAdapter?.removeDataUndefined(10, 10);
          })
          .id('nodeAdapterRemoveDataUndefined')
          .width(110)
          .height(20)
      }

      Row({space:3}) {
        Button('InsertItemNull')
          .onClick(() => {
            this.adapterController.nodeAdapter?.insertDataNull(10, 10);
          })
          .width(90)
          .height(20)
          .id('nodeAdapterInsertItemNull')
        Button('InsertItemUndefined')
          .onClick(() => {
            this.adapterController.nodeAdapter?.insertDataUndefined(10, 10);
          })
          .id('nodeAdapterInsertItemUndefined')
          .width(110)
          .height(20)
      }
      Row({space:3}) {
        Button('MoveItemNull')
          .onClick(() => {
            this.adapterController.nodeAdapter?.removeDataNull(10, 10);
          })
          .width(90)
          .height(20)
          .id('nodeAdapterMoveItemNull')
        Button('MoveItemUndefined')
          .onClick(() => {
            this.adapterController.nodeAdapter?.removeDataUndefined(10, 10);
          })
          .id('nodeAdapterMoveItemUndefined')
          .width(110)
          .height(20)
      }
      Row({space:3}) {
        Button('DetachNodeNull')
          .onClick(() => {
            this.adapterController.nodeAdapter?.detachDataNull();
          })
          .width(90)
          .height(20)
          .id('nodeAdapterDetachNodeNull')
        Button('DetachNodeUndefined')
          .onClick(() => {
            this.adapterController.nodeAdapter?.detachDataUndefined();
          })
          .id('nodeAdapterDetachNodeUndefined')
          .width(110)
          .height(20)
      }
    }
    .width('100%')
    .height('100%')
  }
}