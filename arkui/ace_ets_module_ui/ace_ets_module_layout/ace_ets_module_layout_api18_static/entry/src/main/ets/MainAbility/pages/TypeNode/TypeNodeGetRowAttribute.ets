'use static';
import {
  Entry,
  Text,
  Column,
  Component,
  Color,
  FlexAlign
} from '@ohos.arkui.component';
import { NodeController, FrameNode, typeNode } from '@ohos.arkui.node';
import { NodeContainer } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

export class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute;
    let row = typeNode.createRowNode(uiContext);
    row.initialize().width('30%').height('10%');
    node.appendChild(row);
    // 创建Row
    let row1 = typeNode.createRowNode(uiContext);
    row1.initialize().width('50%').height('20%').backgroundColor(Color.Pink);
    // 获取Row的属性
    typeNode.getRowAttribute(row1)?.backgroundColor(Color.Blue).width('90%').height('30%').id('getRowAttribute')
    row.appendChild(row1);
    return node;
  }
}

@Entry
@Component
struct TypeNodeGetRowAttribute {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Text('Row sample')
        .height('5%')
      NodeContainer(this.myNodeController)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F5F5F5')
  }
}