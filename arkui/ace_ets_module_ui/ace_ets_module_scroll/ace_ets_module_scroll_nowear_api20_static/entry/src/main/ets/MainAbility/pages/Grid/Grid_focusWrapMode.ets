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
struct GridFocusWrapMode {
  /* ===================== 数据：30 项 ===================== */
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();

  /* ========== 动态切换专用 ========== */
  private modeList: (FocusWrapMode | undefined)[] = [
    FocusWrapMode.WRAP_WITH_ARROW,
    FocusWrapMode.DEFAULT,
    undefined,
  ];
  @State private idx: Int = 0;
  @State private focusWrapMode: FocusWrapMode | undefined = this.modeList[0];

  /* ========== 构造器：Grid ========== */
  @Builder
  private GridWithFocusWrapMode(mode: FocusWrapMode | undefined, tip: string) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
      Grid() {
        ForEach(this.data, (i: number) => {
          GridItem() {
            Text(`${i}`)
              .focusable(true)
              .fontSize(20)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height(80)
              .backgroundColor(0xFFE4B5)
          }.focusable(true)
        }, (i: number) => i.toString())
      }
      .focusable(true)
      .columnsTemplate('1fr 1fr 1fr')
      .focusWrapMode(mode) // 关键属性
      .width('100%')
      .height(400)
      .backgroundColor(0xFFF8F0)
      .key(tip)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('focusWrapMode 测试总览')
          .fontSize(20).fontWeight(FontWeight.Bold)

        /* ---------- 静态区域 ---------- */
        Text('静态场景（固定值）').fontSize(16).fontWeight(FontWeight.Medium)
        this.GridWithFocusWrapMode(FocusWrapMode.DEFAULT, 'focusWrapMode')
        this.GridWithFocusWrapMode(undefined, 'focusWrapMode1')
        this.GridWithFocusWrapMode(FocusWrapMode.WRAP_WITH_ARROW, 'focusWrapMode2')
        this.GridWithFocusWrapMode(undefined, 'focusWrapMode3')

        Divider()

        /* ---------- 动态切换区域 ---------- */
        Text('动态切换场景').fontSize(16).fontWeight(FontWeight.Medium)
        Row() {
          Button('切换 value')
            .onClick(() => {
              this.idx = (this.idx + 1) % this.modeList.length;
              this.focusWrapMode = this.modeList[this.idx];
            })
          Text(`当前值：${JSON.stringify(this.focusWrapMode)}`)
            .fontSize(14).layoutWeight(1)
        }
        .width('100%')

        Column() {
          Text('动态 Grid').fontSize(14).fontColor(Color.Gray)
          Grid() {
            ForEach(this.data, (i: number) => {
              GridItem() {
                Text(`${i}`)
                  .focusable(true)
                  .fontSize(20)
                  .textAlign(TextAlign.Center)
                  .width('100%')
                  .height(80)
                  .backgroundColor(0xFFE4B5)
              }.focusable(true)
            }, (i: number) => i.toString())
          }
          .focusable(true)
          .columnsTemplate('1fr 1fr 1fr')
          .focusWrapMode(this.focusWrapMode) // @State 绑定
          .width('100%')
          .height(400)
          .backgroundColor(0xFFF8F0)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
      }
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}