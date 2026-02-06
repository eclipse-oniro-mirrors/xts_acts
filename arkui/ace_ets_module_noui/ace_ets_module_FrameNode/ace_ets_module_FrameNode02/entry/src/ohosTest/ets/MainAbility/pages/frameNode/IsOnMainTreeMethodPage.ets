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
import { NodeController, FrameNode, UIContext, typeNode } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

const TEST_TAG: string = 'jyy FrameNode '

// 继承NodeController实现自定义UI控制器
class MyNodeController extends NodeController {
  public frameNode: FrameNode | null = null;
  public frameNode2: FrameNode | null = null;
  public frameNode3: FrameNode | null = null;
  public frameNode4: FrameNode | null = null;
  public frameNodeNull: FrameNode | null = null;
  public appendChlidNode: FrameNode | null = null;
  public insertChildNode: FrameNode | null = null;
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
    this.frameNode.commonAttribute.key('FrameNodeTest_1');
    this.addCommonEvent(this.frameNode)
    this.rootNode.appendChild(this.frameNode);
    this.childrenCount = this.childrenCount + 1;
    for (let i = 0; i < 5; i++) {
      let childNode = new FrameNode(uiContext);
      childNode.commonAttribute.size({ width: 50, height: 50 }).key('ChildNode_' + i);
      this.childList.push(childNode);
      this.frameNode.appendChild(childNode);

      for (let j = 0; j < 2; j++) {
        let grandson = typeNode.createNode(uiContext, 'Text');
        grandson.initialize('Text_' + j).fontColor(Color.Blue).fontSize(14).key('GrandSon_' + j);
        childNode.appendChild(grandson);
      }
    }

    this.frameNode2 = new FrameNode(uiContext);
    this.frameNode2.commonAttribute.backgroundColor(Color.Pink);
    this.frameNode2.commonAttribute.size({ width: 100, height: 100 });
    this.frameNode2.commonAttribute.key('FrameNodeTest_2');

    this.frameNode3 = new FrameNode(uiContext);
    this.frameNode3.commonAttribute.backgroundColor(Color.Pink);
    this.frameNode3.commonAttribute.size({ width: 100, height: 100 });
    this.frameNode3.commonAttribute.key('FrameNodeTest_3');
    this.rootNode.appendChild(this.frameNode3);

    this.frameNode4 = new FrameNode(uiContext);
    this.frameNode4.commonAttribute.backgroundColor(Color.Pink);
    this.frameNode4.commonAttribute.size({ width: 100, height: 100 });
    this.frameNode4.commonAttribute.key('FrameNodeTest_4');
    this.frameNode.appendChild(this.frameNode4);

