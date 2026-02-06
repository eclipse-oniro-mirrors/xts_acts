/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { NodeController, FrameNode, BuilderNode } from '@kit.ArkUI';

class Params {
  public text: string = 'this is a text'
}

@Builder
function buttonBuilder1(params: Params) {
  Column() {
    Button(params.text)
      .fontSize(20)
      .borderRadius(8)
      .borderWidth(2)
      .backgroundColor(Color.Orange)
  }
}

@Builder
function buttonBuilder2(params: Params) {
  Column() {
    Button(params.text)
      .fontSize(20)
      .borderRadius(8)
      .borderWidth(2)
      .backgroundColor(Color.Grey)
  }
}

class MyNodeController extends NodeController {
  public attachValue: string = '0';
  public detachValue: string = '0';
  public bindValue: string = '0';
  public willBindValue: string = '0';
  public unbindValue: string = '0';
  public willUnbindValue: string = '0';

  private buttonNode: BuilderNode<[Params]> | null = null;
  private wrapBuilder: WrappedBuilder<[Params]> = wrapBuilder(buttonBuilder1);

  makeNode(uiContext: UIContext): FrameNode {
    if (this.buttonNode == null) {
      this.buttonNode = new BuilderNode(uiContext);
      this.buttonNode.build(this.wrapBuilder, { text: 'This is a Button1' })
    }
    return this.buttonNode!.getFrameNode()!;
  }

  onBind(containerId: number): void {
    console.log('test666666 on bind1: '+containerId);
    this.bindValue = 'bind';
  }

  onUnbind(containerId: number): void {
    console.log('test666666 on unbind1: '+containerId);
    this.unbindValue = 'unbind';

  }

  onWillBind(containerId: number): void {
    console.log('test666666 about to bind1: '+containerId);
    this.willBindValue = 'willBind';
  }

  onWillUnbind(containerId: number): void {
    console.log('test666666 about to unbind1: '+containerId);
    this.willUnbindValue = 'willUnbind';
  }

  onAttach(): void {
    console.log('test666666 on attach1111111');
    this.attachValue = 'attach';
  }

  onDetach(): void {
    console.log('test666666 on detach1');
    this.detachValue = 'detach';
  }
}

class MyNodeController2 extends NodeController {
  public attachValue: string = '0';
  public detachValue: string = '0';
  public bindValue: string = '0';
  public willBindValue: string = '0';
  public unbindValue: string = '0';
  public willUnbindValue: string = '0';

  private buttonNode: BuilderNode<[Params]> | null = null;
  private wrapBuilder: WrappedBuilder<[Params]> = wrapBuilder(buttonBuilder2);

  makeNode(uiContext: UIContext): FrameNode {
    if (this.buttonNode == null) {
      this.buttonNode = new BuilderNode(uiContext);
      this.buttonNode.build(this.wrapBuilder, { text: 'This is a Button2' })
    }
    return this.buttonNode!.getFrameNode()!;
  }

  onBind(containerId: number): void {
    console.log('test666666 on bind2: '+containerId);
    this.bindValue = 'bind';
  }

  onUnbind(containerId: number): void {
    console.log('test666666 on unbind2: '+containerId);
    this.unbindValue = 'unbind';
  }

  onWillBind(containerId: number): void {
    console.log('test666666 about to bind2: '+containerId);
    this.willBindValue = 'willBind';
  }

  onWillUnbind(containerId: number): void {
    console.log('test666666 about to unbind2: '+containerId);
    this.willUnbindValue = 'willUnbind';
  }

  onAttach(): void {
    console.log('test66666 on attach222222');
    this.attachValue = 'attach';
  }

  onDetach(): void {
    console.log('test666666 on detach2');
    this.detachValue = 'detach';
  }

}

@Entry
@Component
struct UpDownTreeEventIndex {
  @State attachValue: string = '0';
  @State detachValue: string = '0';
  @State bindValue: string = '0';
  @State willBindValue: string = '0';
  @State unbindValue: string = '0';
  @State willUnbindValue: string = '0';

  @State isShow: boolean = true;
  @State index: number = 0;
  private myNodeController1: MyNodeController = new MyNodeController();
  private myNodeController2: MyNodeController2 = new MyNodeController2();
  private myNodeControllerArray: Array<MyNodeController | MyNodeController2> = [
  this.myNodeController1,
  this.myNodeController2,
  ]

  build() {
    Column() {
      if(this.isShow){
        NodeContainer(this.myNodeControllerArray[this.index % this.myNodeControllerArray.length])
      }

      Button('bindAndUnbinde')
        .onClick(() => {
          this.index++;
        })
        .fontSize(20)
        .width(150)
        .height('10%')

      Button('upDownTree')
        .id('upDownTree')
        .onClick(() => {
          this.isShow = !this.isShow
        })
        .fontSize(20)
        .width(150)
        .height('10%')

      Text(this.attachValue).height('5%')
        .id('attachValue_id')
      Text(this.detachValue).height('5%')
        .id('detachValue_id')
      Text(this.bindValue).height('5%')
        .id('bindValue_id')
      Text(this.willBindValue).height('5%')
        .id('willBindValue_id')
      Text(this.unbindValue).height('5%')
        .id('unbindValue_id')
      Text(this.willUnbindValue).height('5%')
        .id('willUnbindValue_id')

      // 直接点TestValue 1.attach 2.bind 3.willBind
      // 点上下树再点TestValue 1.detach 2.unbind 3.willUnbind
      Button('TestValue').height('10%')
        .id('getTestValue')
        .onClick(()=>{
          if (this.myNodeControllerArray[this.index % this.myNodeControllerArray.length] != null) {
            let node =this.myNodeControllerArray[this.index % this.myNodeControllerArray.length];
            this.attachValue = node.attachValue
            this.detachValue = node.detachValue
            this.bindValue = node.bindValue
            this.willBindValue = node.willBindValue
            this.unbindValue = node.unbindValue
            this.willUnbindValue = node.willUnbindValue
          }
        })
    }
    .padding({ left: 35, right: 35, top: 35 })
    .width('100%')
    .height('100%')
  }
}