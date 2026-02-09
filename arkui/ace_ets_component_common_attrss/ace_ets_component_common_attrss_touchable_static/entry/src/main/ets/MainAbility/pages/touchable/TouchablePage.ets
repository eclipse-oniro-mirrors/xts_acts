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

import { MessageManager } from '../../common/MessageManager';
import { RouterParams } from '../../common/Utils';
import router from '@ohos.router'
import {
  MenuItemGroup,
  MenuItemGroupOptions,
  ImageFit,
  FlowItem,
  TabContent,
  ListItemGroup,
  ListItem,
  SliderStyle,
  BadgeParamWithNumber,
  Blank,
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
// Navigator,
  ColumnSplit,
  RowSplit,
  Refresh,
// Panel,
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
// Point,
  Axis,Builder,CommonMethod,applyStyles,DataPanelType,/*NavRouter,Panel,Navigator,*/
  MenuItemOptions,
  CheckboxGroupOptions,DataPanelOptions,DatePickerOptions,ProgressOptions,RadioOptions,SliderOptions,WebviewController,Web,
  LineJoinStyle,HitTestMode,
  NavPathStack,
  AlignRuleOption
} from '@ohos.arkui.component';
import { MessageManager, Callback } from '../../common/MessageManager';
import { AppStorage, State, StoragePropRef } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TouchablePage {
  @StoragePropRef("_hitTestBehavior") _hitTestBehavior: HitTestMode = HitTestMode.Default
  @State targetView: string = ''
  @State componentKey: string = ''
  @Builder
  myBuilder() {
    Column() {
      Text('Panel')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }
  onPageShow() {
    console.info('TouchablePage page show called ')
    try {
      console.info('[TabIndexPage] start router ');
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
      AppStorage.setOrCreate<HitTestMode>('_hitTestBehavior', routerParamOptions.view.testValue.setValue)
      this.targetView = routerParamOptions.view.targetView
      this.componentKey = routerParamOptions.view.componentKey
      console.info('[TabIndexPage] end router '+this._hitTestBehavior,routerParamOptions.view.testValue.setValue);
    } catch (error) {
      console.log(' routerParamOptions error ' + error);
    }
  }

  @Builder
  itemHead(text: string) {
    Button('Header' + text)
  }
  commonStyle(instance: CommonMethod){
    instance.hitTestBehavior(this._hitTestBehavior)
    instance.key(this.componentKey)
  }

  build() {
    Column() {
      //Create view by config.
      if (this.targetView == 'MenuItem') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
            .applyStyles(this.commonStyle)
        }
        .width('100%')
        .height('70%')
        .backgroundColor(Color.Yellow)
      } else if (this.targetView == 'MenuItemGroup') {
        Menu() {
          MenuItemGroup({ header: 'MenuItemGroup' })
            .applyStyles(this.commonStyle)
        }
        .width('100%')
        .height('70%')
        .backgroundColor(Color.Yellow)
      } else if (this.targetView == 'ListItem') {
        List({ space: 20, initialIndex: 0 }) {
          ListItem() {
            Button('List')
          }.applyStyles(this.commonStyle)
        }.width('100%')
        .height('70%')
        .listDirection(Axis.Vertical)
      } else if (this.targetView == 'ListItemGroup') {
        List({ space: 0, initialIndex: 0 }) {
          ListItemGroup({ header: ()=>this.itemHead('Group1') }) {
            ListItem()
          }
          .backgroundColor(Color.Yellow)
          .applyStyles(this.commonStyle)
        }
        .width('100%')
        .height('70%')
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent() {
            Button('TabContent Test')
          }.tabBar('Tabs1').applyStyles(this.commonStyle)
        }.width('100%')
        .height('70%')
      } else if (this.targetView == 'GridCol') {
        GridRow({ columns: 1, }) {
          GridCol({ span: 1 }) {
            Button('GridCol')
          }
          .backgroundColor(Color.Green)
          .applyStyles(this.commonStyle)
        }
        .width('100%')
        .height('70%')
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem() {
            Text('GridItem1')
              .focusable(true)
          }.applyStyles(this.commonStyle)
        }
        .width('100%')
        .height('70%')
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
        .backgroundColor(Color.Black)
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem() {
            Button('FlowItem')
          }
          .backgroundColor(Color.Green)
          .applyStyles(this.commonStyle)
        }
        .width('100%')
        .height('70%')
      } else {
        Row() {
          //Set view by page config.
          if (this.targetView == 'AlphabetIndexer') {
            AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D'], selected: 0 }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Blank') {
            Blank()
              .backgroundColor(Color.Orange)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Button') {
            Button('button1')
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Checkbox') {
            Checkbox({ name: 'checkbox1', group: 'checkboxGroup' }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'CheckboxGroup') {
            CheckboxGroup({ group: 'checkboxGroup' }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'DataPanel') {
            DataPanel({ values: [25], max: 100, type: DataPanelType.Circle }).applyStyles(this.commonStyle)
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
            Gauge({ value: 75 }).colors([[Color.White, 1], [Color.Black, 1]]).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Image') {
            Image($r('app.media.icon'))
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'ImageAnimator') {
            ImageAnimator().images([{ src: $r('app.media.icon') }]).applyStyles(this.commonStyle)
          } else if (this.targetView == 'LoadingProgress') {
            LoadingProgress()
              .color(Color.Blue)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Marquee') {
            Marquee({ start: true, step: 50, src: 'Running Marquee starts rolling' })
              .fontWeight(700)
              .fontColor(Color.White)
              .fontSize(48)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Menu') {
            Menu() {
              MenuItem({ content: 'Menu' } as MenuItemOptions)
            }
            .backgroundColor(Color.Yellow)
            .padding(100)
            .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Navigation') {
            Navigation()
              .backgroundColor(Color.Green)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'NavRouter') {
            Navigation(new NavPathStack()).applyStyles(this.commonStyle)
            // NavRouter() {
            //   Row() {
            //     Image($r('app.media.icon'))
            //   }
            //
            //   NavDestination() {
            //     Text('NavDestination').fontSize(10)
            //   }
            // }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'Progress') {
            Progress({ value: 50, type: ProgressType.Linear }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'QRCode') {
            QRCode('QRCode').color(0xF7CE00).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Radio') {
            Radio({ value: 'Radio1', group: 'radioGroup' }).applyStyles(this.commonStyle)
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
          } else if (this.targetView == 'Select') {
            Select([{ value: 'aaa' }]).backgroundColor(Color.Green).applyStyles(this.commonStyle)
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
            TextArea({ placeholder: 'TextArea', }).backgroundColor(Color.White).applyStyles(this.commonStyle)
          } else if (this.targetView == 'TextClock') {
            TextClock({ timeZoneOffset: -8 }).format('hms').applyStyles(this.commonStyle)
          } else if (this.targetView == 'TextInput') {
            TextInput({ placeholder: 'TextInput' }).backgroundColor(Color.White).applyStyles(this.commonStyle)
          } else if (this.targetView == 'TextPicker') {
            TextPicker({ range: ['apple1', 'orange2', 'peach3'], selected: 1 }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'TextTimer') {
            TextTimer({ count: 30000 }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'TimePicker') {
            TimePicker().applyStyles(this.commonStyle)
          } else if (this.targetView == 'Toggle') {
            Toggle({ type: ToggleType.Switch }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Badge') {
            Badge({
              value: '',
              style: { badgeSize: 6, badgeColor: Color.Red }
            } as BadgeParamWithString) {
              Button('BadgeContent')
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'Column') {
            Column() {
              Button('ColumnButton')
            }.backgroundColor(Color.Green).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Counter') {
            Counter() {
              Text('1')
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'Flex') {
            Flex() {
              Button('Flex')
            }.backgroundColor(Color.Green).applyStyles(this.commonStyle)
          } else if (this.targetView == 'GridRow') {
            GridRow({ columns: 1, }) {
              GridCol({ span: 1 }) {
                Button('GridRow Test')
              }.backgroundColor(Color.Green)
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'Grid') {
            Grid() {
              ForEach(['0', '1', '2', '3', '4'], (item: string) => {
                ForEach(['0', '1', '2', '3', '4'], (day: string) => {
                  GridItem() {
                    Button('GridItem' + day)
                  }
                })
              })
            }
            .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
            .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
            .applyStyles(this.commonStyle)
          } else if (this.targetView == 'List') {
            List({ space: 20, initialIndex: 0 }) {
              ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: Int, index: Int) => {
                ListItem() {
                  Button('ListItem' + item)
                }
              }, (item: Int, index: Int) => item.toString())
            }
            .listDirection(Axis.Vertical)
            .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Navigator') {
            Navigation().applyStyles(this.commonStyle)
            // Navigator({ target: '' }) {
            //   Text('Navigator Go to index page')
            //     .width('100%').textAlign(TextAlign.Center)
            // }.applyStyles(this.commonStyle)
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
                .id('touchable')
            }.backgroundColor(Color.Green).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Row') {
            Row() {
              Button('RowButton')
            }.backgroundColor(Color.Green).applyStyles(this.commonStyle)
          } else if (this.targetView == 'ColumnSplit') {
            ColumnSplit() {
              Button('ColumnSplit')
            }.backgroundColor(Color.Green).applyStyles(this.commonStyle)
          } else if (this.targetView == 'RowSplit') {
            RowSplit() {
              Button('RowSplit')
            }.backgroundColor(Color.Green).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Panel') {
            // Panel(true) {
            //   Button('Panel')
            // }
            // .backgroundColor(Color.Green)
            // .mode(PanelMode.Full)
            // .applyStyles(this.commonStyle)
            Column()
            .backgroundColor(Color.Green)
            .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Refresh') {
            Refresh({ refreshing: true }) {
              Text('Refresh').fontSize(30)
            }
            .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Scroll') {
            Scroll() {
              Column() {
                ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: Int, index: Int) => {
                  Button('Scroll item' + item)
                }, (item: Int, index: Int) => item.toString())
              }.width('100%')
            }
            .scrollBar(BarState.On)
            .applyStyles(this.commonStyle)
          } else if (this.targetView == 'SideBarContainer') {
            SideBarContainer(SideBarContainerType.Embed) {
              Column() {
                Button('SideBarContainer')
              }.width('100%')
              .justifyContent(FlexAlign.SpaceEvenly)
              .backgroundColor(Color.Green)

              Column() {
                Button('SideBarContainer content')
              }.backgroundColor(Color.Orange)
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'Stack') {
            Stack() {
              Button('Stack')
            }.backgroundColor(Color.Orange).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Swiper') {
            Swiper() {
              ForEach([1, 2, 3], (item: Int,index: Int) => {
                Text('Swiper' + item)
                  .width('90%')
                  .height(160)
              }, (item: Int,index: Int) => item+'')
            }
            .indicator(true)
            .backgroundColor(Color.White)
            .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Tabs') {
            Tabs() {
              TabContent() {
                Button('TabContent')
              }.tabBar('Tabs1')
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'WaterFlow') {
            WaterFlow() {
              FlowItem() {
                Button('FlowItem')
              }
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'Circle') {
            Circle().applyStyles(this.commonStyle)
          } else if (this.targetView == 'Ellipse') {
            Ellipse().applyStyles(this.commonStyle)
          } else if (this.targetView == 'Line') {
            Line()
              .startPoint([0, 0])
              .endPoint([50, 100])
              .stroke(Color.Black)
              .backgroundColor('#F5F5F5')
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Polyline') {
            Polyline()
              .points([[0, 0], [20, 60], [100, 100]])
              .fillOpacity(0)
              .stroke(Color.Blue)
              .strokeWidth(3)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Polygon') {
            Polygon()
              .points([[50, 0], [0, 50], [20, 100], [80, 100], [100, 50]])
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
            Rect()
              .radius(20)
              .fill(Color.Pink)
              .stroke(Color.Transparent)
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Shape') {
            Shape() {
              Path().width(200).height(60).commands('M0 0 L400 0 L400 150 Z')
            }
            .viewPort({ x: -20, y: -5, width: 310, height: 90 })
            .fill(0x317AF7)
            .stroke(0xEE8443)
            .strokeWidth(10)
            .strokeLineJoin(LineJoinStyle.Miter)
            .strokeMiterLimit(5)
            .applyStyles(this.commonStyle)
          }
        }
        .width('100%')
        .height('70%')
        .backgroundColor(Color.Gray)
        .focusable(true)
      }
    }
  }
}