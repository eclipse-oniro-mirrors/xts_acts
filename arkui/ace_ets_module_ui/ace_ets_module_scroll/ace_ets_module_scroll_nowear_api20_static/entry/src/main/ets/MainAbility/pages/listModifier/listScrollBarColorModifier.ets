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
class ListScrollBarColorModifier implements AttributeModifier<ListAttribute> {
  public scrollBarColor: ResourceColor | undefined = Color.Red;

  constructor(scrollBarColor: ResourceColor | undefined) {
    this.scrollBarColor = scrollBarColor
  }

  applyNormalAttribute(instance: ListAttribute): void {
    instance.scrollBarColor(this.scrollBarColor);
  }
}

@Entry
@Component
struct ListScrollBarColorModifierExample {
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();

  @Builder
  private ListScrollWithBarColor(color: ResourceColor | undefined, tip: string, id: number) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
      List() {
        Column() {
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
        .width('100%')
      }
      .id(`listScrollBarColorModifier_00${id}`)
      .attributeModifier(new ListScrollBarColorModifier(color))
      .scrollBar(BarState.On)
      .scrollBarWidth(4)
      .height(200)
      .backgroundColor(0xFFF8F0)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('scrollBarColor 测试总览 - List版本')
          .fontSize(20).fontWeight(FontWeight.Bold)
        this.ListScrollWithBarColor(Color.Red, '正常值：Color.Red', 1)
        this.ListScrollWithBarColor('#00FF00', '正常值：#00FF00', 2)
        this.ListScrollWithBarColor(0x00ff00, '正常值：0x00ff00', 3)
        this.ListScrollWithBarColor('', '异常值：空字符串', 5)
        this.ListScrollWithBarColor(undefined, 'undefined', 6)
        Divider()
      }
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}