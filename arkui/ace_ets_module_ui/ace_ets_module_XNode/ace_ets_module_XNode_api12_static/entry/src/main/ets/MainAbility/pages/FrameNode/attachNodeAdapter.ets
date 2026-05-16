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
import { FrameNode, NodeController, NodeAdapter, typeNode } from '@ohos.arkui.node';
import {
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  Color,
  Builder,
  Row,
  NodeContainer,
  ListOptions,
} from '@ohos.arkui.component'
import { AppStorage, State, LocalStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

let para: Record<string,string> = {
  'onCreateChild': 'start',
  'onDisposeChild': 'start',
  'onUpdateChild': 'start',
  'attachNodeAdapter': 'start',
  'detachNodeAdapter': 'start',
};
let storage: LocalStorage = new LocalStorage();

class MyNodeAdapter extends NodeAdapter {
  uiContext: UIContext = new UIContext();
  cachePool: Array<FrameNode> = new Array<FrameNode>();
  changed: boolean = false
  reloadTimes: number = 0;
  data: Array<string> = new Array<string>(100);
  hostNode: FrameNode | null = null;

  constructor(uiContext: UIContext, count: number) {
    super();
    this.uiContext = uiContext;
    this.totalNodeCount = count as int;
    this.loadData();
  }

  reloadData(count: number): void {
    this.reloadTimes++;
    NodeAdapter.attachNodeAdapter(this, this.hostNode!);
    storage.set('attachNodeAdapter', this.hostNode?.getChildrenCount().toString());
    this.totalNodeCount = count as int;
    this.loadData();
    this.reloadAllItems();
  }

  refreshData(): void {
    let items = this.getAllAvailableItems()
    console.log('UINodeAdapter get All items:' + items.length);
    this.reloadAllItems();
  }

  detachData(): void {
    NodeAdapter.detachNodeAdapter(this.hostNode!);
    this.reloadTimes = 0;
    storage.set('detachNodeAdapter', this.hostNode?.getChildrenCount().toString());
  }

  loadData(): void {
    // console.log('+++++++++++data.length',this.data.length,'this.totalNodeCount',this.totalNodeCount)
    for (let i = 0; i < this.totalNodeCount; i++) {
      this.data[i] = 'Adapter ListItem ' + i + ' r:' + this.reloadTimes;
    }
  }

  changeData(from: number, count: number): void {
    this.changed = !this.changed;
    for (let i = 0; i < count; i++) {
      let index = i + from;
      this.data[index.toInt()] = 'Adapter ListItem ' + (this.changed ? 'changed:' : '') + index + " r:" + this.reloadTimes;
    }
    this.reloadItem(from as int, count as int);
  }

  insertData(from: number, count: number): void {
    for (let i = 0; i < count; i++) {
      let index = i + from;
      this.data.splice(index as int, 0, 'Adapter ListItem ' + from + '-' + i);
    }
    this.insertItem(from as int, count as int);
    this.totalNodeCount += count;
    console.log('UINodeAdapter after insert count:' + this.totalNodeCount);
  }

  removeData(from: number, count: number): void {
    let arr = this.data.splice(from as int, count as int);
    this.removeItem(from as int, count as int);
    this.totalNodeCount -= arr.length;
    console.log('UINodeAdapter after remove count:' + this.totalNodeCount);
  }

  moveData(from: number, to: number): void {
    let tmp = this.data.splice(from as int, 1);
    this.data.splice(to as int, 0, tmp[0]);
    this.moveItem(from as int, to as int);
  }

  onAttachToNode(target: FrameNode): void {
    console.log('UINodeAdapter onAttachToNode id:' + target.getUniqueId()); //master22 执行后appDied
    this.hostNode = target;
  }

  onDetachFromNode(): void {
    console.log('UINodeAdapter onDetachFromNode');
  }

  onGetChildId(index: number): number {
    console.log('UINodeAdapter onGetChildId:' + index);
    return index;
  }

  onCreateChild(index: number): FrameNode {
    storage.set('onCreateChild', 'onCreateChild succ');
    console.log('UINodeAdapter onCreateChild:' + index);
    if (this.cachePool.length > 0) {
      let cacheNode = this.cachePool.pop();
      if (cacheNode !== undefined) {
        console.log('UINodeAdapter onCreateChild reused id:' + cacheNode.getUniqueId());
        let text = cacheNode?.getFirstChild();
        let textNode = text as typeNode.Text;
        textNode?.initialize(this.data[index.toInt()]).fontSize(20);
        return cacheNode;
      }
    }
    console.log('UINodeAdapter onCreateChild createNew');
    let itemNode = typeNode.createListItemNode(this.uiContext);
    let textNode = typeNode.createTextNode(this.uiContext);
    textNode.initialize(this.data[index.toInt()]).fontSize(20);
    itemNode.appendChild(textNode);
    return itemNode;
  }



  onDisposeChild(id: number, node: FrameNode): void {
    storage.set('onDisposeChild', 'onDisposeChild succ');
    console.log('UINodeAdapter onDisposeChild:' + id);
    if (this.cachePool.length < 10) {
      if (!this.cachePool.includes(node)) {
        console.log('UINodeAdapter caching node id:' + node.getUniqueId());
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
    textNode?.initialize(this.data[index.toInt()]).fontSize(20);
    storage.set('onUpdateChild', 'onUpdateChild succ');
  }
}

class MyNodeAdapterController extends NodeController {
  rootNode: FrameNode | null = null;
  nodeAdapter: MyNodeAdapter | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    let listNode = typeNode.createListNode(uiContext);
    listNode.initialize({ space: 3 } as ListOptions).borderWidth(2).borderColor(Color.Black);
    this.rootNode?.appendChild(listNode);
    this.nodeAdapter = new MyNodeAdapter(uiContext, 100);
    NodeAdapter.attachNodeAdapter(this.nodeAdapter!, listNode);
    return this.rootNode;
  }

  rebuild(): void {
    console.log('rebuild succ');
  }
}

@Entry
@Component
struct AttachNodeAdapter1 {
  adapterController: MyNodeAdapterController = new MyNodeAdapterController();
  @State onCreateChild: string = 'Init'
  @State onDisposeChild: string = 'Init'
  @State onUpdateChild: string = 'Init'
  @State attachNodeAdapter: string = 'Init'
  @State detachNodeAdapter: string = 'Init'
  build() {
    Column() {
      Text('ListNode Adapter').height('5%');
      Button(this.onCreateChild).margin(5).id('onCreateChild_id').height('5%')
        .onClick((e:ClickEvent)=>{
          this.onCreateChild = storage.get<string>('onCreateChild') as string
        })
      Button(this.onDisposeChild).margin(5).id('onDisposeChild_id').height('5%')
        .onClick((e:ClickEvent)=>{
          this.onDisposeChild = storage.get<string>('onDisposeChild') as string
        })
      Button(this.onUpdateChild).margin(5).id('onUpdateChild_id').height('5%')
        .onClick((e:ClickEvent)=>{
          this.onUpdateChild = storage.get<string>('onUpdateChild') as string
        })
      Button(this.attachNodeAdapter).margin(5).id('attachNodeAdapter_id').height('5%')
        .onClick((e:ClickEvent)=>{
          this.attachNodeAdapter = storage.get<string>('attachNodeAdapter') as string
        })
      Button(this.detachNodeAdapter).margin(5).id('detachNodeAdapter_id').height('5%')
        .onClick((e:ClickEvent)=>{
          this.adapterController.nodeAdapter?.detachData();
          this.detachNodeAdapter = storage.get<string>('detachNodeAdapter') as string
        })
      NodeContainer(this.adapterController)
        .width(300).height('30%')
        .borderWidth(1).borderColor(Color.Black);

      Button('Reload').margin(10).id('attachNodeAdapterReload').height('5%')
        .onClick((e:ClickEvent) => {
          this.adapterController.nodeAdapter?.reloadData(50);
        })

    }.borderWidth(1)
    .width('100%')
    .height('100%')
  }
}
