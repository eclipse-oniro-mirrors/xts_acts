'use static'

import { BuilderNode, DrawContext, FrameNode, NodeContent, NodeController } from '@ohos.arkui.node'
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
  UIListEvent,
  ListItemStyle,
  ContentSlot,
  ScrollSnapAnimationSpeed,
  ScrollSnapAlign,
  ScrollDirection,
  NavDestinationMode,
  NavDestinationContext,
  PinchGesture,
  GestureEvent,
  Visibility,
  OnScrollFrameBeginHandlerResult,
  GridItemAttribute,
  FlowItemAttribute,
  UIWaterFlowEvent,
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
struct bindListController {
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
  scroller1: Scroller = new Scroller();
  // private myGridController: MyGridController = new MyGridController();
  private listEvent?: UIListEvent;
  // private myListController: MyListController = new MyListController();
  private listAttribute?: ListAttribute;
  private minHeight: number = 80;
  private maxHeight: number = 180;

  // 计算FlowItem高
  private getHeight() {
    let ret = Math.floor(Math.random() * this.maxHeight);
    return (ret > this.minHeight ? ret : this.minHeight);
  }

  aboutToAppear() {
    this.rootNode = typeNode.createListNode(this.getUIContext())
    this.listAttribute = typeNode.getListAttribute(this.rootNode!)
    this!.listAttribute!.size({ width: '100%', height: '20%' })
      .key('list_dragging_fling')
    this!.listAttribute!.backgroundColor(Color.Pink)
    for (let i = 0; i < 10; i++) {
      let listItemNode1 = typeNode.createListItemNode(this.getUIContext());
      listItemNode1.initialize({ style: ListItemStyle.NONE }).height(100).borderWidth(1).backgroundColor('#FF00FF');
      let text1 = typeNode.createTextNode(this.getUIContext());
      text1.initialize('N' + i)
        .size({ width: '20%', height: '100%' })
        .textAlign(TextAlign.Center)
      listItemNode1.appendChild(text1);
      this!.rootNode!.appendChild(listItemNode1);
    }
    //在ListItemGroup中放入ListItem节点
    this.listEvent = typeNode.getListEvent(this.rootNode as FrameNode)
    this.nodeContent.addFrameNode(this.rootNode!);
  }

  build() {
    Column(undefined) {
      Text('ImageFrameNode')
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
        Text(this.str4)
          .width('22%')
          .fontSize(16)
          .margin(10)
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
          .key('str4')
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

      Column() {
        Row() {
          Button('1')
            .onClick((e: ClickEvent) => {
              typeNode.bindListController(this.rootNode as FrameNode, this.scroller1)
            })
            .id('bindListController')
          Button('2')
            .onClick((e: ClickEvent) => {
              this.scroller1.scrollBy(0, 5000);
            })
            .id('scrollBy')
          Button('3')
            .onClick((e: ClickEvent) => {
              this.scroller1.scrollBy(0, -5000);
            })
            .id('scrollBy0')

          Button('4')
            .id('setOn')
            .onClick((e: ClickEvent) => {
              this.listEvent?.setOnDidScroll((scrollOffset: Double, scrollState: ScrollState) => {
                this.str = 'OnDidScroll start';
                console.info(`xinxi setOnDidScroll scrollOffset = ${scrollOffset}, scrollState = ${scrollState}`);
              });
              this.listEvent?.setOnReachEnd(() => {
                this.str1 = 'OnReachEnd start';
                console.info(`xinxi setOnReachEnd`);
              });
              this.listEvent?.setOnReachStart(() => {
                this.str7 = 'OnReachStart start';
                console.info(`xinxi setOnReachStart`);
              });
              this.listEvent?.setOnScrollStart(() => {
                this.str2 = 'OnScrollStart start';
                console.info(`xinxi setOnScrollStart`);
              });
              this.listEvent?.setOnScrollFrameBegin((offset: Double, state: ScrollState) => {
                this.str3 = 'OnScrollFrameBegin start';
                console.info(`xinxi onScrollFrameBegin offset = ${offset}, state = ${state}`);
                return { offsetRemain: offset } as OnScrollFrameBeginHandlerResult;
              });
              this.listEvent?.setOnScrollIndex((first: int, last: int) => {
                this.str4 = 'onScrollIndex start';
                console.info(`xinxi onScrollIndex start = ${first}, end = ${last}`);
              });
              this.listEvent?.setOnScrollStop(() => {
                this.str5 = 'OnScrollStop start';
                console.info(`xinxi setOnScrollStop`);
              });
              this.listEvent?.setOnWillScroll((scrollOffset: double, scrollState: ScrollState,
                scrollSource: ScrollSource) => {
                this.str6 = 'OnWillScroll start';
                console.info(`xinxi onWillScroll scrollOffset = ${scrollOffset}, scrollState = ${scrollState}, scrollSource = ${scrollSource}`);
              });
            })
        }
      }

      Text('ListSample')
    }.width('100%').height('100%')
  }
}