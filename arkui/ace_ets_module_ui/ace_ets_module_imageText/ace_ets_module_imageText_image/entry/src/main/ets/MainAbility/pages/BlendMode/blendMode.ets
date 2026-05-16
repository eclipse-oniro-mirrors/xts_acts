/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  DrawableDescriptor,
  LayeredDrawableDescriptor,
} from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import { drawing } from '@kit.ArkGraphics2D';

@Entry
@Component
struct entirety {
  // 方式一声明DrawableDescriptor对象
  @State layeredDescClear: LayeredDrawableDescriptor | null = null;
  @State layeredDescSrc: LayeredDrawableDescriptor | null = null;
  @State layeredDescDst: LayeredDrawableDescriptor | null = null;
  @State layeredDescSrcOver: LayeredDrawableDescriptor | null = null;
  @State layeredDescDstOver: LayeredDrawableDescriptor | null = null;
  @State layeredDescSrcIn: LayeredDrawableDescriptor | null = null;
  @State layeredDescDstIn: LayeredDrawableDescriptor | null = null;
  @State layeredDescSrcOut: LayeredDrawableDescriptor | null = null;
  @State layeredDescDstOut: LayeredDrawableDescriptor | null = null;
  @State layeredDescSrcAtop: LayeredDrawableDescriptor | null = null;
  @State layeredDescDstAtop: LayeredDrawableDescriptor | null = null;
  @State layeredDescXor: LayeredDrawableDescriptor | null = null;
  @State layeredDescPlus: LayeredDrawableDescriptor | null = null;
  @State layeredDescModulate: LayeredDrawableDescriptor | null = null;
  @State layeredDescScreen: LayeredDrawableDescriptor | null = null;
  @State layeredDescOverlay: LayeredDrawableDescriptor | null = null;
  @State layeredDescDarken: LayeredDrawableDescriptor | null = null;
  @State layeredDescLighten: LayeredDrawableDescriptor | null = null;
  @State layeredDescColorDodge: LayeredDrawableDescriptor | null = null;
  @State layeredDescColorBurn: LayeredDrawableDescriptor | null = null;
  @State layeredDescHardLight: LayeredDrawableDescriptor | null = null;
  @State layeredDescSoftLight: LayeredDrawableDescriptor | null = null;
  @State layeredDescDifference: LayeredDrawableDescriptor | null = null;
  @State layeredDescExclusion: LayeredDrawableDescriptor | null = null;
  @State layeredDescMultiply: LayeredDrawableDescriptor | null = null;
  @State layeredDescHue: LayeredDrawableDescriptor | null = null;
  @State layeredDescSaturation: LayeredDrawableDescriptor | null = null;
  @State layeredDescColor: LayeredDrawableDescriptor | null = null;
  @State layeredDescLuminosity: LayeredDrawableDescriptor | null = null;
  @State layeredDescUndefined: LayeredDrawableDescriptor | null = null;
  @State layeredDescError: LayeredDrawableDescriptor | null = null;
  @State layeredDesc: LayeredDrawableDescriptor | null = null;
  // 开发者可利用DrawableDescriptor实现图片的分层叠加（如徽章图标），动态属性调整（如颜色滤镜），复杂动画序列等高级效果
  async aboutToAppear() {
    // 创建分层图标
    // 创建方式1 new+getPixelMap
    const foreground = await this.getDrawableDescriptor($r('app.media.src'));
    const background = await this.getDrawableDescriptor($r('app.media.dst'));
    const mask = await this.getDrawableDescriptor($r('app.media.landscape'));
    //CLEAR
    this.layeredDescClear = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescClear.setBlendMode(drawing.BlendMode.CLEAR);
    //SRC
    this.layeredDescSrc = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescSrc.setBlendMode(drawing.BlendMode.SRC);
    //DST
    this.layeredDescDst	 = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescDst	.setBlendMode(drawing.BlendMode.DST	);
    //SRC_OVER
    this.layeredDescSrcOver = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescSrcOver.setBlendMode(drawing.BlendMode.SRC_OVER);
    //DST_OVER
    this.layeredDescDstOver = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescDstOver.setBlendMode(drawing.BlendMode.DST_OVER);
    //SRC_IN
    this.layeredDescSrcIn = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescSrcIn.setBlendMode(drawing.BlendMode.SRC_IN);
    //DST_IN
    this.layeredDescDstIn = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescDstIn.setBlendMode(drawing.BlendMode.DST_IN);
    //SRC_OUT
    this.layeredDescSrcOut = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescSrcOut.setBlendMode(drawing.BlendMode.SRC_OUT);
    //DST_OUT
    this.layeredDescDstOut = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescDstOut.setBlendMode(drawing.BlendMode.DST_OUT);
    //SRC_ATOP
    this.layeredDescSrcAtop = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescSrcAtop.setBlendMode(drawing.BlendMode.SRC_ATOP);
    //DST_ATOP
    this.layeredDescDstAtop = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescDstAtop.setBlendMode(drawing.BlendMode.DST_ATOP);
    //XOR
    this.layeredDescXor = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescXor.setBlendMode(drawing.BlendMode.XOR);
    //PLUS
    this.layeredDescPlus = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescPlus.setBlendMode(drawing.BlendMode.PLUS);
    //MODULATE
    this.layeredDescModulate = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescModulate.setBlendMode(drawing.BlendMode.MODULATE);
    //SCREEN
    this.layeredDescScreen = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescScreen.setBlendMode(drawing.BlendMode.SCREEN);
    //OVERLAY
    this.layeredDescOverlay = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescOverlay.setBlendMode(drawing.BlendMode.OVERLAY);
    //DARKEN
    this.layeredDescDarken = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescDarken.setBlendMode(drawing.BlendMode.DARKEN);
    //LIGHTEN
    this.layeredDescLighten = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescLighten.setBlendMode(drawing.BlendMode.LIGHTEN);
    //COLOR_DODGE
    this.layeredDescColorDodge = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescColorDodge.setBlendMode(drawing.BlendMode.COLOR_DODGE);
    //COLOR_BURN
    this.layeredDescColorBurn = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescColorBurn.setBlendMode(drawing.BlendMode.COLOR_BURN);
    //HARD_LIGHT
    this.layeredDescHardLight = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescHardLight.setBlendMode(drawing.BlendMode.HARD_LIGHT);
    //SOFT_LIGHT
    this.layeredDescSoftLight = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescSoftLight.setBlendMode(drawing.BlendMode.SOFT_LIGHT);
    //DIFFERENCE
    this.layeredDescDifference = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescDifference.setBlendMode(drawing.BlendMode.DIFFERENCE);
    //EXCLUSION
    this.layeredDescExclusion = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescExclusion.setBlendMode(drawing.BlendMode.EXCLUSION);
    //MULTIPLY
    this.layeredDescMultiply = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescMultiply.setBlendMode(drawing.BlendMode.MULTIPLY);
    //HUE
    this.layeredDescHue = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescHue.setBlendMode(drawing.BlendMode.HUE);
    //SATURATION
    this.layeredDescSaturation = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescSaturation.setBlendMode(drawing.BlendMode.SATURATION);
    //COLOR
    this.layeredDescColor = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescColor.setBlendMode(drawing.BlendMode.COLOR);
    //LUMINOSITY
    this.layeredDescLuminosity = new LayeredDrawableDescriptor(foreground, background, mask);
    this.layeredDescLuminosity.setBlendMode(drawing.BlendMode.LUMINOSITY);
  };

