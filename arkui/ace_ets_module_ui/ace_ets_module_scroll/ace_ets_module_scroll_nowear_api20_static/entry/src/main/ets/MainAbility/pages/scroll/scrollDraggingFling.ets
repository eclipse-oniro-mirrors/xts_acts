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
@Entry
@Component
struct ScrollDraggingFling {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  scroller: Scroller = new Scroller()
  @State startDragging: string = 'start'
  @State stopDragging: string = 'start'
  @State willStopDragging: string = 'start'
  @State startFling: string = 'start'
  @State stopFling: string = 'start'

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text(this.startDragging).key('scroll_startDragging')
        .margin({top: 5} as Margin)
      Text(this.willStopDragging).key('scroll_willStopDragging')
      Text(this.stopDragging).key('scroll_stopDragging')
      Row(){
        Text(this.startFling).key('scroll_startFling').margin({right:5})
        Text(this.stopFling).key('scroll_stopFling')
      }

      Scroll() {
        Column() {
          ForEach(this.arr, (item: number) => {
            Text('' + item.toString())
              .width('100%')
              .height('40%')
              .fontSize(16)
              .margin(10)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xF9CF93)
          }, (item: number) => item.toString())
        }
      }
      .id('scroll_dragging_fling')
      .width('90%')
      .height('40%')
      .scrollBar(BarState.On)
      .backgroundColor(0xFAEEE0)
      .borderRadius(10)
      .border({ width:1})
      .onWillStartDragging(()=>{
        this.startDragging = 'onWillStartDragging'
        console.log('Scroll callback onWillStartDragging')
      })
      .onWillStopDragging((velocity: number)=>{
        this.willStopDragging = 'onWillStopDragging'
        console.log('Scroll callback1 onWillStopDragging velocity = ' + velocity)
      })
      .onDidStopDragging((willFling : boolean)=>{
        this.stopDragging = 'onDidStopDragging willFling: ' + willFling
        console.log('Scroll callback2 onDidStopDragging willFling = ' + willFling)
      })
      .onWillStartFling(()=>{
        this.startFling = 'onWillStartFling'
        console.log('Scroll callback3 onWillStartFling')
      })
      .onDidStopFling(()=>{
        this.stopFling = 'onDidStopFling'
        console.log('Scroll callback4 onDidStopFling')
      })

    }.width('100%')
    .margin({ top: 5 } as Margin)
  }
}