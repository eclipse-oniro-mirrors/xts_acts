import { RenderNode, FrameNode, NodeController, DrawContext } from '@kit.ArkUI';
import { drawing } from '@kit.ArkGraphics2D';

class MyRenderNode extends RenderNode {
  public uiContext: UIContext;

  constructor(uiContext: UIContext) {
    super();
    this.uiContext = uiContext;
    this.frame = { x: 0, y: 0, width: 100, height: 100 };
  }

  draw(context: DrawContext) {
    const canvas = context.canvas;
    const brush = new drawing.Brush();
    brush.setColor({ alpha: 255, red: 255, green: 0, blue: 0 });
    canvas.attachBrush(brush);
    canvas.drawRect({ left: 150, right: 250, top: 150, bottom: 250 });
  }
}

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private blurRenderNode: RenderNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    let frameNode = new FrameNode(uiContext);
    frameNode.commonAttribute.width(180)
      .backgroundColor('#E5FFFFFF')
      .backgroundImage($r('app.media.icon'))
      .backgroundImageSize({ width: 50, height: 50 })
    this.rootNode.appendChild(frameNode);
    this.blurRenderNode = frameNode.getRenderNode();
    this.blurRenderNode!.frame = { x: 20, y: 20, width: 180, height: 80 }
    let myRenderNode = new MyRenderNode(uiContext)
    this.blurRenderNode!.appendChild(myRenderNode)

    return this.rootNode;
  }

  setBackgroundBlur() {
    if (this.blurRenderNode !== null) {
      this.blurRenderNode.backgroundBlur = {
        radius: 20,
        grayscale: [10, 10]
      };
    }
  }

  setBackgroundBlurUndefined() {
    if (this.blurRenderNode !== null) {
      this.blurRenderNode.backgroundBlur = {
        radius: 20,
        grayscale: undefined
      };
    }
  }

  setContentBlur() {
    if (this.blurRenderNode !== null) {
      this.blurRenderNode.contentBlur = {
        radius: 15,
        grayscale: [5, 5]
      };
    }
  }

  setContentBlurUndefined() {
    if (this.blurRenderNode !== null) {
      this.blurRenderNode.contentBlur = {
        radius: 15,
        grayscale: undefined
      };
    }
  }

  setForegroundBlur() {
    if (this.blurRenderNode !== null) {
      this.blurRenderNode.foregroundBlur = {
        radius: 10
      };
    }
  }

  getBlurConfigs() {
    if (this.blurRenderNode !== null) {
      const backdropConfig = this.blurRenderNode.backgroundBlur;
      const contentConfig = this.blurRenderNode.contentBlur;
      const foregroundConfig = this.blurRenderNode.foregroundBlur;

      console.info(`Backdrop blur radius: ${backdropConfig.radius} grayscale: [${backdropConfig.grayscale}]`);
      console.info(`Content blur radius: ${contentConfig.radius} grayscale: [${contentConfig.grayscale}]`);
      console.info(`Foreground blur radius: ${foregroundConfig.radius}`);
    }
  }

  getBlurConfigsUndefined() {
    if (this.blurRenderNode !== null) {
      this.blurRenderNode.backgroundBlur = undefined;
      this.blurRenderNode.contentBlur = undefined;
      this.blurRenderNode.foregroundBlur = undefined;

      console.info(`Backdrop blur radius: ${this.blurRenderNode.backgroundBlur.radius} grayscale: [${this.blurRenderNode.backgroundBlur.grayscale}]`);
      console.info(`Content blur radius: ${this.blurRenderNode.contentBlur.radius} grayscale: [${this.blurRenderNode.contentBlur.grayscale}]`);
      console.info(`Foreground blur radius: ${this.blurRenderNode.foregroundBlur.radius}`);

      let res1= this.blurRenderNode.backgroundBlur.radius
      AppStorage.SetOrCreate('backgroundBlurRadiusUndefined', res1)
      console.info('RenderNodeBlur backgroundBlurRadiusUndefined:' + AppStorage.get('backgroundBlurRadiusUndefined') )
      let res2 = this.blurRenderNode.backgroundBlur.grayscale
      AppStorage.SetOrCreate('backgroundBlurGrayscaleUndefined', res2)
      console.info('RenderNodeBlur backgroundBlurGrayscaleUndefined:' + AppStorage.get('backgroundBlurGrayscaleUndefined'))

      let res3 = this.blurRenderNode.contentBlur.radius
      AppStorage.SetOrCreate('contentBlurRadiusUndefined', res3)
      console.info('RenderNodeBlur contentBlurRadiusUndefined:' + AppStorage.get('contentBlurRadiusUndefined') )
      let res4 = this.blurRenderNode.contentBlur.grayscale
      AppStorage.SetOrCreate('contentBlurGrayscaleUndefined', res4)
      console.info('RenderNodeBlur contentBlurGrayscaleUndefined:' + AppStorage.get('contentBlurGrayscaleUndefined') )

      let res5 = this.blurRenderNode.foregroundBlur.radius
      AppStorage.SetOrCreate('foregroundBlurRadiusUndefined', res5)
      console.info('RenderNodeBlur foregroundBlurRadiusUndefined:' + AppStorage.get('foregroundBlurRadiusUndefined') )
    }
  }

  clearBlurEffects() {
    if (this.blurRenderNode !== null) {
      this.blurRenderNode.backgroundBlur = undefined;
      this.blurRenderNode.contentBlur = undefined;
      this.blurRenderNode.foregroundBlur = undefined;
    }
  }
}

@Entry
@Component
struct RenderNodeBlur {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({ space: 3 }) {
      NodeContainer(this.myNodeController)
        .width(180)
        .height(100)
        .backgroundColor('#CCCCCC')

      Column({ space: 3 }) {
        Row({space:2}){
          Button('背景模糊')
            .onClick(() => {
              this.myNodeController.setBackgroundBlur();
            })
            .id('setBackgroundBlur')
            .width(90)
            .height(15)
          Button('内容模糊')
            .onClick(() => {
              this.myNodeController.setContentBlur();
            })
            .id('setContentBlur')
            .width(90)
            .height(15)
        }
        Row({space:2}){
          Button('前景模糊效果')
            .onClick(() => {
              this.myNodeController.setForegroundBlur();
            })
            .id('setForegroundBlur')
            .width(90)
            .height(15)
          Button('清除效果')
            .onClick(() => {
              this.myNodeController.clearBlurEffects();
            })
            .id('clearBlurEffects')
            .width(90)
            .height(15)
        }
        Row({space:2}){
          Button('获取模糊效果配置')
            .onClick(() => {
              this.myNodeController.getBlurConfigs();
            })
            .id('getBlurConfigs')
            .width(110)
            .height(15)
          Button('设置undefined')
            .onClick(() => {
              this.myNodeController.setBackgroundBlurUndefined();
              this.myNodeController.setContentBlurUndefined();
              this.myNodeController.getBlurConfigsUndefined();
            })
            .id('setAndGetUndefined')
            .width(110)
            .height(15)
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}