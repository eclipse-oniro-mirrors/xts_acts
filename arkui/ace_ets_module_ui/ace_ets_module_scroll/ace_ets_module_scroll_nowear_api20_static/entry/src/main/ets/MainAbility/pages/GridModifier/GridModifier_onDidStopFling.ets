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

// 定义 onDidStopFling 的 Modifier 类
@Observed
export class OnDidStopFlingModifier implements AttributeModifier<GridAttribute> {
  private callback: () => void;

  constructor(callback: () => void) {
    this.callback = callback;
  }

  applyNormalAttribute(instance: GridAttribute): void {
    instance.onDidStopFling(this.callback);
  }
}

@Entry
@Component
struct GridOnDidStopFlingDemoModifier {
  // 数据源：30个数字
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();

  // 状态变量，用于显示回调触发信息
  @State private flingTriggerCount: number = 0;
  @State private statusText: string = '请快速滑动Grid测试fling效果';

  // 创建 Modifier 实例
  @State private flingModifier: OnDidStopFlingModifier = new OnDidStopFlingModifier(
    () => {
      this.handleFlingStop();
    }
  );

  // 处理Fling停止的回调
  private handleFlingStop(): void {
    this.flingTriggerCount += 1;
    this.statusText = `第${this.flingTriggerCount}次Fling停止`;
  }

  build() {
    Column() {
      // 显示区域
      Text('onDidStopFling Demo')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Text(this.statusText)
        .fontSize(16)
        .fontColor(Color.Blue)
        .key('onDidStopFling')

      Text(`Fling回调触发次数: ${this.flingTriggerCount}`)
        .fontSize(14)

      // Grid组件 - 使用 Modifier
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
      .columnsTemplate('1fr 1fr 1fr 1fr') // 4列布局
      .attributeModifier(this.flingModifier)  // 使用 attributeModifier
      .width('100%')
      .height(400)
      .backgroundColor(0xF5F5F5)
      .key('grid_dragging_fling')

      // 操作区域
      Row() {
        Button('重置计数')
          .onClick(() => {
            this.flingTriggerCount = 0;
            this.statusText = '计数已重置';
          })
      }
      .width('100%')

    }
    .padding(16)
    .width('100%')
    .height('100%')
  }
}