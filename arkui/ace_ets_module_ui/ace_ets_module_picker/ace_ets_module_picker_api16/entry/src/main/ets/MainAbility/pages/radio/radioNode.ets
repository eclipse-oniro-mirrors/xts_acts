import { typeNode, NodeController, FrameNode } from  '@ohos.arkui.node';

class MyNodeController extends  NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col = typeNode.createNode(uiContext, 'Column')
    col.initialize({ space: 10 }).borderColor(Color.Black).alignItems(HorizontalAlign.Center)
    let radio = typeNode.createNode(uiContext, 'Radio')
    radio.initialize({value:'radio',group:'radioGroup'})
    .key('key_Radio_001')
    col.appendChild(radio)
    node.appendChild(col)
    return node
  }
}

@Entry
@Component
struct radio {
  private myNodeController: MyNodeController = new MyNodeController()
  build() {
    Column() {
      NodeContainer(this.myNodeController)
    }
  }
}