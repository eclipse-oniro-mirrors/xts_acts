'use static'

import { TabContentAnimatedTransition, ListScroller, LengthConstrain, AttributeModifier, UIGridEvent, ScrollSource,
  NodeContainer, ImageAttribute, ScrollAttribute, GridAttribute, ListAttribute,  ResourceColor,
  ScrollBarMargin,  TabContentTransitionProxy, FocusWrapMode, TabContentAnimatedTransition, TabsController,
  CacheCountInfo,
  BarPosition, Divider, EdgeEffect, BarMode, AnimationMode, Position, LocalizedEdgeColors, OutlineStyle,
  WaterFlowAttribute,
  EdgeOutlineStyles, EdgeOutlineWidths, EdgeColors, OutlineRadiuses, Circle ,ExpectedFrameRateRange ,PlayMode,
  OnAlphabetIndexerRequestPopupDataCallback, OnAlphabetIndexerPopupSelectCallback,AlphabetIndexerOptions, Column,
  OnAlphabetIndexerSelectCallback ,IndexerAlign,TextAlign ,AlphabetIndexer, ListItem, Stack ,Color ,ButtonType ,
  HoverModeAreaType ,Length ,SheetSize ,SheetType ,EffectEdge ,FontWeight ,FontStyle ,Font ,PopupOptions,
  RefreshStatus,
  PopupMessageOptions ,Placement ,LocalizedBorderRadiuses ,BorderRadiuses, LengthMetrics ,TextInput ,Margin ,
  $$ ,SheetKeyboardAvoidMode ,SheetOptions , SheetTitleOptions ,Orientation, ThemeColorMode ,BlurStyle, ScrollBar,
  BackgroundBlurStyleOptions ,MoreButtonOptions ,BlurOptions ,AdaptiveColor ,BackgroundEffectOptions , ItemFillPolicy,
  NavDestinationActiveReason ,$r,LengthMetrics,HorizontalAlign, ForEach, List,NavigationMode,Alignment, Refresh,
  Entry, Builder, PopInfo,NavBarPosition, Callback, Text, TextAttribute,BarStyle,Image,Color, Row, Column,
  ScrollBarDirection,
  NavDestinationCommonTitle,Component, Button, ButtonAttribute, Scroll, ClickEvent, Curve, NavPathStack, Navigation,
  LayoutSafeAreaEdge, LaunchMode, NavigationMenuItem, NavPathInfo, NavDestination, LayoutSafeAreaType, NavigationMode,
  NavigationOptions, NavigationTitleMode, NavigationCommonTitle, ScrollSnapAnimationSpeed, ScrollSnapAlign,
  ScrollDirection,
  NavDestinationMode, NavDestinationContext } from '@ohos.arkui.component'
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


@Entry
@Component
struct List_cachedCount {
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();

  private countList: (Int | undefined | CacheCountInfo)[] = [60, 0, -20, undefined, {minCount:20, maxCount:30}];
  @State private idx: Int = 0;
  @State private cachedCount: (Int | undefined | CacheCountInfo) = this.countList[0];

  @Builder
  private ScrollListWithCount(count: (Int | undefined | CacheCountInfo), tip: string, id: string) {
    Column() {
      Text(tip).fontSize(14).fontColor(Color.Gray)
      Scroll() {
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
        .width('100%')
        .backgroundColor(0xFFF8F0)
        .cachedCount(count,true)
      }
      .height(200)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column() {
        Text('cachedCount - List版本')
          .fontSize(20).fontWeight(FontWeight.Bold)

        Text('静态场景（固定值）').fontSize(16).fontWeight(FontWeight.Medium)
        this.ScrollListWithCount(3, '正常值：3', 'list1')
        this.ScrollListWithCount(0, '零值：0', 'list2')
        this.ScrollListWithCount(-30, '负值：-30', 'list3')
        this.ScrollListWithCount(undefined, '显式 undefined', 'list4')

        Divider()

        Text('动态切换场景').fontSize(16).fontWeight(FontWeight.Medium)
        Row() {
          Button('切换 value')
            .onClick(() => {
              this.idx = (this.idx + 1) % this.countList.length;
              this.cachedCount = this.countList[this.idx];
            })
          Text(`当前值：${JSON.stringify(this.cachedCount)}`)
            .fontSize(14).layoutWeight(1)
        }
        .width('100%')

        Column() {
          Text('动态 Scroll + List').fontSize(14).fontColor(Color.Gray)
          Scroll() {
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
            .width('100%')
            .backgroundColor(0xFFF8F0)
            .cachedCount(this.cachedCount,true)
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