'use static'

/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  TabContentAnimatedTransition,
  ListScroller,
  LengthConstrain,
  AttributeModifier,
  UIGridEvent,
  ScrollSource,
  NodeContainer,
  ImageAttribute,
  ScrollAttribute,
  GridAttribute,
  ListAttribute,
  ResourceColor,
  ScrollBarMargin,
  TabContentTransitionProxy,
  FocusWrapMode,
  TabsController,
  BarPosition,
  Divider,
  EdgeEffect,
  BarMode,
  AnimationMode,
  Position,
  LocalizedEdgeColors,
  OutlineStyle,
  WaterFlowAttribute,
  EdgeOutlineStyles,
  EdgeOutlineWidths,
  EdgeColors,
  OutlineRadiuses,
  Circle,
  ExpectedFrameRateRange,
  PlayMode,
  OnAlphabetIndexerRequestPopupDataCallback,
  OnAlphabetIndexerPopupSelectCallback,
  AlphabetIndexerOptions,
  Column,
  OnAlphabetIndexerSelectCallback,
  IndexerAlign,
  TextAlign,
  AlphabetIndexer,
  ListItem,
  Stack,
  ButtonType,
  HoverModeAreaType,
  Length,
  SheetSize,
  SheetType,
  EffectEdge,
  FontWeight,
  FontStyle,
  Font,
  PopupOptions,
  RefreshStatus,
  PopupMessageOptions,
  Placement,
  LocalizedBorderRadiuses,
  BorderRadiuses,
  LengthMetrics,
  TextInput,
  Margin,
  $$,
  SheetKeyboardAvoidMode,
  SheetOptions,
  SheetTitleOptions,
  Orientation,
  ThemeColorMode,
  BlurStyle,
  ScrollBar,
  BackgroundBlurStyleOptions,
  MoreButtonOptions,
  BlurOptions,
  AdaptiveColor,
  BackgroundEffectOptions,
  ItemFillPolicy,
  NavDestinationActiveReason,
  $r,
  HorizontalAlign,
  ForEach,
  List,
  NavigationMode,
  Alignment,
  Refresh,
  Entry,
  Builder,
  PopInfo,
  NavBarPosition,
  Callback,
  Text,
  TextAttribute,
  BarStyle,
  Image,
  Color,
  Row,
  ScrollBarDirection,
  NavDestinationCommonTitle,
  Component,
  Button,
  ButtonAttribute,
  Scroll,
  ClickEvent,
  Curve,
  NavPathStack,
  Navigation,
  LayoutSafeAreaEdge,
  LaunchMode,
  NavigationMenuItem,
  NavPathInfo,
  NavDestination,
  LayoutSafeAreaType,
  NavigationOptions,
  NavigationTitleMode,
  NavigationCommonTitle,
  ScrollSnapAnimationSpeed,
  ScrollSnapAlign,
  ScrollDirection,
  NavDestinationMode,
  NavDestinationContext,
  PinchGesture,
  GestureEvent,
  Visibility,
  WaterFlow,
  FlowItem,
  ItemDragInfo,
  ScrollState,
  Scroller,
  LazyForEach,
  Blank,
  GridDirection,
  BarState,
  GridItem,
  Grid,
  GridLayoutOptions,
  ScrollBarAttribute,
  ColorMetrics,
  PresetFillType,
  ColumnOptions,
  Margin
} from '@ohos.arkui.component'

import { State, Consume, AppStorage, Observed } from '@ohos.arkui.stateManagement'

import hilog from '@ohos.hilog'

import { UIContext } from '@ohos.arkui.UIContext'

import { LengthUnit, typeNode } from '@ohos.arkui.node'

import { BusinessError } from '@kit.BasicServicesKit'
@Observed
export class Modifier2 implements AttributeModifier<WaterFlowAttribute> {
  public startDragging: string = 'start';
  public stopDragging: string = 'start';
  public willStopDragging: string = 'start';
  public startFling: string = 'start';
  public stopFling: string = 'start';
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance
      .onWillStartDragging(()=>{
        this.startDragging = 'onWillStartDragging'
        console.log('WaterFlow callback onWillStartDragging')
      })
      .onWillStopDragging((velocity: number)=>{
        this.willStopDragging = 'onWillStopDragging'
        console.log('WaterFlow callback1 onWillStopDragging velocity = ' + velocity)
      })
      .onDidStopDragging((willFling : boolean)=>{
        this.stopDragging = 'onDidStopDragging willFling: ' + willFling
        console.log('WaterFlow callback2 onDidStopDragging willFling = ' + willFling)
      })
      .onWillStartFling(()=>{
        this.startFling = 'onWillStartFling'
        console.log('WaterFlow callback3 onWillStartFling')
      })
      .onDidStopFling(()=>{
        this.stopFling = 'onDidStopFling'
        console.log('WaterFlow callback4 onDidStopFling')
      })
  }
}

@Entry
@Component
struct WaterFlowDraggingFlingModifier {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  scroller: Scroller = new Scroller()
  @State private modifier2: Modifier2 = new Modifier2()

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text(this.modifier2.startDragging).key('waterFlowModifier_startDragging')
        .margin({top: 5} as Margin)
      Text(this.modifier2.willStopDragging).key('waterFlowModifier_willStopDragging')
      Text(this.modifier2.stopDragging).key('waterFlowModifier_stopDragging')
      Row(){
        Text(this.modifier2.startFling).key('waterFlowModifier_startFling').margin({right:5} as Margin)
        Text(this.modifier2.stopFling).key('waterFlowModifier_stopFling')
      }

      WaterFlow() {
        ForEach(this.arr, (i: number) => {
          FlowItem() {
            Text(`${i}`)
              .fontSize(20)
              .textAlign(TextAlign.Center)
              .width('50%')
              .height(80)
          }
        }, (i: number) => i.toString())
      }
      .id('waterFlowModifier_dragging_fling')
      .attributeModifier(this.modifier2)
      .width('90%')
      .height('40%')
      .scrollBar(BarState.On)
      .backgroundColor(0xFAEEE0)
      .borderRadius(10)
      .border({ width:1})


    }.width('100%')
    .margin({ top: 5 } as Margin)
  }
}