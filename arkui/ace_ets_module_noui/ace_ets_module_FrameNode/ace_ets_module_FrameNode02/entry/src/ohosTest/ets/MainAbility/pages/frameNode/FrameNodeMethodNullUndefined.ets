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

import { NodeController, FrameNode, UIContext, typeNode } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

const TEST_TAG: string = 'FrameNode '

// 继承NodeController实现自定义UI控制器
class MyNodeController extends NodeController {
  public frameNode: FrameNode | null = null;
  public childList: FrameNode[] = [];
  private rootNode: FrameNode | null = null;
  private uiContext: UIContext | null = null;
  private childrenCount: number = 0;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.uiContext = uiContext;

    this.frameNode = new FrameNode(uiContext);
    this.frameNode.commonAttribute.backgroundColor(Color.Pink);
    this.frameNode.commonAttribute.size({ width: 100, height: 100 });
    this.frameNode.commonAttribute.key('frameNodeTest');
    this.addCommonEvent(this.frameNode)
    this.rootNode.appendChild(this.frameNode);
    this.childrenCount = this.childrenCount + 1;

    // 批量创建10个子节点并挂载到主节点
    for (let i = 0; i < 10; i++) {
      let childNode = new FrameNode(uiContext);
      this.childList.push(childNode);
      this.frameNode.appendChild(childNode);
    }

    // 创建Stack容器节点
    let stackNode = typeNode.createNode(uiContext, 'Stack');
    stackNode.initialize().size({ width: 50, height: 50 }).key('stackNodeTest').backgroundColor(Color.Yellow);
    this.frameNode.appendChild(stackNode);

    // 创建Row容器节点
    let rowNode = typeNode.createNode(uiContext, 'Row');
    rowNode.initialize().size({ width: 20, height: 20 }).key('rowNodeTest').backgroundColor(Color.Green);
    this.frameNode.appendChild(rowNode);

