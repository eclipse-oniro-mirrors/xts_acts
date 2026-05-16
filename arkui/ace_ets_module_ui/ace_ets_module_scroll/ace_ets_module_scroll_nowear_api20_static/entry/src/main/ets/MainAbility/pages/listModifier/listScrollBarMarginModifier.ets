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


// 定义不同的 ScrollBarMargin Modifier 类
@Observed
export class ListScrollBarMarginNormalModifier implements AttributeModifier<ListAttribute> {
  private margin: ScrollBarMargin;

  constructor(margin: ScrollBarMargin) {
    this.margin = margin;
  }

  applyNormalAttribute(instance: ListAttribute): void {
    instance.scrollBarMargin(this.margin);
  }
}
@Observed
export class ListScrollBarMarginEmptyModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.scrollBarMargin({} as ScrollBarMargin);
  }
}
@Observed
export class ListScrollBarMarginUndefinedModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.scrollBarMargin(undefined);
  }
}

@Entry
@Component
struct ListScrollBarMarginModifier {
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();
  // 创建Modifier实例
  @State private normalModifier: ListScrollBarMarginNormalModifier = new ListScrollBarMarginNormalModifier({
    start: new LengthMetrics(45, LengthUnit.VP),
    end:   new LengthMetrics(70, LengthUnit.VP)
  });

  @State private emptyModifier: ListScrollBarMarginEmptyModifier = new ListScrollBarMarginEmptyModifier();
  @State private undefinedModifier: ListScrollBarMarginUndefinedModifier = new ListScrollBarMarginUndefinedModifier();

  @Builder
  private ListScrollWithBarMargin(modifier: AttributeModifier<ListAttribute>, tip: string, id: number) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
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
      .id(`listScrollBarMarginModifier_00${id}`)
      .attributeModifier(modifier)  // 使用attributeModifier应用Modifier
      .scrollBar(BarState.On)
      .scrollBarWidth(6)
      .scrollBarColor(Color.Red)
      .height(200)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)

  }

  build() {
    Scroll() {
      Column() {
        Text('scrollBarMargin 测试总览 - Modifier版本')
          .fontSize(20).fontWeight(FontWeight.Bold)

        Text('属性说明：通过AttributeModifier设置Scroll组件的滚动条边距')
          .fontSize(12).fontColor(Color.Gray)
        this.ListScrollWithBarMargin(this.normalModifier, '正常值：{start:45, end:70}', 1)
        this.ListScrollWithBarMargin(this.emptyModifier, '异常值：空对象 {}', 2)
        this.ListScrollWithBarMargin(this.undefinedModifier, '不传值（默认）', 3)
        Divider()
      }
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}