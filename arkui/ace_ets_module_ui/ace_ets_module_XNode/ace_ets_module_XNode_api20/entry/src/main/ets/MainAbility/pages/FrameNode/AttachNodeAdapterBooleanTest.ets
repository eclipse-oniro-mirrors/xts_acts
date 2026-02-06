/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

  refreshData(): void {
    let items = this.getAllAvailableItems();
    AppStorage.SetOrCreate('getAllAvailableItemsNull', this.getAllAvailableItems().length);
    console.info('UINodeAdapter get All items:' + items.length);
  }

  loadData(): void {
    for (let i = 0; i < this.totalNodeCount; i++) {
      this.data[i] = 'Adapter ListItem ' + i + ' r:' + this.reloadTimes;
    }
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

    AppStorage.SetOrCreate('attachNodeAdapterTrue', NodeAdapter.attachNodeAdapter(this.nodeAdapter, listNode));
    AppStorage.SetOrCreate('attachNodeAdapterFalse', NodeAdapter.attachNodeAdapter(this.nodeAdapter, listNode));
    return this.rootNode;
  }
}

@Entry
@Component
struct AttachNodeAdapterIndex {
  adapterController: MyNodeAdapterController = new MyNodeAdapterController();

  build() {
    Column() {
      NodeContainer(this.adapterController)
        .width(300)
        .height('30%')
        .borderWidth(1)
        .borderColor(Color.Black);

    }.borderWidth(1)
    .width('100%').height('100%')
  }
}