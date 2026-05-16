'use static'

import { BuilderNode, DrawContext, FrameNode, NodeContent, NodeController } from '@ohos.arkui.node'
import {
  TabContentAnimatedTransition,
  ListScroller,
  ContentSlot,
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
  PresetFillType,
  OnScrollFrameBeginHandlerResult,
  GridItemAttribute,
  FlowItemAttribute,
  UIWaterFlowEvent
} from '@ohos.arkui.component'

import { State, Consume, AppStorage, Observed } from '@ohos.arkui.stateManagement'

import hilog from '@ohos.hilog'

import { UIContext } from '@ohos.arkui.UIContext'

import { LengthUnit, typeNode } from '@ohos.arkui.node'

import { BusinessError } from '@kit.BasicServicesKit'


@Entry
@Component
struct BindGridController {
  @State str: string = 'start';
  @State str1: string = 'start';
  @State str2: string = 'start';
  @State str3: string = 'start';
  @State str4: string = 'start';
  @State str5: string = 'start';
  @State str6: string = 'start';
  @State str7: string = 'start';
  private nodeContent: NodeContent = new NodeContent();
  private rootNode?: FrameNode;
  private textAttribute?: TextAttribute;
  // private myListController: MyListController = new MyListController();
  scroller: Scroller = new Scroller();
  // private myGridController: MyGridController = new MyGridController();
  private gridAttribute?: GridAttribute;
  private gridItemAttribute?: GridItemAttribute;
  private waterFlowAttribute?: WaterFlowAttribute;
  private flowItemAttribute?: FlowItemAttribute;
  // private myListController: MyListController = new MyListController();
  private waterFlowEvent?: UIWaterFlowEvent;
  private minHeight: number = 80;
  private maxHeight: number = 180;
  private gridEvent?: UIGridEvent;

  // 计算FlowItem高
  private getHeight() {
    let ret = Math.floor(Math.random() * this.maxHeight);
    return (ret > this.minHeight ? ret : this.minHeight);
  }

  aboutToAppear() {
    this.rootNode = typeNode.createGridNode(this.getUIContext())
    this.gridAttribute = typeNode.getGridAttribute(this.rootNode!)
    this!.gridAttribute!.size({ width: '100%', height: '80%' })
      .rowsTemplate('1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(5)
      .key('grid_dragging_fling')
    this!.gridAttribute!.backgroundColor(Color.Pink)
    for (let i = 0; i < 40; i++) {
      let gridItemNode = typeNode.createGridItemNode(this.getUIContext());
      this.gridItemAttribute = typeNode.getGridItemAttribute(gridItemNode)
      this!.gridItemAttribute!.size({ height: this.getHeight() });
      this!.gridItemAttribute!.backgroundColor(0xF9CF93)
      this!.rootNode!.appendChild(gridItemNode);
      let text = typeNode.createTextNode(this.getUIContext());
      text.initialize('N' + i)
        .size({ width: '20%', height: '100%' })
        .textAlign(TextAlign.Center)
      gridItemNode.appendChild(text);
    }

    this.nodeContent.addFrameNode(this.rootNode!);
    this.gridEvent = typeNode.getGridEvent(this.rootNode as FrameNode)
  }

  build() {
    Column(undefined) {
      Text('GridFrameNode')
      Row() {
        Text(this.str)
          .width('22%')
          .fontSize(16)
          .margin(10)
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
          .key('str')
        Text(this.str1)
          .width('22%')
          .fontSize(16)
          .margin(10)
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
          .key('str1')
        Text(this.str2)
          .width('22%')
          .fontSize(16)
          .margin(10)
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
          .key('str2')
        Text(this.str7)
          .width('22%')
          .fontSize(16)
          .margin(10)
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
          .key('str7')
      }.height('6%')

      Row() {
        Text(this.str3)
          .width('22%')
          .fontSize(16)
          .margin(10)
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
          .key('str3')
        Text(this.str4)
          .width('22%')
          .fontSize(16)
          .margin(10)
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
          .key('str4')
        Text(this.str5)
          .width('22%')
          .fontSize(16)
          .margin(10)
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
          .key('str5')
        Text(this.str6)
          .width('22%')
          .fontSize(16)
          .margin(10)
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
          .key('str6')
      }.height('6%')

      Stack() {
        ContentSlot(this.nodeContent)
      }

      Row() {
        Button('bindGridController')
          .onClick((e: ClickEvent) => {
            typeNode.bindGridController(this.rootNode as FrameNode, this.scroller)
          })
          .key('bindGridController')
        Button('scrollerBy 600')
          .onClick((e: ClickEvent) => {
            this.scroller.scrollBy(600, 150);
          })
          .key('scrollBy')
        Button('setOn')
          .onClick((e: ClickEvent) => {
            this.gridEvent?.setOnDidScroll((scrollOffset: double, scrollState: ScrollState) => {
              this.str = 'OnDidScroll start';
              console.info(`xinxi setOnDidScroll scrollOffset = ${scrollOffset}, scrollState = ${scrollState}`);
            });
            this.gridEvent?.setOnReachEnd(() => {
              this.str1 = 'OnReachEnd start';
              console.info(`xinxi setOnReachEnd`);
            });
            this.gridEvent?.setOnReachStart(() => {
              this.str7 = 'OnReachStart start';
              console.info(`xinxi setOnReachStart`);
            });
            this.gridEvent?.setOnScrollStart(() => {
              this.str2 = 'OnScrollStart start';
              console.info(`xinxi setOnScrollStart`);
            });
            this.gridEvent?.setOnScrollFrameBegin((offset: Double, state: ScrollState) => {
              this.str3 = 'OnScrollFrameBegin start';
              console.info(`xinxi onScrollFrameBegin offset = ${offset}, state = ${state}`);
              return { offsetRemain: offset } as OnScrollFrameBeginHandlerResult;
            });
            this.gridEvent?.setOnScrollIndex((first: int, last: int) => {
              this.str4 = 'onScrollIndex start';
              console.info(`xinxi onScrollIndex start = ${first}, end = ${last}`);
            });
            this.gridEvent?.setOnScrollStop(() => {
              this.str5 = 'OnScrollStop start';
              console.info(`xinxi setOnScrollStop`);
            });
            this.gridEvent?.setOnWillScroll((scrollOffset: double, scrollState: ScrollState,
              scrollSource: ScrollSource) => {
              this.str6 = 'OnWillScroll start';
              console.info(`xinxi onWillScroll scrollOffset = ${scrollOffset}, scrollState = ${scrollState}, scrollSource = ${scrollSource}`);
            });
          })
          .key('set')
      }
    }.width('100%').height('100%')
  }
}