'use static'

import { TabContentAnimatedTransition, ListScroller, LengthConstrain, AttributeModifier, UIGridEvent, ScrollSource,   NodeContainer, ImageAttribute, ScrollAttribute, GridAttribute,  ResourceColor, ScrollBarMargin,  TabContentTransitionProxy, FocusWrapMode, TabContentAnimatedTransition, TabsController, BarPosition, Divider, EdgeEffect, BarMode, AnimationMode, Position, LocalizedEdgeColors, OutlineStyle, EdgeOutlineStyles, EdgeOutlineWidths, EdgeColors, OutlineRadiuses, Circle ,ExpectedFrameRateRange ,PlayMode, OnAlphabetIndexerRequestPopupDataCallback, OnAlphabetIndexerPopupSelectCallback,AlphabetIndexerOptions ,OnAlphabetIndexerSelectCallback ,IndexerAlign,TextAlign ,AlphabetIndexer, ListItem, Stack ,Color ,ButtonType ,HoverModeAreaType ,Length ,SheetSize ,SheetType ,EffectEdge ,FontWeight ,FontStyle ,Font ,PopupOptions ,PopupMessageOptions ,Placement ,LocalizedBorderRadiuses ,BorderRadiuses, LengthMetrics ,TextInput ,Margin ,$$ ,SheetKeyboardAvoidMode ,SheetOptions , SheetTitleOptions ,Orientation, ThemeColorMode ,BlurStyle, BackgroundBlurStyleOptions ,MoreButtonOptions ,BlurOptions ,AdaptiveColor ,BackgroundEffectOptions ,NavDestinationActiveReason ,$r,LengthMetrics,HorizontalAlign, ForEach, List,NavigationMode,Alignment, Entry, Builder, PopInfo,NavBarPosition, Callback, Text, TextAttribute,BarStyle,Image,Color, Row, Column, NavDestinationCommonTitle,Component, Button, ButtonAttribute, Scroll, ClickEvent, Curve, NavPathStack, Navigation, LayoutSafeAreaEdge, LaunchMode, NavigationMenuItem, NavPathInfo, NavDestination, LayoutSafeAreaType, NavigationMode, NavigationOptions, NavigationTitleMode, NavigationCommonTitle, NavDestinationMode, NavDestinationContext } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins/ import { Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, Entry } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State,Consume } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import { UIContext } from '@ohos.arkui.UIContext'
import { $r,LengthMetrics, HorizontalAlign, ForEach, List,NavigationMode,Alignment, Entry, Builder, PopInfo,NavBarPosition, Callback, Text, TextAttribute,BarStyle,Image,Color, Row, Column, NavDestinationCommonTitle,Component, Button, ButtonAttribute, Scroll, ClickEvent, Curve, NavPathStack, Navigation, LayoutSafeAreaEdge, LaunchMode, NavigationMenuItem, NavPathInfo, NavDestination, LayoutSafeAreaType, NavigationMode, NavigationOptions, NavigationTitleMode, NavigationCommonTitle, NavDestinationMode, NavDestinationContext } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { AppStorage,State,Consume,Observed} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { Scroll,PinchGesture,GestureEvent,Visibility,ItemDragInfo,TextAlign,ScrollState,Scroller,LazyForEach,Blank,GridDirection,BarState,GridItem,Grid,GridLayoutOptions,Component, Entry, Column, Row, Text, Navigation, NavDestination, NavigationTitleMode, NavPathStack, Button, ClickEvent } from '@ohos.arkui.component'
import { LengthUnit } from '@ohos.arkui.node';
import {FrameNode, typeNode} from '@ohos.arkui.node'
import { BusinessError } from '@kit.BasicServicesKit';

type LanesType = Int | LengthConstrain;

@Entry
@Component
struct List_lanes {
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
    { minLength: '100vp', maxLength: '200vp' },  // 自适应列数
    0,   // 异常值：0列
  ];

  @State private idx: Int = 0;
  @State private lanesValue: LanesType = this.lanesList[0];

  /* ========== 构造器：List ========== */
  @Builder
  private ListWithLanes(lanes: LanesType, tip: string, id: string) {
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
      .lanes(lanes)  // 关键属性：测试lanes
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
        Text('List lanes 属性测试总览')
          .fontSize(20).fontWeight(FontWeight.Bold)

        Text('lanes属性用于设置列表交叉轴方向的列数（垂直列表）或行数（水平列表）')
          .fontSize(14).fontColor(0x666666)

        /* ---------- 静态区域 ---------- */
        Text('静态场景（固定值）').fontSize(16).fontWeight(FontWeight.Medium)
        this.ListWithLanes(2, '正常值：2（双列布局）', 'list2')
        this.ListWithLanes(3, '正常值：3（三列布局）', 'list3')

        Divider()

        /* ---------- 动态切换区域 ---------- */
        Text('动态切换场景').fontSize(16).fontWeight(FontWeight.Medium)
        Row() {
          Button('切换 value')
            .onClick(() => {
              this.idx = (this.idx + 1) % this.lanesList.length;
              this.lanesValue = this.lanesList[this.idx];
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
          .lanes(this.lanesValue)  // @State 动态绑定
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