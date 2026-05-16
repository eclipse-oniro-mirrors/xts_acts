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

// 定义 syncLoad 的 Modifier 类
@Observed
export class SyncLoadModifier implements AttributeModifier<WaterFlowAttribute> {
  private syncValue: boolean | undefined;

  constructor(sync: boolean | undefined) {
    this.syncValue = sync;
  }

  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.syncLoad(this.syncValue);
  }
}

@Entry
@Component
struct WaterFlowSyncLoadModifier {
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();
  // 创建 Modifier 实例
  @State private trueModifier: SyncLoadModifier = new SyncLoadModifier(true);
  @State private falseModifier: SyncLoadModifier = new SyncLoadModifier(false);
  @State private undefinedModifier: SyncLoadModifier = new SyncLoadModifier(undefined);
  @Builder
  private WaterFlowWithSyncLoadModifier(modifier: AttributeModifier<WaterFlowAttribute>, tip: string, id: number) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
      WaterFlow() {
        ForEach(this.data, (i: number) => {
          FlowItem() {
            Image($r('app.media.startIcon'))
              .width(60)
              .height(60)
              .border({ width: 1, color: Color.Gray })
          }
        }, (i: number) => i.toString())
      }
      .id(`waterFlowSyncLoadModifier_00${id}`)
      .attributeModifier(modifier)  // 使用 attributeModifier
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr 1fr')
      .rowsGap(8)
      .width('100%')
      .height(400)
      .backgroundColor(0xFFF8F0)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('syncLoad 测试总览 (Modifier方式)')
          .fontSize(20).fontWeight(FontWeight.Bold)
        this.WaterFlowWithSyncLoadModifier(this.trueModifier, '正常值：true', 1)
        this.WaterFlowWithSyncLoadModifier(this.falseModifier, '正常值：false', 2)
        this.WaterFlowWithSyncLoadModifier(this.undefinedModifier, '显式 undefined', 3)

      }
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}