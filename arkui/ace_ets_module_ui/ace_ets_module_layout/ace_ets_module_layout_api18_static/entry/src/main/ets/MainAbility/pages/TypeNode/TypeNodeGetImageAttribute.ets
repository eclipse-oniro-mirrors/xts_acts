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
    let image = typeNode.createImageNode(uiContext);
    // image.initialize().width('30%').height('10%');
    node.appendChild(image);
    // 创建Image
    let image1 = typeNode.createImageNode(uiContext);
    // image1.initialize().width('50%').height('20%').backgroundColor(Color.Pink);
    // 获取Image的属性
    typeNode.getImageAttribute(image1)?.backgroundColor(Color.Blue).width('90%').height('30%').id('getImageAttribute')
    image.appendChild(image1);
    return node;
  }
}

@Entry
@Component
struct TypeNodeGetImageAttribute {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Text('Image sample')
        .height('5%')
      NodeContainer(this.myNodeController)
    }
    .height('100%')
    .width('100%')
    .padding(5)
    .backgroundColor('#F5F5F5')
  }
}