'use static'

import { TabContentAnimatedTransition, ListScroller, LengthConstrain, AttributeModifier, UIGridEvent, ScrollSource,
  NodeContainer, ImageAttribute, ScrollAttribute, GridAttribute, ListAttribute,  ResourceColor,
  ScrollBarMargin,  TabContentTransitionProxy, FocusWrapMode, TabContentAnimatedTransition, TabsController,
  CacheCountInfo,
  BarPosition, Divider, EdgeEffect, BarMode, AnimationMode, Position, LocalizedEdgeColors, OutlineStyle,
  WaterFlowAttribute,
  EdgeOutlineStyles, EdgeOutlineWidths, EdgeColors, OutlineRadiuses, Circle ,ExpectedFrameRateRange ,PlayMode,
  ListItemSwipeActionManager,
  OnAlphabetIndexerRequestPopupDataCallback, OnAlphabetIndexerPopupSelectCallback,AlphabetIndexerOptions, Column,
  ListItemSwipeActionDirection,
  OnAlphabetIndexerSelectCallback ,IndexerAlign,TextAlign ,AlphabetIndexer, ListItem, Stack ,Color ,ButtonType ,
  HoverModeAreaType ,Length ,SheetSize ,SheetType ,EffectEdge ,FontWeight ,FontStyle ,Font ,PopupOptions,
  RefreshStatus,
  PopupMessageOptions ,Placement ,LocalizedBorderRadiuses ,BorderRadiuses, LengthMetrics ,TextInput ,Margin,
  $$ ,SheetKeyboardAvoidMode ,SheetOptions , SheetTitleOptions ,Orientation, ThemeColorMode ,BlurStyle, ScrollBar,
  BackgroundBlurStyleOptions ,MoreButtonOptions ,BlurOptions ,AdaptiveColor ,BackgroundEffectOptions , ItemFillPolicy,
  NavDestinationActiveReason ,$r,LengthMetrics,HorizontalAlign, ForEach, List,NavigationMode,Alignment, Refresh,
  Entry, Builder, PopInfo,NavBarPosition, Callback, Text, TextAttribute,BarStyle,Image,Color, Row, Column,
  ScrollBarDirection,
  NavDestinationCommonTitle,Component, Button, ButtonAttribute, Scroll, ClickEvent, Curve, NavPathStack, Navigation,
  LayoutSafeAreaEdge, LaunchMode, NavigationMenuItem, NavPathInfo, NavDestination, LayoutSafeAreaType, NavigationMode,
  NavigationOptions, NavigationTitleMode, NavigationCommonTitle, ScrollSnapAnimationSpeed, ScrollSnapAlign,
  ScrollDirection,
  NavDestinationMode, NavDestinationContext,Flex,FlexAlign } from '@ohos.arkui.component'
import { State,Consume } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { UIContext } from '@ohos.arkui.UIContext'
import { $r,LengthMetrics, HorizontalAlign,ColorMetrics,ScrollBarAttribute, ForEach, List,NavigationMode,Alignment,
  Entry, Builder, PopInfo,
  NavBarPosition, Callback, Text, TextAttribute,BarStyle,Image,Color, Row, Column, NavDestinationCommonTitle,
  PresetFillType,
  Component, Button, ButtonAttribute, Scroll, ClickEvent, Curve, NavPathStack, Navigation, LayoutSafeAreaEdge,
  LaunchMode, NavigationMenuItem, NavPathInfo, NavDestination, LayoutSafeAreaType, NavigationMode, NavigationOptions,
  NavigationTitleMode, NavigationCommonTitle, NavDestinationMode, NavDestinationContext } from '@ohos.arkui.component'
import { AppStorage,State,Consume,Observed} from '@ohos.arkui.stateManagement'
import { Scroll,PinchGesture,GestureEvent,Visibility,WaterFlow,FlowItem,ItemDragInfo,
  TextAlign,ScrollState,Scroller,LazyForEach,
  Blank,GridDirection,BarState,GridItem,Grid,GridLayoutOptions,Component, Entry, Column, Row, Text, Navigation,
  NavDestination, NavigationTitleMode, NavPathStack, Button, ClickEvent } from '@ohos.arkui.component'
import { LengthUnit } from '@ohos.arkui.node';
import {FrameNode, typeNode} from '@ohos.arkui.node'
import { BusinessError } from '@kit.BasicServicesKit';

// 定义不同的 ListCachedCount Modifier 类
@Observed
export class ListCachedCountNormalModifier implements AttributeModifier<ListAttribute> {
  private count: Int | undefined | CacheCountInfo;
  private show: boolean;

  constructor(count: Int | undefined | CacheCountInfo , show: boolean = true) {
    this.count = count;
    this.show = show;
  }

  applyNormalAttribute(instance: ListAttribute): void {
    instance.cachedCount(this.count, this.show);
  }
}
@Observed
export class ListCachedCountZeroModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.cachedCount(0, true); // 零值测试
  }
}
@Observed
export class ListCachedCountNegativeModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.cachedCount(-30, true); // 负值测试
  }
}
@Observed
export class ListCachedCountUndefinedModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.cachedCount(undefined, true); // undefined测试
  }
}
@Observed
export class ListCachedCountDynamicModifier implements AttributeModifier<ListAttribute> {
  private count: Int | undefined | CacheCountInfo;
  private show: boolean;

