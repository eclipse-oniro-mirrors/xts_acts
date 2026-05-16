'use static'
import { UIContext, Column, Text, Button, Entry, Component, ClickEvent, Margin, NodeContainer, wrapBuilder} from '@ohos.arkui.component'
import {BuilderNode, FrameNode, NodeController, NodeRenderType, RenderOptions, Size } from '@ohos.arkui.node'

class Params {
  text1: string;
  constructor(text: string) {
    this.text1 = text;
  }
}

// builder组件
@Builder
function buildTextWithParams(params: Params) {
  Column() {
    Text(params.text1).id('text').fontSize(20)
    Text('this is a CustomNode with ProxyNode').fontSize(20)
  }
}

export class MyNodeController extends NodeController {
  private builderNode ?: BuilderNode<Params>;
  private uiContext?: UIContext;
  private params: string = 'update with Params';

  // 创建节点时调用
  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    this.addBuilderNode();
    return this.builderNode? this.builderNode!.getFrameNode()!:null;
  }

  // 更新节点内容
  updateNode() {
    this.params += '~'
    this.builderNode?.update(new Params(this.params));
  }

  addBuilderNode(){
    if ( this.builderNode === undefined ) {
      let renderOptions: RenderOptions =
        { selfIdealSize: { width: 100, height: 100 } as Size, type: NodeRenderType.RENDER_TYPE_DISPLAY }
      // 创建BuilderNode
      let builderNode: BuilderNode<Params> = new BuilderNode<Params>(this.uiContext!, renderOptions);
      // useParallel设置为true，并行执行wrapBuilder，创建UI
      builderNode.build(wrapBuilder(buildTextWithParams), new Params('Build with Params'), {useParallel: true});
      this.builderNode = builderNode;
    }
  }
}

@Entry
@Component
struct MyStateSample {
  private nodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      Column() {
        Text('NodeContainer')
        NodeContainer(this.nodeController)
          .borderWidth(1)
          .height('80%')
          .width('100%')
      }
      .height('40%')
      Button('addBuilderNode')
        .onClick((e: ClickEvent) => {
          this.nodeController.addBuilderNode();
        })
        .width(200)
        .height(50)
        .margin({ bottom: 10 } as Margin)
      Button('Update')
        .onClick((e: ClickEvent) => {
          this.nodeController?.updateNode();
        })
        .width(200)
        .height(50)
    }
  }
}