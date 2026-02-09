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
import { FrameNode, NodeController, BuilderNode } from "@ohos.arkui.node";
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
  wrapBuilder,
  WrappedBuilder,
  CustomBuilderT,
  ColumnOptions
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private builderNode: BuilderNode<[]> | null = null;
  private wrappedBuilder: WrappedBuilder<CustomBuilderT<[]>>;

  constructor(builder: WrappedBuilder<CustomBuilderT<[]>>) {
    super();
    this.wrappedBuilder = builder;
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    this.builderNode = new BuilderNode<[]>(uiContext, { selfIdealSize: { width: 200, height: 100 } });
    this.builderNode?.build(this.wrappedBuilder,[]);

    return this.builderNode?.getFrameNode()!;
  }

  dispose() {
    if (this.builderNode !== null) {
      this.builderNode?.getFrameNode()?.disposeTree()
    }
  }

  removeBuilderNode() {
    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null && this.builderNode !== null && this.builderNode?.getFrameNode() !== null) {
      rootRenderNode!.removeChild(this.builderNode!.getFrameNode()!.getRenderNode()!);
    }
  }
}

@Component
struct TestComponent {
  private myNodeController: MyNodeController = new MyNodeController(wrapBuilder<CustomBuilderT<[]>>(buildComponent2));
  @State text: string = 'start'
  build() {
    Column() {
      Text(`start${this.text}`).id('APIdisposeTree_Text')  //SDK11.22 状态改变，页面没改
        .onClick((e:ClickEvent)=>{
          let strJson: string = inspector.getInspectorByKey('APIdisposeTree_Text');
          this.text = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight') + '' //得到700，但页面没刷新
          console.log('++++++++++++++++',JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'),'this.text:',this.text)
        })
        .fontSize(36)
        .fontWeight(700)
      NodeContainer(this.myNodeController)
    }
    .width('100%')
    .backgroundColor(Color.Gray)
  }

  aboutToAppear() {
    console.error('BuilderNode aboutToAppear');
  }

  aboutToDisappear() {
    console.error('BuilderNode aboutToDisappear');
  }
}

@Component
struct TestComponent2 {
  private myNodeController: MyNodeController = new MyNodeController(wrapBuilder<CustomBuilderT<[]>>(buildComponent3));
  private myNodeController2: MyNodeController = new MyNodeController(wrapBuilder<CustomBuilderT<[]>>(buildComponent4));

  build() {
    Column() {
      Text('This is a BuilderNode 2.')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
      NodeContainer(this.myNodeController)
      NodeContainer(this.myNodeController2)
    }
    .width('100%')
    .backgroundColor(Color.Gray)
  }

  aboutToAppear() {
    console.error('BuilderNode 2 aboutToAppear');
  }

  aboutToDisappear() {
    console.error('BuilderNode 2 aboutToDisappear');
  }
}

@Component
struct TestComponent3 {
  build() {
    Column() {
      Text('This is a BuilderNode 3.')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .backgroundColor(Color.Gray)
  }

  aboutToAppear() {
    console.error('BuilderNode 3 aboutToAppear');
  }

  aboutToDisappear() {
    console.error('BuilderNode 3 aboutToDisappear');
  }
}

@Component
struct TestComponent4 {
  build() {
    Column() {
      Text('This is a BuilderNode 4.')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

    }
    .width('100%')
    .backgroundColor(Color.Gray)
  }

  aboutToAppear() {
    console.error('BuilderNode 4 aboutToAppear');
  }

  aboutToDisappear() {
    console.error('BuilderNode 4 aboutToDisappear');
  }
}

@Builder
function buildComponent() {
  TestComponent()
}

@Builder
function buildComponent2() {
  TestComponent2()
}

@Builder
function buildComponent3() {
  TestComponent3()
}

@Builder
function buildComponent4() {
  TestComponent4()
}

@Entry
@Component
struct APIdisposeTree {
  private myNodeController: MyNodeController = new MyNodeController(wrapBuilder<CustomBuilderT<[]>>(buildComponent));

  build() {
    Column({ space: 0 } as ColumnOptions) {
      Button('BuilderNode rebuild').key('APIdisposeTree_Button1')
        .onClick((e:ClickEvent) => {
          this.myNodeController.rebuild();
        }).height(80)
        .width('100%')
      NodeContainer(this.myNodeController)
      Button('BuilderNode dispose').key('APIdisposeTree_Button2')
        .onClick((e:ClickEvent) => {
          this.myNodeController.dispose();
        })
        .width('100%').height(80)
    }
  }
}