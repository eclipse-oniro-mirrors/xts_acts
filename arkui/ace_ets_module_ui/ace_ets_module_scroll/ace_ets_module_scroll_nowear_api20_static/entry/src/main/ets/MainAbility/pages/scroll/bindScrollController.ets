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
struct bindScrollController {
  private nodeContent: NodeContent = new NodeContent();
  private rootNode?: FrameNode;
  private textAttribute?: TextAttribute;
  // private myListController: MyListController = new MyListController();
  scroller1: Scroller = new Scroller();
  scroller2: Scroller = new Scroller();
  // private myGridController: MyGridController = new MyGridController();
  private gridAttribute?: GridAttribute;
  private gridItemAttribute?: GridItemAttribute;
  private waterFlowAttribute?: WaterFlowAttribute;
  private flowItemAttribute?: FlowItemAttribute;
  private scrollAttribute?: ScrollAttribute;
  // private myListController: MyListController = new MyListController();
  private scrollEvent?: UIScrollEvent;
  private minHeight: number = 80;
  private maxHeight: number = 180;

  // 计算FlowItem高
  private getHeight() {
    let ret = Math.floor(Math.random() * this.maxHeight);
    return (ret > this.minHeight ? ret : this.minHeight);
  }
  @State setOnDidScroll: string = '0'
  @State setOnReachEnd: string = '0'
  @State setOnReachStart: string = '0'
  @State setOnScrollFrameBegin: string = '0'
  @State setOnScrollStart: string = '0'
  @State setOnScrollStop: string = '0'
  @State setOnWillScroll: string = '0'

  aboutToAppear() {
    let scroller: Scroller = new Scroller();

    this.rootNode = typeNode.createScrollNode(this.getUIContext());
    (this.rootNode as typeNode.Scroll)!.initialize(this.scroller1).size({ width: '100%', height: 100 });

    let colNode = typeNode.createColumnNode(this.getUIContext());
    this.rootNode!.appendChild(colNode);

    for (let i = 0; i < 5; i++) {
      let text = typeNode.createTextNode(this.getUIContext());
      text.initialize('item' + i)
        .size({ width: '90%', height: 40 })
        .textAlign(TextAlign.Center)
      colNode.appendChild(text);
    }

    this.nodeContent.addFrameNode(this.rootNode!);
    this.scrollAttribute = typeNode.getScrollAttribute(this.rootNode as FrameNode)
    typeNode.bindScrollController(this.rootNode as FrameNode, this.scroller2)
    this.scrollEvent = typeNode.getScrollEvent(this.rootNode as FrameNode)

    this.scrollEvent?.setOnDidScroll((scrollOffset: Double, p2: Double, scrollState: ScrollState) => {
      console.info(`xinxi setOnDidScroll scrollOffset = ${scrollOffset}, scrollState = ${scrollState}`);
      this.setOnDidScroll = 'ok'
    });
    this.scrollEvent?.setOnReachEnd(() => {
      console.info(`xinxi setOnReachEnd`);
      this.setOnReachEnd = 'ok'
    });
    this.scrollEvent?.setOnReachStart(() => {
      console.info(`xinxi setOnReachStart`);
      this.setOnReachStart += 'ok'
    });
    this.scrollEvent?.setOnScrollFrameBegin((offset: Double, state: ScrollState) => {
      console.info(`xinxi onScrollFrameBegin offset = ${offset}, state = ${state}`);
      this.setOnScrollFrameBegin = 'ok'
      return { offsetRemain: offset } as OnScrollFrameBeginHandlerResult;
    });
    this.scrollEvent?.setOnScrollStart(() => {
      console.info(`xinxi setOnScrollStart`);
      this.setOnScrollStart = 'ok'
    });
    this.scrollEvent?.setOnScrollStop(() => {
      console.info(`xinxi setOnScrollStop`);
      this.setOnScrollStop = 'ok'
    });
    this.scrollEvent?.setOnWillScroll(() => {
      console.info(`xinxi setOnWillScroll`);
      this.setOnWillScroll = 'ok'
    });
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
              this.scroller1.scrollBy(0, 200);
            }).id('end')
          Button('start')
            .onClick((e: ClickEvent) => {
              this.scroller1.scrollTo({ xOffset: 0, yOffset: 0 })
            }).id('start')
        }
        Column(){
          Text(this.setOnDidScroll).id('setOnDidScroll')
          Text(this.setOnReachEnd).id('setOnReachEnd')
          Text(this.setOnReachStart).id('setOnReachStart')
          Text(this.setOnScrollFrameBegin).id('setOnScrollFrameBegin')
          Text(this.setOnScrollStart).id('setOnScrollStart')
          Text(this.setOnScrollStop).id('setOnScrollStop')
          Text(this.setOnWillScroll).id('setOnWillScroll')
        }
      }
    }.width('100%').height('100%')
  }
}