  // 辅助方法：获取DrawableDescriptor
  private async getDrawableDescriptor(resource: Resource): Promise<DrawableDescriptor | undefined> {
    const resManager = this.getUIContext().getHostContext()?.resourceManager;
    if (!resManager) {
      return undefined;
    };
    return (resManager.getDrawableDescriptor(resource.id)) as DrawableDescriptor;
  };

  build() {
    RelativeContainer() {
      Scroll(){
        Column() {
          Row() {
            Image(this.layeredDescClear)
              .width('30%')
              .height('10%')
              .id('blendModeClear')
            Image(this.layeredDescSrc)
              .width('50%')
              .height('10%')
              .id('blendModeSrc')
            Image(this.layeredDescDst)
              .width('50%')
              .height('10%')
              .id('blendModeDST')
          }
          Row() {
            Image(this.layeredDescSrcOver)
              .width('50%')
              .height('10%')
              .id('blendModeSrcOver')
            Image(this.layeredDescDstOver)
              .width('50%')
              .height('10%')
              .id('blendModeDstOver')
            Image(this.layeredDescSrcIn)
              .width('50%')
              .height('10%')
              .id('blendModeSrcIn')
          }
          Row() {
            Image(this.layeredDescDstIn)
              .width('50%')
              .height('10%')
              .id('blendModeDstIn')
            Image(this.layeredDescSrcOut)
              .width('50%')
              .height('10%')
              .id('blendModeSrcOut')
            Image(this.layeredDescDstOut)
              .width('50%')
              .height('10%')
              .id('blendModeDstOut')
          }
          Row() {
            Image(this.layeredDescSrcAtop)
              .width('50%')
              .height('10%')
              .id('blendModeSrcAtop')
            Image(this.layeredDescDstAtop)
              .width('50%')
              .height('10%')
              .id('blendModeDtsAtop')
            Image(this.layeredDescXor)
              .width('50%')
              .height('10%')
              .id('blendModeXor')
          }
          Row() {
            Image(this.layeredDescPlus)
              .width('50%')
              .height('10%')
              .id('blendModePlus')
            Image(this.layeredDescModulate)
              .width('50%')
              .height('10%')
              .id('blendModeModulate')
            Image(this.layeredDescScreen)
              .width('50%')
              .height('10%')
              .id('blendModeScreen')
          }
          Row() {
            Image(this.layeredDescOverlay)
              .width('50%')
              .height('10%')
              .id('blendModeOverlay')
            Image(this.layeredDescDarken)
              .width('50%')
              .height('10%')
              .id('blendModeDarken')
            Image(this.layeredDescLighten)
              .width('50%')
              .height('10%')
              .id('blendModeLighten')
          }
          Row() {
            Image(this.layeredDescColorDodge)
              .width('50%')
              .height('10%')
              .id('blendModeColorDodge')
            Image(this.layeredDescColorBurn)
              .width('50%')
              .height('10%')
              .id('blendModeColorBurn')
            Image(this.layeredDescHardLight)
              .width('50%')
              .height('10%')
              .id('blendModeHardLight')
          }
          Row() {
            Image(this.layeredDescSoftLight)
              .width('50%')
              .height('10%')
              .id('blendModeSoftLight')
            Image(this.layeredDescDifference)
              .width('50%')
              .height('10%')
              .id('blendModeDifference')
            Image(this.layeredDescExclusion)
              .width('50%')
              .height('10%')
              .id('blendModeExclusion')
          }
          Row() {
            Image(this.layeredDescMultiply)
              .width('50%')
              .height('10%')
              .id('blendModeMultiply')
            Image(this.layeredDescHue)
              .width('50%')
              .height('10%')
              .id('blendModeHue')
            Image(this.layeredDescSaturation)
              .width('50%')
              .height('10%')
              .id('blendModeSaturation')
          }
          Row() {
            Image(this.layeredDescColor)
              .width('50%')
              .height('10%')
              .id('blendModeColor')
            Image(this.layeredDescLuminosity)
              .width('50%')
              .height('10%')
              .id('blendModeLuminosity')
          }
        }
      }
    }
    .height('100%')
    .width('100%')
  }
}