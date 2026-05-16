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
import { FrameNode, NodeController, NodeAdapter, typeNode } from '@kit.ArkUI';

// 自定义NodeAdapter管理数据
class MyNodeAdapter001 extends NodeAdapter {
  public uiContext: UIContext
  public cachePool: FrameNode[] = [];
  public changed: boolean = false
  public reloadTimes: number = 0;
  public data: string[] = [];
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
    console.info('UINodeAdapter get All items:' + items.length);
    this.reloadAllItems();
  }

  detachData(): void {
    NodeAdapter.detachNodeAdapter(this.hostNode);
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
      this.data[index] = 'Adapter ListItem ' + (this.changed ? 'changed:' : '') + index + ' r:' + this.reloadTimes;
    }
    this.reloadItem(from, count);
  }

  reloadItemTest(from: number, count: number,fromReload: number, countReload: number): void {
    this.changed = !this.changed;
    for (let i = 0; i < count; i++) {
      let index = i + from;
      this.data[index] = 'Adapter ListItem ' + (this.changed ? 'changed:' : '') + index + ' r:' + this.reloadTimes;
    }
    this.reloadItem(0, 0)
    this.reloadItem(fromReload, countReload);
  }
  insertData(from: number, count: number): void {
    for (let i = 0; i < count; i++) {
      let index = i + from;
      this.data.splice(index, 0, 'Adapter ListItem ' + from + '-' + i);
    }
    this.insertItem(from, count);
    this.totalNodeCount += count;
    console.info('UINodeAdapter after insert count:' + this.totalNodeCount);
  }

  removeData(from: number, count: number): void {
    let arr = this.data.splice(from, count);
    this.removeItem(from, count);
    this.totalNodeCount -= arr.length;
    console.info('UINodeAdapter after remove count:' + this.totalNodeCount);
  }

  moveData(from: number, to: number): void {
    let tmp = this.data.splice(from, 1);
    this.data.splice(to, 0, tmp[0]);
    this.moveItem(from, to);
  }

  onAttachToNode(target: FrameNode): void {
    console.info('UINodeAdapter onAttachToNode id:' + target.getUniqueId());
    this.hostNode = target;
  }

  onDetachFromNode(): void {
    console.info('UINodeAdapter onDetachFromNode');
  }

  onGetChildId(index: number): number {
    console.info('UINodeAdapter onGetChildId:' + index);
    return index;
  }

  onCreateChild(index: number): FrameNode {
    console.info('UINodeAdapter onCreateChild:' + index);
    if (this.cachePool.length > 0) {
      let cacheNode = this.cachePool.pop();
      if (cacheNode !== undefined) {
        console.info('UINodeAdapter onCreateChild reused id:' + cacheNode.getUniqueId());
        let text = cacheNode?.getFirstChild();
        let textNode = text as typeNode.Text;
        textNode?.initialize(this.data[index]).fontSize(20).id('text_' + index);
        return cacheNode;
      }
    }
    console.info('UINodeAdapter onCreateChild createNew');
    let itemNode = typeNode.createNode(this.uiContext, 'ListItem');
    let textNode = typeNode.createNode(this.uiContext, 'Text');
    textNode.initialize(this.data[index]).fontSize(20).id('text_' + index);
    itemNode.appendChild(textNode);
    return itemNode;
  }

  onDisposeChild(id: number, node: FrameNode): void {
    console.info('UINodeAdapter onDisposeChild:' + id);
    if (this.cachePool.length < 10) {
      if (!this.cachePool.includes(node)) {
        console.info('UINodeAdapter caching node id:' + node.getUniqueId());
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
// 继承NodeController实现自定义NodeAdapter控制器
class MyNodeAdapterController001 extends NodeController {
  public rootNode: FrameNode | null = null;
  public nodeAdapter: MyNodeAdapter001 | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    let listNode = typeNode.createNode(uiContext, 'List');
    listNode.initialize({ space: 3 }).borderWidth(2).borderColor(Color.Black);
    this.rootNode.appendChild(listNode);
    this.nodeAdapter = new MyNodeAdapter001(uiContext, 100);
    NodeAdapter.attachNodeAdapter(this.nodeAdapter, listNode);
    return this.rootNode;
  }
}

@Entry
@Component
struct NodeAdapter001 {
  adapterController: MyNodeAdapterController001 = new MyNodeAdapterController001();

  build() {
    Column() {
      Text('ListNode Adapter');
      NodeContainer(this.adapterController)
        .width(300).height('30%')
        .borderWidth(1).borderColor(Color.Black);

      Column(){
        Button('reloadItemTest')
          .id('NodeAdapter001_btn01')
          .height('5%')
          .onClick(() => {
            this.adapterController.nodeAdapter?.reloadItemTest(0,2,-1, -1);
          })
        Button('reloadItem')
          .height('5%')
          .onClick(() => {
            this.adapterController.nodeAdapter?.reloadItemTest(0,2,0,2);
          })
        Button('removeItemTest')
          .height('5%')
          .id('NodeAdapter001_btn02')
          .onClick(() => {
            this.adapterController.nodeAdapter?.removeItem(-1, -1);
            this.adapterController.nodeAdapter?.removeItem(0, 0);
          })
        Button('removeItem')
          .height('5%')
          .onClick(() => {
            this.adapterController.nodeAdapter?.removeItem(0, 1);
          })
        Button('insertItemTest')
          .height('5%')
          .id('NodeAdapter001_btn03')
          .onClick(() => {
            this.adapterController.nodeAdapter?.insertItem(0, 0);
            this.adapterController.nodeAdapter?.insertItem(-1, -1);
          })
        Button('insertItem')
          .height('5%')
          .onClick(() => {
            this.adapterController.nodeAdapter?.insertItem(0, 1);
          })
        Button('moveItemTest')
          .height('5%')
          .id('NodeAdapter001_btn04')
          .onClick(() => {
            this.adapterController.nodeAdapter?.moveItem(0, 0);
            this.adapterController.nodeAdapter?.moveItem(-1, -1);
          })
        Button('moveItem')
          .height('5%')
          .onClick(() => {
            this.adapterController.nodeAdapter?.moveItem(0, 1);
          })
      }
      .height('70%')
    }.borderWidth(1)
    .width('100%')
    .height('100%')
  }
}