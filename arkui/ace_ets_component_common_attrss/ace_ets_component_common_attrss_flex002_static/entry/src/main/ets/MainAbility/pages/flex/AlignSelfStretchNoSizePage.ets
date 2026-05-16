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

import AttrsManager from '../../common/AttrsManager';
import router from '@ohos.router'
import { State, StoragePropRef, AppStorage } from '@ohos.arkui.stateManagement';
import { RouterParams, AlignValue } from '../../common/Utils';
import {
  Entry,
  Component,
  ItemAlign,
  VerticalAlign,
  HorizontalAlign,
  Builder,
  AlphabetIndexer,
  Button,
  Checkbox,
  CheckboxGroup,
  DataPanel,
  DatePicker,
  Divider,
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
  ScrollBar,
  Scroller,
  Search,
  Select,
  Slider,
  Text,
  TextArea,
  TextClock,
  TextInput,
  TextPicker,
  TextTimer,
  TimePicker,
  Toggle,
  Badge,
  Column,
  Counter,
  Flex,
  GridRow,
  Grid,
  List,
  RelativeContainer,
  Row,
  Refresh,
  Scroll,
  SideBarContainer,
  Stack,
  Swiper,
  Tabs,
  WaterFlow,
  Circle,
  Ellipse,
  Line,
  Polyline,
  Polygon,
  Path,
  Rect,
  Shape,
  ColumnSplit,
  RowSplit,
  Blank,
  DataPanelType,
  Color,
  $r,
  MenuItem,
  ProgressType,
  BarState,
  SliderStyle,
  Axis,
  ToggleType,
  GridRowDirection,
  GridCol,
  GridItem,
  ListItem,
  SideBarContainerType,
  FlexDirection,
  MenuItemOptions,
  BadgeStyle,
  BadgeParamWithString,
  TextAlign,
  FlexAlign,
  TabContent,
  FlowItem,
  ColumnOptions,
  PolylineOptions,
  RectOptions,
  GridColColumnOption,
  FlexWrap,
  GutterOption,
  BreakPoints,
  ForEach,
  NavPathStack,
  ImageFit,
  BreakpointsReference,
  CommonMethod,
  applyStyles,
  LineJoinStyle,
  AlignRuleOption,
  NavDestination
} from '@ohos.arkui.component'

@Entry
@Component
struct AlignSelfStretchNoSizePage {
  @StoragePropRef('_alignSelf') _alignSelf: ItemAlign = ItemAlign.Auto;
  @StoragePropRef('_wrap') _wrap: FlexWrap = FlexWrap.NoWrap;
  @StoragePropRef('_direction') _direction: FlexDirection = FlexDirection.Row;
  @State containerView: string =  ''
  @State targetView: string = ''
  @State componentKey: string = ''
  @State parentComponentKey: string = ''
  @State referenceComponentKey: string = ''
  @State parentWidth: number = 400
  @State parentHeight: number = 400
  @State compareWidth: number = 0
  @State compareHeight: number = 0

  onPageShow() {
    console.info('AlignSelfStretchNoSizePage page show called ')
    let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
    const value = routerParamOptions.view.testValue.setValue;
    AppStorage.setOrCreate<ItemAlign>('_alignSelf', value.alignSelf)
    AppStorage.setOrCreate<FlexWrap>('_wrap', value.wrap)
    AppStorage.setOrCreate<FlexDirection>('_direction', value.direction)
    this.containerView = routerParamOptions.view.containerView ?? ''
    this.targetView = routerParamOptions.view.targetView ?? ''
    this. componentKey = routerParamOptions.view.componentKey as string  ?? ''
    this.parentComponentKey = routerParamOptions.view.parentComponentKey as string ?? ''
    this.referenceComponentKey = routerParamOptions.view.referenceComponentKey ?? ''
    this.parentWidth = routerParamOptions.view.parentWidth
    this.parentHeight = routerParamOptions.view.parentHeight
    this.compareWidth = routerParamOptions.view.compareWidth
    this.compareHeight = routerParamOptions.view.compareHeight
  }

  commonStyle(instance: CommonMethod){
    instance.margin(0)
    instance.alignSelf(this._alignSelf)
    instance.key(this.componentKey)
  }

