'use static';
import {
  Entry,
  Text,
  Column,
  Component,
  Color
} from '@ohos.arkui.component';
import { NodeController, FrameNode, typeNode } from '@ohos.arkui.node';
import { NodeContainer } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

export class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute;
    let relative = typeNode.createRelativeContainerNode(uiContext);
    relative.initialize().width('30%').height('10%');
    node.appendChild(relative);
    // 创建RelativeContainer
    let relative1 = typeNode.createRelativeContainerNode(uiContext);
    relative1.initialize().width('50%').height('20%').backgroundColor(Color.Pink);
    // 获取RelativeContainer的属性
    typeNode.getRelativeContainerAttribute(relative1)?.backgroundColor(Color.Blue).width('90%').height('30%').id('getRelativeContainerAttribute')
    relative.appendChild(relative1);
    return node;
  }
}

@Entry
@Component
struct TypeNodeGetRelativeContainerAttribute {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Text('RelativeContainer sample')
        .height('5%')
      NodeContainer(this.myNodeController)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F5F5F5')
  }
}