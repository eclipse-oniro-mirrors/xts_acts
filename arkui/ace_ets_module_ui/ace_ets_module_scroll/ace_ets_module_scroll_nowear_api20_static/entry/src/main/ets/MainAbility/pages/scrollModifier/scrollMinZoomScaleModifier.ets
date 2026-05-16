'use static'

import {
  TabContentAnimatedTransition,
  ColumnOptions,
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
@Observed
export class ScrollNormalModifier implements AttributeModifier<ScrollAttribute> {
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.minZoomScale(5);
  }
}
@Observed
export class ScrollEmptyModifier implements AttributeModifier<ScrollAttribute> {
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.minZoomScale(0);
  }
}
@Observed
export class ScrollInvalidModifier implements AttributeModifier<ScrollAttribute> {
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.minZoomScale(-10);
  }
}
@Observed
export class ScrollExplicitUndefinedModifier implements AttributeModifier<ScrollAttribute> {
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.minZoomScale(undefined);
  }
}
@Observed
export class ScrollDefaultModifier implements AttributeModifier<ScrollAttribute> {
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.minZoomScale(1);
  }
}

@Entry
@Component
struct ScrollMinZoomScaleModifier {
  @State private scrollNormalModifier: ScrollNormalModifier = new ScrollNormalModifier();
  @State private scrollEmptyModifier: ScrollEmptyModifier = new ScrollEmptyModifier();
  @State private scrollInvalidModifier: ScrollInvalidModifier = new ScrollInvalidModifier();
  @State private scrollExplicitUndefinedModifier: ScrollExplicitUndefinedModifier =
    new ScrollExplicitUndefinedModifier();
  @State private scrollDefaultModifier: ScrollDefaultModifier = new ScrollDefaultModifier();
  @Builder
  private ScrollWithMinZoomScale(modifier: AttributeModifier<ScrollAttribute>, tip: string, id: number) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
      Scroll() {
        Column() {
          Image($r('app.media.startIcon'))
        }
        .width('100%')
      }
      .id(`minZoomScaleModifier_00${id}`)
      .height(200)
      .backgroundColor(0xFFF8F0)
      .attributeModifier(modifier)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('minZoomScale 测试总览')
          .fontSize(20).fontWeight(FontWeight.Bold)
        this.ScrollWithMinZoomScale(this.scrollNormalModifier, '正常值：5', 1)
        this.ScrollWithMinZoomScale(this.scrollInvalidModifier, '负值：-10', 2)
        this.ScrollWithMinZoomScale(this.scrollEmptyModifier, '零值：0', 3)
        this.ScrollWithMinZoomScale(this.scrollExplicitUndefinedModifier, '显式 undefined', 4)
        this.ScrollWithMinZoomScale(this.scrollDefaultModifier, ',默认值：1', 5)

        Divider()
      }
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}