    return this.rootNode;
  }

  // 为节点添加点击事件
  addCommonEvent(frameNode: FrameNode) {
    frameNode.commonEvent.setOnClick((event: ClickEvent) => {
      console.info(`Click FrameNode: ${JSON.stringify(event)}`)
    })
  }

  createFrameNode() {
    let frameNode = new FrameNode(this.uiContext!);
    frameNode.commonAttribute.backgroundColor(Color.Yellow);
    frameNode.commonAttribute.size({ width: 100, height: 100 });
    frameNode.commonAttribute.position({ x: this.childrenCount * 120, y: 0 });

    return frameNode;
  }

  // 追加子节点到根节点的末尾
  appendChild() {
    const childNode = this.createFrameNode();
    this.rootNode!.appendChild(childNode);
    this.childrenCount = this.childrenCount + 1;
  }

  appendChild_null() {
    this.rootNode!.appendChild(null);
  }

  appendChild_undefined() {
    this.rootNode!.appendChild(undefined);
  }

  // 在指定索引节点后插入新节点
  insertChildAfter(index: number) {
    let insertNode = this.createFrameNode();
    let childNode = this.rootNode!.getChild(index);
    this.rootNode!.insertChildAfter(insertNode, childNode);
    this.childrenCount = this.childrenCount + 1;
  }

  insertChildAfter_null_1() {
    let childNode = this.rootNode!.getChild(0);
    this.rootNode!.insertChildAfter(null, childNode);

  }

  insertChildAfter_undefined_1() {
    let childNode = this.rootNode!.getChild(0);
    this.rootNode!.insertChildAfter(undefined, childNode);
  }

  insertChildAfter_null_2() {
    let insertNode = this.createFrameNode();
    this.rootNode!.insertChildAfter(insertNode, null);
    this.childrenCount = this.childrenCount + 1;
  }

  insertChildAfter_undefined_2() {
    let insertNode = this.createFrameNode();
    this.rootNode!.insertChildAfter(insertNode, undefined);
    this.childrenCount = this.childrenCount + 1;
  }

  // 移除指定索引的子节点
  removeChild(index: number) {
    let childNode = this.rootNode!.getChild(index);
    if (childNode == null) {
      console.info(`${TEST_TAG} getchild at index {${index}} : fail`);
      return;
    }
    this.rootNode!.removeChild(childNode);
    this.childrenCount = this.childrenCount - 1;
  }

  removeChild_null() {
    this.rootNode!.removeChild(null);
  }

  removeChild_undefined() {
    this.rootNode!.removeChild(undefined);
  }

  // 将指定节点移动到根节点的第一个位置
  moveFrameNode() {
    const currentNode = this.frameNode!.getChild(10);
    try {
      currentNode!.moveTo(this.rootNode, 0);
      if (this.rootNode!.getChild(0) === currentNode) {
        console.info(`${TEST_TAG} moveTo result: success.`);
      } else {
        console.info(`${TEST_TAG} moveTo result: fail.`);
      }
    } catch (err) {
      console.info(`${TEST_TAG} ${(err as BusinessError).code} : ${(err as BusinessError).message}`);
      console.info(`${TEST_TAG} moveTo result: fail.`);
    }
  }

  moveFrameNode_null_1() {
    const currentNode = this.frameNode!.getChild(10);
    try {
      currentNode!.moveTo(null, 0);
      console.info(`${TEST_TAG} currentNode?.getId() : ${currentNode?.getId()}.`);
      console.info(`${TEST_TAG} this.rootNode!.getChild(0)?.getId() : ${this.rootNode!.getChild(0)?.getId()}.`);
      console.info(`${TEST_TAG} this.frameNode!.getChild(10)?.getId() : ${this.frameNode!.getChild(10)?.getId()}.`);
    } catch (err) {
      console.info(`${TEST_TAG} ${(err as BusinessError).code} : ${(err as BusinessError).message}`);
      console.info(`${TEST_TAG} moveTo result: fail.`);
    }
  }

  moveFrameNode_undefined_1() {
    const currentNode = this.frameNode!.getChild(10);
    try {
      currentNode!.moveTo(undefined, 0);
      console.info(`${TEST_TAG} currentNode?.getId() : ${currentNode?.getId()}.`);
      console.info(`${TEST_TAG} this.rootNode!.getChild(0)?.getId() : ${this.rootNode!.getChild(0)?.getId()}.`);
      console.info(`${TEST_TAG} this.frameNode!.getChild(10)?.getId() : ${this.frameNode!.getChild(10)?.getId()}.`);
    } catch (err) {
      console.info(`${TEST_TAG} ${(err as BusinessError).code} : ${(err as BusinessError).message}`);
      console.info(`${TEST_TAG} moveTo result: fail.`);
    }
  }

  moveFrameNode_null_2() {
    const currentNode = this.frameNode!.getChild(10);
    try {
      currentNode!.moveTo(this.rootNode, null);
      console.info(`${TEST_TAG} currentNode?.getId() : ${currentNode?.getId()}.`);
      console.info(`${TEST_TAG} this.rootNode!.getChild(0)?.getId() : ${this.rootNode!.getChild(0)?.getId()}.`);
      console.info(`${TEST_TAG} this.frameNode!.getChild(10)?.getId() : ${this.frameNode!.getChild(10)?.getId()}.`);
    } catch (err) {
      console.info(`${TEST_TAG} ${(err as BusinessError).code} : ${(err as BusinessError).message}`);
      console.info(`${TEST_TAG} moveTo result: fail.`);
    }
  }

  moveFrameNode_undefined_2() {
    const currentNode = this.frameNode!.getChild(10);
    try {
      currentNode!.moveTo(this.rootNode, undefined);
      console.info(`${TEST_TAG} currentNode?.getId() : ${currentNode?.getId()}.`);
      console.info(`${TEST_TAG} this.rootNode!.getChild(0)?.getId() : ${this.rootNode!.getChild(0)?.getId()}.`);
      console.info(`${TEST_TAG} this.frameNode!.getChild(10)?.getId() : ${this.frameNode!.getChild(10)?.getId()}.`);
    } catch (err) {
      console.info(`${TEST_TAG} ${(err as BusinessError).code} : ${(err as BusinessError).message}`);
      console.info(`${TEST_TAG} moveTo result: fail.`);
    }
  }

  // 打印节点计数
  getChildNumber() {
    return this.rootNode!.getChildrenCount();
  }

  getIdRootNodeChild_0() {
    return this.rootNode!.getChild(0)?.getId();
  }

  getIdFrameNodeChild_10() {
    return this.frameNode!.getChild(10)?.getId();
  }
}

