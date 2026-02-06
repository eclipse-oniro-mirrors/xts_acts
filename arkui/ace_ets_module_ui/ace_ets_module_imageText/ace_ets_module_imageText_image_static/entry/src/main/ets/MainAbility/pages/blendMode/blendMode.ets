'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Row,
  WrappedBuilder,
  wrapBuilder,
  Builder,
  ContentModifier,
  DataPanel,
  DataPanelType,
  DataPanelConfiguration,
  Alignment,
  Line,
  ForEach,
  RelativeContainer,
  Rect,
  Color,
  Gauge,
  GaugeOptions,
  GaugeConfiguration,
  HorizontalAlign,
  FlexAlign,
  LoadingProgress,
  LoadingProgressConfiguration,
  Progress,
  ProgressType,
  ProgressConfiguration,
  Flex,
  Path,
  TextClock,
  TextClockConfiguration,
  TextClockController,
  TimePickerFormat,
  TimePicker,
  TextTimer,
  TextTimerConfiguration,
  TextTimerController,
  Circle,
  Stack,
  AttributeModifier,
  DataPanelAttribute,
  GaugeAttribute,
  LoadingProgressAttribute,
  ProgressAttribute,
  TextClockAttribute,
  TextTimerAttribute,
  QRCode,
  Bindable,
  BindableResourceStr,
  $r,
  $$,
  List,
  ListItem,
  BindableResourceStrArray,
  Badge,
  BadgeParamWithNumber,
  BadgeParamWithString,
  BadgeStyle,
  TextInput,
  BadgePosition,
  Image,
  ImageRotateOrientation,
  ColorMetrics,
  ColorContent,
  ImageErrorCallback,
  ImageError,
  DatePicker,
  DatePickerAttribute,
  DatePickerDialogOptions,
  ImageSpan,
  Span,
  TextDecorationType,
  CopyOptions,
  TextPickerResult,
  TextPickerDialogOptions,
  PixelMap,
  Resource,
  Scroll,
  ColumnOptions
} from '@ohos.arkui.component'
import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'
import { UIContext } from '@ohos.arkui.UIContext'
import common from '@ohos.app.ability.common';
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';
import {
  DrawableDescriptor,
  PixelMapDrawableDescriptor,
  LayeredDrawableDescriptor,
  AnimatedDrawableDescriptor,
  AnimationOptions
} from '@ohos.arkui.drawableDescriptor';
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image';
@Entry
@Component
struct entirety {
  // 方式一声明DrawableDescriptor对象
  @State layeredDescClear: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescSrc: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescDst: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescSrcOver: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescDstOver: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescSrcIn: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescDstIn: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescSrcOut: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescDstOut: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescSrcAtop: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescDstAtop: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescXor: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescPlus: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescModulate: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescScreen: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescOverlay: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescDarken: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescLighten: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescColorDodge: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescColorBurn: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescHardLight: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescSoftLight: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescDifference: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescExclusion: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescMultiply: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescHue: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescSaturation: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescColor: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescLuminosity: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescUndefined: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDescError: LayeredDrawableDescriptor | undefined = undefined;
  @State layeredDesc: LayeredDrawableDescriptor | undefined = undefined;
  // 开发者可利用DrawableDescriptor实现图片的分层叠加（如徽章图标），动态属性调整（如颜色滤镜），复杂动画序列等高级效果
  aboutToAppear() {
    const resManager = this.getUIContext().getHostContext()?.resourceManager;
    if (!resManager) {
      return;
    }
    // 创建分层图标
    // 创建方式1 new+getPixelMap
    const foreground = this.getDrawableDescriptor($r('app.media.src'));
    const background = this.getDrawableDescriptor($r('app.media.dst'));
    const mask = this.getDrawableDescriptor($r('app.media.landscape'));
    //CLEAR
    this.layeredDescClear =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescClear?.setBlendMode(drawing.BlendMode.CLEAR);
    //SRC
    this.layeredDescSrc =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescSrc?.setBlendMode(drawing.BlendMode.SRC);
    //DST
    this.layeredDescDst	=
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescDst?.setBlendMode(drawing.BlendMode.DST	);
    //SRC_OVER
    this.layeredDescSrcOver =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescSrcOver?.setBlendMode(drawing.BlendMode.SRC_OVER);
    //DST_OVER
    this.layeredDescDstOver =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescDstOver?.setBlendMode(drawing.BlendMode.DST_OVER);
    //SRC_IN
    this.layeredDescSrcIn =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescSrcIn?.setBlendMode(drawing.BlendMode.SRC_IN);
    //DST_IN
    this.layeredDescDstIn =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescDstIn?.setBlendMode(drawing.BlendMode.DST_IN);
    //SRC_OUT
    this.layeredDescSrcOut =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescSrcOut?.setBlendMode(drawing.BlendMode.SRC_OUT);
    //DST_OUT
    this.layeredDescDstOut =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescDstOut?.setBlendMode(drawing.BlendMode.DST_OUT);
    //SRC_ATOP
    this.layeredDescSrcAtop =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescSrcAtop?.setBlendMode(drawing.BlendMode.SRC_ATOP);
    //DST_ATOP
    this.layeredDescDstAtop =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescDstAtop?.setBlendMode(drawing.BlendMode.DST_ATOP);
    //XOR
    this.layeredDescXor =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescXor?.setBlendMode(drawing.BlendMode.XOR);
    //PLUS
    this.layeredDescPlus =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescPlus?.setBlendMode(drawing.BlendMode.PLUS);
    //MODULATE
    this.layeredDescModulate =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescModulate?.setBlendMode(drawing.BlendMode.MODULATE);
    //SCREEN
    this.layeredDescScreen =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescScreen?.setBlendMode(drawing.BlendMode.SCREEN);
    //OVERLAY
    this.layeredDescOverlay =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescOverlay?.setBlendMode(drawing.BlendMode.OVERLAY);
    //DARKEN
    this.layeredDescDarken =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescDarken?.setBlendMode(drawing.BlendMode.DARKEN);
    //LIGHTEN
    this.layeredDescLighten =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescLighten?.setBlendMode(drawing.BlendMode.LIGHTEN);
    //COLOR_DODGE
    this.layeredDescColorDodge =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescColorDodge?.setBlendMode(drawing.BlendMode.COLOR_DODGE);
    //COLOR_BURN
    this.layeredDescColorBurn =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescColorBurn?.setBlendMode(drawing.BlendMode.COLOR_BURN);
    //HARD_LIGHT
    this.layeredDescHardLight =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescHardLight?.setBlendMode(drawing.BlendMode.HARD_LIGHT);
    //SOFT_LIGHT
    this.layeredDescSoftLight =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescSoftLight?.setBlendMode(drawing.BlendMode.SOFT_LIGHT);
    //DIFFERENCE
    this.layeredDescDifference =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescDifference?.setBlendMode(drawing.BlendMode.DIFFERENCE);
    //EXCLUSION
    this.layeredDescExclusion =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescExclusion?.setBlendMode(drawing.BlendMode.EXCLUSION);
    //MULTIPLY
    this.layeredDescMultiply =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescMultiply?.setBlendMode(drawing.BlendMode.MULTIPLY);
    //HUE
    this.layeredDescHue =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescHue?.setBlendMode(drawing.BlendMode.HUE);
    //SATURATION
    this.layeredDescSaturation =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescSaturation?.setBlendMode(drawing.BlendMode.SATURATION);
    //COLOR
    this.layeredDescColor =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescColor?.setBlendMode(drawing.BlendMode.COLOR);
    //LUMINOSITY
    this.layeredDescLuminosity =
      new LayeredDrawableDescriptor(foreground, background, mask) as LayeredDrawableDescriptor;
    this.layeredDescLuminosity?.setBlendMode(drawing.BlendMode.LUMINOSITY);
  };

  // 辅助方法：获取DrawableDescriptor
  private getDrawableDescriptor(resource: Resource): (DrawableDescriptor | undefined) {
    const resManager = this.getUIContext().getHostContext()?.resourceManager;
    if (!resManager) {
      return undefined;
    }
    ;
    return (resManager.getDrawableDescriptor(resource.id)) as DrawableDescriptor;
  };

  build() {
    RelativeContainer() {
      Scroll(){
        Column({space:10}as ColumnOptions) {
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