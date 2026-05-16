'use static'


import {
  BuilderNode,
  DrawContext,
  FrameNode,
  NodeContent,
  NodeController
} from '@ohos.arkui.node'
import {
  TabContentAnimatedTransition,
  ListScroller,
  UIScrollEvent,
  LengthConstrain,
  ContentSlot,
  OnScrollFrameBeginHandlerResult,
  GridItemAttribute,
  FlowItemAttribute,
  UIWaterFlowEvent,
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
struct BindScrollController {
  private nodeContent: NodeContent = new NodeContent();
  private rootNode?: FrameNode;
  private textAttribute?: TextAttribute;
  scroller1: Scroller = new Scroller();
  scroller2: Scroller = new Scroller();
  private gridAttribute?: GridAttribute;
  private gridItemAttribute?: GridItemAttribute;
  private waterFlowAttribute?: WaterFlowAttribute;
  private flowItemAttribute?: FlowItemAttribute;
  private scrollAttribute?: ScrollAttribute;
  private scrollEvent?: UIScrollEvent;
  private minHeight: number = 80;
  private maxHeight: number = 180;
  @State scrollOffset: Double = 0;

  private getHeight() {
    let ret = Math.floor(Math.random() * this.maxHeight);
    return (ret > this.minHeight ? ret : this.minHeight);
  }

  aboutToAppear() {
    let scroller: Scroller = new Scroller();

    this.rootNode = typeNode.createScrollNode(this.getUIContext());
    (this.rootNode as typeNode.Scroll)!.initialize(this.scroller1).size({ width: '100%', height: 500 });

    let colNode = typeNode.createColumnNode(this.getUIContext());
    this.rootNode!.appendChild(colNode);

    for (let i = 0; i < 10; i++) {
      let text = typeNode.createTextNode(this.getUIContext());
      text.initialize('item' + i)
        .size({ width: '90%', height: 100 })
        .textAlign(TextAlign.Center)
      colNode.appendChild(text);
    }

    this.nodeContent.addFrameNode(this.rootNode!);
    this.scrollAttribute = typeNode.getScrollAttribute(this.rootNode as FrameNode)
    this.scrollAttribute?.id('ScrollAttribute');
    this.scrollEvent = typeNode.getScrollEvent(this.rootNode as FrameNode)

  }

  build() {
    Column(undefined) {
      Text('ImageFrameNode')
      Stack() {
        ContentSlot(this.nodeContent)
      }

      Column() {
        Text(this.scrollOffset + '')
          .id('scrollOffset')
        Button('bind scroll2')
          .id('bindController')
          .onClick((e: ClickEvent) => {
            typeNode.bindScrollController(this.rootNode as FrameNode, this.scroller2)
          })
        Button('scroller1 scrollBy 150')
          .onClick((e: ClickEvent) => {
            this.scroller1.scrollBy(0, 150);
          })
        Button('scroller2 scrollBy 150')
          .id('scrollerBy')
          .onClick((e: ClickEvent) => {
            this.scroller2.scrollBy(0, 150);
          })

        Button('setOn')
          .id('setOn')
          .onClick((e: ClickEvent) => {
            this.scrollEvent?.setOnDidScroll((scrollOffset: Double, p2: Double, scrollState: ScrollState) => {
              this.scrollOffset = this.scrollOffset + 100;
              console.info(`xinxi setOnDidScroll scrollOffset = ${scrollOffset}, scrollState = ${scrollState}`);
            });
            this.scrollEvent?.setOnReachEnd(() => {
              console.info(`xinxi setOnReachEnd`);
            });
            this.scrollEvent?.setOnScrollStart(() => {
              console.info(`xinxi setOnScrollStart`);
            });
            this.scrollEvent?.setOnScrollFrameBegin((offset: Double, state: ScrollState) => {
              console.info(`xinxi onScrollFrameBegin offset = ${offset}, state = ${state}`);
              return { offsetRemain: offset } as OnScrollFrameBeginHandlerResult;
            });
            this.scrollEvent?.setOnScrollStop(() => {
              console.info(`xinxi setOnScrollStop`);
            });
            this.scrollEvent?.setOnWillScroll(() => {
              console.info(`xinxi onWillScroll`);
            });
          })
      }

      Text('ListSample')
    }.width('100%').height('100%')
  }
}