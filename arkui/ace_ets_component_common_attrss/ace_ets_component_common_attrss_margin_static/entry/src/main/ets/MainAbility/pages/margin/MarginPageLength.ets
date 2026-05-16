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
import {
  $r,
  AlignRuleOption,
  AlphabetIndexer,
  applyStyles,
  Axis,
  BadgeParamWithString,
  BadgeStyle,
  BarState,
  Blank,
  BreakPoints,
  BreakpointsReference,
  Builder,
  Button,
  Checkbox,
  CheckboxGroup,
  Circle,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  ColumnSplit,
  CommonMethod,
  Component,
  Counter,
  DataChangeListener,
  DataPanel,
  DatePicker,
  Divider,
  Ellipse,
  Entry,
  Flex,
  FlexAlign,
  FlowItem,
  ForEach,
  Gauge,
  Grid,
  GridCol,
  GridColColumnOption,
  GridColOptions,
  GridItem,
  GridRow,
  GridRowDirection,
  GutterOption,
  HorizontalAlign,
  IDataSource,
  Image,
  ImageAnimator,
  ImageFit,
  LazyForEach,
  Line,
  List,
  ListItem,
  ListItemGroup,
  LoadingProgress,
  Margin,
  Marquee,
  Menu,
  MenuItem,
  MenuItemGroup,
  MenuItemGroupOptions,
  MenuItemOptions,
  Padding,
  Path,
  Polygon,
  Polyline,
  Progress,
  ProgressType,
  QRCode,
  Radio,
  Rating,
  Rect,
  Refresh,
  RelativeContainer,
  Resource,
  RichText,
  Row,
  RowOptions,
  RowSplit,
  Scroll,
  ScrollBar,
  Scroller,
  Search,
  Select,
  SideBarContainer,
  SideBarContainerType,
  Slider,
  SliderStyle,
  Stack,
  Swiper,
  SwiperController,
  TabContent,
  Tabs,
  Text,
  TextAlign,
  TextArea,
  TextCase,
  TextClock,
  TextDecorationType,
  TextInput,
  TextPicker,
  TextTimer,
  TimePicker,
  Toggle,
  ToggleType,
  VerticalAlign,
  WaterFlow
} from '@ohos.arkui.component';
import { AppStorage, Link, PropRef, State, StoragePropRef, } from '@ohos.arkui.stateManagement';
import { Router, UIContext } from '@ohos.arkui.UIContext'
import inspector from '@ohos.arkui.inspector';

class View {
  targetView: string = '';
  targetGroupView: string = '';
  componentKey: string = '';
  parentComponentKey: string = '';
  referenceComponentKey: string = '';
  childWidth: number = 0;
  childHeight: number = 0;
  parentWidth: number = 0;
  parentHeight: number = 0;
}

@Entry
@Component
struct MarginPageLength {
  @StoragePropRef('_margin') _margin: number | string | Margin = 0.0
  @State targetView: string = ''
  @State targetGroupView: string = ''
  @State componentKey: string = ''
  @State parentComponentKey: string = ''
  @State referenceComponentKey: string = ''
  @State childWidth: number = 0
  @State childHeight: number = 0
  @State parentWidth: number = 0
  @State parentHeight: number = 0

  onPageShow() {
    console.info('Margin page show called ')
    AppStorage.setOrCreate<number | string | Margin>('_margin', 0.0)
    this.getUIContext().getRouter().getParams() as RouterParams
    try {
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams
      console.log('routerParamOptions==========================' + JSON.stringify(routerParamOptions))
      this.targetView = routerParamOptions.view.targetView
      this.targetGroupView = routerParamOptions.view.targetGroupView
      this.componentKey = routerParamOptions.view.componentKey
      this.parentComponentKey = routerParamOptions.view.parentComponentKey
      this.referenceComponentKey = routerParamOptions.view.referenceComponentKey
      this.childWidth = routerParamOptions.view.childWidth
      this.childHeight = routerParamOptions.view.childHeight
      this.parentWidth = routerParamOptions.view.parentWidth
      this.parentHeight = routerParamOptions.view.parentHeight
    } catch (error) {
      console.log(' routerParamOptions error ' + error);
    }
  }

