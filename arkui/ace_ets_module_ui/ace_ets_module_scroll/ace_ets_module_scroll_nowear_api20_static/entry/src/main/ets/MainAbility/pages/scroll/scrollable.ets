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
struct Scrollable {
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 20; i++) {
      arr.push(i);
    }
    return arr;
  })();

  @Builder
  private ScrollWithDirection(direction: ScrollDirection | undefined, tip: string, id: number) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)

      // 根据滚动方向选择不同的布局方式
      if (direction === ScrollDirection.Horizontal) {
        // 横向滚动使用Row布局
        Scroll() {
          Row() {
            ForEach(this.data, (i: number) => {
              Text(`项目 ${i}`)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .width(120)
                .height(60)
            }, (i: number) => i.toString())
          }
          .height('100%')
          .padding(10)
        }
        .id(`scrollable_00${id}`)
        .scrollable(direction)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Blue)
        .scrollBarWidth(4)
        .width('100%')
        .height(120)
        .backgroundColor(0xFFF8F0)
        .border({
          width: 2,
          color: direction === ScrollDirection.Horizontal ? Color.Red :
            direction === ScrollDirection.Vertical ? Color.Green : Color.Gray
        })
      } else if(direction === ScrollDirection.FREE){
        Scroll() {
          Image($r('app.media.startIcon')) // 'app.media.image1'仅作示例，请替换实际图片。
        }
        .id(`scrollable_00${id}`)
        .height(400)
        .scrollable(ScrollDirection.FREE)
        .minZoomScale(1)
        .maxZoomScale(2)
        .enableBouncesZoom(true)
      } else {
        // 竖向滚动和禁止滚动使用Column布局
        Scroll() {
          Column() {
            ForEach(this.data, (i: number) => {
              Text(`项目 ${i}`)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .width('100%')
                .height(60)
            }, (i: number) => i.toString())
          }
          .width('100%')
          .padding(10)
        }
        .id(`scrollable_00${id}`)
        .scrollable(direction)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Blue)
        .scrollBarWidth(4)
        .width('100%')
        .height(120)
        .backgroundColor(0xFFF8F0)
        .border({
          width: 2,
          color: direction === ScrollDirection.Horizontal ? Color.Red :
            direction === ScrollDirection.Vertical ? Color.Green : Color.Gray
        })
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('scrollable 滚动方向测试总览')
          .fontSize(20).fontWeight(FontWeight.Bold)

        Text('属性说明：设置Scroll组件的滚动方向，包括竖向、横向和禁止滚动')
          .fontSize(12).fontColor(Color.Gray)

        this.ScrollWithDirection(ScrollDirection.Vertical, '竖向滚动 ScrollDirection.Vertical', 1)
        this.ScrollWithDirection(ScrollDirection.Horizontal, '横向滚动 ScrollDirection.Horizontal', 2)
        this.ScrollWithDirection(ScrollDirection.None, '禁止滚动 ScrollDirection.None', 3)
        this.ScrollWithDirection(ScrollDirection.FREE, '自由滚动 ScrollDirection.FREE', 4)
        this.ScrollWithDirection(undefined, 'undefined', 5)
        Divider()
      }
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}