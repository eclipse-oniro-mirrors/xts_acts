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
    let flex = typeNode.createFlexNode(uiContext);
    flex.initialize().width('30%').height('10%');
    node.appendChild(flex);
    // 创建Flex
    let flex1 = typeNode.createFlexNode(uiContext);
    flex1.initialize().width('50%').height('20%').backgroundColor(Color.Pink);
    // 获取Flex的属性
    typeNode.getFlexAttribute(flex1)?.backgroundColor(Color.Blue).width('90%').height('30%').id('getFlexAttribute')
    flex.appendChild(flex1);
    return node;
  }
}

@Entry
@Component
struct TypeNodeGetFlexAttribute {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Text('Flex sample')
        .height('5%')
      NodeContainer(this.myNodeController)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F5F5F5')
  }
}