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


// 定义不同的 ColumnsTemplate Modifier 类
@Observed
class GridColumnsTemplateNormalModifier implements AttributeModifier<GridAttribute> {
  private template: string | undefined | ItemFillPolicy;

  constructor(template: string | undefined) {
    this.template = template;
  }

  applyNormalAttribute(instance: GridAttribute): void {
    instance.columnsTemplate(this.template);
  }
}
@Observed
export class GridColumnsTemplateFixedModifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.columnsTemplate('1fr 2fr 1fr');
  }
}
@Observed
export class GridColumnsTemplateUndefinedModifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.columnsTemplate(undefined);
  }
}
@Observed
export class GridColumnsTemplateEmptyModifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.columnsTemplate('');
  }
}
@Observed
export class GridColumnsTemplateInvalidModifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.columnsTemplate('abc xyz');
  }
}
@Observed
export class GridColumnsTemplateExplicitUndefinedModifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.columnsTemplate(undefined);
  }
}
@Observed
export class GridColumnsTemplateLG5Modifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.columnsTemplate({fillType:PresetFillType.BREAKPOINT_SM2MD3LG5});
  }
}
@Observed
export class GridColumnsTemplateLG3Modifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.columnsTemplate({fillType:PresetFillType.BREAKPOINT_SM1MD2LG3});
  }
}
@Observed
export class GridColumnsTemplateDEFModifier implements AttributeModifier<GridAttribute> {
  applyNormalAttribute(instance: GridAttribute): void {
    instance.columnsTemplate({fillType:PresetFillType.BREAKPOINT_DEFAULT});
  }
}
// 动态切换的 Modifier
@Observed
export class GridColumnsTemplateDynamicModifier implements AttributeModifier<GridAttribute> {
  private template: string | undefined | ItemFillPolicy;

  constructor(template: string | undefined | ItemFillPolicy) {
    this.template = template;
  }

  applyNormalAttribute(instance: GridAttribute): void {
    instance.columnsTemplate(this.template);
  }

  // 更新模板值的方法
  updateTemplate(template: string | undefined | ItemFillPolicy): void {
    this.template = template;
  }
}

@Entry
@Component
struct GridColumnsTemplateModifier {
  private data: number[] = [1, 2, 3, 4, 5, 6];

  // 测试值数组
  private templateList: (string | undefined | ItemFillPolicy)[] = [
    '1fr 2fr 1fr', // 正常
    '',            // 空串
    'abc xyz',     // 异常
    undefined,     // 不传（默认）
    {fillType:PresetFillType.BREAKPOINT_SM2MD3LG5},
    {fillType:PresetFillType.BREAKPOINT_SM1MD2LG3},
    {fillType:PresetFillType.BREAKPOINT_DEFAULT}
  ];

  @State private idx: Int = 0;
  @State private gridCols: string | undefined | ItemFillPolicy = this.templateList[0];

  // 创建 Modifier 实例
  @State private fixedModifier: GridColumnsTemplateFixedModifier = new GridColumnsTemplateFixedModifier();
  @State private undefinedModifier: GridColumnsTemplateUndefinedModifier = new GridColumnsTemplateUndefinedModifier();
  @State private emptyModifier: GridColumnsTemplateEmptyModifier = new GridColumnsTemplateEmptyModifier();
  @State private invalidModifier: GridColumnsTemplateInvalidModifier = new GridColumnsTemplateInvalidModifier();
  @State private explicitUndefinedModifier: GridColumnsTemplateExplicitUndefinedModifier =
    new GridColumnsTemplateExplicitUndefinedModifier();
  @State private dynamicModifier: GridColumnsTemplateDynamicModifier =
    new GridColumnsTemplateDynamicModifier(this.templateList[0]);
  @State private lG5Modifier: GridColumnsTemplateLG5Modifier = new GridColumnsTemplateLG5Modifier();
  @State private lG3Modifier: GridColumnsTemplateLG3Modifier = new GridColumnsTemplateLG3Modifier();
  @State private dEFModifier: GridColumnsTemplateDEFModifier = new GridColumnsTemplateDEFModifier();

  @Builder
  private GridWithTemplateModifier(modifier: AttributeModifier<GridAttribute>, tip: string) {
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
      .attributeModifier(modifier)  // 使用 attributeModifier 应用 columnsTemplate
      .rowsTemplate('1fr 1fr')
      .width('100%')
      .height(120)
      .backgroundColor(0xFFF8F0)
      .key(tip)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  // 将模板值转换为可读字符串
  private templateToString(template: string | undefined | ItemFillPolicy): string | ItemFillPolicy {
    if (template === undefined) {
      return 'undefined';
    }
    if (template === '') {
      return '';
    }
    return template;
  }

  build() {
    Scroll() {
      Column() {
        Text('gridColumnsTemplate 测试 (Modifier方式)')
          .fontSize(20).fontWeight(FontWeight.Bold)

        Text('静态场景（固定Modifier）').fontSize(16).fontWeight(FontWeight.Medium)
        this.GridWithTemplateModifier(new GridColumnsTemplateNormalModifier('1fr 2fr 1fr'), 'columnsTemplate')
        this.GridWithTemplateModifier(this.undefinedModifier, '不传值（默认）')
        this.GridWithTemplateModifier(this.invalidModifier, 'columnsTemplate1')
        this.GridWithTemplateModifier(this.emptyModifier, '空字符串：')
        this.GridWithTemplateModifier(this.explicitUndefinedModifier, '显式 undefined')
        this.GridWithTemplateModifier(this.lG5Modifier, 'FillPolicyLG5')
        this.GridWithTemplateModifier(this.lG3Modifier, 'FillPolicyLG3')
        this.GridWithTemplateModifier(this.dEFModifier, 'DEFAULT')

        Divider()

        Text('动态切换场景').fontSize(16).fontWeight(FontWeight.Medium)

        Row() {
          Button('切换 value')
            .onClick(() => {
              this.idx = (this.idx + 1) % this.templateList.length;
              this.gridCols = this.templateList[this.idx];
              this.dynamicModifier = new GridColumnsTemplateDynamicModifier(this.gridCols);
            })
          Text(`当前模板：${this.templateToString(this.gridCols)}`)
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
          .attributeModifier(this.dynamicModifier)  // 使用动态 modifier
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