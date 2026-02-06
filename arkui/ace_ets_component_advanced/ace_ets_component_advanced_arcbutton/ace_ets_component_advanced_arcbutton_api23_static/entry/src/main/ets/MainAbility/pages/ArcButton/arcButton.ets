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
import { LevelMode, ImmersiveMode, LevelOrder} from '@ohos.promptAction'
import promptAction from '@ohos.promptAction';
import { Callback, BusinessError } from '@ohos.base';
import { ComponentContent, FrameNode, Frame } from '@ohos.arkui.node';
import { UIContext, OverlayManager, UIInspector, OverlayManagerOptions,
  PromptAction } from '@ohos.arkui.UIContext'
import { $r, Entry, Text, Column, Component, Button, ClickEvent, Color,
  TextAlign, List, ListItem, ListScroller, Builder, ForEach, Row, TransitionType, FlexAlign,
  ColumnOptions, Slider, SliderStyle, Divider, SliderBlockType, Path,
  SizeOptions, ResourceColor, Length, ResourceStr, Select, ArrowPosition,
  MenuAlignType, MenuItemConfiguration, WrappedBuilder, ContentModifier, Dimension,
  MenuOutlineOptions, OnSelectCallback, CustomBuilderT, SwiperController, Swiper,
  AutoPlayOptions, SwiperDisplayMode, EdgeEffect, OnSwiperAnimationEndCallback,
  OnSwiperAnimationStartCallback, ContentDidScrollCallback, ContentWillScrollCallback,
  SwiperContentWillScrollResult, OnSwiperGestureSwipeCallback,
  SwiperAnimationEvent,ProgressType,Progress,FontStyle,
  AttributeModifier, ListAttribute,Position, Scroll, FontWeight, ComponentV2, Stack,
  Circle, Blank, $rawfile, LocalizedMargin} from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import { IDataSource, DataChangeListener, LazyForEach} from '@kit.ArkUI';
import { BlurStyle, ShadowOptions, ShadowStyle, HoverModeAreaType, Rectangle, TransitionEffect,
  KeyboardAvoidMode, DismissReason, BackgroundBlurStyleOptions, BackgroundEffectOptions,
  BlurStyleActivePolicy, ThemeColorMode, AdaptiveColor, ShadowType  } from 'arkui.component.common';
import { DismissDialogAction } from 'arkui.component.actionSheet';
import { AlertDialogParamWithConfirm, AlertDialogParamWithButtons, AlertDialogParamWithOptions,
  DialogAlignment } from 'arkui.component.alertDialog';
import { WordBreak, DialogButtonStyle, BorderStyle, Alignment, Curve } from 'arkui.component.enums';
import { ActionSheetOptions, ActionSheetButtonOptions } from 'arkui.component.actionSheet';
import { NavPathStack, NavigationOperation, NavBar, Navigation } from 'arkui.component.navigation';
import { ButtonType, ButtonStyleMode, ButtonRole } from 'arkui.component.button';
import { NavDestination } from 'arkui.component.navDestination';
import { Scroller } from 'arkui.component.scroll';
import { ColoringStrategy } from 'arkui.component.enums'
import { LengthUnit } from 'arkui.Graphics'
import { ColorMetrics, LengthMetrics } from '@ohos.arkui.node';
import { ArcButton, ArcButtonOptions, ArcButtonStatus, ArcButtonStyleMode,
  ArcButtonPosition, ArcButtonProgressConfig} from '@ohos.arkui.advanced.ArcButton'
import { ObservedV2, Monitor, IMonitor, Require, Trace, Param, Local, State } from '@ohos.arkui.stateManagement';

@Entry
@ComponentV2
struct progress {
  @Local message: string = 'Hello World';
  @Local onClickBoolean: boolean = false;
  backgroundColorListIndex1: int = 0;
  backgroundColorListIndex2: int = 0;
  backgroundColorList: (ResourceColor)[] = [
    Color.Black,
    Color.Red,
    '77895',
    '#ff950fdd',
    50,
    'rgba(23,169,141,0.5)',
    12345,
    -12345,
    0
  ]

  @Local progressConfig: ArcButtonProgressConfig = new ArcButtonProgressConfig(20);
  @Local topOptions: ArcButtonOptions = new ArcButtonOptions({
    styleMode: ArcButtonStyleMode.CUSTOM,
    status:ArcButtonStatus.NORMAL,
    label: 'Test Progress',
    fontSize: new LengthMetrics(10, LengthUnit.FP),
    backgroundColor: ColorMetrics.numeric(0xff87F787 as Int),
    fontColor: ColorMetrics.numeric(0xffffff as Int),
    progressConfig: this.progressConfig,
    position: ArcButtonPosition.TOP_EDGE,
    backgroundBlurStyle: BlurStyle.Thick,
    shadowColor: ColorMetrics.resourceColor('#FF4151'),
    shadowEnabled: true,
    pressedFontColor: ColorMetrics.resourceColor('#FF4151'),
    fontStyle: FontStyle.Italic,
    fontFamily: 'Bold',
    fontMargin: {
      start: LengthMetrics.vp(24),
      top: LengthMetrics.vp(10),
      end: LengthMetrics.vp(24),
      bottom: LengthMetrics.vp(16)
    } as LocalizedMargin,
    onClick: () => {
      this.onClickBoolean = true
    },
    onTouch: () => {
    },
  });

  private uiContext: UIContext = this.getUIContext();

  build() {
    Column() {
      Text(''+this.onClickBoolean).key('arcButtonTest')
      ArcButton({ options: this.topOptions })
    }
    .width('100%')
    .height('100%')
  }
}
