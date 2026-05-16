'use static';
import {
  Entry, Text, Column, Component, Color
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import { NodeController, FrameNode, typeNode } from '@ohos.arkui.node';
import { NodeContainer } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

export class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute;
    let col = typeNode.createColumnNode(uiContext);
    col.initialize().width('30%');
    node.appendChild(col);
    // 创建Progress
    let progress = typeNode.createProgressNode(uiContext);
    progress.initialize({ value: 40, total: 100 })
      .value(30)
      .width('50%')
      .height('20%')
      .backgroundColor(Color.Pink);
    // 获取Progress的属性
    typeNode.getProgressAttribute(progress)?.value(60).backgroundColor(Color.Blue)
      .width('90%')
      .id('getProgressAttribute')
    col.appendChild(progress);
    return node;
  }
}

@Entry
@Component
struct FrameNodeTypeTest {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Text('Progress sample')
        .height('10%')
      NodeContainer(this.myNodeController)
    }
    .height('100%')
    .width('100%')
  }
}