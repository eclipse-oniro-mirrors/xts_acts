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
export class ModifierZoomScale5 implements AttributeModifier<ScrollAttribute> {
  public didZoom: string = 'zoom';
  public zoomStart: string = 'start';
  public zoomStop: string = 'stop';
  public currScale: number = 1;
  applyNormalAttribute(instance: ScrollAttribute): void {
    instance
      .zoomScale(this.currScale!!)
      .onDidZoom((scale: number) => {
        this.didZoom = 'onDidZoom: ' + scale
        console.info(`Scroll onDidZoom:${scale}`);
      })
      .onZoomStart(() => {
        this.zoomStart = 'onZoomStart'
        console.info('Scroll onZoomStart');
      })
      .onZoomStop(() => {
        this.zoomStop = 'onZoomStop'
        console.info('Scroll onZoomStop');
      })
  }
}
@Entry
@Component
struct ScrollZoomModifier {
  scroller: Scroller = new Scroller();
  @State private modifier: ModifierZoomScale5 = new ModifierZoomScale5()

  build() {
    Column() {
      Text(this.modifier.didZoom)
        .id('scrollModifier_didZoom')
      Row() {
        Text(this.modifier.zoomStart)
          .id('scrollModifier_Start')
          .margin({ right: 10 })
        Text(this.modifier.zoomStop)
          .id('scrollModifier_Stop')
      }

      Scroll() {
        Image($r('app.media.icon'))
          .id('img_zoom')
          .width('70%')
          .height('100%')
      }
      .id('scrollModifier_zoom')
      .width('80%')
      .height('50%')
      .scrollable(ScrollDirection.FREE)
      .minZoomScale(1)
      .maxZoomScale(2)
      .attributeModifier(this.modifier)
    }.width('100%')
    .height('100%')
  }
}