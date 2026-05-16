'use static'


import {
  BuilderNode, DrawContext, FrameNode, NodeContent, NodeController
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
  private nodeContent: NodeContent = new NodeContent();
  private rootNode?: FrameNode;
  private listNode?: FrameNode;
  private textAttribute?: TextAttribute;
  scroller1: Scroller = new Scroller();
  scroller2: Scroller = new Scroller();
  private gridAttribute?: GridAttribute;
  private gridItemAttribute?: GridItemAttribute;
  private waterFlowAttribute?: WaterFlowAttribute;
  private flowItemAttribute?: FlowItemAttribute;
  private scrollAttribute?: ScrollAttribute;
  private listEvent?: UIListEvent;

  private minHeight: number = 80;
  private maxHeight: number = 180;
  @State scrollOffset: double = -111;

  private getHeight() {
    let ret = Math.floor(Math.random() * this.maxHeight);
    return (ret > this.minHeight ? ret : this.minHeight);
  }

  aboutToAppear() {
    let scroller: Scroller = new Scroller();
    let listNode = typeNode.createListNode(this.getUIContext());
    listNode.initialize({ space: 3 }).size({ width: '100%', height: '20%' });
    typeNode.getListAttribute(listNode)?.friction(0.6);
    typeNode.getListAttribute(listNode)?.id('ListAttribute');
    typeNode.bindListController(listNode, this.scroller1)
    let listItemGroupNode = typeNode.createListItemGroupNode(this.getUIContext());
    listItemGroupNode.initialize({ space: 3 });
    typeNode.getListItemGroupAttribute(listItemGroupNode)?.height(300)
    typeNode.getListItemGroupAttribute(listItemGroupNode)?.id('ListItemGroupAttribute')
    listNode.appendChild(listItemGroupNode);
    let listItemNode1 = typeNode.createListItemNode(this.getUIContext());
    listItemNode1.initialize({ style: ListItemStyle.NONE }).height(100).borderWidth(1).backgroundColor('#FF00FF');
    let text1 = typeNode.createTextNode(this.getUIContext());
    text1.initialize('ListItem1');
    listItemNode1.appendChild(text1);
    listItemGroupNode.appendChild(listItemNode1);
    let listItemNode3 = typeNode.createListItemNode(this.getUIContext());
    listItemNode3.initialize({ style: ListItemStyle.NONE }).height(100).borderWidth(1).backgroundColor('#FF00FF');
    let text3 = typeNode.createTextNode(this.getUIContext());
    text3.initialize('ListItem3');
    listItemNode3.appendChild(text3);
    listItemGroupNode.appendChild(listItemNode3);
    let listItemNode4 = typeNode.createListItemNode(this.getUIContext());
    listItemNode4.initialize({ style: ListItemStyle.NONE }).height(100).borderWidth(1).backgroundColor('#FF00FF');
    let text4 = typeNode.createTextNode(this.getUIContext());
    text4.initialize('ListItem4');
    listItemNode4.appendChild(text4);
    listItemGroupNode.appendChild(listItemNode4);
    let listItemNode2 = typeNode.createListItemNode(this.getUIContext());
    listItemNode2.initialize({ style: ListItemStyle.CARD }).borderWidth(1).backgroundColor('#FF00FF');
    typeNode.getListItemAttribute(listItemNode2)?.height(100);
    typeNode.getListItemAttribute(listItemNode2)?.id('ListItemAttribute');
    let text2 = typeNode.createTextNode(this.getUIContext());
    text2.initialize('ListItem2');
    listItemNode2.appendChild(text2);
    listItemGroupNode.appendChild(listItemNode2);
    this.rootNode = listNode;
    this.listNode = listNode;
    this.listEvent = typeNode.getListEvent(this.listNode as FrameNode)
    this.nodeContent.addFrameNode(this.rootNode!);
  }

  build() {
    Column(undefined) {
      Text('bindListController')
      Stack() {
        ContentSlot(this.nodeContent)
      }

      Column() {
        Text(this.scrollOffset + '')
          .id('scrollOffset')
        Button('bind scroll2')
          .id('bindController')
          .onClick((e: ClickEvent) => {
            typeNode.bindListController(this.listNode as FrameNode, this.scroller2)
          })
        Button('scroller1 scrollBy 150')
          .id('scrollerBy')
          .onClick((e: ClickEvent) => {
            this.scroller1.scrollBy(0, 150);
          })
        Button('scroller2 scrollBy 150')
          .onClick((e: ClickEvent) => {
            this.scroller2.scrollBy(0, 150);
          })

        Button('setOn')
          .id('setOn')
          .onClick((e: ClickEvent) => {
            this.listEvent?.setOnDidScroll((scrollOffset: Double, scrollState: ScrollState) => {
              this.scrollOffset = scrollOffset;
              console.info(`xinxi setOnDidScroll scrollOffset = ${scrollOffset}, scrollState = ${scrollState}`);
            });
            this.listEvent?.setOnReachEnd(() => {
              console.info(`xinxi setOnReachEnd`);
            });
            this.listEvent?.setOnScrollStart(() => {
              console.info(`xinxi setOnScrollStart`);
            });
            this.listEvent?.setOnScrollFrameBegin((offset: Double, state: ScrollState) => {
              console.info(`xinxi onScrollFrameBegin offset = ${offset}, state = ${state}`);
              return { offsetRemain: offset } as OnScrollFrameBeginHandlerResult;
            });
            this.listEvent?.setOnScrollIndex((first: int, last: int) => {
              console.info(`xinxi onScrollIndex start = ${first}, end = ${last}`);
            });
            this.listEvent?.setOnScrollStart(() => {
              console.info(`xinxi setOnScrollStart`);
            });
            this.listEvent?.setOnScrollStop(() => {
              console.info(`xinxi setOnScrollStop`);
            });
            this.listEvent?.setOnScrollFrameBegin((offset: Double, state: ScrollState) => {
              console.info(`xinxi setOnScrollStop`);
              return { offsetRemain: offset } as OnScrollFrameBeginHandlerResult;
            });
            this.listEvent?.setOnWillScroll(() => {
              console.info(`xinxi onWillScroll`);
            });
          })
      }

      Text('ListSample')
    }.width('100%').height('100%')
  }
}