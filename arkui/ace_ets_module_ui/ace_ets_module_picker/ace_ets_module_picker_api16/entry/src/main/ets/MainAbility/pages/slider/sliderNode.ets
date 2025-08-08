import { typeNode, NodeController, FrameNode } from  '@ohos.arkui.node';
import { CheckboxModifier } from '@ohos.arkui.modifier';

class MyNodeController extends  NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col = typeNode.createNode(uiContext, 'Column')
    let slider = typeNode.createNode(uiContext, 'Slider')
    slider.initialize({
      value:null,
      min: null,
      max: null,
      style:  null,
      direction: null,
      reverse: null,
    })
    .key('key_Slider_001')
    col.appendChild(slider)
    node.appendChild(col)
    return node
  }
}

@Entry
@Component
struct sliderIndex {
  private myNodeController: MyNodeController = new MyNodeController()  
  build() {
    Column({ space: 50 }) {
      NodeContainer(this.myNodeController)
     }
  }
}
