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

import { NodeController, BuilderNode, FrameNode, UIContext } from '@kit.ArkUI';

@Builder
function myBuilder() {
  Column() {
    Text('TEST')
      .height(30)
      .id('text')
    Image($r('app.media.icon'))
      .id('image')
      .height(30)
  }
  .width('100%')
  .height('100%')
  .id('column')
}

class MyNodeAdapterController extends NodeController {
  private rootNode: FrameNode | null = null;
  private uid: number = -1;

  makeNode(uiContext: UIContext): FrameNode | null {
    if (this.rootNode == null) {
      this.rootNode = new FrameNode(uiContext);
      let buttonNode = new BuilderNode(uiContext);
      buttonNode!.build(wrapBuilder(myBuilder));
      this.rootNode!.appendChild(buttonNode!.getFrameNode()!);
    }
    return this.rootNode;
  }

  addFrameNodeById(id: string): string {
    let node = this.rootNode!.getFrameNodeById('text')
    console.info(`CYC_addFrameNodeById node type: ${typeof(node)}`)
    if (node == null) {
      console.info(`CYC_addFrameNodeById null`)
      let str = 'null'
      return str
    } else if (node == undefined) {
      console.info(`CYC_addFrameNodeById undefined`)
      let str = 'undefined'
      return str
    } else {
      console.info(`CYC_addFrameNodeById id ${node.getId()}`)
      this.uid = node.getUniqueId();
      let tempNode = this.rootNode!.getFrameNodeByUniqueId(this.uid)
      console.info(`CYC_addFrameNodeById id ${node.getUniqueId()} ${tempNode!.getUniqueId()}`)
      let str = node.getUniqueId().toString()
      return str
    }
  }

  getFrameNodeByUniqueId(): string {
    let node = this.rootNode!.getFrameNodeByUniqueId(this.uid)
    console.info(`CYC_addFrameNodeById node type: ${typeof(node)}`)
    if (node == null) {
      console.info(`CYC_getFrameNodeByUniqueId null`)
      let str = 'null'
      return str
    } else if (node == undefined) {
      console.info(`CYC_getFrameNodeByUniqueId undefined`)
      let str = 'undefined'
      return str
    } else {
      console.info(`CYC_getFrameNodeByUniqueId id ${node.getUniqueId()}`)
      let str = node.getUniqueId().toString()
      return str
    }
  }
  createFrameNodes(uiContext: UIContext, count: number): string {
    let startTime = Date.now();
    let frameNodes = FrameNode.createFrameNodes(uiContext, count)
    let endTime = Date.now();let executionTime = endTime - startTime;
    console.info(`CYC_createFrameNodes size ${frameNodes.length} ${executionTime}ms`)
    let str = frameNodes.length.toString()
    return str
  }

  createFrameNodes2(uiContext: UIContext):string{
    let startTime = Date.now();
    for(let i=0;i<100;i++){
      new FrameNode(uiContext)
    }
    let endTime = Date.now();let executionTime = endTime - startTime;
    console.info(`CYC_createFrameNodes2：${executionTime}ms`);
    let str = 'ms'
    return str
  }
}

@Entry
@Component
struct createFrameNodesUIContextInt {
  @State flag: boolean = true;
  @State str:string = 'hello'
  public adapterController: MyNodeAdapterController = new MyNodeAdapterController();

  build() {
    Column({space:3}) {
      NodeContainer(this.adapterController)
        .width(150).height(60)
        .borderWidth(1).borderColor(Color.Black)
      Text(this.str).height(20).id('createFrameNodesText')
      Button('addFrameNodeById').onClick(() => {
        this.str = this.adapterController.addFrameNodeById('text')
      }).width(150).height(20).id('addFrameNodeById')
      Button('getFrameNodeByUniqueId').onClick(() => {
        this.str = this.adapterController.getFrameNodeByUniqueId()
      }).width(150).height(20).id('getFrameNodeByUniqueId')
      Button('createFrameNodes').onClick(() => {
        this.str = this.adapterController.createFrameNodes(this.getUIContext(), 100)
      }).width(150).height(20).id('createFrameNodes')
      Button('createFrameNodes2').onClick(() => {
        this.str = this.adapterController.createFrameNodes2(this.getUIContext())
      }).width(150).height(20).id('createFrameNodes2')

    }
    .height('100%')
    .width('100%')
  }
}