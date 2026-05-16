'use static'

import { TabContentAnimatedTransition, ListScroller, AttributeModifier, UIGridEvent, ScrollSource,   NodeContainer, ImageAttribute, ScrollAttribute, GridAttribute,  ResourceColor, ScrollBarMargin,  TabContentTransitionProxy, FocusWrapMode, TabContentAnimatedTransition, TabsController, BarPosition, Divider, EdgeEffect, BarMode, AnimationMode, Position, LocalizedEdgeColors, OutlineStyle, EdgeOutlineStyles, EdgeOutlineWidths, EdgeColors, OutlineRadiuses, Circle ,ExpectedFrameRateRange ,PlayMode, OnAlphabetIndexerRequestPopupDataCallback, OnAlphabetIndexerPopupSelectCallback,AlphabetIndexerOptions ,OnAlphabetIndexerSelectCallback ,IndexerAlign,TextAlign ,AlphabetIndexer, ListItem, Stack ,Color ,ButtonType ,HoverModeAreaType ,Length ,SheetSize ,SheetType ,EffectEdge ,FontWeight ,FontStyle ,Font ,PopupOptions ,PopupMessageOptions ,Placement ,LocalizedBorderRadiuses ,BorderRadiuses, LengthMetrics ,TextInput ,Margin ,$$ ,SheetKeyboardAvoidMode ,SheetOptions , SheetTitleOptions ,Orientation, ThemeColorMode ,BlurStyle, BackgroundBlurStyleOptions ,MoreButtonOptions ,BlurOptions ,AdaptiveColor ,BackgroundEffectOptions ,NavDestinationActiveReason ,$r,LengthMetrics,HorizontalAlign, ForEach, List,NavigationMode,Alignment, Entry, Builder, PopInfo,NavBarPosition, Callback, Text, TextAttribute,BarStyle,Image,Color, Row, Column, NavDestinationCommonTitle,Component, Button, ButtonAttribute, Scroll, ClickEvent, Curve, NavPathStack, Navigation, LayoutSafeAreaEdge, LaunchMode, NavigationMenuItem, NavPathInfo, NavDestination, LayoutSafeAreaType, NavigationMode, NavigationOptions, NavigationTitleMode, NavigationCommonTitle, NavDestinationMode, NavDestinationContext } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins/ import { Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, Entry } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State,Consume } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import { UIContext } from '@ohos.arkui.UIContext'
import { $r,LengthMetrics, HorizontalAlign, ForEach, List,NavigationMode,Alignment, Entry, Builder, PopInfo,NavBarPosition, Callback, Text, TextAttribute,BarStyle,Image,Color, Row, Column, NavDestinationCommonTitle,Component, Button, ButtonAttribute, Scroll, ClickEvent, Curve, NavPathStack, Navigation, LayoutSafeAreaEdge, LaunchMode, NavigationMenuItem, NavPathInfo, NavDestination, LayoutSafeAreaType, NavigationMode, NavigationOptions, NavigationTitleMode, NavigationCommonTitle, NavDestinationMode, NavDestinationContext } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { AppStorage,State,Consume,Observed} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { Scroll,PinchGesture,GestureEvent,Visibility,ItemDragInfo,TextAlign,ScrollState,Scroller,LazyForEach,Blank,GridDirection,BarState,GridItem,Grid,GridLayoutOptions,Component, Entry, Column, Row, Text, Navigation, NavDestination, NavigationTitleMode, NavPathStack, Button, ClickEvent } from '@ohos.arkui.component'
import { LengthUnit } from '@ohos.arkui.node';
import {FrameNode, typeNode} from '@ohos.arkui.node'
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct List_focusWrapMode {
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

  /* ========== 构造器：List ========== */
  @Builder
  private ListWithFocusWrapMode(mode: FocusWrapMode | undefined, tip: string, id: string) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
      List() {
        ForEach(this.data, (i: number) => {
          ListItem() {
            Text(`${i}`)
              .focusable(true)
              .fontSize(20)
              .textAlign(TextAlign.Center)
              .width('100%')
              .height(80)
          }.focusable(true)
        }, (i: number) => i.toString())
      }.id(id)
      .focusable(true)
      .focusWrapMode(mode) // 关键属性
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
        Text('focusWrapMode 测试总览 - List版本')
          .fontSize(20).fontWeight(FontWeight.Bold)

        /* ---------- 静态区域 ---------- */
        Text('静态场景（固定值）').fontSize(16).fontWeight(FontWeight.Medium)
        this.ListWithFocusWrapMode(FocusWrapMode.DEFAULT, '正常值：DEFAULT', 'list1')
        this.ListWithFocusWrapMode(FocusWrapMode.WRAP_WITH_ARROW, '正常值：WRAP_WITH_ARROW', 'list3')

        Divider()

        /* ---------- 动态切换区域 ---------- */
        Text('动态切换场景').fontSize(16).fontWeight(FontWeight.Medium)
        Row() {
          Button('切换 value')
            .onClick(() => {
              this.idx = (this.idx + 1) % this.modeList.length;
              this.focusWrapMode = this.modeList[this.idx];
            })
          Text(`当前值：${JSON.stringify(this.focusWrapMode)}`)
            .fontSize(14).layoutWeight(1)
        }
        .width('100%')

        Column() {
          Text('动态 List').fontSize(14).fontColor(Color.Gray)
          List() {
            ForEach(this.data, (i: number) => {
              ListItem() {
                Text(`${i}`)
                  .focusable(true)
                  .fontSize(20)
                  .textAlign(TextAlign.Center)
                  .width('100%')
                  .height(80)
              }.focusable(true)
            }, (i: number) => i.toString())
          }
          .focusable(true)
          .focusWrapMode(this.focusWrapMode) // @State 绑定
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