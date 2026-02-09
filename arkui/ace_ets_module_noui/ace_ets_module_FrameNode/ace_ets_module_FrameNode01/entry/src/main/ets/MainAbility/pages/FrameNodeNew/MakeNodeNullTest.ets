import { FrameNode, NodeController, UIContext } from '@kit.ArkUI';

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    return this.rootNode;
  }
}
@Entry
@Component
struct MakeNodeIndex {
  myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      NodeContainer(this.myNodeController)
        .height('30%')
      Button('makeNode null')
        .id('btn_makeNodeNull')
        .height('10%')
        .onClick(() => {
          AppStorage.SetOrCreate('makeNodeNull', this.myNodeController.makeNode(this.getUIContext()));
          console.log('jerry makeNode null result:' + this.myNodeController.makeNode(this.getUIContext()));
        })
    }
    .width('100%')
    .height('100%')
  }
}