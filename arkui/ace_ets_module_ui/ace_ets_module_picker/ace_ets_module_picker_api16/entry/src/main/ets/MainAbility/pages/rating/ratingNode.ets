import { typeNode, NodeController, FrameNode } from  '@ohos.arkui.node';

class MyNodeController extends  NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col = typeNode.createNode(uiContext, 'Column')
    col.initialize({ space: 10 }).borderColor(Color.Black).alignItems(HorizontalAlign.Center)
    let rating = typeNode.createNode(uiContext, 'Rating')
    rating.initialize({ rating: 0, indicator: true })
    .key('key_Rating_001')
    col.appendChild(rating)
    node.appendChild(col)
    return node
  }
}

@Entry
@Component
struct rating {
  private myNodeController: MyNodeController = new MyNodeController()
  build() {
    Column({ space: 20 }) {
      NodeContainer(this.myNodeController)
    }
  }
}