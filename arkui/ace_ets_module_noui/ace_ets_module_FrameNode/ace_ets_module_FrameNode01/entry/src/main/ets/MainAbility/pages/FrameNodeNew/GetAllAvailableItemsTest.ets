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

  constructor(uiContext: UIContext, count: number) {
    super();
    this.uiContext = uiContext;
    this.totalNodeCount = count;
  }

  refreshData(): void {
    let items = this.getAllAvailableItems();
    AppStorage.SetOrCreate('getAllAvailableItemsNoNull', this.getAllAvailableItems().length);
    console.info('UINodeAdapter get All items:' + items.length);
  }

  onCreateChild(index: number): FrameNode {
    console.info('UINodeAdapter onCreateChild:' + index);
    let textNode = typeNode.createNode(this.uiContext, 'Text');
    return textNode;
  }
}

class MyNodeAdapter2 extends NodeAdapter {
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
  public nodeAdapter2: MyNodeAdapter2 | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.nodeAdapter = new MyNodeAdapter(uiContext, 100);
    this.nodeAdapter2 = new MyNodeAdapter2(uiContext, 100);
    NodeAdapter.attachNodeAdapter(this.nodeAdapter, this.rootNode);
    return this.rootNode;
  }
}

@Entry
@Component
struct ListNodeTest {
  adapterController: MyNodeAdapterController = new MyNodeAdapterController();

  build() {
    Column() {
      NodeContainer(this.adapterController)
        .width(300).height('30%').borderWidth(1).borderColor(Color.Black);
      Button('getAllAvailableItems 空')
        .id('btn_getAllAvailableItemsNull')
        .height('10%')
        .onClick(() => {
          this.adapterController.nodeAdapter2?.refreshData();
        })
      Button('getAllAvailableItems 非空')
        .id('btn_getAllAvailableItemsNoNull')
        .height('10%')
        .onClick(() => {
          this.adapterController.nodeAdapter?.refreshData();
        })
    }.borderWidth(1)
    .width('100%').height('100%')
  }
}