  commonStyle(instance: CommonMethod) {
    instance.margin(this._margin)
    instance.width(this.childWidth)
    instance.height(this.childHeight)
    instance.key(this.componentKey)
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

  build() {
    Row() {
      if (this.targetView == 'ListItem') {
        List() {
          ListItem() {
            Text('item1').width('100%').textAlign(TextAlign.Center).backgroundColor(Color.White)
          }.margin(this._margin).key(this.componentKey)

          ListItem() {
            Text('referenceComponent')
              .width('100%').textAlign(TextAlign.Center).backgroundColor(Color.White)
          }.key(this.referenceComponentKey)
        }
        .listDirection(Axis.Vertical).width(this.parentWidth).height(this.parentHeight).key(this.parentComponentKey)
      } else if (this.targetView == 'ListItemGroup') {
        List({ space: 0, initialIndex: 0 }) {
          ListItemGroup().backgroundColor(Color.Yellow).margin(this._margin).key(this.componentKey)
          ListItemGroup().backgroundColor(Color.Red).key(this.referenceComponentKey)
        }
        .backgroundColor(Color.Pink)
        .width(this.parentWidth)
        .height(this.parentHeight)
        .listDirection(Axis.Vertical)
        .key(this.parentComponentKey)
      } else if (this.targetView == 'MenuItem') {
        Row() {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              .margin(this._margin).key(this.componentKey).width('100%').height('100%')
          }
          .backgroundColor(Color.Yellow)
          .padding(0)
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
        }.width('100%').height('100%').backgroundColor(Color.Green)
      } else if (this.targetView == 'MenuItemGroup') {
        Row() {
          Menu() {
            MenuItemGroup({ header: 'MenuItemGroup' } as MenuItemGroupOptions) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
            }.margin(this._margin).key(this.componentKey).width('100%').height('100%')
          }
          .backgroundColor(Color.Yellow)
          .padding(0)
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
        }.width('100%').height('100%').backgroundColor(Color.Green)
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent() {
            Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
          }.tabBar('Tabs1').margin(this._margin).key(this.componentKey)

          TabContent() {
            Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
          }.tabBar('Tabs1').key(this.referenceComponentKey)
        }
        .width(this.parentWidth).height(this.parentHeight).key(this.parentComponentKey)
      } else if (this.targetView == 'GridCol') {
        GridRow({
          columns: 1,
          direction: GridRowDirection.Row
        }) {
          GridCol() {
            Row().width('100%').height('20vp')
          }
          .margin(this._margin)
          .key(this.componentKey)
          .backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        }
        .width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Pink).key(this.parentComponentKey)
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem() {
            Column() {
              Text('WaterFlow').fontSize(12).height('16')
              Image($r('app.media.icon')).width(50).height(50).objectFit(ImageFit.Fill)
            }
          }
          .margin(this._margin)
          .key(this.componentKey)
          .backgroundColor(Color.Yellow)
          .width('100%')
          .height('100%')
        }
        .backgroundColor(Color.Pink).width(this.parentWidth).height(this.parentHeight).key(this.parentComponentKey)
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem() {
            Text('4').backgroundColor(0xFAEEE0).width('100%').height('100%').textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('100%')
          .rowStart(1)
          .rowEnd(4)
          .margin(this._margin)
          .key(this.componentKey)
          .backgroundColor(Color.Yellow)
        }
        .backgroundColor(Color.Pink).width(this.parentWidth).height(this.parentHeight).key(this.parentComponentKey)
      } else {
        Column() {
          if (this.targetView == 'Button') {
            Button('button1').applyStyles(this.commonStyle)
          } else if (this.targetView == 'Text') {
            Text('text1').applyStyles(this.commonStyle)
          } else if (this.targetView == 'AlphabetIndexer') {
            AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
              .applyStyles(this.commonStyle)
          } else if (this.targetView == 'Blank') {
            Blank().backgroundColor(Color.Yellow).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Checkbox') {
            Checkbox().applyStyles(this.commonStyle)
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
            Image($r('app.media.icon')).applyStyles(this.commonStyle)
          } else if (this.targetView == 'ImageAnimator') {
            ImageAnimator()
              .images([{ src: $r('app.media.icon') }
              ]).applyStyles(this.commonStyle)
          } else if (this.targetView == 'LoadingProgress') {
            LoadingProgress().applyStyles(this.commonStyle)
          } else if (this.targetView == 'Marquee') {
            Marquee({
              start: true,
              step: 50,
              loop: Number.MAX_VALUE.toInt(),
              fromStart: true,
              src: 'Running Marquee starts rolling'
            }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Menu') {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
            }.backgroundColor(Color.Yellow).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Navigation') {
            // Navigation() {
            // }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'NavRouter') {
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
            Progress({ value: 10, type: ProgressType.Eclipse }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'QRCode') {
            QRCode('Running Marquee starts rolling').applyStyles(this.commonStyle)
          } else if (this.targetView == 'Radio') {
            Radio({ value: 'Radio1', group: 'radioGroup' }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Rating') {
            Rating({ rating: 3.5, indicator: false }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'ScrollBar') {
            ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
              Text().width(20).height(100).borderRadius(10).backgroundColor('#C0C0C0')
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'Search') {
            Search().applyStyles(this.commonStyle)
          } else if (this.targetView == 'Select') {
            Select([{ value: 'aaa' },
              { value: 'bbb' }]).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Slider') {
            Slider({
              value: 50,
              min: 0,
              max: 100,
              style: SliderStyle.OutSet
            }).showTips(true).applyStyles(this.commonStyle)
          } else if (this.targetView == 'TextArea') {
            TextArea({
              placeholder: 'The text area can hold an unlimited amount of text. input your word...'
            }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'TextClock') {
            TextClock({ timeZoneOffset: -8 })
              .format('hms').applyStyles(this.commonStyle)
          } else if (this.targetView == 'TextInput') {
            TextInput({ placeholder: 'input your word...' }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'TextPicker') {
            TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'TextTimer') {
            TextTimer({ isCountDown: true, count: 30000 })
              .format('mm:ss.SS').fontColor(Color.Black).applyStyles(this.commonStyle)
          } else if (this.targetView == 'TimePicker') {
            TimePicker({
              selected: new Date('2022-07-22T08:00:00')
            }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Toggle') {
            Toggle({ type: ToggleType.Switch, isOn: false }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Web') {
            // Web({ src: 'www.example.com', controller: new WebController() }).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Circle') {
            Circle().applyStyles(this.commonStyle)
          } else if (this.targetView == 'Ellipse') {
            Ellipse().applyStyles(this.commonStyle)
          } else if (this.targetView == 'Line') {
            Line().applyStyles(this.commonStyle).startPoint([0, 0]).endPoint([50, 100]).backgroundColor(Color.Black)
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
            //   Rect().width(100).height(50)
            // }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'Badge') {
            // Badge({
            //   count: 50,
            //   style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
            // }) {
            //   Button('message')
            //     .width(100).height(50).backgroundColor(0x317aff)
            // }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'Column') {
            Column() {
              Column().width('100%').height(30).backgroundColor(0xAFEEEE)
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'ColumnSplit') {
            ColumnSplit() {
              Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'Counter') {
            Counter() {
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'Flex') {
            Flex() {
              Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'GridRow') {
            GridRow().applyStyles(this.commonStyle)
          } else if (this.targetView == 'Grid') {
            Grid() {
              ForEach(new Array<string>('0', '1', '2', '3', '4'), (i: string) => {
                ForEach(new Array<string>('0', '1', '2', '3', '4'), (day: string) => {
                  GridItem() {
                    Text(day).backgroundColor(Color.White)
                      .width('100%').height('100%').textAlign(TextAlign.Center)
                  }
                })
              })
            }
            .columnsTemplate('1fr 1fr 1fr 1fr 1fr').rowsTemplate('1fr 1fr 1fr 1fr 1fr').backgroundColor(0xFAEEE0)
            .applyStyles(this.commonStyle)
          } else if (this.targetView == 'List') {
            List().applyStyles(this.commonStyle)
          } else if (this.targetView == 'Navigator') {
            // Navigator() {
            //   Text('Go to back page').width('100%').height(20)
            // }.applyStyles(this.commonStyle).backgroundColor(Color.Red)
          } else if (this.targetView == 'Panel') {
            Column() {

            }
            .applyStyles(this.commonStyle)
            .bindSheet(true, this.myBuilder, {
              height: 300,
              backgroundColor: Color.Yellow
            })
          } else if (this.targetView == 'Refresh') {
            Refresh({ refreshing: false }) {
              Text('123')
            }.applyStyles(this.commonStyle)
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
                .id('marginLength')
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'Row') {
            Row().applyStyles(this.commonStyle)
          } else if (this.targetView == 'RowSplit') {
            RowSplit() {
              Text('Text')
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'Scroll') {
            Scroll() {
              Column() {
                ForEach(['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'], (item: string) => {
                  Text('Scroll' + item)
                    .width('90%')
                    .height(50)
                    .backgroundColor(Color.White)
                    .textAlign(TextAlign.Center)
                }, (item: string) => item)
              }.width('100%')
            }.scrollBar(BarState.On).applyStyles(this.commonStyle)
          } else if (this.targetView == 'SideBarContainer') {
            SideBarContainer(SideBarContainerType.Embed) {
              Column() {
                ForEach(['1', '2', '3'], (item: string) => {
                  Column({ space: 5 } as ColumnOptions) {
                    Image($r('app.media.icon')).width(50).height(50)
                    Text('Index0' + item).fontSize(25)
                  }
                })
              }.width('100%').justifyContent(FlexAlign.SpaceEvenly).backgroundColor(Color.Green)

              Column() {
                Text('SideBarContainer content').fontSize(25)
              }.backgroundColor(Color.Orange)
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'Stack') {
            Stack() {
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'Swiper') {
            Swiper() {
              ForEach(['1', '2', '3'], (item: string) => {
                Text('Swiper' + item).width('90%').height(50)
              }, (item: string) => item)
            }.indicator(true).backgroundColor(Color.White).applyStyles(this.commonStyle)
          } else if (this.targetView == 'Tabs') {
            Tabs() {
              TabContent() {
                Column().width('100%').height('100%').backgroundColor('#00CB87')
              }
            }.applyStyles(this.commonStyle)
          } else if (this.targetView == 'WaterFlow') {
            WaterFlow() {
              ForEach(['1', '2', '3', '4', '5', '6', '7', '8', '9'], (item: string) => {
                FlowItem() {
                  Column() {
                    Text('WaterFlow' + item).fontSize(12).height('16')
                    Image($r('app.media.icon')).width(50).height(50).objectFit(ImageFit.Fill)
                  }
                }
              }, (item: string) => item)
            }.applyStyles(this.commonStyle)
          }
        }
        .key(this.parentComponentKey)
        .backgroundColor(Color.Red)
      }
    }.backgroundColor(Color.Yellow)
  }
}