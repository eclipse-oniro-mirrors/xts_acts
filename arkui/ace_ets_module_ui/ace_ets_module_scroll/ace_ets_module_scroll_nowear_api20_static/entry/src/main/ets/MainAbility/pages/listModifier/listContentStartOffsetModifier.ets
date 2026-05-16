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
// 定义不同的 ListModifier 类
@Observed
export class ListNormalModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.contentStartOffset(60);
  }
}

@Observed
export class ListEmptyModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.contentStartOffset(0);
  }
}

@Observed
export class ListInvalidModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.contentStartOffset(-30);
  }
}

@Observed
export class ListExplicitUndefinedModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.contentStartOffset(undefined);
  }
}

@Entry
@Component
struct ListContentStartOffsetModifier {
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 12; i++) {
      arr.push(i);
    }
    return arr;
  })();
  @State private listNormalModifier: ListNormalModifier = new ListNormalModifier();
  @State private listEmptyModifier: ListEmptyModifier = new ListEmptyModifier();
  @State private listInvalidModifier: ListInvalidModifier = new ListInvalidModifier();
  @State private listExplicitUndefinedModifier: ListExplicitUndefinedModifier = new ListExplicitUndefinedModifier();

  @Builder
  private ScrollListWithOffset(modifier: AttributeModifier<ListAttribute>, tip: string, id: number) {
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
      .id(`listContentStartOffsetModifier_00${id}`)
      .attributeModifier(modifier)
      .width('100%')
      .height(200)
      .backgroundColor(0xFFF8F0)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('contentStartOffset (Modifier方式)')
          .fontSize(20).fontWeight(FontWeight.Bold)
        this.ScrollListWithOffset(this.listNormalModifier, '正常值：60', 1)
        this.ScrollListWithOffset(this.listEmptyModifier, '零值：0', 2)
        this.ScrollListWithOffset(this.listExplicitUndefinedModifier, '显式 undefined', 4)

        Divider()
      }
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}