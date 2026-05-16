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
struct GridContentEndOffset {
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();

  private offsetList: (number | undefined)[] = [60, 0, -20, undefined];
  @State private idx: int = 0;
  @State private contentEndOffset: number | undefined = this.offsetList[0];

  @Builder
  private ScrollGridWithOffset(offset: number | undefined, tip: string) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
      Scroll() { // 滚动容器
        Grid() {
          ForEach(this.data, (i: number) => {
            GridItem() {
              Text(`${i}`)
                .fontSize(20)
                .textAlign(TextAlign.Center)
                .width('100%')
                .height(80)
                .backgroundColor(0xFFE4B5)
            }
          }, (i: number) => i.toString())
        }
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr') // 6 列
        .rowsGap(8)
        .width('100%')
        .backgroundColor(0xFFF8F0)
        .contentEndOffset(offset)
        .key(tip)
      }
      .height(200)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() { // 外层页面滚动
      Column() {
        Text('contentEndOffset 可滚动场景')
          .fontSize(20).fontWeight(FontWeight.Bold)

        Text('静态场景（固定值）').fontSize(16).fontWeight(FontWeight.Medium)
        this.ScrollGridWithOffset(60, 'contentEndOffset')
        this.ScrollGridWithOffset(undefined, 'contentEndOffset1')
        this.ScrollGridWithOffset(0, 'contentEndOffset3')
        this.ScrollGridWithOffset(undefined, '显式 contentEndOffset4')

        Divider()

        Text('动态切换场景').fontSize(16).fontWeight(FontWeight.Medium)
        Row() {
          Button('切换 value')
            .onClick(() => {
              this.idx = (this.idx + 1) % this.offsetList.length;
              this.contentEndOffset = this.offsetList[this.idx];
            })
          Text(`当前值：${JSON.stringify(this.contentEndOffset)}`)
            .fontSize(14).layoutWeight(1)
        }
        .width('100%')

        Column() {
          Text('动态 Scroll + Grid').fontSize(14).fontColor(Color.Gray)
          Scroll() {
            Grid() {
              ForEach(this.data, (i: number) => {
                GridItem() {
                  Text(`${i}`)
                    .fontSize(20)
                    .textAlign(TextAlign.Center)
                    .width('100%')
                    .height(80)
                    .backgroundColor(0xFFE4B5)
                }
              }, (i: number) => i.toString())
            }
            .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr')
            .rowsGap(8)
            .width('100%')
            .backgroundColor(0xFFF8F0)
            .contentEndOffset(this.contentEndOffset) // @State 绑定
          }
          .height(200)
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