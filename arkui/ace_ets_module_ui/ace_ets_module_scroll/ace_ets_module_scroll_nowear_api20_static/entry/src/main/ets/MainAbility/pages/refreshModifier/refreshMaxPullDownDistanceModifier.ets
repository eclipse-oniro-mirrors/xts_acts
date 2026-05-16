'use static'

import {
  TabContentAnimatedTransition,
  ListItemAlign,
  RefreshAttribute,
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

export class MaxPullDownDistanceModifier implements AttributeModifier<RefreshAttribute> {
  public val: Double | undefined = 150 as Double

  constructor(val: Double | undefined) {
    this.val = val
  }

  applyNormalAttribute(instance: RefreshAttribute): void {
    instance.maxPullDownDistance(this.val);
  }
}

@Entry
@Component
struct RefreshMaxPullDownDistanceModifier {
  @State isRefreshing: boolean = false
  @State arr: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
  @State mod1: MaxPullDownDistanceModifier = new MaxPullDownDistanceModifier(150);
  @State mod2: MaxPullDownDistanceModifier = new MaxPullDownDistanceModifier(0);
  @State mod3: MaxPullDownDistanceModifier = new MaxPullDownDistanceModifier(-9999);
  @State mod4: MaxPullDownDistanceModifier = new MaxPullDownDistanceModifier(undefined);

  @Builder
  RefreshCom(modifier: MaxPullDownDistanceModifier,id: number) {
    Refresh({ refreshing: this.isRefreshing }) {
      List() {
        ForEach(this.arr, (item: string) => {
          ListItem() {
            Text('' + item)
              .width('70%')
              .height(80)
              .fontSize(16)
              .margin(10)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
        }, (item: string) => item)
      }
      .width('80%')
      .height('40%')
      .alignListItem(ListItemAlign.Center)
      .scrollBar(BarState.Off)
    }
    .id(`maxPullDownDistanceModifier_00${id}`)
    .attributeModifier(modifier)
    .onRefreshing(() => {
      setTimeout(() => {
        this.isRefreshing = false
      }, 2000)
      console.info('onRefreshing test')
    })
    .backgroundColor(0x89CFF0)
    .refreshOffset(64)
    .pullToRefresh(true)
  }

  build() {
    Scroll() {
      Column() {
        Text('150').fontSize(16).fontWeight(FontWeight.Medium)
        this.RefreshCom(this.mod1,1)
        Text('0').fontSize(16).fontWeight(FontWeight.Medium)
        this.RefreshCom(this.mod2,2)
        Text('-9999').fontSize(16).fontWeight(FontWeight.Medium)
        this.RefreshCom(this.mod3,3)
        Text('undefined').fontSize(16).fontWeight(FontWeight.Medium)
        this.RefreshCom(this.mod4,4)
      }
    }.width('100%')
  }
}
