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

import { ListItemGroupView } from '../view/position/ListItemGroupView';
import { FlowItemView } from '../view/position/FlowItemView';
import { NavRouterView } from '../view/position/NavRouterView';
import { WaterFlowView } from '../view/position/WaterFlowView';
import { TabsView } from '../view/position/TabsView';
import { AlphabetIndexerView } from '../view/position/AlphabetIndexerView';
import { NavigationView } from '../view/position/NavigationView';
import { attrsManager } from '../../common/AttrsManager';
import { RouterParams } from '../../common/Utils';
import router from '@ohos.router'
import {
  Entry,Component,LineJoinStyle,$r,AlignRuleOption,Row,Button,Margin,IDataSource,DataChangeListener,SwiperController,Column,ColumnOptions,ClickEvent,
  RowOptions,LazyForEach,Text,FlexAlign,TextCase,TextDecorationType,Resource,VerticalAlign,HorizontalAlign,RelativeContainer,Color,Scroller,
  Menu,ScrollBar,TextTimer,ColumnSplit,RowSplit,Refresh,Shape,Rect,Path,Polygon,Polyline,Line,Ellipse,Circle,
  WaterFlow,Tabs,Swiper,Stack,SideBarContainer,Scroll,List,GridRow,Grid,Flex,Counter,Badge,Toggle,TimePicker,TextPicker,TextInput,TextClock,TextArea,
  Slider,Search,Rating,QRCode,Progress,AlphabetIndexer,ImageAnimator,Image,Navigation,Marquee,LoadingProgress,Gauge,Divider,DatePicker,DataPanel,CheckboxGroup,Checkbox,
  Select,Radio,MenuItem,ProgressType,ToggleType,ForEach,GridRowDirection,BarState,SideBarContainerType,TextAlign,GridItem,BadgeStyle,BadgeParamWithString,GutterOption,BreakPoints,BreakpointsReference,
  GridCol,GridColOptions,GridColColumnOption,ColumnOptions,MenuItemOptions,Position,TabContent,Axis,ListItem,FlowItem,FlexDirection,MenuItemGroup,Blank,DataPanelType,SliderStyle,
  RectOptions,CommonMethod,applyStyles,Builder
} from '@ohos.arkui.component';
import { MessageManager, Callback } from '../../common/MessageManager';
import { AppStorage, State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { SetValue, TestValue } from '../../common/Utils';
interface ViewOption {
targetView: string
componentKey: string
parentWidth: number
parentHeight: number
parentComponentKey: string
referenceComponentKey: string
}
interface RouterParamOptions {
  view: ViewOption
}
/**
 * Test page of common attribute: position
 */
@Entry
@Component
struct PositionPage {
  @StoragePropRef('_position') _position: Position = { x: 0, y: 0 } as Position;
  @State targetView: string = ''
  @State componentKey: string = ''
  @State parentWidth: number = 0
  @State parentHeight: number = 0
  @State parentComponentKey: string =  ''
  @State referenceComponentKey: string = ''
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
    console.info('[PositionPage] page show called ')

    //Register data change call back.
    // attrsManager.registerDataChange((value: SetValue) => {
    //   this._position = value
    // })
    try {
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
      AppStorage.setOrCreate<Position>('_position', (routerParamOptions.view.testValue as TestValue).setValue as Position)
      this._position =  (routerParamOptions.view.testValue as TestValue).setValue as Position
      this.targetView = routerParamOptions.view.targetView
      this.componentKey = routerParamOptions.view.componentKey
      this.parentWidth = routerParamOptions.view.parentWidth
      this.parentHeight = routerParamOptions.view.parentHeight
      this.parentComponentKey = routerParamOptions.view.parentComponentKey
      this.referenceComponentKey = routerParamOptions.view.referenceComponentKey
      console.log('+++++++this.parentComponentKey',this.parentComponentKey)

    } catch (error) {
      console.log(' routerParamOptions error ' + error);
    }
  }
  aboutToAppear(){

  }
  /**
   * Set common style.
   */
  commonStyle(instance: CommonMethod) {
      instance.position(this._position)
      instance.key(this.componentKey)
  }
  build() {
    Row() {
      Column() {
        //Create view by config.
        if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions).applyStyles(this.commonStyle)
              MenuItem({ startIcon: $r('app.media.icon'), content: 'referenceComponent' } as MenuItemOptions)
                .key(this.referenceComponentKey)
            }
            .backgroundColor(Color.Yellow)
            .width(this.parentWidth)
            .height(this.parentHeight)
            .key(this.parentComponentKey)
            .padding(0)
          }.width('100%').height('100%').backgroundColor(Color.Green)
        } else if (this.targetView == 'MenuItemGroup') {
          Row() {
            Menu() {
              MenuItemGroup({ header: 'MenuItemGroup' }) {
                MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              }.applyStyles(this.commonStyle)

              MenuItem({ startIcon: $r('app.media.icon'), content: 'referenceComponent' } as MenuItemOptions)
                .key(this.referenceComponentKey)
            }
            .backgroundColor(Color.Yellow)
            .width(this.parentWidth)
            .height(this.parentHeight)
            .key(this.parentComponentKey)
            .padding(0)
          }
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Green)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.applyStyles(this.commonStyle)

            ListItem() {
              Text('referenceComponent')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.key(this.referenceComponentKey)
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
          .listDirection(Axis.Vertical)
        } else if (this.targetView == 'ListItemGroup') {
          ListItemGroupView({
            _position: this._position as Position,
            componentKey: this.componentKey,
            parentWidth: this.parentWidth,
            parentHeight: this.parentHeight,
            parentComponentKey: this.parentComponentKey,
            referenceComponentKey: this.referenceComponentKey
          })
        } else if (this.targetView == 'TabContent') {
          console.log('+++++++this.referenceComponentKey',this.referenceComponentKey)
          Tabs() {
            TabContent() {
              Text('TabContent Test')
                .width('100%')
                .height('100%')
                .backgroundColor(Color.White)
            }
            .tabBar('Tabs1')
            .applyStyles(this.commonStyle)

            TabContent() {
              Text('referenceComponent')
                .width('100%')
                .height('100%')
                .backgroundColor(Color.Orange)
            }
            .tabBar('Tabs2')
            .key(this.referenceComponentKey)
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
        } else if (this.targetView == 'ColumnSplit') {
          Column() {
            Text('The secant line can be dragged').fontSize(9)
              .fontColor(0xCCCCCC)
              .width('90%')
              .key(this.referenceComponentKey)
            ColumnSplit() {
              Text('1')
                .width('100%')
                .height(50)
                .backgroundColor('0xF5DEB3')
                .textAlign(TextAlign.Center)
            }
            .applyStyles(this.commonStyle)
            .borderWidth(1)
            .width('90%').height('60%')
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
        } else if (this.targetView == 'RowSplit') {
          Column() {
            Text('The second line can be dragged').fontSize(9)
              .fontColor(0xCCCCCC)
              .width('90%')
              .key(this.referenceComponentKey)
            RowSplit() {
              Text('1')
                .width('10%')
                .height(100)
                .backgroundColor('0xF5DEB3')
                .textAlign(TextAlign.Center)
              Text('2')
                .width('10%')
                .height(100)
                .backgroundColor('0xD2B48C')
                .textAlign(TextAlign.Center)
              Text('3')
                .width('10%')
                .height(100)
                .backgroundColor('0xF5DEB3')
                .textAlign(TextAlign.Center)
              Text('4')
                .width('10%')
                .height(100)
                .backgroundColor('0xD2B48C')
                .textAlign(TextAlign.Center)
              Text('5')
                .width('10%')
                .height(100)
                .backgroundColor('0xF5DEB3')
                .textAlign(TextAlign.Center)
            }
            .width('90%')
            .height(100)
            .applyStyles(this.commonStyle)
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 5,
            gutter: { x: 5, y: 10 } as GutterOption,
            breakpoints: { value: ['400vp', '600vp', '800vp'], reference: BreakpointsReference.WindowSize } as BreakPoints,
            direction: GridRowDirection.Row
          }) {
            GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption } ) {
              Row()
                .width('100%')
                .height('20vp')
            }
            .borderColor(Color.Green)
            .borderWidth(2)
            .applyStyles(this.commonStyle)

            GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption }) {
              Row()
                .width('100%')
                .height('20vp')
            }
            .borderColor(Color.Yellow)
            .borderWidth(2)
            .key(this.referenceComponentKey)
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
        } else if (this.targetView == 'GridItem') {
          Grid() {
            GridItem() {
              Text('GridItem1').backgroundColor(Color.White)
                .width('100%').height('100%').textAlign(TextAlign.Center)
            }.applyStyles(this.commonStyle)

            GridItem() {
              Text('GridItem2').backgroundColor(Color.White)
                .width('100%').height('100%').textAlign(TextAlign.Center)
            }.key(this.referenceComponentKey)
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .backgroundColor(Color.Black)
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
          .padding(0)
        } else if (this.targetView == 'FlowItem') {
          FlowItemView({
            _position: this._position as Position,
            componentKey: this.componentKey,
            parentWidth: this.parentWidth,
            parentHeight: this.parentHeight,
            parentComponentKey: this.parentComponentKey,
            referenceComponentKey: this.referenceComponentKey
          })
        } else {
          Row() {
            //Set view by page config.
            if (this.targetView == 'AlphabetIndexer') {
              console.info('wj----------position',this._position)
              AlphabetIndexerView({ _position: this._position as Position, componentKey: this.componentKey })
            } else if (this.targetView == 'Blank') {
              Blank().backgroundColor(Color.Orange).applyStyles(this.commonStyle)
            } else if (this.targetView == 'Button') {
              Button('button1').applyStyles(this.commonStyle)
            } else if (this.targetView == 'Checkbox') {
              Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
                .applyStyles(this.commonStyle)
                .margin(0)
            } else if (this.targetView == 'CheckboxGroup') {
              CheckboxGroup({ group: 'checkboxGroup' })
                .applyStyles(this.commonStyle)
                .margin(0)
            } else if (this.targetView == 'DataPanel') {
              DataPanel({ values: [25], max: 100, type: DataPanelType.Circle })
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'DatePicker') {
              DatePicker({
                start: new Date('1970-1-1'),
                end: new Date('2100-1-1'),
                selected: new Date()
              }).applyStyles(this.commonStyle)
            } else if (this.targetView == 'Divider') {
              Divider()
                .strokeWidth(8)
                .vertical(true)
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Gauge') {
              console.log('wj----------------------',this.targetView);
              Gauge({ value: 75 })
                .applyStyles(this.commonStyle)
                .colors([[Color.White, 1], [Color.Black, 1]]) //加上这个属性 导致空指针

            } else if (this.targetView == 'Image') {
              Image($r('app.media.icon')).applyStyles(this.commonStyle)
            } else if (this.targetView == 'ImageAnimator') {
              ImageAnimator().images([{ src: $r('app.media.icon') }])
                .width('100%')
                .height('100%')
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'LoadingProgress') {
              LoadingProgress().color(Color.Blue).applyStyles(this.commonStyle)
            } else if (this.targetView == 'Marquee') {
              Marquee({ start: true, step: 50, src: 'Running Marquee starts rolling' })
                .fontWeight(700).fontColor(Color.White).fontSize(48).applyStyles(this.commonStyle)
            } else if (this.targetView == 'Menu') {
              Menu() {
                MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
              }.backgroundColor(Color.Yellow).applyStyles(this.commonStyle)
            } else if (this.targetView == 'Navigation') {
              NavigationView({ _position: this._position as Position, componentKey: this.componentKey })
            } else if (this.targetView == 'NavRouter') {
              NavRouterView({ _position: this._position as Position, componentKey: this.componentKey })
            } else if (this.targetView == 'Progress') {
              Progress({ value: 50, type: ProgressType.Linear }).applyStyles(this.commonStyle)
            } else if (this.targetView == 'QRCode') {
              QRCode('QRCode')
                .color(0xF7CE00)
                .width(200)
                .height(200)
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Radio') {
              Radio({ value: 'Radio1', group: 'radioGroup' })
                .applyStyles(this.commonStyle)
                .margin(0)
            } else if (this.targetView == 'Rating') {
              Rating({ rating: 4 })
                .stars(5)
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'ScrollBar') {
              ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
                Text()
                  .width(20)
                  .height(100)
                  .borderRadius(10)
                  .backgroundColor('#C0C0C0')
              }
              .width(20)
              .backgroundColor('#ededed')
              .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Search') {
              Search({ placeholder: 'Type to search...' })
                .backgroundColor(Color.White)
                .searchButton('SEARCH')
                .applyStyles(this.commonStyle)
                .margin(0)
            } else if (this.targetView == 'Select') {
              Select([{ value: 'aaa', icon: '/common/public_icon.svg' },
                { value: 'bbb', icon: '/common/public_icon.svg' }]).applyStyles(this.commonStyle)
            } else if (this.targetView == 'Slider') {
              Slider({ value: 50, style: SliderStyle.OutSet, direction: Axis.Vertical })
                .blockColor('#191970')
                .trackColor('#ADD8E6')
                .selectedColor('#4169E1')
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Text') {
              Text('text')
                .fontColor(Color.White)
                .fontSize(30)
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'TextArea') {
              TextArea({ placeholder: 'TextArea', })
                .backgroundColor(Color.White)
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'TextClock') {
              TextClock({ timeZoneOffset: -8 })
                .format('hms')
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'TextInput') {
              TextInput({ placeholder: 'TextInput' })
                .backgroundColor(Color.White)
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'TextPicker') {
              TextPicker({ range: ['apple1', 'orange2', 'peach3'], selected: 1 }).applyStyles(this.commonStyle)
            } else if (this.targetView == 'TextTimer') {
              TextTimer({ count: 30000 }).applyStyles(this.commonStyle)
            } else if (this.targetView == 'TimePicker') {
              TimePicker().applyStyles(this.commonStyle)
            } else if (this.targetView == 'Toggle') {
              Toggle({ type: ToggleType.Switch }).applyStyles(this.commonStyle).margin(0)
            } else if (this.targetView == 'Badge') {
              Badge({
                value: '',
                style: { badgeSize: 6, badgeColor: Color.Red }
              } as BadgeParamWithString) {
                Button('BadgeContent')
              }.applyStyles(this.commonStyle)
            } else if (this.targetView == 'Column') {
              Column()
                .height('50%')
                .width('50%')
                .backgroundColor(Color.Green)
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Counter') {
              Counter() {
                Text('1')
              }.applyStyles(this.commonStyle)
            } else if (this.targetView == 'Flex') {
              Flex()
                .height('50%')
                .width('50%')
                .backgroundColor(Color.Green)
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'GridRow') {
              GridRow({
                columns: 5,
                gutter: { x: 5, y: 10 } as GutterOption,
                breakpoints: { value: ['400vp', '600vp', '800vp'], reference: BreakpointsReference.WindowSize } as BreakPoints,
                direction: GridRowDirection.Row
              }) {
                ForEach(new Array<Color>(Color.Red, Color.Orange, Color.Yellow, Color.Green,
                  Color.Pink, Color.Grey, Color.Blue, Color.Brown), (color: Color) => {
                  GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption }) {
                    Row()
                      .width('100%')
                      .height('20vp')
                  }.borderColor(color).borderWidth(2)
                })
              }
              .width('100%')
              .height('100%')
              .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Grid') {
              Grid() {
                ForEach(new Array<string>('0', '1', '2', '3', '4'), (day:string, index:int):void => {
                  ForEach(new Array<string>('0', '1', '2', '3', '4'), (item:string, index:int):void => {
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
            } else if (this.targetView == 'List') {
              List({ space: 20, initialIndex: 0 }) {
                ForEach(new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), (item:number, index:int):void => {
                  ListItem() {
                    Text('' + item)
                      .width('100%')
                      .textAlign(TextAlign.Center)
                      .backgroundColor(Color.White)
                  }
                }, (item: number, index:int):string => String(item))
              }
              .width('100%')
              .height('100%')
              .listDirection(Axis.Vertical)
              .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Navigator') {
              // Navigator({ target: 'MainAbility/pages/index/Index' }) {
              //   Text('Navigator Go to index page')
              //     .width('100%').textAlign(TextAlign.Center)
              // }.applyStyles(this.commonStyle)
            }else if (this.targetView == 'RelativeContainer') {
              RelativeContainer() {
                Row()
                  .width(100)
                  .height(100)
                  .backgroundColor('#FF3333')
                  .alignRules({
                    top: { anchor: '__container__', align: VerticalAlign.Top },
                    left: { anchor: '__container__', align: HorizontalAlign.Start }
                  } as AlignRuleOption)
                  .id('PositionPageRow')
              }
              .height('50%')
              .width('50%')
              .backgroundColor(Color.Green)
              .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Row') {
              Row()
                .height('50%')
                .width('50%')
                .backgroundColor(Color.Green)
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Panel') {
              console.log('---------------------------------',this.targetView);
              Column(){
                Text('Panel')
              }.height('100%').width('100%')
              .bindSheet(true,this.myBuilder)  //10.13sdk已解决
              .applyStyles(this.commonStyle)

            } else if (this.targetView == 'Refresh') {
              Refresh({ refreshing: true }) {
                Text('Refresh').fontSize(30)
              }
              .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Scroll') {
              Scroll() {
                Column() {
                  ForEach(new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), (item: number, index:int):void => {
                    Text('Scroll' + item.toString())
                      .width('90%')
                      .height(150)
                      .backgroundColor(Color.White)
                      .textAlign(TextAlign.Center)
                  }, (item: number, index:int):string => String(item))
                }.width('100%')
              }
              .scrollBar(BarState.On)
              .applyStyles(this.commonStyle)
            } else if (this.targetView == 'SideBarContainer') {
              SideBarContainer(SideBarContainerType.Embed) {
                Column() {
                  ForEach(new Array<number>(1, 2, 3), (item: number, index:int):void => {
                    Column({ space: 5 } as ColumnOptions) {
                      Image($r('app.media.icon'))
                        .width(64)
                        .height(64)
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
              Stack() {
                Text('Stack').fontColor(Color.White)
              }
              .backgroundColor(Color.Orange)
              .width('50%')
              .height('50%')
              .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Swiper') {
              Swiper() {
                ForEach(new Array<number>(1, 2, 3), (item: number, index:int):void => {
                  Text('Swiper' + item)
                    .width('90%')
                    .height(160)
                }, (item: number, index:int):string => String(item))
              }
              .indicator(true)
              .backgroundColor(Color.White)
              .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Tabs') {
              TabsView({ _position: this._position as Position, componentKey: this.componentKey })
            } else if (this.targetView == 'WaterFlow') {
              WaterFlowView({ _position: this._position as Position, componentKey: this.componentKey })
            } else if (this.targetView == 'Circle') {
              Circle({ width: 150, height: 150 }).applyStyles(this.commonStyle)
            } else if (this.targetView == 'Ellipse') {
              Ellipse({ width: 150, height: 80 }).applyStyles(this.commonStyle)
            } else if (this.targetView == 'Line') {
              Line()
                .width(200)
                .height(150)
                .startPoint([0, 0])
                .endPoint([50, 100])
                .stroke(Color.Black)
                .backgroundColor('#F5F5F5')
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Polyline') {
              Polyline({ width: 100, height: 100 })
                .points([[0, 0], [20, 60], [100, 100]])
                .fillOpacity(0)
                .stroke(Color.Blue)
                .strokeWidth(3)
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Polygon') {
              Polygon()
                .points([[50, 0], [0, 50], [20, 100], [80, 100], [100, 50]])
                .width(100)
                .height(100)
                .fill(Color.Red)
                .fillOpacity(0.6)
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Path') {
              Path()
                .width('210px')
                .height('310px')
                .commands('M0 100 A30 20 20 0 0 200 100 Z')
                .fillOpacity(0)
                .stroke(Color.Black)
                .strokeWidth(3)
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Rect') {
              Rect({ width: '90%', height: 80 } as RectOptions)
                .radius(20)
                .fill(Color.Pink)
                .stroke(Color.Transparent)
                .applyStyles(this.commonStyle)
            } else if (this.targetView == 'Shape') {
              console.info('wj----------position',this._position)
              Shape() {
                Path().width(200).height(60).commands('M0 0 L400 0 L400 150 Z')
              }
              .width(300)
              .height(200)
              .viewPort({ x: -20, y: -5, width: 310, height: 90 })
              .fill(0x317AF7)
              .stroke(0xEE8443)
              .strokeWidth(10)
              .strokeLineJoin(LineJoinStyle.Miter)
              .strokeMiterLimit(5)
              .applyStyles(this.commonStyle)
            }

            Button('ReferenceComponent').key(this.referenceComponentKey)
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
          .backgroundColor(Color.Gray)
        }
      }
      .width('100%')
      .height('90%')
      .backgroundColor(Color.Pink)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Yellow)
  }
}