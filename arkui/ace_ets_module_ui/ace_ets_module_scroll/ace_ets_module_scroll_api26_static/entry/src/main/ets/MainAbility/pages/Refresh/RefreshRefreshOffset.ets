/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use static'

import {
  TabContentAnimatedTransition,
  ListItemAlign,
  RefreshAttribute,
  ListScroller,
  LengthConstrain,
  AttributeModifier,
  ScrollSource,
  NodeContainer,
  ImageAttribute,
  ScrollAttribute,
  GridAttribute,
  ListAttribute,
  ResourceColor,
  Resource,
  TabContentTransitionProxy,
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
  ColorMetrics
} from '@ohos.arkui.component'

import { State, Consume, AppStorage, Observed } from '@ohos.arkui.stateManagement'

import hilog from '@ohos.hilog'

import { UIContext } from '@ohos.arkui.UIContext'

import { LengthUnit, typeNode } from '@ohos.arkui.node'

import { BusinessError } from '@kit.BasicServicesKit'

import common from '@ohos.app.ability.common';

import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';

@Entry
@Component
struct refreshOffsetIndex {
  @State isRefreshing1: boolean = false;
  @State arr1: String[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  @State promptText1: string = 'Refreshing1...';
  @State changeRefreshOffsetIndex: Int = 0;
  @State changeRefreshOffsetList: ( Resource )[] = [
    $r('app.string.refreshOffset_Normal'),$r('app.string.refreshOffset_Error')
  ]

  build() {
    Column() {
      Row(){
        Button('0')
          .onClick(() => {
            this.changeRefreshOffsetIndex = 0
          })
          .id('changeRefreshOffsetValue0')
        Button('1')
          .onClick(() => {
            this.changeRefreshOffsetIndex = 1
          })
          .id('changeRefreshOffsetValue1')
      }
      Row(){
        Refresh({ refreshing: this.isRefreshing1, promptText: this.promptText1 }) {
          List() {
            ForEach(this.arr1, (item: string) => {
              ListItem() {
                Text('' + item)
                  .width('70%')
                  .height(80)
                  .fontSize(16)
                  .margin(10)
                  .textAlign(TextAlign.Center)
                  .borderRadius(10)
                  .backgroundColor(0xFFFFFF)
              }
            }, (item: string) => item)
          }
          .width('100%')
          .height('100%')
          .alignListItem(ListItemAlign.Center)
          .scrollBar(BarState.Off)
        }
        .id('refreshOffsetStatic1')
        .refreshOffset(this.changeRefreshOffsetList[this.changeRefreshOffsetIndex])
        .onStateChange((refreshStatus: RefreshStatus) => {
          console.info(' Refresh onStatueChange state is ' + refreshStatus);
        })
        .onOffsetChange((value: Double) => {
          console.info(' Refresh onOffsetChange offset:' + value);
        })
        .onRefreshing(() => {
          setTimeout(() => {
            this.isRefreshing1 = false;
          }, 2000)
          console.info('onRefreshing test');
        })
        .width('50%')
        .backgroundColor(0x89CFF0)
        .pullToRefresh(true)
      }
    }
    .width('100%')
  }
}