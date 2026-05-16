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

import { ReactiveBuilderNode, FrameNode, NodeController, Binding, UIUtils } from '@kit.ArkUI';

@Builder
function buildText(count: Binding<number>) {
  Column() {
    TextBuilder({ message: count.value })
  }
}

class TextNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private textNode: ReactiveBuilderNode<[Binding<number>]> | null = null;
  private count: number = 0;

  makeNode(context: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(context);
    this.textNode = new ReactiveBuilderNode(context, { selfIdealSize: { width: 150, height: 150 } });
    this.textNode.build(wrapBuilder<[Binding<number>]>(buildText), {}, UIUtils.makeBinding<number>(() => {
      return this.count
    }));
    this.textNode.inheritFreezeOptions(false);
    if (this.rootNode !== null) {
      this.rootNode.appendChild(this.textNode.getFrameNode());
    }
    return this.rootNode;
  }

  update(): void {
    if (this.textNode !== null) {
      this.count += 1;
      this.textNode.flushState();
    }
  }
}

const textNodeController: TextNodeController = new TextNodeController();

@Entry
@Component
struct MyNavigationTestStack {
  @Provide('pageInfo') pageInfo: NavPathStack = new NavPathStack();
  @State message: number = 0;
  @State logNumber: number = 0;
  @State str : string = 'hello'

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      pageOneStack({ message: $message, logNumber: $logNumber })
    } else if (name === 'pageTwo') {
      pageTwoStack({ message: $message, logNumber: $logNumber })
    }
  }

  @Builder
  CustomTitle() {
    Text('NavIndex')
      .height(25)
      .fontColor(Color.Black)
  }

  build() {
    Column() {
      Text(this.str).height(25).id('builderNodeInheritFreezeOptionsFalseText')
      Button('updateBuilderNode')
        .height(25)
        .width(120)
        .onClick(() => {
          textNodeController.update();
          this.str = 'inheritFreezeOptions'
        })
        .id('builderNodeInheritFreezeOptionsFalse')

      Navigation(this.pageInfo) {
        Column() {
          Button('NextPage', { stateEffect: true, type: ButtonType.Capsule })
            .height(25)
            .width(100)
            .onClick(() => {
              this.pageInfo.pushPath({ name: 'pageOne' });
            })
        }
      }
      .title(this.CustomTitle)
      .navDestination(this.PageMap)
      .mode(NavigationMode.Stack)
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct pageOneStack {
  @Consume('pageInfo') pageInfo: NavPathStack;
  @State index: number = 1;
  @Link message: number;
  @Link logNumber: number;

  build() {
    NavDestination() {
      Column() {
        NavigationContentMsgStack({ message: this.message, index: this.index, logNumber: this.logNumber })

        Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
          .fontSize(18)
          .width('80%')
          .height(40)
          .margin(8)
          .onClick(() => {
            this.pageInfo.pushPathByName('pageTwo', null);
          })

        Button('Back Page', { stateEffect: true, type: ButtonType.Capsule })
          .fontSize(18)
          .width('80%')
          .height(40)
          .margin(8)
          .onClick(() => {
            this.pageInfo.pop();
          })
      }
      .width('100%')
      .height('100%')
    }
    .title('pageOne')
    .onBackPressed(() => {
      this.pageInfo.pop();
      return true;
    })
  }
}

@Component
struct pageTwoStack {
  @Consume('pageInfo') pageInfo: NavPathStack;
  @State index: number = 2;
  @Link message: number;
  @Link logNumber: number;

  build() {
    NavDestination() {
      Column({ space: 8 }) {
        NavigationContentMsgStack({ message: this.message, index: this.index, logNumber: this.logNumber })

        Text('BuilderNode处于冻结状态')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 16, bottom: 16 })

        Button('Back Page', { stateEffect: true, type: ButtonType.Capsule })
          .fontSize(18)
          .width('80%')
          .height(40)
          .margin(8)
          .onClick(() => {
            this.pageInfo.pop();
          })
      }
      .width('100%')
      .height('100%')
    }
    .title('pageTwo')
    .onBackPressed(() => {
      this.pageInfo.pop();
      return true;
    })
  }
}

@Component({ freezeWhenInactive: true })

struct NavigationContentMsgStack {
  @Link message: number;
  @Link index: number;
  @Link logNumber: number;

  build() {
    Column() {
      if (this.index === 1) {
        NodeContainer(textNodeController)
          .margin({ bottom: 5 })
      }
    }
  }
}

@Component({ freezeWhenInactive: true })
struct TextBuilder {
  @Prop @Watch('info') message: number = 0;
  @State count: number = 0;

  info() {
    this.count++;
    console.info(`freeze-test TextBuilder message callback change time ${this.count}`);
    console.info(`freeze-test TextBuilder message callback change massage ${this.message}`);
  }

  build() {
    Row() {
      Column() {
        Text(`文本更新内容： ${this.message}`)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 16, bottom: 16 })

        Text(`文本更新次数： ${this.count}`)
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 16, bottom: 16 })
      }
    }
  }
}