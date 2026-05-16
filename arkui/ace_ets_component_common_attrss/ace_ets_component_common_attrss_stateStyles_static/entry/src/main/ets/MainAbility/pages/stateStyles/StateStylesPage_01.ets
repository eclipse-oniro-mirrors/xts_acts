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
import { RouterParams } from '../../common/Utils';
import router from '@ohos.router'
import {
  MenuItemGroup,MenuItemGroupOptions,ImageFit,FlowItem,TabContent,ListItemGroup,ListItem,SliderStyle,BadgeParamWithNumber,Blank,Entry,Component,$r,
  AlignRuleOption,Row,Button,Margin,IDataSource,DataChangeListener,SwiperController,Column,ColumnOptions,ClickEvent,RowOptions,LazyForEach,
  Text,FlexAlign,TextCase,TextDecorationType,Resource,VerticalAlign,HorizontalAlign,RelativeContainer,CommonMethod,applyStyles,Builder,
  Color,Scroller,Menu,ScrollBar,TextTimer,ColumnSplit,RowSplit,Refresh,Shape,Rect,Path,Polygon,Polyline,Line,Ellipse,
  Circle,WaterFlow,Tabs,Swiper,Stack,SideBarContainer,Scroll,List,GridRow,Grid,Flex,Counter,Badge,Toggle,TimePicker,TextPicker,TextInput,TextClock,TextArea,Slider,
  Search,Rating,QRCode,Progress,AlphabetIndexer,ImageAnimator,Image,Navigation,Marquee,LoadingProgress,Gauge,Divider,DatePicker,DataPanel,CheckboxGroup,Checkbox,
  Select,Radio,MenuItem,ProgressType,ToggleType,ForEach,GridRowDirection,BarState,SideBarContainerType,TextAlign,GridItem,BadgeStyle,BadgeParamWithString,
  GutterOption,BreakPoints,BreakpointsReference,GridCol,GridColOptions,GridColColumnOption,ColumnOptions,NavPathStack,
  MenuItemOptions,CheckboxGroupOptions,DataPanelOptions,DatePickerOptions,ProgressOptions,RadioOptions,SliderOptions
} from '@ohos.arkui.component';
import { MessageManager, Callback } from '../../common/MessageManager';
import { AppStorage, State,StoragePropRef } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

/**
 * Test page of common attribute:alignRules
 */
