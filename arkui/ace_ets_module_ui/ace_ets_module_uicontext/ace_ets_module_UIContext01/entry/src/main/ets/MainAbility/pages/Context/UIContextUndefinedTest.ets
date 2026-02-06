import { FrameNode, NodeController, UIContext } from '@kit.ArkUI';

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode {
    if (this.rootNode === null) {
      this.rootNode = new FrameNode(uiContext);
    }
    if (globalThis.buttonNode) {
      console.log('jerry makeNode add buttonNode to rootNode');
      this.rootNode.appendChild(globalThis.buttonNode.getFrameNode());
    }
    return this.rootNode;
  }
}
@Entry
@Component
struct UIContextUndefinedIndex {
  myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column() {
      NodeContainer(this.myNodeController)
        .height('30%')
      Button('test undefined')
        .height('10%')
        .id('btn_contextUndefined')
        .onClick(() => {
          AppStorage.SetOrCreate('getHostContextUndefined', AppStorage.get<UIContext>('UIContext99')?.getHostContext());
          AppStorage.SetOrCreate('getWindowNameUndefined', AppStorage.get<UIContext>('UIContext99')?.getWindowName());

          console.log(`jerry UIContext99.getHostContext=${AppStorage.get<UIContext>('UIContext99')?.getHostContext()}`);
          console.log(`jerry UIContext99.getWindowName=${AppStorage.get<UIContext>('UIContext99')?.getWindowName()}`);
      })
    }
    .width('100%')
    .height('100%')
  }
}