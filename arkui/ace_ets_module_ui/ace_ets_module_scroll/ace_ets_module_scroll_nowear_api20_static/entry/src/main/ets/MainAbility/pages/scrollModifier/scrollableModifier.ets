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

// 定义不同的 ScrollModifier 类
@Observed
export class ScrollVerticalModifier implements AttributeModifier<ScrollAttribute> {
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.scrollable(ScrollDirection.Vertical);
  }
}
@Observed
export class ScrollHorizontalModifier implements AttributeModifier<ScrollAttribute> {
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.scrollable(ScrollDirection.Horizontal);
  }
}
@Observed
export class ScrollNoneModifier implements AttributeModifier<ScrollAttribute> {
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.scrollable(ScrollDirection.None);
  }
}
@Observed
export class ScrollFreeModifier implements AttributeModifier<ScrollAttribute> {
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.scrollable(ScrollDirection.FREE);
  }
}
@Observed
export class ScrollUndefinedModifier implements AttributeModifier<ScrollAttribute> {
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.scrollable(undefined);
  }
}

@Entry
@Component
struct ScrollableModifier {
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 20; i++) {
      arr.push(i);
    }
    return arr;
  })();

  @State private scrollVerticalModifier: ScrollVerticalModifier = new ScrollVerticalModifier();
  @State private scrollHorizontalModifier: ScrollHorizontalModifier = new ScrollHorizontalModifier();
  @State private scrollNoneModifier: ScrollNoneModifier = new ScrollNoneModifier();
  @State private scrollFreeModifier: ScrollFreeModifier = new ScrollFreeModifier();
  @State private scrollUndefinedModifier: ScrollUndefinedModifier = new ScrollUndefinedModifier();

  @Builder
  private ScrollWithDirection(modifier: AttributeModifier<ScrollAttribute>, tip: string, id: number) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)

      if (modifier instanceof ScrollHorizontalModifier) {
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
        .id(`scrollableModifier_00${id}`)
        .attributeModifier(modifier)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Blue)
        .scrollBarWidth(4)
        .width('100%')
        .height(120)
        .backgroundColor(0xFFF8F0)
        .border({
          width: 2,
          color: Color.Red
        })
      } else if (modifier instanceof ScrollFreeModifier) {
        // 自由滚动模式 - 支持缩放
        Scroll() {
          Image($r('app.media.startIcon'))
        }
        .id(`scrollableModifier_00${id}`)
        .height(400)
        .attributeModifier(modifier)
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
        .id(`scrollableModifier_00${id}`)
        .attributeModifier(modifier)
        .scrollBar(BarState.On)
        .scrollBarColor(Color.Blue)
        .scrollBarWidth(4)
        .width('100%')
        .height(120)
        .backgroundColor(0xFFF8F0)
        .border({
          width: 2,
          color: modifier instanceof ScrollVerticalModifier ? Color.Green : Color.Gray
        })
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('scrollable 滚动方向测试 (Modifier方式)')
          .fontSize(20).fontWeight(FontWeight.Bold)

        Text('属性说明：通过AttributeModifier设置Scroll组件的滚动方向')
          .fontSize(12).fontColor(Color.Gray)

        this.ScrollWithDirection(this.scrollVerticalModifier, '竖向滚动 ScrollDirection.Vertical', 1)
        this.ScrollWithDirection(this.scrollHorizontalModifier, '横向滚动 ScrollDirection.Horizontal', 2)
        this.ScrollWithDirection(this.scrollNoneModifier, '禁止滚动 ScrollDirection.None', 3)
        this.ScrollWithDirection(this.scrollFreeModifier, '自由滚动 ScrollDirection.FREE', 4)
        this.ScrollWithDirection(this.scrollUndefinedModifier, 'undefined', 5)
        Divider()
      }
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}