  constructor(count: Int | undefined | CacheCountInfo, show: boolean = true) {
    this.count = count;
    this.show = show;
  }

  applyNormalAttribute(instance: ListAttribute): void {
    instance.cachedCount(this.count, this.show);
  }
}

@Observed
export class ListCachedCountInfoModifier implements AttributeModifier<ListAttribute> {
  private cacheInfo: CacheCountInfo;
  private show: boolean;

  constructor(minCount: Int, maxCount: Int, show: boolean = true) {
    this.cacheInfo = { minCount, maxCount };
    this.show = show;
  }

  applyNormalAttribute(instance: ListAttribute): void {
    instance.cachedCount(this.cacheInfo, this.show);
  }
}

@Entry
@Component
struct listModifier_cachedCount {
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();

  // 扩展测试值，包含CacheCountInfo类型
  private countList: Array<Int | undefined | CacheCountInfo> = [
    3,  // 正常值
    0,  // 零值
    -30, // 负值
    undefined, // undefined
    { minCount: 2, maxCount: 6 }, // CacheCountInfo类型
    { minCount: 1, maxCount: 4 }  // 另一个CacheCountInfo
  ];

  @State private idx: Int = 0;
  @State private cachedCount: Int | undefined | CacheCountInfo = this.countList[0];

  // 创建Modifier实例
  @State private normalModifier: ListCachedCountNormalModifier = new ListCachedCountNormalModifier(3, true);
  @State private zeroModifier: ListCachedCountZeroModifier = new ListCachedCountZeroModifier();
  @State private negativeModifier: ListCachedCountNegativeModifier = new ListCachedCountNegativeModifier();
  @State private undefinedModifier: ListCachedCountUndefinedModifier = new ListCachedCountUndefinedModifier();
  @State private cacheInfoModifier1: ListCachedCountInfoModifier = new ListCachedCountInfoModifier(2, 6, true);
  @State private cacheInfoModifier2: ListCachedCountInfoModifier = new ListCachedCountInfoModifier(1, 4, true);
  @State private dynamicModifier: ListCachedCountDynamicModifier = new ListCachedCountDynamicModifier(3, true);

  @Builder
  private ScrollListWithCount(modifier: AttributeModifier<ListAttribute>, tip: string, id: string) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
      Scroll() {
        List() {
          ForEach(this.data, (i: number) => {
            ListItem() {
              Text(`项目 ${i}`)
                .fontSize(18)
                .textAlign(TextAlign.Center)
                .width('100%')
                .height(80)
            }
          }, (i: number) => i.toString())
        }.id(id)
        .width('100%')
        .backgroundColor(0xFFF8F0)
        .attributeModifier(modifier)  // 使用Modifier设置cachedCount
      }
      .height(200)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('cachedCount 属性测试 - Modifier版本 (API 22+)')
          .fontSize(20).fontWeight(FontWeight.Bold)

        Text('属性说明：设置列表项预加载数量，支持动态范围控制')
          .fontSize(12).fontColor(Color.Gray)

        Text('静态场景（固定Modifier）').fontSize(16).fontWeight(FontWeight.Medium)
        this.ScrollListWithCount(this.normalModifier, '正常值：3（推荐值）', 'list1')
        this.ScrollListWithCount(this.zeroModifier, '零值：0（不预加载）', 'list2')
        this.ScrollListWithCount(this.negativeModifier, '负值：-30（无效值测试）', 'list3')
        this.ScrollListWithCount(this.undefinedModifier, 'undefined（默认值）', 'list4')

        Divider()

        Text('动态切换场景').fontSize(16).fontWeight(FontWeight.Medium)
        Row() {
          Button('切换缓存策略')
            .onClick(() => {
              this.idx = (this.idx + 1) % this.countList.length;
              this.cachedCount = this.countList[this.idx];

              // 创建新的动态Modifier
              if (typeof this.cachedCount === 'number') {
                this.dynamicModifier = new ListCachedCountDynamicModifier(this.cachedCount, true);
              } else if (this.cachedCount && typeof this.cachedCount === 'object') {
                // 如果是CacheCountInfo类型，需要特殊处理
                this.dynamicModifier = new ListCachedCountDynamicModifier(undefined, true);
              } else {
                this.dynamicModifier = new ListCachedCountDynamicModifier(this.cachedCount, true);
              }
            })
        }
        .width('100%')

        Column() {
          Text('动态 List (Modifier方式)').fontSize(14).fontColor(Color.Gray)
          Scroll() {
            List() {
              ForEach(this.data, (i: number) => {
                ListItem() {
                  Text(`动态项目 ${i}`)
                    .fontSize(18)
                    .textAlign(TextAlign.Center)
                    .width('100%')
                    .height(80)
                }
              }, (i: number) => i.toString())
            }
            .width('100%')
            .backgroundColor(0xFFF8F0)
            .attributeModifier(this.dynamicModifier)
          }
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