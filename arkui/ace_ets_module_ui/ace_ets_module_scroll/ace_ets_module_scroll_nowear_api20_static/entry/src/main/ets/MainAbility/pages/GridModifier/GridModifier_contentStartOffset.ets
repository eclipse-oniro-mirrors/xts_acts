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

// 定义不同的 GridModifier 类
@Observed
export class GridNormalModifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.contentStartOffset(60);
  }
}

@Observed
export class GridEmptyModifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.contentStartOffset(0);
  }
}

@Observed
export class GridInvalidModifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.contentStartOffset(-30);
  }
}

@Observed
export class GridUndefinedModifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.contentStartOffset(undefined);
  }
}

@Observed
export class GridExplicitUndefinedModifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.contentStartOffset(undefined);
  }
}

// 动态切换的 Modifier
@Observed
export class GridDynamicModifier implements AttributeModifier<GridAttribute> {
  private offset: number | undefined;

  constructor(offset: number | undefined) {
    this.offset = offset;
  }

  applyNormalAttribute(instance: GridAttribute): void {
    instance.contentStartOffset(this.offset);
  }
}

@Entry
@Component
struct GridContentStartOffsetModifier {
  private data: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  private offsetList: (number | undefined)[] = [
    60,        // 正常正值
    0,         // 零值
    -30,       // 负值
    undefined, // 不传值（默认）
  ];

  @State private idx: Int = 0;
  @State private contentStartOffset: number | undefined = this.offsetList[0];

  // 创建 Modifier 实例
  @State private gridNormalModifier: GridNormalModifier = new GridNormalModifier();
  @State private gridEmptyModifier: GridEmptyModifier = new GridEmptyModifier();
  @State private gridInvalidModifier: GridInvalidModifier = new GridInvalidModifier();
  @State private gridUndefinedModifier: GridUndefinedModifier = new GridUndefinedModifier();
  @State private gridExplicitUndefinedModifier: GridExplicitUndefinedModifier = new GridExplicitUndefinedModifier();
  @State private gridDynamicModifier: GridDynamicModifier = new GridDynamicModifier(this.offsetList[0]);

  @Builder
  private GridWithContentStartOffset(modifier: AttributeModifier<GridAttribute>, tip: string) {
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
                .height(60)
            }
          }, (i: number) => i.toString())
        }
        .columnsTemplate('1fr 1fr 1fr')
        .rowsGap(8)
        .columnsGap(8)
        .attributeModifier(modifier)
        .width('100%')
        .height(200)
        .backgroundColor(0xFFF8F0)
        .key(tip)
      }
      .scrollBar(BarState.On)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('contentStartOffset (Modifier方式)')
          .fontSize(20).fontWeight(FontWeight.Bold)

        Text('静态场景（固定Modifier）').fontSize(16).fontWeight(FontWeight.Medium)

        this.GridWithContentStartOffset(this.gridNormalModifier, 'contentStartOffset')
        this.GridWithContentStartOffset(this.gridEmptyModifier, 'contentStartOffset1')
        this.GridWithContentStartOffset(this.gridUndefinedModifier, 'contentStartOffset3')
        this.GridWithContentStartOffset(this.gridExplicitUndefinedModifier, 'contentStartOffset4')

        Divider()

        Text('动态切换场景').fontSize(16).fontWeight(FontWeight.Medium)

        Row() {
          Button('切换 value')
            .onClick(() => {
              this.idx = (this.idx + 1) % this.offsetList.length;
              this.contentStartOffset = this.offsetList[this.idx];
              this.gridDynamicModifier = new GridDynamicModifier(this.contentStartOffset);
            })
          Text(`当前偏移量：${JSON.stringify(this.contentStartOffset)}`)
            .fontSize(14).layoutWeight(1)
        }
        .width('100%')

        Column() {
          Text('动态 Grid').fontSize(14).fontColor(Color.Gray)
          Scroll() {
            Grid() {
              ForEach(this.data, (i: number) => {
                GridItem() {
                  Text(`${i}`)
                    .fontSize(20)
                    .textAlign(TextAlign.Center)
                    .width('100%')
                    .height(60)
                }
              }, (i: number) => i.toString())
            }
            .columnsTemplate('1fr 1fr 1fr')
            .rowsGap(8)
            .columnsGap(8)
            .attributeModifier(this.gridDynamicModifier)
            .width('100%')
            .height(200)
            .backgroundColor(0xFFF8F0)
          }
          .scrollBar(BarState.On)
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