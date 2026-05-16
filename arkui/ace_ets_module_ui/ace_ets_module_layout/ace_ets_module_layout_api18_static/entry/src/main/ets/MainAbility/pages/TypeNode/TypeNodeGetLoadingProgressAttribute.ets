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
    let col = typeNode.createColumnNode(uiContext);
    col.initialize().width('30%');
    node.appendChild(col);
    // 创建LoadingProgress
    let loading = typeNode.createLoadingProgressNode(uiContext);
    loading.initialize().width('50%').height('20%').color(Color.Pink);
    // 获取LoadingProgress的属性
    typeNode.getLoadingProgressAttribute(loading)?.color(Color.Blue).width('90%').height('30%').id('getLoadingProgressAttribute')
    col.appendChild(loading);
    return node;
  }
}

@Entry
@Component
struct TypeNodeGetLoadingProgressAttribute {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Text('LoadingProgress sample')
        .height('5%')
      NodeContainer(this.myNodeController)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F5F5F5')
  }
}