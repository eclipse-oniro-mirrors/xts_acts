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
@Observed
export class WaterFlowNormalModifier implements AttributeModifier<WaterFlowAttribute> {
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.contentStartOffset(60);
  }
}
@Observed
export class WaterFlowEmptyModifier implements AttributeModifier<WaterFlowAttribute> {
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.contentStartOffset(0);
  }
}
@Observed
export class WaterFlowInvalidModifier implements AttributeModifier<WaterFlowAttribute> {
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.contentStartOffset(-30);
  }
}
@Observed
export class WaterFlowExplicitUndefinedModifier implements AttributeModifier<WaterFlowAttribute> {
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.contentStartOffset(undefined);
  }
}
@Entry
@Component
struct WaterFlowContentStartOffsetModifier {
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();
  @State private waterFlowNormalModifier: WaterFlowNormalModifier = new WaterFlowNormalModifier();
  @State private waterFlowEmptyModifier: WaterFlowEmptyModifier = new WaterFlowEmptyModifier();
  @State private waterFlowInvalidModifier: WaterFlowInvalidModifier = new WaterFlowInvalidModifier();
  @State private waterFlowExplicitUndefinedModifier: WaterFlowExplicitUndefinedModifier =
    new WaterFlowExplicitUndefinedModifier();

  @Builder
  private ScrollWaterFlowWithOffset(modifier: AttributeModifier<WaterFlowAttribute>, tip: string, id: number) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
      WaterFlow() {
        ForEach(this.data, (i: number) => {
          FlowItem() {
            Text(`${i}`)
              .fontSize(20)
              .textAlign(TextAlign.Center)
              .width('50%')
              .height(80)
          }
        }, (i: number) => i.toString())
      }
      .height(200)
      .backgroundColor(0xFFF8F0)
      .attributeModifier(modifier)
      .id(`waterFlowContentStartOffsetModifier_00${id}`)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('contentStartOffset 可滚动场景 - WaterFlow版本')
          .fontSize(20).fontWeight(FontWeight.Bold)
        this.ScrollWaterFlowWithOffset(this.waterFlowNormalModifier, '正常值：60', 1)
        this.ScrollWaterFlowWithOffset(this.waterFlowEmptyModifier, '零值：0', 3)
        this.ScrollWaterFlowWithOffset(this.waterFlowExplicitUndefinedModifier, '显式 undefined', 4)

        Divider()
      }
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}