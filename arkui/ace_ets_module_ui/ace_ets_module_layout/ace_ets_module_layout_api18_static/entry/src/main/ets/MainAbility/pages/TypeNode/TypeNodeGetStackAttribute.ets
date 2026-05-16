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
    let stack = typeNode.createStackNode(uiContext);
    stack.initialize().width('30%').height('10%');
    node.appendChild(stack);
    // 创建Stack
    let stack1 = typeNode.createStackNode(uiContext);
    stack1.initialize().width('50%').height('20%').backgroundColor(Color.Pink);
    // 获取Stack的属性
    typeNode.getStackAttribute(stack1)?.backgroundColor(Color.Blue).width('90%').height('30%').id('getStackAttribute')
    stack.appendChild(stack1);
    return node;
  }
}

@Entry
@Component
struct TypeNodeGetStackAttribute {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Text('Stack sample')
        .height('5%')
      NodeContainer(this.myNodeController)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F5F5F5')
  }
}