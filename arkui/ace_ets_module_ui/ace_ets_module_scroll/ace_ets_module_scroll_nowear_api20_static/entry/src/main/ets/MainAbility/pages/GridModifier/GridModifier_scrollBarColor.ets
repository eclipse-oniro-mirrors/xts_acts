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

// 定义 scrollBarColor 的 Modifier 类
@Observed
export class ScrollBarColorModifier implements AttributeModifier<ScrollAttribute> {
  private colorValue: ResourceColor | undefined;
  constructor(color: ResourceColor | undefined) {
    this.colorValue = color;
  }

  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.scrollBarColor(this.colorValue);
  }
}

@Entry
@Component
struct GridScrollBarColorModifier {
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();

  /* ========== 动态切换专用 ========== */
  private colorList: (ResourceColor | undefined)[] = [
    Color.Red,            // 正常
    '#00FF00',            // 正常
    '',                   // 空字符串
    undefined,            // undefined
  ];
  @State private idx: Int = 0;
  @State private scrollBarColor: ResourceColor | undefined = this.colorList[0];

  // 创建 Modifier 实例
  @State private redColorModifier: ScrollBarColorModifier = new ScrollBarColorModifier(Color.Red);
  @State private greenColorModifier: ScrollBarColorModifier = new ScrollBarColorModifier('#00FF00');
  @State private emptyColorModifier: ScrollBarColorModifier = new ScrollBarColorModifier('');
  @State private undefinedColorModifier: ScrollBarColorModifier = new ScrollBarColorModifier(undefined);
  @State private blueColorModifier: ScrollBarColorModifier = new ScrollBarColorModifier(Color.Blue);
  @State private dynamicColorModifier: ScrollBarColorModifier = new ScrollBarColorModifier(this.colorList[0]);

  @Builder
  private ScrollGridWithBarColor(modifier: AttributeModifier<ScrollAttribute>, tip: string) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
      Scroll() {
        Grid() {
          ForEach(this.data, (i: number) => {
            GridItem() {
              Text(`${i}`)
                .fontSize(20)
                .textAlign(TextAlign.Center)
                .width('100%')
                .height(80)
                .backgroundColor(0xFFE4B5)
            }
          }, (i: number) => i.toString())
        }
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr')
        .rowsGap(8)
        .width('100%')
        .backgroundColor(0xFFF8F0)
      }
      .scrollBar(BarState.On)
      .scrollBarWidth(4)
      .attributeModifier(modifier)  // 使用 attributeModifier
      .height(200)
      .key(tip)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('scrollBarColor 测试总览 (Modifier方式)')
          .fontSize(20).fontWeight(FontWeight.Bold)

        Text('静态场景（固定Modifier）').fontSize(16).fontWeight(FontWeight.Medium)
        this.ScrollGridWithBarColor(this.redColorModifier, 'color')
        this.ScrollGridWithBarColor(this.greenColorModifier, 'color1')
        this.ScrollGridWithBarColor(this.emptyColorModifier, 'color2')
        this.ScrollGridWithBarColor(this.undefinedColorModifier, 'color3')
        this.ScrollGridWithBarColor(this.blueColorModifier, 'color4')

        Divider()

        Text('动态切换场景').fontSize(16).fontWeight(FontWeight.Medium)
        Row() {
          Button('切换 value')
            .onClick(() => {
              this.idx = (this.idx + 1) % this.colorList.length;
              this.scrollBarColor = this.colorList[this.idx];
              // 更新动态modifier
              this.dynamicColorModifier = new ScrollBarColorModifier(this.scrollBarColor);
            })
          Text(`当前值：${JSON.stringify(this.scrollBarColor)}`)
            .fontSize(14).layoutWeight(1)
        }
        .width('100%')

        Column() {
          Text('动态 Scroll + Grid').fontSize(14).fontColor(Color.Gray)
          Scroll() {
            Grid() {
              ForEach(this.data, (i: number) => {
                GridItem() {
                  Text(`${i}`)
                    .fontSize(20)
                    .textAlign(TextAlign.Center)
                    .width('100%')
                    .height(80)
                    .backgroundColor(0xFFE4B5)
                }
              }, (i: number) => i.toString())
            }
            .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr')
            .rowsGap(8)
            .width('100%')
            .backgroundColor(0xFFF8F0)
          }
          .scrollBar(BarState.On)
          .scrollBarWidth(4)
          .attributeModifier(this.dynamicColorModifier)  // 使用动态modifier
          .height(200)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
      }
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}