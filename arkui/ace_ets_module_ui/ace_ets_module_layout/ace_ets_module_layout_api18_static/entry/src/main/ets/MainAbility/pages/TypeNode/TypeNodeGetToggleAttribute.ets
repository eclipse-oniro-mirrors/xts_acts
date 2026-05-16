'use static';
import {
  Entry, Text, Column, Component, Color, ToggleType
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
    // // 创建Toggle
    let toggle = typeNode.createToggleNode(uiContext, { type: ToggleType.Switch, isOn: false });
    toggle.initialize({ type: ToggleType.Switch, isOn: false  });
    // // 获取Toggle的属性
    typeNode.getToggleAttribute(toggle)?.selectedColor(Color.Blue).backgroundColor(Color.Blue).width('90%').id('getToggleAttribute')
    col.appendChild(toggle);
    return node;
  }
}

@Entry
@Component
struct FrameNodeTypeTest {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Text('Toggle sample')
        .height('10%')
      NodeContainer(this.myNodeController)
    }
    .height('100%')
    .width('100%')
  }
}