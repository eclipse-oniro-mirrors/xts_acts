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

// 定义不同的 FocusWrapMode Modifier 类
export class ListFocusWrapModeDefaultModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.focusWrapMode(FocusWrapMode.DEFAULT);
  }
}

export class ListFocusWrapModeUndefinedModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.focusWrapMode(undefined);
  }
}

export class ListFocusWrapModeWrapWithArrowModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.focusWrapMode(FocusWrapMode.WRAP_WITH_ARROW);
  }
}

export class ListFocusWrapModeExplicitUndefinedModifier implements AttributeModifier<ListAttribute> {
  applyNormalAttribute(instance: ListAttribute): void {
    instance.focusWrapMode(undefined);
  }
}

// 动态切换的 Modifier
export class ListFocusWrapModeDynamicModifier implements AttributeModifier<ListAttribute> {
  private mode: FocusWrapMode | undefined;

  constructor(mode: FocusWrapMode | undefined) {
    this.mode = mode;
  }

  applyNormalAttribute(instance: ListAttribute): void {
    instance.focusWrapMode(this.mode);
  }
}

@Entry
@Component
struct listModifier_focusWrapMode {
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 1; i <= 30; i++) {
      arr.push(i);
    }
    return arr;
  })();

  private modeList: (FocusWrapMode | undefined)[] = [
    FocusWrapMode.WRAP_WITH_ARROW,
    FocusWrapMode.DEFAULT,
    undefined,
  ];
  @State private idx: Int = 0;
  @State private focusWrapMode: FocusWrapMode | undefined = this.modeList[0];

  @State private defaultModifier: ListFocusWrapModeDefaultModifier = new ListFocusWrapModeDefaultModifier();
  @State private undefinedModifier: ListFocusWrapModeUndefinedModifier = new ListFocusWrapModeUndefinedModifier();
  @State private wrapWithArrowModifier: ListFocusWrapModeWrapWithArrowModifier =
    new ListFocusWrapModeWrapWithArrowModifier();
  @State private explicitUndefinedModifier: ListFocusWrapModeExplicitUndefinedModifier =
    new ListFocusWrapModeExplicitUndefinedModifier();
  @State private dynamicModifier: ListFocusWrapModeDynamicModifier =
    new ListFocusWrapModeDynamicModifier(this.modeList[0]);

  @Builder
  private ListWithFocusWrapMode(modifier: AttributeModifier<ListAttribute>, tip: string, id: string) {
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
      .attributeModifier(modifier)
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
        Text('focusWrapMode (Modifier方式) - List版本')
          .fontSize(20).fontWeight(FontWeight.Bold)

        Text('静态场景（固定Modifier）').fontSize(16).fontWeight(FontWeight.Medium)
        this.ListWithFocusWrapMode(this.defaultModifier, '正常值：DEFAULT', 'list1')
        this.ListWithFocusWrapMode(this.undefinedModifier, '不传值（默认）', 'list2')

        Divider()

        Text('动态切换场景').fontSize(16).fontWeight(FontWeight.Medium)
        Row() {
          Button('切换 value')
            .onClick(() => {
              this.idx = (this.idx + 1) % this.modeList.length;
              this.focusWrapMode = this.modeList[this.idx];
              this.dynamicModifier = new ListFocusWrapModeDynamicModifier(this.focusWrapMode);
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
          .attributeModifier(this.dynamicModifier)
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