    return this.rootNode;
  }

  addCommonEvent(frameNode: FrameNode) {
    frameNode.commonEvent.setOnClick((event: ClickEvent) => {
      console.info(`Click FrameNode: ${JSON.stringify(event)}`)
    })
  }

  clearChildren() {
    this.rootNode!.clearChildren();
    console.log(TEST_TAG + `rootNode.clearChildren()`);
  }

  rootDisposeTree() {
    this.rootNode?.disposeTree();
    console.log(TEST_TAG + `rootNode.disposeTree()`);
  }

  rootNodeDispose() {
    this.rootNode?.dispose();
    console.log(TEST_TAG + `rootNode.dispose()`);
  }

  testrootNodeTest() {
    try {
      AppStorage.SetOrCreate('testrootNodeTest', this.rootNode!.isOnMainTree());
      console.log(TEST_TAG + `rootNode isOnMainTree: ${this.rootNode!.isOnMainTree()}`);
    } catch (err) {
      AppStorage.SetOrCreate('testrootNodeTest', (err as BusinessError).code);
      console.log(TEST_TAG + `rootNode isOnMainTree: ${JSON.stringify(err)}`);
    }
  }
  testFrameNodeTest1() {
    try {
      AppStorage.SetOrCreate('testFrameNodeTest1', this.frameNode!.isOnMainTree());
      console.log(TEST_TAG + `FrameNodeTest_1 isOnMainTree: ${this.frameNode!.isOnMainTree()}`);
    } catch (err) {
      AppStorage.SetOrCreate('testFrameNodeTest1', (err as BusinessError).code);
      console.log(TEST_TAG + `FrameNodeTest_1 isOnMainTree: ${JSON.stringify(err)}`);
    }
  }
  testFrameNodeTest2() {
    try {
      AppStorage.SetOrCreate('testFrameNodeTest2', this.frameNode2!.isOnMainTree());
      console.log(TEST_TAG + `FrameNodeTest_2 isOnMainTree: ${this.frameNode2!.isOnMainTree()}`);
    } catch (err) {
      AppStorage.SetOrCreate('testFrameNodeTest2', (err as BusinessError).code);
      console.log(TEST_TAG + `FrameNodeTest_2 isOnMainTree: ${JSON.stringify(err)}`);
    }
  }
  testFrameNodeTest3() {
    try {
      AppStorage.SetOrCreate('testFrameNodeTest3', this.frameNode3!.isOnMainTree());
      console.log(TEST_TAG + `FrameNodeTest_3 isOnMainTree: ${this.frameNode3!.isOnMainTree()}`);
    } catch (err) {
      AppStorage.SetOrCreate('testFrameNodeTest3', (err as BusinessError).code);
      console.log(TEST_TAG + `FrameNodeTest_3 isOnMainTree: ${JSON.stringify(err)}`);
    }
  }
  testFrameNodeTest4() {
    try {
      AppStorage.SetOrCreate('testFrameNodeTest4', this.frameNode4!.isOnMainTree());
      console.log(TEST_TAG + `FrameNodeTest_4 isOnMainTree: ${this.frameNode4!.isOnMainTree()}`);
    } catch (err) {
      AppStorage.SetOrCreate('testFrameNodeTest4', (err as BusinessError).code);
      console.log(TEST_TAG + `FrameNodeTest_4 isOnMainTree: ${JSON.stringify(err)}`);
    }
  }
  nullTest() {
    try {
      AppStorage.SetOrCreate('IsOnMainTreeMethodPage_nullTest', this.frameNodeNull!.isOnMainTree());
      console.log(TEST_TAG + `frameNodeNull isOnMainTree: ${this.frameNodeNull!.isOnMainTree()}`);
    } catch (err) {
      AppStorage.SetOrCreate('IsOnMainTreeMethodPage_nullTest', err.toString());
      console.log(TEST_TAG + `frameNodeNull isOnMainTree: ${err}`);
    }
  }
}

@Entry
@Component
struct IsOnMainTreeMethodPage {
  private myNodeController: MyNodeController = new MyNodeController();
  private scroller: Scroller = new Scroller();
  @State index: number = 0;
  @State flag: boolean = true;

  build() {
    Scroll(this.scroller) {
      Column({ space: 5 }) {
        Column() {
          if (this.flag) {
            NodeContainer(this.myNodeController)
              .borderWidth(1)
              .width(200)
              .height(100)
          }
        }

        Row() {
          Button('node_1')
            .width('25%')
            .onClick(() => {
              this.myNodeController.testFrameNodeTest1()
            }).key('IsOnMainTreeMethodPage_btn_1')

          Button('node_2')
            .width('25%')
            .onClick(() => {
              this.myNodeController.testFrameNodeTest2()
            }).key('IsOnMainTreeMethodPage_btn_2')

          Button('node_3')
            .width('25%')
            .onClick(() => {
              this.myNodeController.testFrameNodeTest3()
            }).key('IsOnMainTreeMethodPage_btn_3')

          Button('node_4')
            .width('25%')
            .onClick(() => {
              this.myNodeController.testFrameNodeTest4()
            }).key('IsOnMainTreeMethodPage_btn_4')
        }

        Row() {
          Button('RootNode')
            .width('25%')
            .onClick(() => {
              this.myNodeController.testrootNodeTest()
            }).key('IsOnMainTreeMethodPage_btn_5')

          Button('NullTest')
            .width('25%')
            .onClick(() => {
              this.myNodeController.nullTest();
            }).key('IsOnMainTreeMethodPage_btn_6')

          Button('Show/Hide')
            .width('25%')
            .onClick(() => {
              this.flag = !this.flag
            }).key('IsOnMainTreeMethodPage_btn_7')
        }

        Row() {
          Button('clearChildren')
            .width('25%')
            .onClick(() => {
              this.myNodeController.clearChildren();
            }).key('IsOnMainTreeMethodPage_btn_8')

          Button('Dispose')
            .width('25%')
            .onClick(() => {
              this.myNodeController.rootNodeDispose();
            }).key('IsOnMainTreeMethodPage_btn_9')

          Button('DisposeTree')
            .width('25%')
            .onClick(() => {
              this.myNodeController.rootDisposeTree();
            }).key('IsOnMainTreeMethodPage_btn_10')
        }
      }
      .width('100%')
    }
    .scrollable(ScrollDirection.Vertical) // 滚动方向为纵向
  }
}