'use static'

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  Color
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { NodeController, FrameNode } from '@ohos.arkui.node';
import { NodeContainer } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ConvertPositionTest {
  private uiContext: UIContext = this.getUIContext();
  @State convertResult: string = ''
  @State nodeAOk: boolean = false;
  @State nodeBOK: boolean = false;

  build() {
    Column() {
      Text(`FrameNode ConvertPosition Test`)
        .height('10%')
        .id('testNodeA')
        .fontSize(8)
        .onAppear(() => {
          this.nodeAOk = true;
        })
      Column() {
        Text('testNodeB')
          .height('10%')
          .id('testNodeB')
          .fontSize(8)
          .onAppear(() => {
            this.nodeBOK = true;
          })
      }
      .height('30%')
      Button('运行convertPosition测试')
        .id('ButtonConvertPosition')
        .height('5%')
        .onClick(() => {
          this.convertResult = this.runBasicTest();
        })
      Text(this.convertResult)
        .id('convertResult')
        .height('10%')
        .fontSize(8)
    }
    .width('100%')
    .height('100%')
  }

  private runBasicTest() {
    if (!this.nodeAOk || !this.nodeBOK) {
      return 'convertPosition false';
    }

    if (!this.uiContext) {
      return 'convertPosition false';
    }
    const nodeA = this.uiContext.getAttachedFrameNodeById('testNodeA');
    const nodeB = this.uiContext.getAttachedFrameNodeById('testNodeB');

    if (!nodeA || !nodeB) {
      console.info('无法获取测试节点');
      return 'convertPosition false';
    }

    const result = nodeA.convertPosition({ x: 30, y: 10 }, nodeB);
    if (result === undefined) {
      console.info('convertPosition 转换失败');
      return 'convertPosition false';
    }
    return 'convertPosition success';
  }
}