@Entry
@Component
struct FrameNodeMethodNullUndefinedTest {
  private myNodeController: MyNodeController = new MyNodeController();
  @State index: number = 0;
  @State count: number = -1;
  @State content_1: string | undefined = '-';
  @State content_2: string | undefined = '-';

  build() {
    Column() {
      Column() {
        NodeContainer(this.myNodeController)
          .width(200)
          .height(100)
      }
      .height('50%')

      Column() {
        Row({space: 2}) {
          Text(this.count.toString()).key('FrameNodeMethodNullUndefinedTest_text_1').width('30%')
          Text(this.content_1).key('FrameNodeMethodNullUndefinedTest_text_2').width('30%')
          Text(this.content_2).key('FrameNodeMethodNullUndefinedTest_text_3').width('30%')
        }.height('8%')

        Row() {
          Button('null')
            .onClick(() => {
              this.myNodeController.appendChild_null();
            }).width('50%').key('FrameNodeMethodNullUndefinedTest_appendChild_1')
          Button('undefined')
            .onClick(() => {
              this.myNodeController.appendChild_undefined();
            }).width('50%').key('FrameNodeMethodNullUndefinedTest_appendChild_2')
        }.height('8%')

        Row() {
          Button('null_1')
            .onClick(() => {
              this.myNodeController.insertChildAfter_null_1();
            }).width('25%').key('FrameNodeMethodNullUndefinedTest_insertChildAfter_1')
          Button('undefined_1')
            .onClick(() => {
              this.myNodeController.insertChildAfter_undefined_1();
            }).width('25%').key('FrameNodeMethodNullUndefinedTest_insertChildAfter_2')
          Button('null_1')
            .onClick(() => {
              this.myNodeController.insertChildAfter_null_2();
            }).width('25%').key('FrameNodeMethodNullUndefinedTest_insertChildAfter_3')
          Button('undefined_2')
            .onClick(() => {
              this.myNodeController.insertChildAfter_undefined_2();
            }).width('25%').key('FrameNodeMethodNullUndefinedTest_insertChildAfter_4')
        }.height('8%')

        Row() {
          Button('null')
            .onClick(() => {
              this.myNodeController.removeChild_null();
            }).width('50%').key('FrameNodeMethodNullUndefinedTest_removeChild_1')
          Button('undefined')
            .onClick(() => {
              this.myNodeController.removeChild_undefined();
            }).width('50%').key('FrameNodeMethodNullUndefinedTest_removeChild_2')
        }.height('8%')

        Row() {
          Button('null_1')
            .onClick(() => {
              this.myNodeController.moveFrameNode_null_1();
            }).width('25%').key('FrameNodeMethodNullUndefinedTest_moveTo_1')
          Button('undefined_1')
            .onClick(() => {
              this.myNodeController.moveFrameNode_undefined_1();
            }).width('25%').key('FrameNodeMethodNullUndefinedTest_moveTo_2')
          Button('null_2')
            .onClick(() => {
              this.myNodeController.moveFrameNode_null_2();
            }).width('25%').key('FrameNodeMethodNullUndefinedTest_moveTo_3')
          Button('undefined_2')
            .onClick(() => {
              this.myNodeController.moveFrameNode_undefined_2();
            }).width('25%').key('FrameNodeMethodNullUndefinedTest_moveTo_4')
        }.height('8%')

        Row() {
          Button('getChildNumber')
            .onClick(() => {
              this.count = this.myNodeController.getChildNumber();
            }).width('30%').key('FrameNodeMethodNullUndefinedTest_getChildNumber')
          Button('getId_1')
            .onClick(() => {
              this.content_1 = this.myNodeController.getIdRootNodeChild_0();
            }).width('30%').key('FrameNodeMethodNullUndefinedTest_getRootNodeChildId')
          Button('getId_2')
            .onClick(() => {
              this.content_2 = this.myNodeController.getIdFrameNodeChild_10();
            }).width('30%').key('FrameNodeMethodNullUndefinedTest_getFrameNodeChildId')
        }.height('8%')
      }
      .height('50%')

    }
    .width('100%')
    .height('100%')
  }
}