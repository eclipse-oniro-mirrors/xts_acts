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

// 定义 scrollBarMargin 的 Modifier 类
@Observed
export class ScrollBarMarginModifier implements AttributeModifier<ScrollAttribute> {
  private marginValue: ScrollBarMargin | undefined;

  constructor(margin: ScrollBarMargin | undefined) {
    this.marginValue = margin;
  }

  applyNormalAttribute(instance: ScrollAttribute): void {
    instance.scrollBarMargin(this.marginValue);
  }
}

@Entry
@Component
struct Index {
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();

  private marginList: (ScrollBarMargin | undefined)[] = [
    {
      start: new LengthMetrics(45, LengthUnit.VP),  // 使用构造函数
      end: new LengthMetrics(70, LengthUnit.VP)     // 使用构造函数
    },
    {},                               // 异常：空对象
    undefined,
  ];
  @State private idx: Int = 0;
  @State private scrollBarMargin: ScrollBarMargin | undefined = this.marginList[0];

  // 创建 Modifier 实例
  @State private normalMarginModifier: ScrollBarMarginModifier = new ScrollBarMarginModifier({
    start: new LengthMetrics(45, LengthUnit.VP),
    end:   new LengthMetrics(70, LengthUnit.VP)
  });
  @State private emptyMarginModifier: ScrollBarMarginModifier = new ScrollBarMarginModifier({});
  @State private undefinedMarginModifier: ScrollBarMarginModifier = new ScrollBarMarginModifier(undefined);
  @State private dynamicMarginModifier: ScrollBarMarginModifier = new ScrollBarMarginModifier(this.marginList[0]);

  @Builder
  private ScrollGridWithBarMargin(modifier: AttributeModifier<ScrollAttribute>, tip: string) {
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

      .id(`scrollBarMargin_00${tip}`)
      .scrollBar(BarState.On)
      .scrollBarWidth(6)
      .scrollBarColor(Color.Red)
      .attributeModifier(modifier)
      .height(200)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('scrollBarMargin 测试总览 (Modifier方式)')
          .fontSize(20).fontWeight(FontWeight.Bold)

        Text('静态场景（固定Modifier）').fontSize(16).fontWeight(FontWeight.Medium)
        this.ScrollGridWithBarMargin(this.normalMarginModifier, '1')
        this.ScrollGridWithBarMargin(this.emptyMarginModifier, '2')
        this.ScrollGridWithBarMargin(this.undefinedMarginModifier, '3')

        Divider()

        Text('动态切换场景').fontSize(16).fontWeight(FontWeight.Medium)
        Row() {
          Button('切换 value')
            .onClick(() => {
              this.idx = (this.idx + 1) % this.marginList.length;
              this.scrollBarMargin = this.marginList[this.idx];
              // 更新动态modifier
              this.dynamicMarginModifier = new ScrollBarMarginModifier(this.scrollBarMargin);
            })
          Text(`当前值：${JSON.stringify(this.scrollBarMargin)}`)
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
          .scrollBarWidth(6)
          .scrollBarColor(Color.Red)
          .attributeModifier(this.dynamicMarginModifier)  // 使用动态modifier
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