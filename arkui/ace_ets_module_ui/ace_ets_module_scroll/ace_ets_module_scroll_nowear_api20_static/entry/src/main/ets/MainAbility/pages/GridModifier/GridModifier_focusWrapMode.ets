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
// 定义不同的 FocusWrapMode Modifier 类
@Observed
export class FocusWrapModeDefaultModifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.focusWrapMode(FocusWrapMode.DEFAULT);
  }
}
@Observed
export class FocusWrapModeUndefinedModifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.focusWrapMode(undefined);
  }
}
@Observed
export class FocusWrapModeWrapWithArrowModifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.focusWrapMode(FocusWrapMode.WRAP_WITH_ARROW);
  }
}

@Observed
export class FocusWrapModeExplicitUndefinedModifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.focusWrapMode(undefined);
  }
}
// 动态切换的 Modifier
@Observed
export class FocusWrapModeDynamicModifier implements AttributeModifier<GridAttribute> {
  private mode: FocusWrapMode | undefined;

  constructor(mode: FocusWrapMode | undefined) {
    this.mode = mode;
  }

  applyNormalAttribute(instance: GridAttribute): void {
    instance.focusWrapMode(this.mode);
  }
}

@Entry
@Component
struct GridFocusWrapModeModifier {
  /* ===================== 数据：30 项 ===================== */
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();

  /* ========== 动态切换专用 ========== */
  private modeList: (FocusWrapMode | undefined)[] = [
    FocusWrapMode.WRAP_WITH_ARROW,
    FocusWrapMode.DEFAULT,
    undefined,
  ];
  @State private idx: Int = 0;
  @State private focusWrapMode: FocusWrapMode | undefined = this.modeList[0];

  // 创建 Modifier 实例
  @State private defaultModifier: FocusWrapModeDefaultModifier = new FocusWrapModeDefaultModifier();
  @State private undefinedModifier: FocusWrapModeUndefinedModifier = new FocusWrapModeUndefinedModifier();
  @State private wrapWithArrowModifier: FocusWrapModeWrapWithArrowModifier = new FocusWrapModeWrapWithArrowModifier();
  @State private explicitUndefinedModifier: FocusWrapModeExplicitUndefinedModifier =
    new FocusWrapModeExplicitUndefinedModifier();
  @State private dynamicModifier: FocusWrapModeDynamicModifier = new FocusWrapModeDynamicModifier(this.modeList[0]);

  /* ========== 构造器：Grid ========== */
  @Builder
  private GridWithFocusWrapMode(modifier: AttributeModifier<GridAttribute>, tip: string) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
      Grid() {
        ForEach(this.data, (i: number) => {
          GridItem() {
            Text(`${i}`)
              .focusable(true)
              .fontSize(20)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height(80)
              .backgroundColor(0xFFE4B5)
          }.focusable(true)
        }, (i: number) => i.toString())
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
      .attributeModifier(modifier) // 使用 attributeModifier 替代直接设置
      .width('100%')
      .height(400)
      .backgroundColor(0xFFF8F0)
      .key(tip)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('focusWrapMode (Modifier方式)')
          .fontSize(20).fontWeight(FontWeight.Bold)

        /* ---------- 静态区域 ---------- */
        Text('静态场景（固定Modifier）').fontSize(16).fontWeight(FontWeight.Medium)
        this.GridWithFocusWrapMode(this.defaultModifier, 'focusWrapMode')
        this.GridWithFocusWrapMode(this.undefinedModifier, 'focusWrapMode1')
        this.GridWithFocusWrapMode(this.wrapWithArrowModifier, 'focusWrapMode2')
        this.GridWithFocusWrapMode(this.explicitUndefinedModifier, 'focusWrapMode3')

        Divider()

        /* ---------- 动态切换区域 ---------- */
        Text('动态切换场景').fontSize(16).fontWeight(FontWeight.Medium)
        Row() {
          Button('切换 value')
            .onClick(() => {
              this.idx = (this.idx + 1) % this.modeList.length;
              this.focusWrapMode = this.modeList[this.idx];
              // 更新动态modifier
              this.dynamicModifier = new FocusWrapModeDynamicModifier(this.focusWrapMode);
            })
          Text(`当前值：${JSON.stringify(this.focusWrapMode)}`)
            .fontSize(14).layoutWeight(1)
        }
        .width('100%')

        Column() {
          Text('动态 Grid').fontSize(14).fontColor(Color.Gray)
          Grid() {
            ForEach(this.data, (i: number) => {
              GridItem() {
                Text(`${i}`)
                  .focusable(true)
                  .fontSize(20)
                  .textAlign(TextAlign.Center)
                  .width('100%')
                  .height(80)
                  .backgroundColor(0xFFE4B5)
              }
            }, (i: number) => i.toString())
          }
          .focusable(true)
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .attributeModifier(this.dynamicModifier) // 使用动态modifier
          .width('100%')
          .height(400)
          .backgroundColor(0xFFF8F0)
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