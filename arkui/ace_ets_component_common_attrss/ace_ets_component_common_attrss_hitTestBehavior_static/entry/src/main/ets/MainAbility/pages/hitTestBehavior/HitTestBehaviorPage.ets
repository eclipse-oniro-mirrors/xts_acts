'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { RouterParams,CustomValue } from '../../common/Utils';
import router from '@ohos.router'
import {
  NavPathStack,
  ListItemGroup,
  MenuItemGroupOptions,
  MenuItemGroup,
  BadgeParamWithNumber,
  SliderOptions,
  SliderStyle,
  MenuItemOptions,
  TabContent,
  ImageFit,
  FlowItem,
  Blank,
  Span,
  ListItem,
  Builder,
  Entry,
  Component,
  $r,
  AlignRuleOption,
  Row,
  Button,
  Margin,
  IDataSource,
  DataChangeListener,
  SwiperController,
  Column,
  ColumnOptions,
  ClickEvent,
  RowOptions,
  LazyForEach,
  Text,
  FlexAlign,
  TextCase,
  TextDecorationType,
  Resource,
  VerticalAlign,
  HorizontalAlign,
  RelativeContainer,
  Color,
  Scroller,
  Menu,
  ScrollBar,
  TextTimer,
  ColumnSplit,
  RowSplit,
  Refresh,
  Shape,
  Rect,
  Path,
  Polygon,
  Polyline,
  Line,
  Ellipse,
  Circle,
  WaterFlow,
  Tabs,
  Swiper,
  Stack,
  SideBarContainer,
  Scroll,
  List,
  GridRow,
  Grid,
  Flex,
  Counter,
  Badge,
  Toggle,
  TimePicker,
  TextPicker,
  TextInput,
  TextClock,
  TextArea,
  Slider,
  Search,
  Rating,
  QRCode,
  Progress,
  AlphabetIndexer,
  ImageAnimator,
  Image,
  Navigation,
  Marquee,
  LoadingProgress,
  Gauge,
  Divider,
  DatePicker,
  DataPanel,
  CheckboxGroup,
  Checkbox,
  Select,
  Radio,
  MenuItem,
  ProgressType,
  ToggleType,
  ForEach,
  GridRowDirection,
  BarState,
  SideBarContainerType,
  TextAlign,
  GridItem,
  BadgeStyle,
  BadgeParamWithString,
  GutterOption,
  BreakPoints,
  BreakpointsReference,
  GridCol,
  GridColOptions,
  GridColColumnOption,
  ColumnOptions,
  NavPathStack,
  HitTestMode,
  CommonMethod,applyStyles,
  AlignRuleOption,
  TouchEvent
} from '@ohos.arkui.component';
import { MessageManager, Callback } from '../../common/MessageManager';
import { AppStorage, State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

/**
 * Test page of common attribute:alignRules
 */
@Entry
@Component
struct HitTestBehaviorPage {
  @StoragePropRef('_hitTestBehavior') _hitTestBehavior: HitTestMode = HitTestMode.Default;
  @State targetView: string = '';
  @State componentKey: string = '';
  @State TargetEventCallBackStr: string = '';
  @State ChildEventCallBackStr: string = '';
  @State BrotherEventCallBackStr: string = '';
  @State containerView: string = '';
  @State referenceTargetComponentKey: string = '';
  @State referenceBrotherComponentKey: string ='';
  @State referenceChildComponentKey: string = '';

  onPageShow() {
    console.info('Margin page show called ')
    try {
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams
      AppStorage.setOrCreate<HitTestMode>('_hitTestBehavior', routerParamOptions.view.testValue.setValue.HitTestMode)
      this.targetView = routerParamOptions.view.targetView
      this.componentKey = routerParamOptions.view.componentKey
      this.TargetEventCallBackStr = routerParamOptions.view.TargetEventCallBackStr
      this.ChildEventCallBackStr = routerParamOptions.view.ChildEventCallBackStr
      this.BrotherEventCallBackStr = routerParamOptions.view.BrotherEventCallBackStr
      this.referenceTargetComponentKey = routerParamOptions.view.referenceTargetComponentKey
      this.referenceBrotherComponentKey = routerParamOptions.view.referenceBrotherComponentKey
      this.referenceChildComponentKey = routerParamOptions.view.referenceChildComponentKey

    } catch (error) {
      console.log(' routerParamOptions error ' + error);
    }
  }

  /**
   * Set common style.
   */
  commonStyle(instance: CommonMethod){
   instance.width(100)
   instance.height(100)
   instance.hitTestBehavior(this._hitTestBehavior)
   instance.id(this.componentKey)
   instance.onTouch((event: TouchEvent) => {
      console.info('[HitTestBehaviorPage] ' + this.targetView + ' onTouch called at' + event.timestamp);
      this.TargetEventCallBackStr = 'onTargetTouch'
    })
  }

  onChildTouchStyle(instance: CommonMethod){
    instance.width(100)
    instance.height(100)
    instance.onTouch((event: TouchEvent) => {
      console.info('[HitTestBehaviorPage] ' + this.targetView + ' onTouch called at' + event.timestamp);
      this.ChildEventCallBackStr = 'onChildTouch'
    })
  }

  onBrotherTouchStyle(instance: CommonMethod){
    instance.width(100)
    instance.height(100)
    instance.onTouch((event: TouchEvent) => {
      console.info('[HitTestBehaviorPage] ' + this.targetView + ' onTouch called at' + event.timestamp);
      this.BrotherEventCallBackStr = 'onBrotherTouch'
    })
  }

  @Builder
  buttonBrotherView() {
    Button('')
      .applyStyles(this.onBrotherTouchStyle)
      .id('button')
  }

  @Builder
  buildTargetView() {
    if (this.targetView == 'Button') {
      Button('') {
        Text().applyStyles(this.onChildTouchStyle)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Blank') {
      Row() {
        Blank().backgroundColor(Color.Yellow).applyStyles(this.commonStyle)
      }
    } else if (this.targetView == 'Text') {
      // Text('text1') {
      //   Span('span').applyStyles(this.onChildTouchStyle)
      // }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Checkbox') {
      Checkbox({ name: 'checkbox1', group: 'checkboxGroup' }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'CheckboxGroup') {
      CheckboxGroup({ group: 'checkboxGroup' }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'DataPanel') {
      DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'DatePicker') {
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
      }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Divider') {
      Divider().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Gauge') {
      Gauge({ value: 105 })
        .applyStyles(this.commonStyle)
        .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
    } else if (this.targetView == 'Image') {
      Image($r('app.media.icon'))
        .draggable(false)
        .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Marquee') {
      Marquee({
        start: true,
        step: 50,
        loop: Number.MAX_VALUE as Int,
        fromStart: true,
        src: 'Running Marquee starts rolling'
      }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Progress') {
      Progress({ value: 10, type: ProgressType.Eclipse }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'QRCode') {
      QRCode('Running Marquee starts rolling').applyStyles(this.commonStyle)
    } else if (this.targetView == 'Radio') {
      Radio({ value: 'Radio1', group: 'radioGroup' }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'ScrollBar') {
      ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
        Text()
          .width(100)
          .height(100)
          .backgroundColor('#C0C0C0')
          .applyStyles(this.onChildTouchStyle)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Select') {
      Select([{ value: 'aaa' },
        { value: 'bbb' }]).applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextArea') {
      TextArea({
        placeholder: 'The text area can hold an unlimited amount of text. input your word...'
      }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextClock') {
      TextClock({ timeZoneOffset: -8 }).format('hms').applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextInput') {
      TextInput({ placeholder: 'input your word...' }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextPicker') {
      TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextTimer') {
      TextTimer({ isCountDown: true, count: 30000 })
        .format('mm:ss.SS')
        .fontColor(Color.Black)
        .applyStyles(this.commonStyle)
    } else if (this.targetView == 'TimePicker') {
      TimePicker({
        selected: new Date('2022-07-22T08:00:00')
      }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Toggle') {
      Toggle({ type: ToggleType.Button, isOn: false }) {
        Text('status button').fontColor('#182431').fontSize(12).applyStyles(this.onChildTouchStyle)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Circle') {
      Circle().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Ellipse') {
      Ellipse().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Line') {
      Line().applyStyles(this.commonStyle).backgroundColor(Color.Black)
    } else if (this.targetView == 'Polyline') {
      Polyline().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Polygon') {
      Polygon().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Path') {
      Path().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Rect') {
      Rect().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Shape') {
      // Shape() {
      //   Rect().width(100).height(100).applyStyles(this.onChildTouchStyle)
      // }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Column') {
      Column() {
        Column().width(100).height(100).backgroundColor(0xAFEEEE).applyStyles(this.onChildTouchStyle)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'ColumnSplit') {
      ColumnSplit() {
        Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        Text('2')
          .width('100%')
          .height(50)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
          .applyStyles(this.onChildTouchStyle)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Flex') {
      Flex() {
        Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          .applyStyles(this.onChildTouchStyle)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Grid') {
      Grid() {
        GridItem() {
          Text('day').backgroundColor(Color.White)
            .width('100%').height('100%').textAlign(TextAlign.Center)
        }.applyStyles(this.onChildTouchStyle)
      }.backgroundColor(0xFAEEE0)
      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'List') {
      List() {
        ListItem() {
          Text('text')
            .width('100%')
            .height(100)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0xFFFFFF)
        }.applyStyles(this.onChildTouchStyle)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Navigator') {
      // Navigator({ target: '' }) {
      //   Text('Go to back page').width('100%').height(20).applyStyles(this.onChildTouchStyle)
      // }.applyStyles(this.commonStyle).backgroundColor(Color.Red)
    } else if (this.targetView == 'RelativeContainer') {
      RelativeContainer() {
        Row()
          .width(100)
          .height(50)
          .backgroundColor('#FF3333')
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            left: { anchor: '__container__', align: HorizontalAlign.Start }
          } as AlignRuleOption)
          .applyStyles(this.onChildTouchStyle)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Row') {
      Row() {
        Button('buttonRow').applyStyles(this.onChildTouchStyle)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'RowSplit') {
      RowSplit() {
        Text('Text').applyStyles(this.onChildTouchStyle)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Scroll') {
      Scroll() {
        Column() {
          ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: Int,index:Int) => {
            Text('Scroll' + item+'')
              .width('90%')
              .height(150)
              .backgroundColor(Color.White)
              .textAlign(TextAlign.Center)
          }, (item: Int,index:Int) => item+'')
        }.width('100%').applyStyles(this.onChildTouchStyle)
      }.scrollBar(BarState.On).applyStyles(this.commonStyle)
    } else if (this.targetView == 'SideBarContainer') {
      SideBarContainer(SideBarContainerType.Embed) {
        Column() {
          ForEach([1, 2, 3], (item: Int,index:Int) => {
            Column({ space: 5 } as ColumnOptions) {
              Image($r('app.media.icon')).width(50).height(50)
              Text('Index0' + item).fontSize(25)
            }
          })
        }.width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor(Color.Green)

        Column() {
          Text('SideBarContainer content').fontSize(25)
        }.backgroundColor(Color.Orange)
        .applyStyles(this.onChildTouchStyle)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Stack') {
      Stack() {
        Button('buttonStack').applyStyles(this.onChildTouchStyle)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Swiper') {
      Swiper() {
        ForEach([1, 2, 3], (item: Int,index:Int) => {
          Text('Swiper' + item).width('90%').height(50)
            .applyStyles(this.onChildTouchStyle)
        }, (item: Int,index:Int) => item+'')
      }.indicator(true).backgroundColor(Color.White).applyStyles(this.commonStyle)
    } else if (this.targetView == 'WaterFlow') {
      WaterFlow() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: Int,index:Int) => {
          FlowItem() {
            Column() {
              Text('WaterFlow' + item).fontSize(12).height('16')
              Image($r('app.media.icon')).width(50).height(50).objectFit(ImageFit.Fill)
            }
          }.applyStyles(this.onChildTouchStyle)
        }, (item: Int,index:Int) => item+'')
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'GridItem') {
      Grid() {
        GridItem() {
          Text('GridItem1').backgroundColor(Color.White)
            .width('100%').height('100%').textAlign(TextAlign.Center)
        }.applyStyles(this.onBrotherTouchStyle)

        GridItem() {
          Text('GridItem2')
            .backgroundColor(Color.White)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
            .applyStyles(this.onChildTouchStyle)
        }.applyStyles(this.commonStyle)
      }
      .width('100%')
      .height('70%')
      .backgroundColor(Color.Black)
    } else if (this.targetView == 'FlowItem') {
      WaterFlow() {
        FlowItem() {
          Column() {
            Text('WaterFlow').fontSize(12).height('16')
            Image($r('app.media.icon')).width(50).height(50).objectFit(ImageFit.Fill)
          }
        }.applyStyles(this.onBrotherTouchStyle)

        FlowItem() {
          Column() {
            Text('WaterFlow').fontSize(12).height('16')
            Image($r('app.media.icon')).width(50).height(50).objectFit(ImageFit.Fill)
          }.applyStyles(this.onChildTouchStyle)
        }.applyStyles(this.commonStyle).width('100%').height('100%')
      }
    } else if (this.targetView == 'ListItem') {
      List({ space: 20, initialIndex: 0 }) {
        ListItem() {
          Text('item1')
            .width('100%')
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.White)
        }.applyStyles(this.onBrotherTouchStyle)

        ListItem() {
          Text('item1')
            .width('100%')
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.White)
            .applyStyles(this.onChildTouchStyle)
        }.applyStyles(this.commonStyle)
      }.width('100%').height('70%')
    } else if (this.targetView == 'TabContent') {
      Tabs() {
        TabContent() {
          Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
        }.tabBar('Tabs1').applyStyles(this.onBrotherTouchStyle)

        TabContent() {
          Text('referenceComponent').width('100%').height('100%').backgroundColor(Color.Orange).applyStyles(this.onChildTouchStyle)
        }.tabBar('Tabs2').applyStyles(this.commonStyle)
      }.width('100%')
      .height('70%')
    } else if (this.targetView == 'AlphabetIndexer') {
      AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'ImageAnimator') {
      ImageAnimator()
        .images([{ src: $r('app.media.icon') }])
        .applyStyles(this.commonStyle)
    } else if (this.targetView == 'LoadingProgress') {
      LoadingProgress()
        .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Menu') {
      Menu() {
        MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions )
          .applyStyles(this.onChildTouchStyle)
      }.backgroundColor(Color.Yellow).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Navigation') {
      Navigation(new NavPathStack()).applyStyles(this.commonStyle)
    } else if (this.targetView == 'NavRouter') {
      // NavRouter() {
      //   Row() {
      //     Image($r('app.media.icon'))
      //   }
      //
      //   NavDestination() {
      //     Text('NavDestination').fontSize(10)
      //   }
      //   .applyStyles(this.onChildTouchStyle)
      // }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Rating') {
      Rating({ rating: 3.5, indicator: false }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Search') {
      Search().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Slider') {
      Slider({
        value: 50,
        min: 0,
        max: 100,
        style: SliderStyle.OutSet
      } as SliderOptions).showTips(true).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Badge') {
      Badge({
        count: 50,
        style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }as BadgeStyle
      } as BadgeParamWithNumber) {
        Button('message')
          .width(100).height(50).backgroundColor(0x317aff).applyStyles(this.onChildTouchStyle)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Counter') {
      Counter() {
        Button('buttonCounter')
          .applyStyles(this.onChildTouchStyle)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'GridRow') {
      GridRow({
        columns: 1,
        gutter: { x: 5, y: 10 }  as GutterOption ,
        direction: GridRowDirection.Row
      }) {
        ForEach([Color.Red], (color: Color) => {
          GridCol({ span: 1 }) {
            Row().width('100%').height('20vp')
          }.borderColor(color).borderWidth(2).applyStyles(this.onChildTouchStyle)
        })
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Panel') {
      // Panel(true) {
      //   Text('Text').applyStyles(this.onChildTouchStyle)
      // }.backgroundColor(Color.Yellow).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Refresh') {
      Refresh({ refreshing: false }) {
        Text('123').applyStyles(this.onChildTouchStyle)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Tabs') {
      Tabs() {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.applyStyles(this.onChildTouchStyle)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'MenuItem') {
      Menu() {
        MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
          .applyStyles(this.onBrotherTouchStyle)
        MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions).applyStyles(this.commonStyle)
      }.width('100%').height('70%').backgroundColor(Color.Yellow)
    } else if (this.targetView == 'MenuItemGroup') {
      Menu() {
        MenuItemGroup({ header: 'MenuItemGroup' } as MenuItemGroupOptions) {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
        }.applyStyles(this.onBrotherTouchStyle)

        MenuItemGroup({ header: 'MenuItemGroup' } as MenuItemGroupOptions) {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions).applyStyles(this.onChildTouchStyle)
        }.applyStyles(this.commonStyle)
      }.width('100%').height('70%').backgroundColor(Color.Yellow)
    } else if (this.targetView == 'ListItemGroup') {
      List({ space: 0, initialIndex: 0 }) {
        ListItemGroup().backgroundColor(Color.Yellow).applyStyles(this.onBrotherTouchStyle)
        ListItemGroup() {
          ListItem().applyStyles(this.onChildTouchStyle)
        }.backgroundColor(Color.Red).applyStyles(this.commonStyle)
      }
    } else if (this.targetView == 'GridCol') {
      GridRow({}) {
        GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption   } as GridColOptions) {
          Row().width('100%').height('20vp')
        }.applyStyles(this.onBrotherTouchStyle)

        GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption }as GridColOptions) {
          Row().width('100%').height('20vp').applyStyles(this.onChildTouchStyle)
        }.applyStyles(this.commonStyle)
      }.width('100%').height('70%')
    }
  }

  build() {
    Column() {
      Text(this.TargetEventCallBackStr).key(this.referenceTargetComponentKey).fontSize(30).width(100).height(100)
      Text(this.BrotherEventCallBackStr).key(this.referenceBrotherComponentKey).fontSize(30).width(100).height(100)
      Text(this.ChildEventCallBackStr).key(this.referenceChildComponentKey).fontSize(30).width(100).height(100)
      if (this.containerView == 'RelativeContainer') {
        RelativeContainer() {
          if (this.targetView == 'TabContent' || this.targetView == 'ListItemGroup' || this.targetView == 'ListItem'
            || this.targetView == 'GridItem' || this.targetView == 'GridCol' || this.targetView == 'FlowItem'
            || this.targetView == 'MenuItemGroup' || this.targetView == 'Blank') {
            this.buildTargetView();
          } else {
            this.buttonBrotherView();
            this.buildTargetView();
          }
        }.width('80%').height('80%').backgroundColor(Color.Pink)
      } else {
        Stack() {
          if (this.targetView == 'TabContent' || this.targetView == 'ListItemGroup' || this.targetView == 'ListItem'
            || this.targetView == 'GridItem' || this.targetView == 'GridCol' || this.targetView == 'FlowItem'
            || this.targetView == 'MenuItemGroup' || this.targetView == 'Blank') {
            this.buildTargetView();
          } else {
            this.buttonBrotherView();
            this.buildTargetView();
          }
        }.width('80%').height('80%').backgroundColor(Color.Pink)
      }
    }.width('100%').height('100%').backgroundColor(Color.White)
  }
}