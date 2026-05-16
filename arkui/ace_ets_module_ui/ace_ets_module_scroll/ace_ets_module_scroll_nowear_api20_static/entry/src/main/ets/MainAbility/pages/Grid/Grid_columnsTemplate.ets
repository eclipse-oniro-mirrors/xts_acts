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

@Entry
@Component
struct GridColumnsTemplate {
  private data: number[] = [1, 2, 3, 4, 5, 6];

  private templateList: (string | undefined | ItemFillPolicy)[] = [
    '1fr 2fr 1fr', // 正常
    '',            // 空串
    'abc xyz',     // 异常
    {fillType:PresetFillType.BREAKPOINT_SM2MD3LG5},
    {fillType:PresetFillType.BREAKPOINT_SM1MD2LG3},
    {fillType:PresetFillType.BREAKPOINT_DEFAULT},
    undefined,     // 不传（默认）
  ];
  @State private idx: int = 0;
  @State private gridCols: string | undefined | ItemFillPolicy = this.templateList[0];

  @Builder
  private GridWithTemplate(template: string | undefined | ItemFillPolicy, tip: string) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
      Grid() {
        ForEach(this.data, (i: number) => {
          GridItem() {
            Text(`${i}`)
              .fontSize(20)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height(48)
              .backgroundColor(0xFFE4B5)
          }
        }, (i: number) => i.toString())
      }
      .columnsTemplate(template)
      .key(tip)
      .rowsTemplate('1fr 1fr')
      .width('100%')
      .height(120)
      .backgroundColor(0xFFF8F0)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('gridColumnsTemplate')
          .fontSize(20).fontWeight(FontWeight.Bold)

        Text('静态场景（固定值）').fontSize(16).fontWeight(FontWeight.Medium)
        this.GridWithTemplate('1fr 2fr 1fr', 'columnsTemplate')
        this.GridWithTemplate({fillType:PresetFillType.BREAKPOINT_SM2MD3LG5}, 'columnsTemplate4')
        this.GridWithTemplate({fillType:PresetFillType.BREAKPOINT_SM1MD2LG3}, 'columnsTemplate5')
        this.GridWithTemplate({fillType:PresetFillType.BREAKPOINT_DEFAULT}, 'columnsTemplate6')

        Divider()

        Text('动态切换场景').fontSize(16).fontWeight(FontWeight.Medium)

        Row() {
          Button('切换 value')
            .onClick(() => {
              this.idx = (this.idx + 1) % this.templateList.length;
              this.gridCols = this.templateList[this.idx];
            })
          Text(`当前模板：${JSON.stringify(this.gridCols)}`)
            .fontSize(14).layoutWeight(1)
        }
        .width('100%')

        Column() {
          Text('动态 Grid').fontSize(14).fontColor(Color.Gray)
          Grid() {
            ForEach(this.data, (i: number) => {
              GridItem() {
                Text(`${i}`)
                  .fontSize(20)
                  .textAlign(TextAlign.Center)
                  .width('100%')
                  .height(48)
                  .backgroundColor(0xFFE4B5)
              }
            }, (i: number) => i.toString())
          }
          .columnsTemplate(this.gridCols)
          .rowsTemplate('1fr 1fr')
          .width('100%')
          .height(120)
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