import { NodeController, FrameNode, UIContext, typeNode, ExpandMode } from '@kit.ArkUI';

class MyNodeController extends NodeController {
  public frameNode: FrameNode | null = null;
  public childList: Array<FrameNode> = [];
  private rootNode: FrameNode | null = null;
  private uiContext: UIContext | null = null;
  private childrenCount: number = 0;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.uiContext = uiContext;

    this.frameNode = new FrameNode(uiContext);
    this.frameNode.commonAttribute.backgroundColor(Color.Pink);
    this.frameNode.commonAttribute.size({ width: 100, height: 100 });
    this.addCommonEvent(this.frameNode)
    this.rootNode.appendChild(this.frameNode);
    this.childrenCount = this.childrenCount + 1;
    for (let i = 0; i < 10; i++) {
      let childNode = new FrameNode(uiContext);
      this.childList.push(childNode);
      this.frameNode.appendChild(childNode);
    }
    let stackNode = typeNode.createNode(uiContext, 'Stack');
    this.frameNode.appendChild(stackNode);
    return this.rootNode;
  }

  addCommonEvent(frameNode: FrameNode) {
    frameNode.commonEvent.setOnClick((event: ClickEvent) => {
      console.info(`Click FrameNode: ${JSON.stringify(event)}`)
    })
  }

  createFrameNode() {
    let frameNode = new FrameNode(this.uiContext!);
    frameNode.commonAttribute.backgroundColor(Color.Pink);
    frameNode.commonAttribute.size({ width: 100, height: 100 });
    frameNode.commonAttribute.position({ x: this.childrenCount * 120, y: 0 });
    frameNode.commonAttribute.visibility(Visibility.Hidden);

    return frameNode;
  }

  isModifiableBoolean() {
    const childNode = this.createFrameNode();
    AppStorage.SetOrCreate('isModifiableTrue', childNode.isModifiable());
    this.frameNode?.dispose();
    AppStorage.SetOrCreate('isModifiableFalse', this.frameNode?.isModifiable());
    console.info('FrameNode isModifiable  result: ' + this.frameNode?.isModifiable());
    console.info('FrameNode isModifiable  result: ' + childNode?.isModifiable());
  }
}

@Entry
@Component
struct IsModifiableIndex {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({ space: 8 }) {
      NodeContainer(this.myNodeController)
        .borderWidth(1)
        .width(300)
        .height('30%')

      Button('isModifiable boolean')
        .id('btn_isModifiable')
        .height('5%')
        .width(300)
        .onClick(() => {
          this.myNodeController.isModifiableBoolean();
        })
    }
    .width('100%')
  }
}