  @Builder
  buildTargetView() {
    if (this.targetView == 'AlphabetIndexer') {
      AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 }) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Button') {
      Button('button1') .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Checkbox') {
      Checkbox({ name: 'checkbox1', group: 'checkboxGroup' }) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'CheckboxGroup') {
      CheckboxGroup({ group: 'checkboxGroup' }) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'DataPanel') {
      DataPanel({ values: [25], max: 100, type: DataPanelType.Circle }) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'DatePicker') {
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: new Date()
      }) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Divider') {
      Divider().strokeWidth(8).vertical(true) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Gauge') {
      Gauge({ value: 75 }).colors([[Color.White, 1], [Color.Black, 1]]) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Image') {
      Image($r('app.media.icon')) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'ImageAnimator') {
      ImageAnimator().images([{ src: $r('app.media.icon') }]) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'LoadingProgress') {
      LoadingProgress().color(Color.Blue) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Marquee') {
      Marquee({ start: true, step: 50, src: 'Running Marquee starts rolling' })
        .fontWeight(700).fontColor(Color.White).fontSize(48) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Menu') {
      Menu() {
        MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
      } .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Navigation') {
      Navigation(new NavPathStack()) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'NavRouter') {
      Navigation() {
        Row() {
          Image($r('app.media.icon'))
        }

        NavDestination() {
          Text('NavDestination').fontSize(10)
        }
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Progress') {
      Progress({ value: 50, type: ProgressType.Linear }) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'QRCode') {
      QRCode('QRCode').color(0xF7CE00) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Radio') {
      Radio({ value: 'Radio1', group: 'radioGroup' }) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Rating') {
      Rating({ rating: 4 }).stars(5) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'ScrollBar') {
      ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
        Text().width(20).height(20).borderRadius(10)
      }.width(20) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Search') {
      Search({ placeholder: 'Type to search...' })
        .searchButton('SEARCH')
      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Select') {
      Select([{ value: 'aaa', icon: '/common/public_icon.svg' },
        { value: 'bbb', icon: '/common/public_icon.svg' }]) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Slider') {
      Slider({ value: 50, style: SliderStyle.OutSet, direction: Axis.Vertical })
        .blockColor('#191970')
        .trackColor('#ADD8E6')
        .selectedColor('#4169E1')
      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Text') {
      Text('text').fontColor(Color.White).fontSize(30) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextArea') {
      TextArea({ placeholder: 'TextArea', }) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextClock') {
      TextClock({ timeZoneOffset: -8 }).format('hms') .applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextInput') {
      TextInput({ placeholder: 'TextInput' }) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextPicker') {
      TextPicker({ range: ['apple1', 'orange2', 'peach3'], selected: 1 }) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextTimer') {
      TextTimer({ count: 30000 }) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'TimePicker') {
      TimePicker() .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Toggle') {
      Toggle({ type: ToggleType.Switch }) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Badge') {
      Badge({
        value: '',
        style: { badgeSize: 6, badgeColor: Color.Red } as BadgeStyle
      } as BadgeParamWithString) {
        Button('BadgeContent')
      } .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Column') {
      Column() {
        Text('Column')
      } .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Counter') {
      Counter() {
        Text('1')
      } .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Flex') {
      Flex() {
        Text('Flex')
      } .applyStyles(this.commonStyle)
    } else if (this.targetView == 'GridRow') {
      GridRow({
        columns: 5,
        gutter: { x: 5, y: 10 } as GutterOption,
        breakpoints: { value: ['400vp', '600vp', '800vp'], reference: BreakpointsReference.WindowSize } as BreakPoints,
        direction: GridRowDirection.Row
      }) {
        ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green,
          Color.Pink, Color.Grey, Color.Blue, Color.Brown], (color: Color) => {
          GridCol({
            span: {
              xs: 1,
              sm: 2,
              md: 3,
              lg: 4
            } as GridColColumnOption
          }) {
            Row().width('100%').height('20vp')
          }.borderColor(color).borderWidth(2)
        })
      } .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Grid') {
      Grid() {
        ForEach(['0', '1', '2', '3', '4'], (d: string, i: int) => {
          ForEach(['0', '1', '2', '3', '4'], (day: string, index: int) => {
            GridItem() {
              Text(day)
                .width('100%').height('100%').textAlign(TextAlign.Center)
            }
          })
        })
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')

      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'List') {
      List({ space: 20, initialIndex: 0 }) {
        ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: Int, index: int) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .textAlign(TextAlign.Center)
          }
        }, (item: Int, index: int) => String(item))
      }
      .listDirection(Axis.Vertical)

      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Navigator') {
      Navigation() {
        Row() {
          Image($r('app.media.icon'))
        }
        NavDestination() {
          Text('NavDestination').fontSize(10)
        }
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'RelativeContainer') {
      RelativeContainer() {
        Row()
          .width(100)
          .height(100)
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            left: { anchor: '__container__', align: HorizontalAlign.Start }
          } as AlignRuleOption)
      } .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Row') {
      Row() {
        Text('Row')
      } .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Panel') {
      // Panel(true) {
      //   Column() {
      //     Text('Panel')
      //   }
      // }
      // .mode(PanelMode.Half)
      //.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Refresh') {
      Refresh({ refreshing: true }) {
        Text('Refresh').fontSize(30)
      }

      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Scroll') {
      Scroll() {
        Column() {
          ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: Int, index: int) => {
            Text('Scroll' + item)
              .width('90%')
              .height(10)
              .textAlign(TextAlign.Center)
          }, (item: Int, index: int) => String(item))
        }.width('100%')
      }
      .scrollBar(BarState.On)

      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'SideBarContainer') {
      SideBarContainer(SideBarContainerType.Embed) {
        Column() {
          ForEach([1, 2, 3], (item: Int, index: int) => {
            Column({ space: 5 } as ColumnOptions) {
              Image($r('app.media.icon')).width(64).height(64)
              Text('Index0' + item).fontSize(25)
            }
          })
        }.width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)

        Column() {
          Text('SideBarContainer content').fontSize(25)
        }
      } .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Stack') {
      Stack() {
        Text('Stack').fontColor(Color.White)
      } .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Swiper') {
      Swiper() {
        ForEach([1, 2, 3], (item: Int, index: int) => {
          Text('Swiper' + item).width('90%').height(160)
        }, (item: Int, index: int) => String(item))
      }
      .indicator(true)

      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Tabs') {
      Tabs() {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }
      } .applyStyles(this.commonStyle)
    } else if (this.targetView == 'WaterFlow') {
      WaterFlow() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: Int, index: int) => {
          FlowItem() {
            Column() {
              Text('WaterFlow' + item).fontSize(12).height('16')
              Image($r('app.media.icon')).width(50).height(50).objectFit(ImageFit.Fill)
            }
          }
        }, (item: Int, index: int) => String(item))
      } .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Circle') {
      Circle({ width: 150, height: 150 }) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Ellipse') {
      Ellipse({ width: 150, height: 80 }) .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Line') {
      Line()
        .startPoint([0, 0])
        .endPoint([50, 100])
        .stroke(Color.Black)
      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Polyline') {
      Polyline({ width: 100, height: 100 } as PolylineOptions)
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
      Shape() {
        Path().width(20).height(20).commands('M0 0 L400 0 L400 150 Z')
      }
      .viewPort({ x: -20, y: -5, width: 310, height: 90 })
      .fill(0x317AF7)
      .stroke(0xEE8443)
      .strokeWidth(10)
      .strokeLineJoin(LineJoinStyle.Miter)
      .strokeMiterLimit(5)
      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'ColumnSplit') {
      ColumnSplit() {
        Text('1').width('100%').height(20).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      }

      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'RowSplit') {
      RowSplit() {
        Text('1').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      } .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Blank') {
      Blank() .applyStyles(this.commonStyle)
    }
  }

  build() {
    Column() {
      if (this.containerView == 'FlexNoReference') {
        Flex({ direction: this._direction, alignItems: ItemAlign.Start, wrap: this._wrap }) {
          this.buildTargetView();
        }
        .width(this.parentWidth)
        .height(this.parentHeight)
        .backgroundColor(Color.Green)
        .key(this.parentComponentKey)
      } else if (this.containerView == 'Flex') {
        Flex({ direction: this._direction, alignItems: ItemAlign.Start, wrap: this._wrap }) {
          this.buildTargetView();
          Button('referenceComponent')
            .width(this.compareWidth)
            .height(this.compareHeight)
            .key(this.referenceComponentKey)
        }
        .width(this.parentWidth)
        .height(this.parentHeight)
        .backgroundColor(Color.Green)
        .key(this.parentComponentKey)
      }
    }.backgroundColor(Color.Yellow)
  }
}