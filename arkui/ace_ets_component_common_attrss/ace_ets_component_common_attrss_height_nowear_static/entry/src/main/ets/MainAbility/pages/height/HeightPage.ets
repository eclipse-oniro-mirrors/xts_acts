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
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import { AnimatorResult, AnimatorOptions } from '@ohos.animator';
import {
  WebviewController,
  BreakpointsReference,
  GutterOption,
  BreakPoints,
  TabContent,
  FlowItem,
  ColumnOptions,
  SideBarContainerType,
  HorizontalAlign,
  VerticalAlign,
  AlignRuleOption,
  BadgeParam,
  BadgeStyle,
  GridColColumnOption,
  GridColOptions,
  GridItem,
  GridCol,
  GridRowDirection,
  MenuItemGroup,
  CommonMethod,
  applyStyles,
  ToggleType,
  TimePicker,
  SliderStyle,
  FlexDirection,
  ProgressType,
  Divider,
  ScrollBar,
  BadgeParamWithNumber,
  Length,
  MenuItemOptions,
  MenuItem,
  $r,
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,
  Color,
  FlexAlign,
  ExpectedFrameRateRange,
  Scroll,
  Margin,
// Styles,
  AlphabetIndexer,
  Blank,
  Checkbox,
  CheckboxGroup,
  DataPanel,
  DatePicker,
  Gauge,
  Image,
  ImageAnimator,
  LoadingProgress,
  Marquee,
  Menu,
  Navigation,
  Progress,
  QRCode,
  Radio,
  Rating,
  RichText,
  Scroller,
  Flex,
  BarState,
  ScrollDirection,
  Search,
  Select,
  Slider,
  TextArea,
  TextClock,
  ImageFit,
  TextInput,
  TextPicker,
  TextTimer,
  Toggle,
  Web,
  Circle,
  Ellipse,
  Line,
  Polyline,
  Polygon,
  Path,
  Rect,
  Shape,
  Badge,
  ColumnSplit,
  Counter,
  GridRow,
  Grid,
  Refresh,
  RelativeContainer,
  RowSplit,
  TextAlign,
  SideBarContainer,
  Stack,
  Swiper,
  Tabs,
  WaterFlow,
  DataPanelType,
  AlignRuleOption
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, StoragePropRef } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';

import { SetValue } from '../../common/Utils'
import { RouterParams } from '../../common/Utils';

@Entry
@Component
struct heightPage {
  //Use for TimePicker.
  private selectedTime: Date = new Date('2022-07-22T08:00:00')
  //Use for QRCode,Marquee.
  private src: string = 'Running Marquee starts rolling'
  //Use for AlphabetIndexer,TextPicker.
  private value: string[] = ['#', 'A', 'B']
  //Use for Scroll,Grid,DataPanel.
  public valueArr: number[] = new Array<number>(5, 10, 10, 7, 9, 10, 10, 10, 10)
  @StoragePropRef('_height') _height: Length = 0 as Length
  @StoragePropRef('_width') _width: Length = 0 as Length
  @State targetView: string = "";
  @State componentKey: string = "";
  @State parentWidth: number = 0;
  @State parentHeight: number = 0;
  @State parentBackGroundColor: Color = Color.White;
  @State BackGroundColor: Color = Color.White;
  @State parentComponentKey: string = "";

  onPageShow() {
    console.info('height page show called ')
    AppStorage.setOrCreate<Length>('_height', 0)
    AppStorage.setOrCreate<Length>('_width', 0)
    try {
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
      AppStorage.setOrCreate<Length>('_height', routerParamOptions.view.testValue.setValue.height)
      this.targetView = routerParamOptions.view.targetView
      this.componentKey = routerParamOptions.view.componentKey
      this.parentWidth = routerParamOptions.view.parentWidth
      this.parentHeight = routerParamOptions.view.parentHeight
      this.parentBackGroundColor = routerParamOptions.view.parentBackGroundColor
      this.BackGroundColor = routerParamOptions.view.BackGroundColor
      this.parentComponentKey = routerParamOptions.view.parentComponentKey
    } catch (error: Error) {
      console.log(' routerParamOptions error ' + error);
    }
  }

  commonStyle(instance: CommonMethod) {
    instance.height(this._height)
    instance.key(this.componentKey)
  }

