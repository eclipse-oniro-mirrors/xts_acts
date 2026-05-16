'use static';
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Alignment,
  Color,
  FlexAlign
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
    // 创建Column
    let col1 = typeNode.createColumnNode(uiContext);
    col1.initialize().width('50%').height('20%').backgroundColor(Color.Pink);
    // 获取Column的属性
    typeNode.getColumnAttribute(col)?.backgroundColor(Color.Blue).width('90%').id('getColumnAttribute')
    col.appendChild(col1);
    return node;
  }
}

@Entry
@Component
struct FrameNodeTypeTest {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Text('Column sample')
        .height('10%')
      NodeContainer(this.myNodeController)
    }
    .height('100%')
    .width('100%')
  }
}