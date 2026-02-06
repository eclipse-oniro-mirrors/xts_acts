import { typeNode, NodeController, FrameNode } from  '@ohos.arkui.node';

class MyNodeController extends  NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col = typeNode.createNode(uiContext, 'Column')
    col.initialize({ space: 10 }).borderColor(Color.Black).alignItems(HorizontalAlign.Center)
    let checkbox = typeNode.createNode(uiContext, 'Checkbox')
    checkbox.initialize({name:'checkbox1',group:'CheckboxGroup'})
      .key('key_checkbox_01')
    col.appendChild(checkbox)
    node.appendChild(col)
    return node
  }
}

@Entry
@Component
struct checkbox {
  private myNodeController: MyNodeController = new MyNodeController()
  build() {
    Column({ space: 20 }) {
      NodeContainer(this.myNodeController)
    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}