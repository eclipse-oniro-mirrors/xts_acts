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
import { NodeController, FrameNode, UIContext, router } from '@kit.ArkUI';
@Entry
@Component
struct convertPointError12{
  private uiContext: UIContext = this.getUIContext();
  @State nodeAOk: boolean = false;
  @State nodeBOK: boolean = false;
  @State PX:Length|undefined = 0 ;
  @State PY:Length|undefined = 0 ;
  @State error:number = 100024 ;
  @State text1:string= '' ;

  build() {
    Column({ space: 30 }) {
      // 设置子元素垂直方向间距为5
      Text('测试position 坐标为++').width('90%')
      Column({ space: 30 }) {
        Column(){
          Circle({ width: 10, height: 10 })
            .position({ x: 10, y: 10 })
            .id('cirlceA')
        }.width('100%').height(0).backgroundColor(0xAFEEEE).id('testNodeA').onAppear(()=>{this.nodeAOk = true})

        Column(){
          Circle({ width: 10, height: 10 })
            .position({ x: this.PX, y: this.PY })
            .id('cirlceB')
        }.width('100%').height(0).backgroundColor(0x00FFFF).id('testNodeB').onAppear(()=>{this.nodeBOK = true})

      }.width('100%').height(100).border({ width: 1 })
      Button('运行convertPoint测试').id('button1')
        .onClick(() => {
          this.runBasicTest();
        })

      Text(`${this.error}`).id('text1')
      Text(''+ 100024).id('text2')
    }
    .width('100%')
    .height('100%')
  }

  private runBasicTest() {
    if(!this.nodeAOk||!this.nodeBOK) {
      return

    }

    console.info(' 2')
    // 等待UI渲染完成
    if (!this.uiContext) {
      console.info(' 无法获取测试节点 1');
      return
    }
    const nodeA = this.uiContext.getAttachedFrameNodeById('testNodeA');
    const nodeB = this.uiContext.getAttachedFrameNodeById('testNodeB');

    if (!nodeA || !nodeB) {
      console.info(' 无法获取测试节点');
      if (!nodeA) {
        console.info(' 2222')
      }
      if (!nodeB) {
        console.info(' 3333')
      }
      return;
    }

    // 测试1: 基本转换
    console.info(' 基本坐标转换')
    if (!nodeB.isAttached()) {
      console.info('nodeB已从UI树中移除，无法转换坐标');
      return;
    }
    let frameNode = new FrameNode(this.uiContext!);
    frameNode.commonAttribute.backgroundColor(Color.Pink);
    frameNode.commonAttribute.size({ width: 100, height: 100 });
    frameNode.commonAttribute.position({ x: 50, y: 0 });
    try{

      const result: Position = nodeA.convertPosition({ x: this.PX as number, y: this.PY as number }, frameNode);
      console.info(' succ')
      this.PX = result.x
      this.PY = result.y
    } catch (e) {
      console.error(' err' + e);
      this.error = (e as BusinessError).code
      console.info('333'+ this.error)
    }

  }
}