  build() {
    Column() {
      if (this.targetView == 'Button') {
        Button('button1')
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'Text') {
        Text('text1')
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 })

          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'BlankRow') {
        Row() {
          Blank().color(this.BackGroundColor)
            .applyStyles(this.commonStyle)

        }.width(this.parentWidth as number).height(this.parentHeight as number).key(this.parentComponentKey)
      } else if (this.targetView == 'BlankColumn') {
        Blank().color(this.BackGroundColor)
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'Checkbox') {
        Checkbox().backgroundColor(this.BackGroundColor)
          .applyStyles(this.commonStyle)
          .width(100).margin(0)
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup({ group: 'checkboxGroup' })
          .applyStyles(this.commonStyle)
          .backgroundColor(this.BackGroundColor).width(100)
          .margin(0)
      } else if (this.targetView == 'DataPanel') {
        DataPanel({ values: this.valueArr })
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'DatePicker') {
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1')
        })
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'Divider') {
        Divider().strokeWidth(8).color(Color.Red)
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'Gauge') {
        Gauge({ value: 105 })
          .applyStyles(this.commonStyle)
          .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
          .width(100)
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
          .applyStyles(this.commonStyle)
          .width(110).backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([
            {
              src: $r('app.media.icon')
            }
          ])
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'LoadingProgress') {
        LoadingProgress().backgroundColor(this.BackGroundColor)
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'Marquee') {
        Marquee({
          start: true,
          step: 50,
          loop: Number.MAX_VALUE as int,
          fromStart: true,
          src: this.src
        })
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'Navigation') {
        Navigation({})
          .applyStyles(this.commonStyle)
          .width(100).expandSafeArea([], [])
      } else if (this.targetView == 'NavRouter') {
        // NavRouter()
        //.applyStyles(this.commonStyle)
        // .width(100)
      } else if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Eclipse })
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'QRCode') {
        QRCode(this.src)
          .applyStyles(this.commonStyle)
          .backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' }).width(100)
          .applyStyles(this.commonStyle)
          .backgroundColor(this.BackGroundColor)
          .margin(0)
      } else if (this.targetView == 'Rating') {
        Rating({ rating: 3.5 })
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'RichText') {
        RichText('RichText')
          .applyStyles(this.commonStyle)
          .width(100).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: new Scroller() }) {
          Text().width(10).height(50).backgroundColor('#C0C0C0')
        }
        .applyStyles(this.commonStyle)
        .backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'Search') {
        Search()
          .applyStyles(this.commonStyle)
          .width(100).margin(0)
      } else if (this.targetView == 'Select') {
        Select([{ value: 'aaa' },
          { value: 'bbb' }]).backgroundColor(this.BackGroundColor)
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'Slider') {
        Slider({
          value: 50
        }).showTips(true)
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'TextArea') {
        TextArea({ placeholder: 'TextArea' })
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'TextClock') {
        TextClock({ timeZoneOffset: -8 })
          .format('hms')
          .fontSize(30)

          .applyStyles(this.commonStyle)

          .backgroundColor(this.BackGroundColor)
          .width(100)
      } else if (this.targetView == 'TextInput') {
        TextInput({ placeholder: 'input your word...' })

          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: this.value })
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 }).format('mm:ss.SS')

          .applyStyles(this.commonStyle)
          .backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'TimePicker') {
        TimePicker({
          selected: this.selectedTime
        }).useMilitaryTime(true)
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch })
          .applyStyles(this.commonStyle)
          .backgroundColor(this.BackGroundColor).width(100).margin(0)
      } else if (this.targetView == 'Web') {
        // Web({ src: 'www.example.com', controller: new WebviewController() })
        //   .applyStyles(this.commonStyle)
        //   .width(100)
      } else if (this.targetView == 'Circle') {
        Circle()
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'Ellipse') {
        Ellipse()
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'Line') {
        Line()
          .startPoint([0, 0])
          .endPoint([50, 100])

          .applyStyles(this.commonStyle)

          .width(100)
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Polyline') {
        Polyline()

          .applyStyles(this.commonStyle)
          .width(100)
          .points([[20, 0], [0, 100], [100, 90]])
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Polygon') {
        Polygon()

          .applyStyles(this.commonStyle)

          .width(100)
          .points([[20, 0], [0, 100], [100, 100], [100, 0]])
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Path') {
        Path()
          .applyStyles(this.commonStyle)
          .width(100).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Rect') {
        Rect()
          .applyStyles(this.commonStyle)
          .width(100)
      } else if (this.targetView == 'Shape') {
        Shape() {
          Rect().width(100).height(50)
        }
        .applyStyles(this.commonStyle)
        .backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'Badge') {
        Badge({
          count: 50,
          style: {
            color: 0xFFFFFF,
            fontSize: 16,
            badgeSize: 20,
            badgeColor: Color.Red
          } as BadgeStyle
        } as BadgeParamWithNumber) {
          Button('message')
        }
        .applyStyles(this.commonStyle)
        .width(100)
      } else if (this.targetView == 'Column') {
        Column() {
          Column().width('100%').height(30).backgroundColor(0xAFEEEE)
        }
        .applyStyles(this.commonStyle)
        .width(100)
      } else if (this.targetView == 'ColumnSplit') {
        Column() {
          ColumnSplit() {
            Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          }
          .applyStyles(this.commonStyle)
          .width(100)
        }
      } else if (this.targetView == 'Counter') {
        Counter() {
        }
        .applyStyles(this.commonStyle)
        .width(100)
      } else if (this.targetView == 'Flex') {
        Flex() {
          Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
        }
        .applyStyles(this.commonStyle)
        .width(100)
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
          ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink], (color: Color) => {
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
        .applyStyles(this.commonStyle)
        .width(100)
      } else if (this.targetView == 'Grid') {
        Grid() {
          ForEach(this.valueArr, (day: number) => {
            GridItem() {
              Text(String(day))
            }
          }, (day: number) => String(day))
        }.columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .applyStyles(this.commonStyle)
        .width(100).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'List') {
        List() {
        }
        .applyStyles(this.commonStyle)
        .width(200).backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'ListItem') {
        List() {
          ListItem() {
          }
          .applyStyles(this.commonStyle)

        }.width(this.parentWidth as number).height(this.parentHeight as number).key(this.parentComponentKey)
      } else if (this.targetView == 'Panel') {
        // Panel(true) {
        //   Column() {
        //   }
        // }
        //    .applyStyles(this.commonStyle)
        // .width(100)
      } else if (this.targetView == 'Refresh') {
        Refresh({ refreshing: false }) {
          Text('Pull Down and refresh:0 ')
        }
        .applyStyles(this.commonStyle)
        .backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'Row') {
        Row() {
          Row().width('30%').height(50).backgroundColor(0xAFEEEE)
        }
        .applyStyles(this.commonStyle)
        .width(100).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('1').width('20%').height(100).backgroundColor(0xF5DEB3)
        }
        .applyStyles(this.commonStyle)
        .width(100)
      } else if (this.targetView == 'Scroll') {
        Scroll() {
          List() {
            ForEach(this.valueArr, (item: number) => {
              ListItem() {
                Text('ListItem' + item)
              }.width('100%').height(100)
            }, (item: number) => String(item))
          }.width(200).height(200)
        }
        .applyStyles(this.commonStyle)
        .width(100).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed) {
          Column() {
            ForEach(new Array<number>(1, 2, 3), (item: number) => {
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
        }
        .applyStyles(this.commonStyle)

      } else if (this.targetView == 'Stack') {
        Stack() {
        }
        .applyStyles(this.commonStyle)
        .width(100)
      } else if (this.targetView == 'Swiper') {
        Swiper() {
          ForEach(new Array<number>(1, 2, 3), (item: number) => {
            Text('Swiper' + item).width('90%').height(50)
          }, (item: number) => String(item))
        }.indicator(true)
        .applyStyles(this.commonStyle)
        .width(100)
      } else if (this.targetView == 'Tabs') {
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#00CB87')
          }
        }
        .applyStyles(this.commonStyle)
        .backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'WaterFlow') {
        WaterFlow()
          .applyStyles(this.commonStyle)
          .backgroundColor(this.BackGroundColor).width(100)
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem()
            .applyStyles(this.commonStyle)

        }.key(this.parentComponentKey).width(this.parentWidth as number).height(this.parentHeight as number)
      } else if (this.targetView == 'GridCol') {
        GridRow() {
          GridCol({
            span: {
              xs: 1,
              sm: 2,
              md: 3,
              lg: 4
            } as GridColColumnOption
          } as GridColOptions) {
            Row().width('100%').height('20vp')
          }
          .applyStyles(this.commonStyle)

        }.key(this.parentComponentKey).width(this.parentWidth as number).height(this.parentHeight as number)
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem()
            .applyStyles(this.commonStyle)

        }.key(this.parentComponentKey).width(this.parentWidth as number).height(this.parentHeight as number)
      } else if (this.targetView == 'RelativeContainer') {
        RelativeContainer() {
          Row()
            .width('100%')
            .height('100%')
            .backgroundColor('#FF3333')
            .alignRules({
              center: { anchor: '__container__', align: VerticalAlign.Center },
              middle: { anchor: '__container__', align: HorizontalAlign.Center }
            } as AlignRuleOption)
        }.backgroundColor(Color.Green)
        .applyStyles(this.commonStyle)
        .width(100)
      } else if (this.targetView == 'Navigator') {
        // Navigator()
        //    .applyStyles(this.commonStyle)
        // .width(100)
      } else if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }.backgroundColor(Color.Yellow)
        .applyStyles(this.commonStyle)
        .width(100).padding(0)
      } else if (this.targetView == 'MenuItem') {
        Row() {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
              .height(this._height)
              .key(this.componentKey)
          }
          .backgroundColor(this.BackGroundColor)
          .width(this.parentWidth as number)
          .height(this.parentHeight as number)
          .key(this.parentComponentKey)
          .padding(0)
        }
      } else if (this.targetView == 'MenuItemGroup') {
        Row() {
          Menu() {
            MenuItemGroup({ header: 'MenuItemGroup' }) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
            }.key(this.componentKey)
            .height(this._height)
          }
          .backgroundColor(Color.Yellow)
          .height(this.parentHeight as number)
          .width(this.parentWidth as number)
          .key(this.parentComponentKey)
          .padding(0)
        }
      }
    }
    .height(this.parentHeight as number)
    .width(this.parentWidth as number)
    .backgroundColor(this.parentBackGroundColor)
    .key(this.parentComponentKey)
  }
}