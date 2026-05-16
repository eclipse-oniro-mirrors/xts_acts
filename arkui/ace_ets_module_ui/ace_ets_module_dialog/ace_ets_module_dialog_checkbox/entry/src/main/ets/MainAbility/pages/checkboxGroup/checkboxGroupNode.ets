import { typeNode, NodeController, FrameNode } from  '@ohos.arkui.node';

class MyNodeController extends  NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col = typeNode.createNode(uiContext, 'Column')
    col.initialize({ space: 10 }).borderColor(Color.Black).alignItems(HorizontalAlign.Center)
    let checkboxGroup = typeNode.createNode(uiContext, 'CheckboxGroup')
    checkboxGroup.initialize({group:'checkboxGroup'}).key('key_checkboxGroup_001')
    let checkbox1 = typeNode.createNode(uiContext, 'Checkbox')
    checkbox1.initialize({name:'checkbox1',group:'checkboxGroup'})
    let checkbox2 = typeNode.createNode(uiContext, 'Checkbox')
    checkbox2.initialize({name:'checkbox2',group:'checkboxGroup'})
    let checkbox3 = typeNode.createNode(uiContext, 'Checkbox')
    checkbox3.initialize({name:'checkbox3',group:'checkboxGroup'})
    col.appendChild(checkbox1)
    col.appendChild(checkbox2)
    col.appendChild(checkbox3)
    col.appendChild(checkboxGroup)
    node.appendChild(col)
    return node
  }
}

@Entry
@Component
struct checkboxGroup {
  private myNodeController: MyNodeController = new MyNodeController()
  build() {
    Column({ space: 20 }) {
      NodeContainer(this.myNodeController)
    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}