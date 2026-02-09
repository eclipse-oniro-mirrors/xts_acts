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
import { attrsManager } from '../../common/AttrsManager';
import { RouterParams } from '../../common/Utils';
import router from '@ohos.router'
import {
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
  MenuItemOptions,
  NavPathStack,
  CommonMethod,
  applyStyles,
  Builder
} from '@ohos.arkui.component';
import { MessageManager, Callback } from '../../common/MessageManager';
import { AppStorage, State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

/**
 * Test page of common attribute:alignRules
 */
@Entry
@Component
struct AlignRules {
  @State show: boolean = false //For Panel
  @StoragePropRef("_alignRules") _alignRules: AlignRuleOption = {
    center: { anchor: '__container__', align: VerticalAlign.Center },
    middle: { anchor: '__container__', align: HorizontalAlign.Center }
  } as AlignRuleOption;
  @State targetView: string = "";
  @State componentKey: string = "";
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State subassemblyWidth: number = 0;
  @State subassemblyHeight: number = 0
  @State subassemblyCenter: AlignRuleOption = {} as AlignRuleOption;
  @State parentComponentKey: string = "";
  @State referenceComponentKey: string = ""
  @Builder
  myBuilder() {
    Column() {
      Text("bindSheet")
        .fontSize(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }

  onPageShow() {
    console.info('[AlignRules] page show called ')
    let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
    AppStorage.setOrCreate<AlignRuleOption>('_alignRules', routerParamOptions.view.testValue.setValue)
    this.targetView = routerParamOptions.view.targetView
    this.componentKey = routerParamOptions.view.componentKey ?? ""
    this.parentWidth = routerParamOptions.view.parentWidth
    this.parentHeight = routerParamOptions.view.parentHeight
    this.subassemblyWidth = routerParamOptions.view.subassemblyWidth
    this.subassemblyHeight = routerParamOptions.view.subassemblyHeight
    this.parentComponentKey = routerParamOptions.view.parentComponentKey
    this.referenceComponentKey = routerParamOptions.view.referenceComponentKey
    this.subassemblyCenter = routerParamOptions.view.subassemblyCenter
  }

  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  commonStyle(instance: CommonMethod){
    instance.id(this.componentKey)
    instance.alignRules(this._alignRules)
  }

  build() {
    RelativeContainer() {
      //Set view by page config.
      if (this.targetView == 'Button') {
        Button('button1')
          .width(this.subassemblyWidth).height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .margin(0).width(this.subassemblyWidth).height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Select') {
        Select([{ value: 'aaa', icon: '../../../../common/public_icon.svg' },
          { value: 'bbb', icon: '../../../../common/public_icon.svg' }])
          .width(this.subassemblyWidth).height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Checkbox') {
        Checkbox({ name: 'checkbox1' })
          .margin(0).width(this.subassemblyWidth).height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup()
          .margin(0).width(this.subassemblyWidth).height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'DataPanel') {
        DataPanel({ values: [25] })
          .width(this.subassemblyWidth).height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'DatePicker') {
        DatePicker({})
          .width(this.subassemblyWidth).height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Divider') {
        Divider()
          .strokeWidth(10)
          .color(Color.Black)
          .vertical(false)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Gauge') {
        Gauge({ value: 0 })
          .colors([[0x317AF7, 1], [0x9C554B, 1]])
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'LoadingProgress') {
        LoadingProgress()
          .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Marquee') {
        Marquee({ start: true, src: 'Marquee' })
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Navigation') {
        Navigation(new NavPathStack())
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .expandSafeArea([], [])
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: ['A', 'B', 'C', 'D'], selected: 0 })
          .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Ring })
          .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'QRCode') {
        QRCode('Hello Harmony')
          .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Rating') {
        Rating({ rating: 3.5 })
          .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Search') {
        Search()
          .margin(0).width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Slider') {
        Slider()
          .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Text') {
        Text('Text')
          .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'TextArea') {
        TextArea()
          .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'TextClock') {
        TextClock()
          .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'TextInput') {
        TextInput()
          .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: ['apple1', 'orange2', 'peach3', 'grape4'] })
          .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'TimePicker') {
        TimePicker()
          .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch })
          .margin(0).width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Badge') {
        Badge({ value: '', style: { badgeSize: 6, badgeColor: Color.Red } as BadgeStyle } as BadgeParamWithString) {
          Button('BadgeContent')
        }
        .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Column') {
        Column()
          .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Counter') {
        Counter()
          .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Flex') {
        Flex()
          .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Grid') {
        Grid() {
          ForEach(['0', '1', '2', '3', '4'], (iten: string) => {
            ForEach(['0', '1', '2', '3', '4'], (day: string) => {
              GridItem() {
                Text(day).backgroundColor(Color.White)
                  .width('100%').height('100%').textAlign(TextAlign.Center)
              }
            })
          })
        }
        .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'GridRow') {
        GridRow({
          columns: 5,
          gutter: { x: 5, y: 10 } as GutterOption,
          breakpoints: {
            value: ['400vp', '600vp', '800vp'],
            reference: BreakpointsReference.WindowSize
          } as BreakPoints,
          direction: GridRowDirection.Row
        }) {
          ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown],
            (color: Color) => {
              GridCol({
                span: {
                  xs: 1,
                  sm: 2,
                  md: 3,
                  lg: 4
                } as GridColColumnOption
              } as GridColOptions) {
                Row().width('100%').height('20vp')
              }.borderColor(color).borderWidth(2)
            })
        }
        .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'List') {
        List()
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'RelativeContainer') {
        RelativeContainer() {
          Row()
            .width(100)
            .height(100)
            .backgroundColor('#FF3333')
            .alignRules({
              top: { anchor: '__container__', align: VerticalAlign.Top },
              left: { anchor: '__container__', align: HorizontalAlign.Start }
            } as AlignRuleOption)
            .id('alignRules')
        }
        .backgroundColor(Color.Blue)
        .width(this.subassemblyWidth)
        .height(this.subassemblyHeight)

       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Row') {
        Row()
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Scroll') {
        Scroll() {
          Column() {
            ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[], (item: number, index: int) => {
              Text('Scroll' + item)
                .width('90%')
                .height(150)
                .backgroundColor(Color.White)
                .textAlign(TextAlign.Center)
            }, (item: number) => String(item))
          }.width('100%')
        }
        .scrollBar(BarState.On)
        .backgroundColor(Color.Blue)
        .width(this.subassemblyWidth)
        .height(this.subassemblyHeight)

       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed) {
          Column() {
            ForEach([1, 2, 3] as number[], (item: number, index: int) => {
              Column({ space: 5 } as ColumnOptions) {
                Image($r('app.media.icon')).width(64).height(64)
                Text('Index0' + item).fontSize(25)
              }
            }, (item: number) => String(item))
          }.width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)
          .backgroundColor(Color.Green)

          Column() {
            Text('SideBarContainer content').fontSize(25)
          }.backgroundColor(Color.Orange)
        }
        .backgroundColor(Color.Blue)
        .width(this.subassemblyWidth)
        .height(this.subassemblyHeight)

       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Stack') {
        Stack()
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Swiper') {
        Swiper() {
          ForEach([1, 2, 3] as number[], (item: number, index: int) => {
            Text('Swiper' + item).width('90%').height(160)
          }, (item: number) => String(item))
        }
        .indicator(true)
        .backgroundColor(Color.White)
        .width(this.subassemblyWidth)
        .height(this.subassemblyHeight)

       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Tabs') {
        Tabs()
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'WaterFlow') {
        WaterFlow()
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Circle') {
        Circle()
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Ellipse') {
        Ellipse()
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Line') {
        Line()
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Polyline') {
        Polyline()
          .points([[50, 10], [50, 50], [90, 90]])
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Polygon') {
        Polygon()
          .points([[50, 10], [50, 50], [90, 90]])
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Path') {
        Path()
          .commands('M100 0 L200 240 L0 240 Z')
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Rect') {
        Rect()
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
       .applyStyles(this.commonStyle)
        } else if (this.targetView == 'Shape') {
          Shape() {
            Rect().width('100%').height('100%').id('Rect')
          }
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .applyStyles(this.commonStyle)
        } else if (this.targetView == 'Panel') {
            Column(){
            }
            .width(this.subassemblyWidth)
            .height(this.subassemblyHeight)
            .alignRules(this.subassemblyCenter)
            .applyStyles(this.commonStyle)
            .bindSheet(true,this.myBuilder,{
              height: 300,
              backgroundColor: Color.Red
            })

          // Panel(this.show = true) {
          //   Column() {
          //   }
          // }
          // .width(this.subassemblyWidth)
          // .height(this.subassemblyHeight)
          // .alignRules(this.subassemblyCenter)
          // .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Refresh') {
        Refresh({ refreshing: false }) {
          Text('Pull Down and refresh:0 ')
        }
        .width(this.subassemblyWidth)
        .height(this.subassemblyHeight)
        .alignRules(this.subassemblyCenter)

       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('1').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          Text('2').width('10%').height(100).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
        }.width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'ColumnSplit') {
        ColumnSplit() {
          Text('1').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          Text('2').width('10%').height(100).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
        }.width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
        } else if (this.targetView == 'Navigator') {
          Navigation(new NavPathStack())
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .expandSafeArea([], [])
          .applyStyles(this.commonStyle)
        } else if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 })
          .width(this.subassemblyWidth).height(this.subassemblyHeight).applyStyles(this.commonStyle)
      } else if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
          Text().width(20).height(100).borderRadius(10)
            .backgroundColor('#C0C0C0')
        }
        .width(this.subassemblyWidth)
        .height(this.subassemblyHeight)
        .backgroundColor('#ededed')

       .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }
        .backgroundColor(Color.Yellow)
        .width(this.subassemblyWidth)
        .height(this.subassemblyHeight)

       .applyStyles(this.commonStyle)
      }
      Button('button')
        .width(this.subassemblyWidth)
        .height(this.subassemblyHeight)
        .alignRules(this.subassemblyCenter)
        .id(this.referenceComponentKey)
    }.key(this.parentComponentKey).width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Pink)
  }
}