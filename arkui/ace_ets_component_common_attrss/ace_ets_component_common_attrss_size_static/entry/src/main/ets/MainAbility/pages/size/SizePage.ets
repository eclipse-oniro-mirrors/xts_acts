'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router'
import {
  Entry,Text,Column,Button,Component,AlignRuleOption,FlexDirection,ItemAlign,FlexAlign,FontWeight,$r,TextInput,TextArea,List,ListItem,Image,Grid,Builder,applyStyles,
  GridItem,Rating,MenuItemGroup,MenuItem,Menu,ImageAnimator,DatePicker,CheckboxGroup,Checkbox,Search,Counter,ColumnSplit,AlphabetIndexer,Web,Toggle,TimePicker,NavPathStack,
  TextPicker,Slider,Select,Swiper,Tabs,TabContent,SideBarContainer,Scroll,RowSplit,GridCol,ForEach,Row,GridRow,Flex,Color,ColumnOptions,
  Scroller,Margin,TextAlign,MenuItemOptions,Radio,ToggleType,GridRowDirection,Axis,ListItemGroup,SideBarContainerType,Stack,BreakPoints,GridRowOptions,GutterOption,BreakpointsReference,GridColColumnOption,SizeOptions,
  Blank,DataPanel,Divider,Gauge,LoadingProgress,Marquee,Navigation,Progress,TextTimer,TextClock,ScrollBar,RichText,QRCode,Circle,Ellipse,Line,CommonMethod,
  Polyline,Polygon,Path,Rect,Shape,Badge,Refresh,ProgressType,BarState,BadgeParamWithNumber,RelativeContainer,WaterFlow,FlowItem,HorizontalAlign,VerticalAlign
} from '@ohos.arkui.component'
import { RouterParams } from '../../common/Utils';
import { State, AppStorage,StoragePropRef } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct sizePage {
  //Use for TimePicker.
  private selectedTime: Date = new Date('2022-07-22T08:00:00')
  //Use for QRCode,Marquee.
  private src: string = 'Running Marquee starts rolling'
  //Use for AlphabetIndexer,TextPicker.
  private value: string[] = ['#', 'A', 'B']
  //Use for Scroll,Grid,DataPanel.
  public valueArr: Array<number> = new Array<number>(5, 10, 10, 7, 9, 10, 10, 10, 10)
  @StoragePropRef('_size') _size: SizeOptions = { width: 0, height: 0 } as SizeOptions;
  @State targetView: string = 'Button'
  @State componentKey: string = ''
  @State parentWidth: number = 300
  @State parentHeight: number = 300
  @State parentBackGroundColor: Color = Color.Pink
  @State BackGroundColor: Color = Color.Pink

  onPageShow() {
    console.info('size page show called ')

    AppStorage.setOrCreate<SizeOptions>('_size', { width: 0, height: 0 });
    try {
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
      console.info('size page show called targetView ',routerParamOptions.view.targetView)
      this.targetView = routerParamOptions.view.targetView
      this.componentKey = routerParamOptions.view.componentKey
      this.parentWidth = routerParamOptions.view.parentWidth
      this.parentHeight = routerParamOptions.view.parentHeight
      this.parentBackGroundColor = routerParamOptions.view.parentBackGroundColor
      this.BackGroundColor = routerParamOptions.view.BackGroundColor
    } catch (error: Error) {
      console.log(' routerParamOptions error ' + error);
    }
  }
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
  commonStyle(instance: CommonMethod) {
    instance.size(this._size)
    instance.key(this.componentKey)
  }


  build() {
    Row() {
      if (this.targetView == 'Button') {
        Button('button1').applyStyles(this.commonStyle)
      } else if (this.targetView == 'Text') {
        Text('text1').applyStyles(this.commonStyle)
      } else if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'BlankRow') {
        Blank().color(this.BackGroundColor)
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'BlankColumn') {
        Column() {
          Blank().color(this.BackGroundColor).applyStyles(this.commonStyle)
        }.width(this.parentWidth).height(this.parentHeight)
      } else if (this.targetView == 'Checkbox') {
        Checkbox().backgroundColor(this.BackGroundColor)
          .applyStyles(this.commonStyle)
          .margin(0)
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup({ group: 'checkboxGroup' })
          .applyStyles(this.commonStyle)
          .backgroundColor(this.BackGroundColor)
          .margin(0)
      } else if (this.targetView == 'DataPanel') {
        DataPanel({ values: this.valueArr }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'DatePicker') {
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1'),
        }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Divider') {
        Divider()
          .strokeWidth(8)
          .color(Color.Red)
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Gauge') {
        Gauge({ value: 105 })
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
          .applyStyles(this.commonStyle)
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([
            {
              src: $r('app.media.icon')
            }
          ]).applyStyles(this.commonStyle)
      } else if (this.targetView == 'LoadingProgress') {
        LoadingProgress()
          .backgroundColor(this.BackGroundColor)
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Marquee') {
        Marquee({
          start: true,
          step: 50,
          loop: Infinity as int,
          fromStart: true,
          src: this.src
        }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Navigation') {
        Navigation({}).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Eclipse }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'QRCode') {
        QRCode(this.src).applyStyles(this.commonStyle).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .checked(true)
          .applyStyles(this.commonStyle)
          .backgroundColor(this.BackGroundColor)
          .margin(0)
      } else if (this.targetView == 'Rating') {
        Rating({ rating: 3.5 }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'RichText') {
        RichText('RichText')
          .applyStyles(this.commonStyle)
          // .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
          Text()
            .width(10)
            .height(50)
            .backgroundColor('#C0C0C0')
        }.applyStyles(this.commonStyle).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Search') {
        Search().applyStyles(this.commonStyle).margin(0)
      } else if (this.targetView == 'Select') {
        Select([{ value: 'aaa' }, { value: 'bbb' }])
          .backgroundColor(this.BackGroundColor)
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Slider') {
        Slider({
          value: 50
        })
          .showTips(true)
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'TextArea') {
        TextArea({ placeholder: 'TextArea' })
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'TextClock') {
        TextClock({ timeZoneOffset: -8 })
          .format('hms')
          .applyStyles(this.commonStyle)
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'TextInput') {
        TextInput({ placeholder: 'input your word...' })
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: this.value }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 })
          .format('mm:ss.SS')
          .applyStyles(this.commonStyle)
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'TimePicker') {
        TimePicker({
          selected: this.selectedTime,
        }).useMilitaryTime(true).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch, isOn: false })
          .applyStyles(this.commonStyle)
          .backgroundColor(this.BackGroundColor)
          .margin(0)
      } else if (this.targetView == 'Circle') {
        Circle().applyStyles(this.commonStyle)
      } else if (this.targetView == 'Ellipse') {
        Ellipse().applyStyles(this.commonStyle)
      } else if (this.targetView == 'Line') {
        Line()
          .startPoint([0, 0])
          .endPoint([50, 100])
          .applyStyles(this.commonStyle)
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Polyline') {
        Polyline().applyStyles(this.commonStyle)
          .points([[20, 0], [0, 100], [100, 90]])
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Polygon') {
        Polygon()
          .applyStyles(this.commonStyle)
          .points([[0, 0], [0, 100], [100, 100], [100, 0]])
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Path') {
        Path().applyStyles(this.commonStyle).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Rect') {
        Rect().applyStyles(this.commonStyle)
      } else if (this.targetView == 'Shape') {
        Shape() {
          Rect().width(100).height(50)
        }.applyStyles(this.commonStyle).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Badge') {
        Badge({
          count: 50,
          style: { color: Color.Red, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
        } as BadgeParamWithNumber) {
          Button('message')
            .width(100)
            .height(50)
            .backgroundColor(Color.Red)
        }.applyStyles(this.commonStyle)
      } else if (this.targetView == 'Column') {
        Column() {
          Column()
            .width('100%')
            .height(30)
            .backgroundColor(Color.Red)
        }.applyStyles(this.commonStyle)
      } else if (this.targetView == 'ColumnSplit') {
        ColumnSplit() {
          Text('1')
            .width('100%')
            .height(50)
            .backgroundColor(Color.Red)
            .textAlign(TextAlign.Center)
        }.applyStyles(this.commonStyle)
      } else if (this.targetView == 'Counter') {
        Counter() {
        }.applyStyles(this.commonStyle)
      } else if (this.targetView == 'Flex') {
        Flex() {
          Text('1')
            .width('20%')
            .height(50)
            .backgroundColor(Color.Red)
        }.applyStyles(this.commonStyle)
      } else if (this.targetView == 'GridRow') {
        GridRow({
          columns: 5,
          gutter: { x: 5, y: 10 } as GutterOption,
          breakpoints: { value: ['400vp', '600vp', '800vp'], reference: BreakpointsReference.WindowSize } as BreakPoints,
          direction: GridRowDirection.Row
        }) {
          ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink], (color: Color) => {
            GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption }) {
              Row()
                .width('100%')
                .height('20vp')
            }
            .borderColor(color)
            .borderWidth(2)
          })
        }.applyStyles(this.commonStyle).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Grid') {
        Grid() {
          ForEach(this.valueArr, (day: number, index:int):void => {
            GridItem() {
              Text(String(day))
            }
          }, (day: number, index:int):string => String(day))
        }
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .applyStyles(this.commonStyle)
        .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'List') {
        List() {
        }.width('0')
        .height('0')
        .applyStyles(this.commonStyle)
        .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'ListItem') {
        List() {
          ListItem() {
          }.applyStyles(this.commonStyle)
        }.width(this.parentWidth).height(this.parentHeight)
      } else if (this.targetView == 'Panel') {
        Column(){

        }.height('100%').width('100%')
        .backgroundColor(Color.Yellow)
        .applyStyles(this.commonStyle)
        .bindSheet(true,this.myBuilder,{
          height: 300,
          backgroundColor: Color.Green,
        })

      } else if (this.targetView == 'Navigator') {
        Navigation({}).applyStyles(this.commonStyle)
      } else if (this.targetView == 'NavRouter') {
        Navigation(new NavPathStack()).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Refresh') {
        Refresh({ refreshing: false }) {
          Text('Pull Down and refresh:0 ')
        }
        .applyStyles(this.commonStyle)
        .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Row') {
        Row() {
          Row()
            .width('30%')
            .height(50)
            .backgroundColor(Color.Red)
        }
        .applyStyles(this.commonStyle)
        .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('1')
            .width('20%')
            .height(100)
            .backgroundColor(Color.Red)
        }.applyStyles(this.commonStyle)
      } else if (this.targetView == 'Scroll') {
        Scroll() {
          List() {
            ForEach(this.valueArr, (item: number, index:int):void => {
              ListItem() {
                Text('ListItem' + item)
              }.width('100%').height(100)
            }, (item: number, index:int):string => String(item))
          }.width(200)
          .height(200)
        }.applyStyles(this.commonStyle)
        .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed) {
          Column() {
            ForEach([1, 2, 3], (item: Int, index:int):void => {
              Column({ space: 5 } as ColumnOptions) {
                Image($r('app.media.icon'))
                  .width(50)
                  .height(50)
                Text('Index0' + item)
                  .fontSize(25)
              }
            })
          }.width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)
          .backgroundColor(Color.Green)

          Column() {
            Text('SideBarContainer content')
              .fontSize(25)
          }.backgroundColor(Color.Orange)
        }.applyStyles(this.commonStyle)
      } else if (this.targetView == 'Stack') {
        Stack().applyStyles(this.commonStyle)
      } else if (this.targetView == 'Swiper') {
        Swiper() {
          ForEach([1, 2, 3], (item: Int, index:int) => {
            Text('Swiper' + item)
              .width('90%')
              .height(50)
          }, (item: Int, index:int):string => String(item))
        }
        .indicator(true)
        .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Tabs') {
        Tabs() {
          TabContent() {
            Column()
              .width('100%')
              .height('100%')
              .backgroundColor('#00CB87')
          }
        }.applyStyles(this.commonStyle).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'WaterFlow') {
        WaterFlow()
          .applyStyles(this.commonStyle)
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem().applyStyles(this.commonStyle)
        }
        .width(this.parentWidth)
        .height(this.parentHeight)
      } else if (this.targetView == 'GridCol') {
        GridRow() {
          GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption }) {
            Row().width('100%').height('20vp')
          }.applyStyles(this.commonStyle)
        }
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem().applyStyles(this.commonStyle)
        }.width(this.parentWidth).height(this.parentHeight)
      } else if (this.targetView == 'RelativeContainer') {
        RelativeContainer() {
          Row()
            .width('100%')
            .height('100%')
            .backgroundColor('#FF3333')
            .alignRules({
              center: { anchor: '__container__', align: VerticalAlign.Center},
              middle: { anchor: '__container__', align: HorizontalAlign.Center}
            } as AlignRuleOption)
        }.backgroundColor(Color.Green).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }.backgroundColor(Color.Yellow).applyStyles(this.commonStyle).padding(0)
      } else if (this.targetView == 'MenuItem') {
        Row() {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              .size(this._size)
              .key(this.componentKey)
          }.width(this.parentWidth).height(this.parentHeight).padding(0)
        }
      } else if (this.targetView == 'MenuItemGroup') {
        Row() {
          Menu() {
            MenuItemGroup({ header: 'MenuItemGroup' }) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
            }.key(this.componentKey).size(this._size)
          }.width(this.parentWidth).height(this.parentHeight).padding(0)
        }
      }
    }
    .height(this.parentHeight)
    .width(this.parentWidth)
    .backgroundColor(this.parentBackGroundColor)
  }
}