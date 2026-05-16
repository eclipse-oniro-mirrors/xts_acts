'use static'

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
  PresetFillType
} from '@ohos.arkui.component'

import { State, Consume, AppStorage, Observed } from '@ohos.arkui.stateManagement'

import hilog from '@ohos.hilog'

import { UIContext } from '@ohos.arkui.UIContext'

import { LengthUnit, typeNode } from '@ohos.arkui.node'

import { BusinessError } from '@kit.BasicServicesKit'
@Entry
@Component
struct GridOnDidStopDraggingDemo {
  // 数据源：30个数字
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();

  // 状态变量，用于显示回调触发信息
  @State private triggerCount: Int = 0;
  @State private lastWillFling: boolean = false;
  @State private statusText: string = '拖拽Grid并观察回调触发';

  build() {
    Column() {
      // 显示区域
      Text('onDidStopDragging 检验Demo')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Text(this.statusText)
        .fontSize(16)
        .fontColor(Color.Blue)
        .key('onDidStopDragging')

      Text(`回调触发次数: ${this.triggerCount}`)
        .fontSize(14)

      Text(`最后一次willFling参数: ${this.lastWillFling}`)
        .fontSize(14)
        .fontColor(this.lastWillFling ? Color.Red : Color.Green)

      Divider()

      Grid() {
        ForEach(this.data, (item: number) => {
          GridItem() {
            Text(item.toString())
              .fontSize(18)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height(80)
              .backgroundColor(0xAFEEEE)
              .borderRadius(8)
          }
        }, (item: number) => item.toString())
      }
      .columnsTemplate('1fr 1fr')
      .onDidStopDragging((willFling: boolean) => {
        this.triggerCount += 1;
        this.lastWillFling = willFling;
        this.statusText = `第${this.triggerCount}次触发 - ${willFling ? '有Fling动效' : '无Fling动效'}`;
        console.log(`onDidStopDragging触发: willFling = ${willFling}, 触发次数: ${this.triggerCount}`);
      })
      .width('100%')
      .height(400)
      .backgroundColor(0xF5F5F5)
      .key('grid_dragging')

      Button('重置计数')
        .onClick(() => {
          this.triggerCount = 0;
          this.lastWillFling = false;
          this.statusText = '计数已重置，请继续拖拽检验';
          console.log('计数器已重置');
        })
    }
    .padding(16)
    .width('100%')
    .height('100%')
  }
}