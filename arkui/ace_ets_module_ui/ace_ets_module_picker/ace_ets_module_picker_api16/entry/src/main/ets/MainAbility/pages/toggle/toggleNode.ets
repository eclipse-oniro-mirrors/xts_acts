import { typeNode, NodeController, FrameNode } from  '@ohos.arkui.node';
import { CheckboxModifier } from '@ohos.arkui.modifier';

let toggleOptions:ToggleOptions = {type: ToggleType.Checkbox, isOn: false};

class MyNodeController extends  NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col1 = typeNode.createNode(uiContext, 'Column')
    col1.initialize({ space: 10 }).borderColor(Color.Black).alignItems(HorizontalAlign.Center)
    let col = typeNode.createNode(uiContext, 'Column')
    col.initialize({ space: 10 }).borderColor(Color.Black).alignItems(HorizontalAlign.Center)
    let scroll = typeNode.createNode(uiContext, 'Scroll')
    scroll.initialize()
    let toggle = typeNode.createNode(uiContext, 'Toggle', toggleOptions)
    toggle.initialize( { type: ToggleType.Button, isOn: false }).width(50)
      .key('key_Toggle_001')
    col.appendChild(toggle)
    scroll.appendChild(col)
    col1.appendChild(scroll)
    node.appendChild(col1)
    return node
  }
}

@Entry
@Component
struct slider {
  private myNodeController: MyNodeController = new MyNodeController()
  build() {
    Column(){
      Scroll(){
        Column({ space: 20 }) {
          NodeContainer(this.myNodeController)
        }
      }
    }

  }
}

