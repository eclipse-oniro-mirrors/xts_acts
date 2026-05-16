'use static'

import { TabContentAnimatedTransition, ListScroller, LengthConstrain, AttributeModifier, UIGridEvent, ScrollSource,
  NodeContainer, ImageAttribute, ScrollAttribute, GridAttribute, ListAttribute,  ResourceColor,
  ScrollBarMargin,  TabContentTransitionProxy, FocusWrapMode, TabContentAnimatedTransition, TabsController,
  BarPosition, Divider, EdgeEffect, BarMode, AnimationMode, Position, LocalizedEdgeColors, OutlineStyle,
  EdgeOutlineStyles, EdgeOutlineWidths, EdgeColors, OutlineRadiuses, Circle ,ExpectedFrameRateRange ,PlayMode,
  OnAlphabetIndexerRequestPopupDataCallback, OnAlphabetIndexerPopupSelectCallback,AlphabetIndexerOptions,
  OnAlphabetIndexerSelectCallback ,IndexerAlign,TextAlign ,AlphabetIndexer, ListItem, Stack ,Color ,ButtonType ,
  HoverModeAreaType ,Length ,SheetSize ,SheetType ,EffectEdge ,FontWeight ,FontStyle ,Font ,PopupOptions ,
  PopupMessageOptions ,Placement ,LocalizedBorderRadiuses ,BorderRadiuses, LengthMetrics ,TextInput ,Margin ,
  $$ ,SheetKeyboardAvoidMode ,SheetOptions , SheetTitleOptions ,Orientation, ThemeColorMode ,BlurStyle,
  BackgroundBlurStyleOptions ,MoreButtonOptions ,BlurOptions ,AdaptiveColor ,BackgroundEffectOptions ,
  NavDestinationActiveReason ,$r,LengthMetrics,HorizontalAlign, ForEach, List,NavigationMode,Alignment,
  Entry, Builder, PopInfo,NavBarPosition, Callback, Text, TextAttribute,BarStyle,Image,Color, Row, Column,
  NavDestinationCommonTitle,Component, Button, ButtonAttribute, Scroll, ClickEvent, Curve, NavPathStack, Navigation,
  LayoutSafeAreaEdge, LaunchMode, NavigationMenuItem, NavPathInfo, NavDestination, LayoutSafeAreaType, NavigationMode,
  NavigationOptions, NavigationTitleMode, NavigationCommonTitle, ScrollSnapAnimationSpeed, ScrollSnapAlign,
  NavDestinationMode, NavDestinationContext } from '@ohos.arkui.component'
import { State,Consume } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { UIContext } from '@ohos.arkui.UIContext'
import { $r,LengthMetrics, HorizontalAlign, ForEach, List,NavigationMode,Alignment, Entry, Builder, PopInfo,
  NavBarPosition, Callback, Text, TextAttribute,BarStyle,Image,Color, Row, Column, NavDestinationCommonTitle,
  Component, Button, ButtonAttribute, Scroll, ClickEvent, Curve, NavPathStack, Navigation, LayoutSafeAreaEdge,
  LaunchMode, NavigationMenuItem, NavPathInfo, NavDestination, LayoutSafeAreaType, NavigationMode, NavigationOptions,
  NavigationTitleMode, NavigationCommonTitle, NavDestinationMode, NavDestinationContext } from '@ohos.arkui.component'
import { AppStorage,State,Consume,Observed} from '@ohos.arkui.stateManagement'
import { Scroll,PinchGesture,GestureEvent,Visibility,ItemDragInfo,TextAlign,ScrollState,Scroller,LazyForEach,
  Blank,GridDirection,BarState,GridItem,Grid,GridLayoutOptions,Component, Entry, Column, Row, Text, Navigation,
  NavDestination, NavigationTitleMode, NavPathStack, Button, ClickEvent } from '@ohos.arkui.component'
import { LengthUnit } from '@ohos.arkui.node';
import {FrameNode, typeNode} from '@ohos.arkui.node'
import { BusinessError } from '@kit.BasicServicesKit';

type LanesType = Int | LengthConstrain;
// 定义不同的 Lanes Modifier 类
@Observed
class ListLanesNormalModifier implements AttributeModifier<ListAttribute> {
  private lanesValue: LanesType;

  constructor(lanesValue: LanesType) {
    this.lanesValue = lanesValue;
  }

