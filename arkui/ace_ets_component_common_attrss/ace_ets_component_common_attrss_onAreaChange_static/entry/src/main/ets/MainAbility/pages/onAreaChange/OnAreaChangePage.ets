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

import router from '@ohos.router'
import { State,StoragePropRef } from '@ohos.arkui.stateManagement';
import { RouterParams, SetValue } from '../../common/Utils';
import { Entry, Component, ItemAlign, Position, Builder, AlphabetIndexer, Button, Checkbox,CommonMethod,applyStyles,
  CheckboxGroup, DataPanel, DatePicker, Divider, Gauge, Image, ImageAnimator, LoadingProgress, Marquee, Menu,
  Navigation, Progress, QRCode, Radio, Rating, ScrollBar, Scroller, Search, Select, Slider,
  Text, TextArea, TextClock, TextInput, TextPicker, TextTimer, TimePicker, Toggle, Badge, Column, Counter, Flex,
  GridRow, Grid, List, RelativeContainer, Row, Refresh, Scroll, SideBarContainer, Stack, Swiper,
  Tabs, WaterFlow, Circle, Ellipse, Line, Polyline, Polygon, Path, Rect, Shape, ColumnSplit, RowSplit, Blank,
  DataPanelType, Color, $r, MenuItem, ProgressType, BarState, SliderStyle, Axis, ToggleType,
  GridRowDirection, GridCol, GridItem, ListItem, SideBarContainerType, FlexDirection, BadgeStyle,LinearGradient,
  BadgeParamWithString, TextAlign, FlexAlign, TabContent, FlowItem, ColumnOptions, PolylineOptions,Area,
  RectOptions, GridColColumnOption, FlexWrap, GutterOption, NavPathStack, BreakPoints, ForEach,NavDestination,AlignRuleOption,
  ImageFit, BreakpointsReference, TextTimerController, MenuItemOptions, MenuItemGroup, ListItemGroup, PatternLock,
  RichText, VerticalAlign, HorizontalAlign } from '@ohos.arkui.component'
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';
@Entry
@Component
struct OnAreaChangePage {
  @State _width: number = 30;
  @State _height: number = 30;
  @State _compareButtonWidth: number = 30;
  @State _compareButtonHeight: number = 30;
  @State sizeOldValue: string = '';
  @State sizeNewValue: string = '';
  @State _offset: Position = { x: 0, y: 0 } as Position;
  @State parentMargin: number = 0
  @State parentWidth: number =  0
  @State parentHeight: number =  0
  @State parentKey: string = ''
  @State targetView: string = ''
  @State targetGroupView: string = ''
  @State componentKey: string = ''
  @State compareButtonKey: string = ''
  @State compareOldTextKey: string = ''
  @State compareNewTextKey: string = ''
  textTimerController: TextTimerController = new TextTimerController() //Use by TextTimer
  private scroller: Scroller = new Scroller()
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G']; //Use by AlphabetIndexer TextPicker
  private src: string = 'Running Marquee starts rolling A B C D E F G H I J'; //Use by Marquee QRCode
  @State isShow: boolean = false
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
    console.info('OnAreaChangePage show called')
    try {
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
      console.log('routerParamOptions',JSON.stringify(routerParamOptions))
      this.parentMargin = routerParamOptions.view.parentMargin
      this.parentWidth = routerParamOptions.view.parentWidth
      this.parentHeight = routerParamOptions.view.parentHeight
      this.parentKey = routerParamOptions.view.parentKey
      this.targetView = routerParamOptions.view.targetView
      this.targetGroupView = routerParamOptions.view.targetGroupView
      this.componentKey = routerParamOptions.view.componentKey
      this.compareButtonKey = routerParamOptions.view.compareButtonKey
      this.compareOldTextKey = routerParamOptions.view.compareOldTextKey
      this.compareNewTextKey = routerParamOptions.view.compareNewTextKey
    } catch (error: Error) {
      console.log(' routerParamOptions error ' + error);
    }
    let stateChangeEvent3: events_emitter.InnerEvent = {
      eventId: 99,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent3, this.stateChangCallBack)
  }

  private stateChangCallBack:(eventData: events_emitter.EventData) => void = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      const data = eventData.data as Record<String,RecordData>
      console.info("swiper page state change called:" + JSON.stringify(eventData));
      if (data['_width'] != null && data['_height'] != null) {
        this._width = data['_width'] as number;
        this._height = data['_height'] as number;
      }
      if (data['_compareButtonWidth'] != null && data['_compareButtonHeight'] != null) {
        this._compareButtonWidth = data['_compareButtonWidth'] as number;
        this._compareButtonHeight = data['_compareButtonHeight'] as number;
      }

      if (data['_offset'] != null) {
        this._offset = data['_offset'] as Position;
      }
      this.sizeOldValue = ''
      this.sizeNewValue = ''
    }
  }

  /*
   * Set common style.
   */
  commonStyle(instance: CommonMethod) {
    instance.width(this._width)
    instance.height(this._height)
    instance.offset(this._offset)
    instance.key(this.componentKey)
    instance.onAreaChange((oldValue: Area, newValue: Area) => {
      this.sizeOldValue = JSON.stringify(oldValue)
      this.sizeNewValue = JSON.stringify(newValue)
    })
  }
  //Draw screen
  build() {
    Column() {
      if (this.targetView == 'MenuItem') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
            .width(this._compareButtonWidth)
            .height(this._compareButtonHeight)
            .key(this.compareButtonKey)
          MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions).backgroundColor(Color.Pink).applyStyles(this.commonStyle)
        }
        .width(this.parentWidth)
        .height(this.parentHeight)
        .backgroundColor(Color.Green)
        .margin(this.parentMargin)
        .padding(0)
        .key(this.parentKey)
      } else if (this.targetView == 'MenuItemGroup') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
            .width(this._compareButtonWidth)
            .height(this._compareButtonHeight)
            .key(this.compareButtonKey)

          MenuItemGroup() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
          }.applyStyles(this.commonStyle).backgroundColor(Color.Pink)
        }
        .width(this.parentWidth)
        .height(this.parentHeight)
        .backgroundColor(Color.Green)
        .margin(this.parentMargin)
        .padding(0)
        .key(this.parentKey)
      } else if (this.targetView == 'NavDestination') {
        NavDestination(){
            Button('Button')
              .width(this._compareButtonWidth)
              .height(this._compareButtonHeight)
              .key(this.compareButtonKey)

        }.backgroundColor(Color.Pink).applyStyles(this.commonStyle)
        .width(this.parentWidth)
        .height(this.parentHeight)
        .backgroundColor(Color.Green)
        .margin(this.parentMargin)
        .key(this.parentKey)
      } else if (this.targetView == 'Navigator') {
        Navigation({}).applyStyles(this.commonStyle)
      } else if (this.targetView == 'NavRouter') {
        Navigation({}).applyStyles(this.commonStyle)
      } else if (this.targetView == 'FlowItem') {
        Button('Button')
          .width(this._compareButtonWidth)
          .height(this._compareButtonHeight)
          .key(this.compareButtonKey)
        WaterFlow() {
          FlowItem()
            .backgroundColor(Color.Pink)
            .applyStyles(this.commonStyle)
        }
        .width(this.parentWidth)
        .height(this.parentHeight)
        .backgroundColor(Color.Green)
        .margin(this.parentMargin)
        .key(this.parentKey)
      } else if (this.targetView == 'GridCol') {
        Button('Button')
          .width(this._compareButtonWidth)
          .height(this._compareButtonHeight)
          .key(this.compareButtonKey)
        GridRow() {
          GridCol() {
            Text('GridCol')
          }
          .backgroundColor(Color.Pink)
          .applyStyles(this.commonStyle)
        }
        .width(this.parentWidth)
        .height(this.parentHeight)
        .backgroundColor(Color.Green)
        .margin(this.parentMargin)
        .key(this.parentKey)
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem()
            .width(this._compareButtonWidth)
            .height(this._compareButtonHeight)
            .key(this.compareButtonKey)
          GridItem()
            .backgroundColor(Color.Pink)
            .applyStyles(this.commonStyle)
        }
        .width(this.parentWidth)
        .height(this.parentHeight)
        .backgroundColor(Color.Green)
        .margin(this.parentMargin)
        .key(this.parentKey)
      } else if (this.targetView == 'ListItem') {
        List() {
          ListItem() {
            Button('ListItem')
          }
          .width(this._compareButtonWidth)
          .height(this._compareButtonHeight)
          .key(this.compareButtonKey)

          ListItem() {
            Button('ListItem')
          }
          .backgroundColor(Color.Pink)
          .applyStyles(this.commonStyle)
        }
        .width(this.parentWidth)
        .height(this.parentHeight)
        .backgroundColor(Color.Green)
        .margin(this.parentMargin)
        .key(this.parentKey)
      } else if (this.targetView == 'ListItemGroup') {
        List() {
          ListItem() {
            Text('ListItem')
          }
          .width(this._compareButtonWidth)
          .height(this._compareButtonHeight)
          .key(this.compareButtonKey)

          ListItemGroup() {
            ListItem() {
              Text('ListItemGroup')
            }
          }
          .backgroundColor(Color.Pink)
          .applyStyles(this.commonStyle)
        }
        .listDirection(Axis.Horizontal)
        .width(this.parentWidth)
        .height(this.parentHeight)
        .backgroundColor(Color.Green)
        .margin(this.parentMargin)
        .key(this.parentKey)
      } else if (this.targetView == 'TabContent') {
        Button('Button')
          .width(this._compareButtonWidth)
          .height(this._compareButtonHeight)
          .key(this.compareButtonKey)
        Tabs() {
          TabContent() {
            Text('TabContent Test')
          }
          .backgroundColor(Color.Pink)
          .applyStyles(this.commonStyle)
        }
        .width(this._width)
        .height(this._height)
        .backgroundColor(Color.Green)
        .margin(this.parentMargin)
        .key(this.parentKey)
      } else {
        Column() {
          Button('Button')
            .width(this._compareButtonWidth)
            .height(this._compareButtonHeight)
            .key(this.compareButtonKey)
          if (this.targetView == 'AlphabetIndexer') {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Blank') {
            Blank()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Button') {
            Button('button').applyStyles(this.commonStyle)
          } else if (this.targetView == 'Checkbox') {
            Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'CheckboxGroup') {
            CheckboxGroup({ group: 'checkboxGroup' })
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'DataPanel') {
            DataPanel({ values: [25] })
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'DatePicker') {
            DatePicker()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Divider') {
            Divider()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Gauge') {
            Gauge({ value: 75 })
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Image') {
            Image($r('app.media.icon'))
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'ImageAnimator') {
            ImageAnimator()
              .images([{ src: $r('app.media.icon') }])
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'LoadingProgress') {
            LoadingProgress()
              .color(Color.Blue)
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Marquee') {
            Marquee({
              start: true,
              src: this.src
            })
              .fontSize(15)
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Menu') {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
            }.backgroundColor(Color.Pink).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Navigation') {
            Navigation(new NavPathStack())
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'PatternLock') {
            PatternLock()
              .sideLength(this._width)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Progress') {
            Progress({ value: 20 })
              .border({ width: 2 })
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'QRCode') {
            QRCode(this.src)
              .border({ width: 2 })
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Radio') {
            Radio({ value: 'Radio1', group: 'radioGroup' })
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Rating') {
            Rating()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'RichText') {
            RichText('RichText').backgroundColor(Color.Pink).applyStyles(this.commonStyle)
          } else if (this.targetView == 'ScrollBar') {
            ScrollBar({ scroller: this.scroller, state: BarState.On }) {
              Text('text')
            }
            .backgroundColor(Color.Pink)
            .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Search') {
            Search()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Select') {
            Select([{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }])
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Slider') {
            Slider()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Text') {
            Text('text')
              .fontSize(15)
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'TextArea') {
            TextArea()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'TextClock') {
            TextClock()
              .fontSize(15)
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'TextInput') {
            TextInput()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'TextPicker') {
            TextPicker({ range: this.value })
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'TextTimer') {
            TextTimer({ controller: this.textTimerController })
              .fontSize(15)
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'TimePicker') {
            TimePicker()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Toggle') {
            Toggle({ type: ToggleType.Switch })
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Badge') {
            Badge({
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red } as BadgeStyle,
              value: 'undefined'
            } as BadgeParamWithString) {
              Button('message').backgroundColor(0x317aff)
            }
            .backgroundColor(Color.Pink)
            .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Column') {
            Column()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'ColumnSplit') {
            ColumnSplit() {
              Text('1').backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
              Text('2').backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
            }
            .backgroundColor(Color.Pink)
            .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Flex') {
            Flex()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'GridRow') {
            GridRow() {
              GridCol() {
                Text('GridCol')
              }
            }
            .backgroundColor(Color.Pink)
            .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Grid') {
            Grid() {
              GridItem() {
                Text('Grid').backgroundColor(Color.White)
              }
            }
            .backgroundColor(Color.Pink)
            .applyStyles(this.commonStyle)
          } else if (this.targetView == 'List') {
            List()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Panel') {
            Column(){

            }
            .width('50%')
            .height('100%')
            .applyStyles(this.commonStyle)
            .bindSheet(this.isShow = true,this.myBuilder,{
              height: 300,
              backgroundColor: Color.Green,
            })

          } else if (this.targetView == 'Refresh') {
            Refresh({ refreshing: false })
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
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
                .id('OnAreaChange')
            }
            .backgroundColor(Color.Pink)
            .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Row') {
            Row()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'RowSplit') {
            RowSplit() {
              Text('Text')
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'Scroll') {
            Scroll() {
              Column() {
                ForEach(new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), (item: number, index: int) => {
                  Text('Scroll' + item.toString())
                    .width('90%')
                    .height(150)
                    .backgroundColor(Color.White)
                    .textAlign(TextAlign.Center)
                }, (item: number, index: int) => String(item))
              }.width('100%')
            }.scrollBar(BarState.On).applyStyles(this.commonStyle)
          } else if (this.targetView == 'SideBarContainer') {
            SideBarContainer(SideBarContainerType.Embed) {
              Column() {
                ForEach(new Array<number>(1, 2, 3), (item: number, index: int) => {
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
            Stack()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Swiper') {
            Swiper() {
              ForEach(new Array<number>(1, 2, 3), (item: number, index: int) => {
                Text('Swiper' + item)
              }, (item: number, index: int) => String(item))
            }
            .indicator(true)
            .backgroundColor(Color.Pink)
            .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Tabs') {
            Tabs()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'WaterFlow') {
            WaterFlow()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Circle') {
            Circle()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Ellipse') {
            Ellipse()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Line') {
            Line()
              .backgroundColor(Color.Pink)
              .startPoint([0, 0])
              .endPoint([50, 100])
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Polyline') {
            Polyline()
              .points([[0, 0], [20, 60], [100, 100]])
              .fillOpacity(0)
              .stroke(Color.Blue)
              .strokeWidth(3)
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Polygon') {
            Polygon()
              .points([[50, 0], [0, 50], [20, 100], [80, 100], [100, 50]])
              .fillOpacity(0)
              .strokeWidth(5)
              .stroke(Color.Blue)
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Path') {
            Path()
              .commands('M100 0 L200 240 L0 240 Z')
              .fillOpacity(0)
              .stroke(Color.Black)
              .strokeWidth(3)
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Rect') {
            Rect()
              .fillOpacity(0)
              .stroke(Color.Red)
              .strokeWidth(3)
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Shape') {
            Shape()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Counter') {
            Counter()
              .backgroundColor(Color.Pink)
              .applyStyles(this.commonStyle)
          }
        }
        .width(this.parentWidth)
        .height(this.parentHeight)
        .backgroundColor(Color.Green)
        .margin(this.parentMargin)
        .key(this.parentKey)
      }
      Text(this.sizeOldValue).key(this.compareOldTextKey)
      Text(this.sizeNewValue).key(this.compareNewTextKey)
    }.width('100%').height('100%')
  }
}