@Entry
@Component
struct StateStylesPage {
  @StoragePropRef("_isEnable") _isEnable: boolean = false
  @State targetView: string = ''
  @State componentKey: string = ''
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
    console.info('StateStylesPage show called ')
    AppStorage.setOrCreate<boolean>('_isEnable', false)
    try {
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
      this.targetView = routerParamOptions.view.targetView
      this.componentKey = routerParamOptions.view.componentKey
    } catch (error) {
      console.log(' routerParamOptions error ' + error);
    }
  }

  disabledStyles(instance: CommonMethod) {
    instance.zIndex(2)
  }
  normalStyles(instance: CommonMethod) {
    instance.zIndex(1)
  }

  commonStyle(instance: CommonMethod){
    instance.enabled(this._isEnable)
    instance.key(this.componentKey)
    instance.stateStyles({
      normal: this.normalStyles,
      disabled: this.disabledStyles
    })
  }

  build() {
    Row() {
      Stack() {
        if (this.targetView == 'Button') {
          Button('button1').applyStyles(this.commonStyle)
        } else if (this.targetView == 'Text') {
          Text('text1').applyStyles(this.commonStyle)
        }
        else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 }).applyStyles(this.commonStyle)
        }
        else if (this.targetView == 'Blank') {
          Row() {
            Blank().backgroundColor(Color.Yellow).applyStyles(this.commonStyle)
          }.width('100%').height('100%')
        } else if (this.targetView == 'Checkbox') {
          Checkbox().applyStyles(this.commonStyle)
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup({ group: 'checkboxGroup' } as CheckboxGroupOptions).applyStyles(this.commonStyle)
        } else if (this.targetView == 'DataPanel') {
          DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] } as DataPanelOptions)
            .applyStyles(this.commonStyle)
        } else if (this.targetView == 'DatePicker') {
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date('2100-1-1'),
          } as DatePickerOptions).applyStyles(this.commonStyle)
        } else if (this.targetView == 'Divider') {
          Divider().applyStyles(this.commonStyle)
        } else if (this.targetView == 'Gauge') {
          Gauge({ value: 105 })
            .applyStyles(this.commonStyle)
            .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).applyStyles(this.commonStyle)
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .images([
              {
                src: $r('app.media.icon')
              }
            ]).applyStyles(this.commonStyle)
        }
        else if (this.targetView == 'LoadingProgress') {
          LoadingProgress().applyStyles(this.commonStyle)
        } else if (this.targetView == 'Marquee') {
          Marquee({
            start: true,
            step: 50,
            loop: 10,
            fromStart: true,
            src: 'Running Marquee starts rolling'
          }).applyStyles(this.commonStyle)
        } else if (this.targetView == 'Navigation') {
          Navigation({}) {
            Text('Navigation')
          }.applyStyles(this.commonStyle)
          .backgroundColor(Color.Blue)
        }else if (this.targetView == 'Navigator') {
          Navigation({}).applyStyles(this.commonStyle)
        } else if (this.targetView == 'NavRouter') {
          Navigation(new NavPathStack()).applyStyles(this.commonStyle)
        } else if (this.targetView == 'Menu') {
          Menu() {
          }.backgroundColor(Color.Yellow).applyStyles(this.commonStyle)
        }  else if (this.targetView == 'Progress') {
          Progress({ value: 10, type: ProgressType.Eclipse } as ProgressOptions).applyStyles(this.commonStyle)
        } else if (this.targetView == 'QRCode') {
          QRCode('Running Marquee starts rolling').applyStyles(this.commonStyle)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' } as RadioOptions).applyStyles(this.commonStyle)
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5, indicator: false }).applyStyles(this.commonStyle)
        } else if (this.targetView == 'ScrollBar') {
          ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
            Text()
              .width(20)
              .height(100)
              .borderRadius(10)
              .backgroundColor('#C0C0C0')
          }.applyStyles(this.commonStyle)
        } else if (this.targetView == 'Search') {
          Search({ placeholder: 'Type to search...' })
            .backgroundColor(Color.White)
            .searchButton('SEARCH')
            .applyStyles(this.commonStyle)
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa', icon: '/common/public_icon.svg' },
            { value: 'bbb', icon: '/common/public_icon.svg' }])
            .applyStyles(this.commonStyle)
        } else if (this.targetView == 'Slider') {
          Slider({
            value: 50,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          } )
            .showTips(true)
            .applyStyles(this.commonStyle)
        } else if (this.targetView == 'TextArea') {
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...'
          }).applyStyles(this.commonStyle)
        } else if (this.targetView == 'TextClock') {
          TextClock({ timeZoneOffset: -8 })
            .format('hms')
            .applyStyles(this.commonStyle)
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
            selected: new Date('2022-07-22T08:00:00'),
          }).applyStyles(this.commonStyle)
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch, isOn: false }).applyStyles(this.commonStyle)
        } else if (this.targetView == 'Circle') {
          Circle().applyStyles(this.commonStyle)
        } else if (this.targetView == 'Ellipse') {
          Ellipse().applyStyles(this.commonStyle)
        } else if (this.targetView == 'Line') {
          Line()
            .applyStyles(this.commonStyle)
            .startPoint([0, 0])
            .endPoint([50, 100])
            .backgroundColor(Color.Black)
        } else if (this.targetView == 'Polyline') {
          Polyline().applyStyles(this.commonStyle)
        } else if (this.targetView == 'Polygon') {
          Polygon().applyStyles(this.commonStyle)
        } else if (this.targetView == 'Path') {
          Path().applyStyles(this.commonStyle)
        } else if (this.targetView == 'Rect') {
          Rect().applyStyles(this.commonStyle)
        } else if (this.targetView == 'Shape') {
          Shape() {
            Rect().width(100).height(50)
          }.applyStyles(this.commonStyle)
        } else if (this.targetView == 'Badge') {
          Badge({
            count: 50,
            style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
          } as BadgeParamWithNumber) {
            Button('message')
              .width(100)
              .height(50)
              .backgroundColor(0x317aff)
          }.applyStyles(this.commonStyle)
        } else if (this.targetView == 'Column') {
          Column() {
            Column()
              .width('100%')
              .height(30)
              .backgroundColor(0xAFEEEE)
          }.applyStyles(this.commonStyle)
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1')
              .width('100%')
              .height(50)
              .backgroundColor(0xF5DEB3)
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
              .backgroundColor(0xF5DEB3)
          }.applyStyles(this.commonStyle)
        } else if (this.targetView == 'GridRow') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green,
              Color.Pink, Color.Grey, Color.Blue, Color.Brown], (color: Color) => {
              GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption }  as GridColOptions) {
                Row()
                  .width('100%')
                  .height('20vp')
              }
              .borderColor(color)
              .borderWidth(2)
            })
          }.applyStyles(this.commonStyle)
        } else if (this.targetView == 'Grid') {
          Grid() {
            ForEach(['0', '1', '2', '3', '4'], (item: string) => {
              ForEach(['0', '1', '2', '3', '4'], (day: string) => {
                GridItem() {
                  Text(day)
                    .backgroundColor(Color.White)
                    .width('100%')
                    .height('100%')
                    .textAlign(TextAlign.Center)
                }
              })
            })
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .applyStyles(this.commonStyle)
          .backgroundColor(0xFAEEE0)
        } else if (this.targetView == 'GridItem') {
          Grid() {
            GridItem() {
              Text('4')
                .backgroundColor(0xFAEEE0)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
            .rowStart(1)
            .rowEnd(4)
            .applyStyles(this.commonStyle)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'List') {
          List() {
          }.applyStyles(this.commonStyle)
        } else if (this.targetView == 'ListItem') {
          List({ space: 0, initialIndex: 0 }) {
            ListItem() {
              Text('ListItem')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.applyStyles(this.commonStyle)
          }
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup()
              .backgroundColor(Color.Yellow)
              .applyStyles(this.commonStyle)
          }.backgroundColor(Color.Pink)
          .width('100%')
          .height('100%')
        }  else if (this.targetView == 'Panel') {
          Column(){
            Text('Text')
          }
          .backgroundColor(Color.Yellow)
          .applyStyles(this.commonStyle)
          .bindSheet(true,this.myBuilder)
        } else if (this.targetView == 'Refresh') {
          Refresh({ refreshing: true }) {
            Text('123')
          }.applyStyles(this.commonStyle)
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
              .id('responseRegion')
          }.applyStyles(this.commonStyle)
        } else if (this.targetView == 'Row') {
          Row() {
            Text('Text')
          }.backgroundColor(Color.Orange).applyStyles(this.commonStyle)
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('Text')
          }.applyStyles(this.commonStyle)
        } else if (this.targetView == 'Scroll') {
          Scroll() {
            Column() {
              ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: Int) => {
                Text('Scroll' + item+'')
                  .width('90%')
                  .height(50)
                  .backgroundColor(Color.White)
                  .textAlign(TextAlign.Center)
              }, (item: Int) => item+'')
            }.width('100%')
          }.scrollBar(BarState.On).applyStyles(this.commonStyle)
        } else if (this.targetView == 'SideBarContainer') {
          SideBarContainer(SideBarContainerType.Embed) {
            Column() {
              Column({ space: 5 } as ColumnOptions) {
                Text('Index0')
                  .fontSize(25)
              }
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceEvenly)
            .backgroundColor(Color.Green)

            Column() {
              Text('SideBarContainer content')
                .fontSize(25)
            }.backgroundColor(Color.Orange)
          }.applyStyles(this.commonStyle)
        } else if (this.targetView == 'Stack') {
          Stack() {
            Text('Stack')
          }
          .backgroundColor(Color.White)
          .applyStyles(this.commonStyle)
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            Text('Swiper')
              .width('100%')
              .height('100%')
          }.indicator(true)
          .backgroundColor(Color.White)
          .applyStyles(this.commonStyle)
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Column()
                .width('100%')
                .height('100%')
                .backgroundColor('#00CB87')
            }
          }.applyStyles(this.commonStyle)
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test')
                .width('100%')
                .height('100%')
                .backgroundColor(Color.White)
            }
            .tabBar('Tabs1')
            .applyStyles(this.commonStyle)
            .backgroundColor(Color.Yellow)
          }.backgroundColor(Color.Red)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'WaterFlow') {
          WaterFlow() {
            FlowItem() {
              Column() {
                Text('WaterFlow')
                  .fontSize(12)
                  .height('16')
                Image($r('app.media.icon'))
                  .width(50)
                  .height(50)
                  .objectFit(ImageFit.Fill)
              }
            }
          }.applyStyles(this.commonStyle)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row()
                .width('100%')
                .height('20vp')
            }
            .applyStyles(this.commonStyle)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Red)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'FlowItem') {
          WaterFlow() {
            FlowItem() {
              Column() {
                Text('WaterFlow')
                  .fontSize(12)
                  .height('16')
                Image($r('app.media.icon'))
                  .width(50)
                  .height(50)
                  .objectFit(ImageFit.Fill)
              }
            }
            .applyStyles(this.commonStyle)
            .backgroundColor(Color.Yellow)
          }
          .backgroundColor(Color.Red)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItem') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              .applyStyles(this.commonStyle)
          }.backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        } else if (this.targetView == 'MenuItemGroup') {
          Menu() {
            MenuItemGroup({ header: 'MenuItemGroup' } as MenuItemGroupOptions) {
            }.applyStyles(this.commonStyle)
          }.backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        }
      }
      .backgroundColor(Color.Pink)
      .width('100%')
      .width('100%')
    }.backgroundColor(Color.Yellow)
  }
}