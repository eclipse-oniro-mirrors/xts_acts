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
@Entry
@Component
struct convertPoint {
  private uiContext: UIContext = this.getUIContext();
  @State nodeAOk: boolean = false;
  @State nodeBOK: boolean = false;
  @State PX:Length|undefined = 0 ;
  @State PY:Length|undefined = 0 ;
  @State istext1:string = '' ;
  @State istext2:string = '' ;

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
          console.info('click')
          this.runBasicTest();


        })
        .margin(20)

      Button('button').id('button2')
        .onClick(() => {
          const nodeC = this.uiContext.getAttachedFrameNodeById('cirlceA');
          const nodeD = this.uiContext.getAttachedFrameNodeById('cirlceB');
          this.istext1 = nodeC?.getPositionToScreen().x+ ' cirlce ' + nodeC?.getPositionToScreen().y
          this.istext2 = nodeD?.getPositionToScreen().x + ' cirlce ' + nodeD?.getPositionToScreen().y
        })

      Text(this.istext1).id('text1')
      Text(this.istext2).id('text2')
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
    const result: Position | undefined = nodeA.convertPosition({x:10,y:10}, nodeB); // 显式声明可能返回 undefined
    this.PX = result.x
    this.PY = result.y

    if (result === undefined) {
      console.info(' 转换失败，返回 undefined');
      return;
    }

    // 3. 安全访问 x/y 属性
    console.info(` 输出: (${result.x}, ${result.y})`);

  }
}