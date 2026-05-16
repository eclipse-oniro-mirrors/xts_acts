'use static'

import { Entry, Text, Column, Component, Button, ClickEvent, RowOptions, Row ,ColumnOptions, Color, DrawContext,NodeContainer, $r } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { UIContext } from '@ohos.arkui.UIContext';
import { NodeContent, typeNode, ComponentContent, FrameNode, NodeController, BuilderNode, RenderNode } from '@ohos.arkui.node'
import { AppStorage } from '@ohos.arkui.stateManagement';

class MyRenderNode extends RenderNode {
  public uiContext: UIContext;

  constructor(uiContext: UIContext) {
    super();
    this.uiContext = uiContext;
    this.frame = { x: 0, y: 0, width: 100, height: 100 };
  }
}

export class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private blurRenderNode: RenderNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    let frameNode = new FrameNode(uiContext);
    frameNode.commonAttribute.width(180)
      .backgroundColor('#E5FFFFFF')
      .backgroundImage($r('app.media.icon'))
      .backgroundImageSize({ width: 50, height: 50 })
    this.rootNode!.appendChild(frameNode);
    this.blurRenderNode = frameNode.getRenderNode();
    this.blurRenderNode!.frame = { x: 20, y: 20, width: 180, height: 80 }
    let myRenderNode = new MyRenderNode(uiContext)
    this.blurRenderNode!.appendChild(myRenderNode)

    return this.rootNode;
  }

  setBackgroundBlur() {
    if (this.blurRenderNode !== null) {
      this.blurRenderNode!.backgroundBlur = {
        radius: 20,
        grayscale: [10, 10]
      };
    }
  }

  setBackgroundBlurUndefined() {
    if (this.blurRenderNode !== null) {
      this.blurRenderNode!.backgroundBlur = {
        radius: 20,
        grayscale: undefined
      };
    }
  }

  setContentBlur() {
    if (this.blurRenderNode !== null) {
      this.blurRenderNode!.contentBlur = {
        radius: 15,
        grayscale: [5, 5]
      };
    }
  }

  setContentBlurUndefined() {
    if (this.blurRenderNode !== null) {
      this.blurRenderNode!.contentBlur = {
        radius: 15,
        grayscale: undefined
      };
    }
  }

  setForegroundBlur() {
    if (this.blurRenderNode !== null) {
      this.blurRenderNode!.foregroundBlur = {
        radius: 10
      };
    }
  }

  getBlurConfigs() {
    if (this.blurRenderNode !== null) {
      const backdropConfig = this.blurRenderNode!.backgroundBlur;
      const contentConfig = this.blurRenderNode!.contentBlur;
      const foregroundConfig = this.blurRenderNode!.foregroundBlur;

      console.info(`Backdrop blur radius: ${backdropConfig.radius} grayscale: [${backdropConfig.grayscale}]`);
      console.info(`Content blur radius: ${contentConfig.radius} grayscale: [${contentConfig.grayscale}]`);
      console.info(`Foreground blur radius: ${foregroundConfig.radius}`);
    }
  }

  getBlurConfigsUndefined() {
    if (this.blurRenderNode !== null) {
      this.blurRenderNode!.backgroundBlur = undefined;
      this.blurRenderNode!.contentBlur = undefined;
      this.blurRenderNode!.foregroundBlur = undefined;

      console.info(`Backdrop blur radius: ${this.blurRenderNode!.backgroundBlur.radius} grayscale: [${this.blurRenderNode!.backgroundBlur.grayscale}]`);
      console.info(`Content blur radius: ${this.blurRenderNode!.contentBlur.radius} grayscale: [${this.blurRenderNode!.contentBlur.grayscale}]`);
      console.info(`Foreground blur radius: ${this.blurRenderNode!.foregroundBlur.radius}`);

      let res1= this.blurRenderNode!.backgroundBlur.radius
      AppStorage.setOrCreate<Double>('backgroundBlurRadiusUndefined', res1)
      console.info('RenderNodeBlur backgroundBlurRadiusUndefined:' + AppStorage.get<Double>('backgroundBlurRadiusUndefined'))
      let res2 = this.blurRenderNode!.backgroundBlur.grayscale
      AppStorage.setOrCreate<[Int, Int]|undefined>('backgroundBlurGrayscaleUndefined', res2)
      console.info('RenderNodeBlur backgroundBlurGrayscaleUndefined:' + AppStorage.get<[Int, Int]|undefined>('backgroundBlurGrayscaleUndefined'))

      let res3 = this.blurRenderNode!.contentBlur.radius
      AppStorage.setOrCreate<Double>('contentBlurRadiusUndefined', res3)
      console.info('RenderNodeBlur contentBlurRadiusUndefined:' + AppStorage.get<Double>('contentBlurRadiusUndefined'))
      let res4 = this.blurRenderNode!.contentBlur.grayscale
      AppStorage.setOrCreate<[Int, Int]|undefined>('contentBlurGrayscaleUndefined', res4)
      console.info('RenderNodeBlur contentBlurGrayscaleUndefined:' + AppStorage.get<[Int, Int]|undefined>('contentBlurGrayscaleUndefined'))

      let res5 = this.blurRenderNode!.foregroundBlur.radius
      AppStorage.setOrCreate<Double>('foregroundBlurRadiusUndefined', res5)
      console.info('RenderNodeBlur foregroundBlurRadiusUndefined:' + AppStorage.get<Double>('foregroundBlurRadiusUndefined'))
    }
  }

  clearBlurEffects() {
    if (this.blurRenderNode !== null) {
      this.blurRenderNode!.backgroundBlur = undefined;
      this.blurRenderNode!.contentBlur = undefined;
      this.blurRenderNode!.foregroundBlur = undefined;
    }
  }
}

@Entry
@Component
struct RenderNodeBlurStatic {
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Column({ space: 3 } as ColumnOptions) {
      NodeContainer(this.myNodeController)
        .width(180)
        .height(100)
        .backgroundColor('#CCCCCC')

      Column({ space: 3 } as ColumnOptions) {
        Row({space:2} as RowOptions){
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
        Row({space:2} as RowOptions){
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
        Row({space:2} as RowOptions){
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