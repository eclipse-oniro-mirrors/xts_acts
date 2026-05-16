'use static'

// 核心UI组件与属性（合并所有唯一项，去重后）
import {
  TabContentAnimatedTransition,
  ResourceColor,
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
  OnAlphabetIndexerSelectCallback,
  IndexerAlign,
  TextAlign,
  AlphabetIndexer,
  ListItem,
  Stack,
  Color,
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
  Entry,
  Builder,
  PopInfo,
  NavBarPosition,
  Callback,
  Text,
  TextAttribute,
  BarStyle,
  Image,
  Row,
  Column,
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
  NavDestinationMode,
  NavDestinationContext,
  PinchGesture,
  GestureEvent,
  Visibility,
  ItemDragInfo,
  ScrollState,
  Scroller,
  LazyForEach,
  Blank,
  GridDirection,
  BarState,
  GridItem,
  Grid,
  GridLayoutOptions
} from '@ohos.arkui.component'

import { State, Consume, AppStorage } from '@ohos.arkui.stateManagement'

import hilog from '@ohos.hilog'

import { UIContext } from '@ohos.arkui.UIContext'

@Entry
@Component
struct ListScrollBarColor {
  // 数据源：30个数字
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();

  /* ========== 动态切换专用 ========== */
  private colorList: (ResourceColor | undefined)[] = [
    Color.Red,            // 正常
    0x00ff00,            // 正常
    '',                   // 空字符串
    undefined,            // undefined
  ];

  @State private idx: Int = 0;
  @State private scrollBarColor: ResourceColor | undefined = this.colorList[0];

  @Builder
  private ScrollListWithBarColor(color: ResourceColor | undefined, tip: string) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
      Scroll() {
        List() {
          ForEach(this.data, (i: number) => {
            ListItem() {
              Text(`${i}`)
                .fontSize(20)
                .textAlign(TextAlign.Center)
                .width('100%')
                .height(80)
            }
          }, (i: number) => i.toString())
        }
        .width('100%')
        .backgroundColor(0xFFF8F0)
      }
      .scrollBar(BarState.On)
      .scrollBarWidth(4)
      .scrollBarColor(color)
      .height(200)
      .key(tip)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('scrollBarColor 测试总览 - List版本')
          .fontSize(20).fontWeight(FontWeight.Bold)

        Text('静态场景（固定值）').fontSize(16).fontWeight(FontWeight.Medium)
        this.ScrollListWithBarColor(Color.Red, 'color')
        this.ScrollListWithBarColor('#00FF00', 'color1')
        this.ScrollListWithBarColor('', 'color2')
        this.ScrollListWithBarColor(undefined, 'color3')
        this.ScrollListWithBarColor(Color.Blue, 'color4')

        Divider()

        Text('动态切换场景').fontSize(16).fontWeight(FontWeight.Medium)
        Row() {
          Button('切换 value')
            .onClick(() => {
              this.idx = (this.idx + 1) % this.colorList.length;
              this.scrollBarColor = this.colorList[this.idx];
            })
          Text(`当前值：${JSON.stringify(this.scrollBarColor)}`)
            .fontSize(14).layoutWeight(1)
        }
        .width('100%')

        Column() {
          Text('动态 Scroll + List').fontSize(14).fontColor(Color.Gray)
          Scroll() {
            List() {
              ForEach(this.data, (i: number) => {
                ListItem() {
                  Text(`${i}`)
                    .fontSize(20)
                    .textAlign(TextAlign.Center)
                    .width('100%')
                    .height(80)
                }
              }, (i: number) => i.toString())
            }
            .width('100%')
            .backgroundColor(0xFFF8F0)
          }
          .scrollBar(BarState.On)
          .scrollBarWidth(4)
          .scrollBarColor(this.scrollBarColor)
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