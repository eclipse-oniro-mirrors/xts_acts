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
  OnScrollFrameBeginHandlerResult,
  GridItemAttribute,
  FlowItemAttribute,
  UIWaterFlowEvent,
  SheetKeyboardAvoidMode,
  ContentSlot,
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
struct bindWaterFlowController {
  private nodeContent: NodeContent = new NodeContent();
  private rootNode?: FrameNode;
  private textAttribute?: TextAttribute;
  scroller: Scroller = new Scroller();
  private gridAttribute?: GridAttribute;
  private gridItemAttribute?: GridItemAttribute;
  private waterFlowAttribute?: WaterFlowAttribute;
  private flowItemAttribute?: FlowItemAttribute;
  private waterFlowEvent?: UIWaterFlowEvent;
  private minHeight: number = 80;
  private maxHeight: number = 180;

  @State setOnDidScroll: string = '0'
  @State setOnReachEnd: string = '0'
  @State setOnReachStart: string = '0'
  @State setOnScrollFrameBegin: string = '0'
  @State setOnScrollIndex: string = '0'
  @State setOnScrollStart: string = '0'
  @State setOnScrollStop: string = '0'
  @State setOnWillScroll: string = '0'

  private getHeight() {
    let ret = Math.floor(Math.random() * this.maxHeight);
    return (ret > this.minHeight ? ret : this.minHeight);
  }

  aboutToAppear() {
    this.rootNode = typeNode.createWaterFlowNode(this.getUIContext());
    this.waterFlowAttribute = typeNode.getWaterFlowAttribute(this.rootNode!)
    this!.waterFlowAttribute!.size({ width: '100%', height: 100 })
      .rowsTemplate('1fr 1fr')
    this!.waterFlowAttribute!.backgroundColor(Color.Pink)
    for (let i = 0; i < 5; i++) {
      let flowItemNode = typeNode.createFlowItemNode(this.getUIContext());
      this.flowItemAttribute = typeNode.getFlowItemAttribute(flowItemNode)
      this!.flowItemAttribute!.size({ height: 40 });
      this!.flowItemAttribute!.backgroundColor(0xF9CF93)
      this!.rootNode!.appendChild(flowItemNode);
      //
      let text = typeNode.createTextNode(this.getUIContext());
      text.initialize('N' + i)
        .size({ width: '100%', height: 40 })
        .textAlign(TextAlign.Center)
      flowItemNode.appendChild(text);
    }
    this.nodeContent.addFrameNode(this.rootNode!);
    this.waterFlowEvent = typeNode.getWaterFlowEvent(this.rootNode as FrameNode)
    this.waterFlowEvent?.setOnDidScroll((scrollOffset: Double, scrollState: ScrollState) => {
      console.info(`xinxi setOnDidScroll scrollOffset = ${scrollOffset}, scrollState = ${scrollState}`);
      this.setOnDidScroll = 'ok'
    });
    this.waterFlowEvent?.setOnReachEnd(() => {
      console.info(`xinxi setOnReachEnd`);
      this.setOnReachEnd = 'ok'
    });
    this.waterFlowEvent?.setOnReachStart(() => {
      console.info(`xinxi setOnReachStart`);
      this.setOnReachStart += 'ok'
    });
    this.waterFlowEvent?.setOnScrollFrameBegin((offset: Double, state: ScrollState) => {
      console.info(`xinxi onScrollFrameBegin offset = ${offset}, state = ${state}`);
      this.setOnScrollFrameBegin = 'ok'
      return { offsetRemain: offset } as OnScrollFrameBeginHandlerResult;
    });
    this.waterFlowEvent?.setOnScrollIndex((first: int, last: int) => {
      console.info(`xinxi onScrollIndex start = ${first}, end = ${last}`);
      this.setOnScrollIndex = 'ok'
    });
    this.waterFlowEvent?.setOnScrollStart(() => {
      console.info(`xinxi setOnScrollStart`);
      this.setOnScrollStart = 'ok'
    });
    this.waterFlowEvent?.setOnScrollStop(() => {
      console.info(`xinxi setOnScrollStop`);
      this.setOnScrollStop = 'ok'
    });
    this.waterFlowEvent?.setOnWillScroll((scrollOffset: double, scrollState: ScrollState,
      scrollSource: ScrollSource) => {
      console.info(`xinxi onWillScroll scrollOffset = ${scrollOffset}, scrollState = ${scrollState}, scrollSource = ${scrollSource}`);
      this.setOnWillScroll = 'ok'
    });
    typeNode.bindWaterFlowController(this.rootNode as FrameNode, this.scroller)
  }

  build() {
    Column(undefined) {
      Stack() {
        ContentSlot(this.nodeContent)
      }.id('ContentSlot')
      Row() {
        Column() {
          Button('end')
            .onClick((e: ClickEvent) => {
              this.scroller.scrollBy(0, 200);
            }).id('end')
          Button('start')
            .onClick((e: ClickEvent) => {
              this.scroller.scrollTo({ xOffset: 0, yOffset: 0 })
            }).id('start')
        }
        Column(){
          Text(this.setOnDidScroll).id('setOnDidScroll')
          Text(this.setOnReachEnd).id('setOnReachEnd')
          Text(this.setOnReachStart).id('setOnReachStart')
          Text(this.setOnScrollFrameBegin).id('setOnScrollFrameBegin')
          Text(this.setOnScrollIndex).id('setOnScrollIndex')
          Text(this.setOnScrollStart).id('setOnScrollStart')
          Text(this.setOnScrollStop).id('setOnScrollStop')
          Text(this.setOnWillScroll).id('setOnWillScroll')
        }
      }
    }.width('100%').height('100%')
  }
}