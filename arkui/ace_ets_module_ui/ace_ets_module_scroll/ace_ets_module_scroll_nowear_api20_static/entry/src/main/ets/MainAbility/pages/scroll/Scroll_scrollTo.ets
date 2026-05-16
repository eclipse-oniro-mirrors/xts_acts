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
struct Scroll_scrollTo {
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();
  private scroller: Scroller = new Scroller();
  private scroller2: Scroller = new Scroller();

  @State private currentX: number = 0;
  @State private currentY: number = 0;
  @State private statusText: string = '点击按钮测试不同参数的 scrollTo 方法';

  build() {
    Column() {
      Row(){
        Scroll(this.scroller) {
          Column(){
            ForEach(this.data, (item: number) => {
              Text(`Item_1_${item}`)
                .fontSize(18)
                .textAlign(TextAlign.Center)
                .width('100%')
                .height(80)
                .borderRadius(8)
                .id(`Item_1_${item}`)
            }, (item: number) => item.toString())
          }
        }
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.On)
        .width('40%')
        .height(160)
        .backgroundColor(0xF5F5F5)
        Scroll(this.scroller2) {
          Column(){
            ForEach(this.data, (item: number) => {
              Text(`Item_2_${item}`)
                .fontSize(18)
                .textAlign(TextAlign.Center)
                .width('100%')
                .height(80)
                .borderRadius(8)
                .id(`Item_2_${item}`)
            }, (item: number) => item.toString())
          }
        }
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.On)
        .width('40%')
        .height(160)
        .backgroundColor(0xF5F5F5)
      }

      // 精简测试按钮
        Button('正常值')
          .onClick(() => {
            this.scroller.scrollTo({ xOffset: 160, yOffset: 160 });
            this.statusText = '正常值: {xOffset:200, yOffset:200}';
          }).id('Button1')
        Button('异常值')
          .onClick(() => {
            this.scroller2.scrollTo({ xOffset: -160, yOffset: -160 }); // 负值异常
            this.statusText = '异常值: 负偏移量';
          }).id('Button2')
    }
    .padding(16)
    .width('100%')
    .height('100%')
  }

}