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
export class WaterFlowColumnsTemplateFixedModifier implements AttributeModifier<WaterFlowAttribute> {
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.columnsTemplate('1fr 2fr 1fr');
  }
}
@Observed
export class WaterFlowColumnsTemplateEmptyModifier implements AttributeModifier<WaterFlowAttribute> {
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.columnsTemplate('');
  }
}
@Observed
export class WaterFlowColumnsTemplateInvalidModifier implements AttributeModifier<WaterFlowAttribute> {
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.columnsTemplate('abc xyz');
  }
}
@Observed
export class WaterFlowColumnsTemplateLG5Modifier implements AttributeModifier<WaterFlowAttribute> {
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.columnsTemplate({fillType:PresetFillType.BREAKPOINT_SM2MD3LG5});
  }
}
@Observed
export class WaterFlowColumnsTemplateLG3Modifier implements AttributeModifier<WaterFlowAttribute> {
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.columnsTemplate({fillType:PresetFillType.BREAKPOINT_SM1MD2LG3});
  }
}
@Observed
export class WaterFlowColumnsTemplateDEFModifier implements AttributeModifier<WaterFlowAttribute> {
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.columnsTemplate({fillType:PresetFillType.BREAKPOINT_DEFAULT});
  }
}
@Observed
export class WaterFlowColumnsTemplateExplicitUndefinedModifier implements AttributeModifier<WaterFlowAttribute> {
  applyNormalAttribute(instance: WaterFlowAttribute): void {
    instance.columnsTemplate(undefined);
  }
}
@Entry
@Component
struct WaterFlowColumnsTemplateModifier {
  private data: number[] = [1, 2, 3, 4, 5, 6];
  @State private fixedModifier: WaterFlowColumnsTemplateFixedModifier = new WaterFlowColumnsTemplateFixedModifier();
  @State private emptyModifier: WaterFlowColumnsTemplateEmptyModifier = new WaterFlowColumnsTemplateEmptyModifier();
  @State private invalidModifier: WaterFlowColumnsTemplateInvalidModifier =
    new WaterFlowColumnsTemplateInvalidModifier();
  @State private lG5Modifier: WaterFlowColumnsTemplateLG5Modifier = new WaterFlowColumnsTemplateLG5Modifier();
  @State private lG3Modifier: WaterFlowColumnsTemplateLG3Modifier = new WaterFlowColumnsTemplateLG3Modifier();
  @State private dEFModifier: WaterFlowColumnsTemplateDEFModifier = new WaterFlowColumnsTemplateDEFModifier();
  @State private explicitUndefinedModifier: WaterFlowColumnsTemplateExplicitUndefinedModifier = 
    new WaterFlowColumnsTemplateExplicitUndefinedModifier();

  @Builder
  private WaterFlowWithTemplate(modifier: AttributeModifier<WaterFlowAttribute>, tip: string, id: number) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
      WaterFlow() {
        ForEach(this.data, (i: number) => {
          FlowItem() {
            Text(`${i}`)
              .fontSize(20)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height(48)
              .backgroundColor(0xFFE4B5)
          }
        }, (i: number) => i.toString())
      }.id(`columnsTemplateModifier_00${id}`)
      .attributeModifier(modifier)
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
        Text('WaterFlowColumnsTemplate')
          .fontSize(20).fontWeight(FontWeight.Bold)
        this.WaterFlowWithTemplate(this.fixedModifier, '正常值：1fr 2fr 1fr', 1)
        this.WaterFlowWithTemplate(this.emptyModifier, '空字符串：', 3)
        this.WaterFlowWithTemplate(this.explicitUndefinedModifier, '显式 undefined', 4)
        this.WaterFlowWithTemplate(this.lG5Modifier, 'FillPolicyLG5', 5)
        this.WaterFlowWithTemplate(this.lG3Modifier, 'FillPolicyLG3', 6)
        this.WaterFlowWithTemplate(this.dEFModifier, 'DEFAULT', 7)
        Divider()
      }
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}