  applyNormalAttribute(instance: ListAttribute): void {
    instance.lanes(this.lanesValue);
  }
}
@Observed
export class ListLanesNumberModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.lanes(2);  // 正常值：2列
  }
}
@Observed
export class ListLanesAdaptiveModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.lanes({ minLength: 100, maxLength: 200 });  // 自适应列数
  }
}
@Observed
export class ListLanesZeroModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.lanes(0);  // 异常值：0列
  }
}
@Observed
export class ListLanesNegativeModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.lanes(-1);  // 异常值：-1
  }
}
// 动态切换的 Modifier
@Observed
export class ListLanesDynamicModifier implements AttributeModifier<ListAttribute> {
  private lanesValue: LanesType;

  constructor(lanesValue: LanesType) {
    this.lanesValue = lanesValue;
  }

  applyNormalAttribute(instance: ListAttribute): void {
    instance.lanes(this.lanesValue);
  }
}

@Entry
@Component
struct listModifier_lanes {
  /* ===================== 数据：30 项 ===================== */
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();

  /* ========== 动态切换专用 ========== */
  private lanesList: LanesType[] = [
    2,  // 正常值：2列
    { minLength: 100, maxLength: 200 },  // 自适应列数
    0,   // 异常值：0列
  ];

  @State private idx: Int = 0;
  @State private lanesValue: LanesType = this.lanesList[0];

  // 创建 Modifier 实例
  @State private numberModifier: ListLanesNumberModifier = new ListLanesNumberModifier();
  @State private adaptiveModifier: ListLanesAdaptiveModifier = new ListLanesAdaptiveModifier();
  @State private zeroModifier: ListLanesZeroModifier = new ListLanesZeroModifier();
  @State private negativeModifier: ListLanesNegativeModifier = new ListLanesNegativeModifier();
  @State private dynamicModifier: ListLanesDynamicModifier = new ListLanesDynamicModifier(this.lanesList[0]);

  @Builder
  private ListWithLanesModifier(modifier: AttributeModifier<ListAttribute>, tip: string, id: string) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
      List() {
        ForEach(this.data, (i: number) => {
          ListItem() {
            Text(`${i}`)
              .fontSize(20)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height(80)
          }
        }, (i: number) => i.toString())
      }.id(id)
      .attributeModifier(modifier)  // 使用attributeModifier应用lanes属性
      .width('100%')
      .height(200)
      .backgroundColor(0xFFF8F0)
      .border({ width: 1, color: Color.Blue })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('List lanes 属性测试 (Modifier方式)')
          .fontSize(20).fontWeight(FontWeight.Bold)

        Text('lanes属性用于设置列表交叉轴方向的列数（垂直列表）或行数（水平列表）')
          .fontSize(14).fontColor(0x666666)

        /* ---------- 静态区域 ---------- */
        Text('静态场景（固定Modifier）').fontSize(16).fontWeight(FontWeight.Medium)
        this.ListWithLanesModifier(new ListLanesNormalModifier(1), '正常值：1（单列布局）', 'list1')
        this.ListWithLanesModifier(this.numberModifier, '正常值：2（双列布局）', 'list2')
        this.ListWithLanesModifier(new ListLanesNormalModifier(3), '正常值：3（三列布局）', 'list3')
        this.ListWithLanesModifier(this.adaptiveModifier, '自适应：{minLength: 100, maxLength: 150}', 'list4')
        this.ListWithLanesModifier(this.zeroModifier, '异常值：0', 'list5')
        this.ListWithLanesModifier(this.negativeModifier, '异常值：-1', 'list6')

        Divider()

        /* ---------- 动态切换区域 ---------- */
        Text('动态切换场景').fontSize(16).fontWeight(FontWeight.Medium)
        Row() {
          Button('切换 value')
            .onClick(() => {
              this.idx = (this.idx + 1) % this.lanesList.length;
              this.lanesValue = this.lanesList[this.idx];
              this.dynamicModifier = new ListLanesDynamicModifier(this.lanesValue);
            })
        }
        .width('100%')

        Column() {
          Text('动态 List - 实时测试lanes属性').fontSize(14).fontColor(Color.Gray)
          List() {
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
          .attributeModifier(this.dynamicModifier)  // 使用动态modifier
          .width('100%')
          .height(200)
          .backgroundColor(0xFFF8F0)
          .border({ width: 2, color: Color.Red })
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