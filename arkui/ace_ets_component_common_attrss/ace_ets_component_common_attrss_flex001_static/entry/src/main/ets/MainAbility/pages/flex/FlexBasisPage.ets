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
import AttrsManager from '../../common/AttrsManager';
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
  NavPathStack,
  GutterOption,
  BreakPoints,
  ForEach,
  ImageFit,
  BreakpointsReference,
  CommonMethod,
  applyStyles,
  LineJoinStyle,AlignRuleOption
} from '@ohos.arkui.component'


@Entry
@Component
struct FlexBasisPage {
  @StoragePropRef('_flexBasis') _flexBasis: number | string = 0.0
  @State targetView: string = ''
  @State containerView: string = ''
  @State componentKey: string = ''
  @State parentWidth: number = 0
  @State parentHeight: number = 0
  @State targetWidth: number = 0
  @State targetHeight: number = 0

  onPageShow() {
    let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
    AppStorage.setOrCreate('_flexBasis', routerParamOptions.view.testValue.setValue.flexBasis)
    console.info('xxxyyybbb: [FlexBasis] page show called ' + JSON.stringify(routerParamOptions))
    this.targetView = routerParamOptions.view.targetView ?? ''
    this.containerView = routerParamOptions.view.containerView ?? ''
    this.componentKey = routerParamOptions.view.componentKey as string ?? ''
    this.parentWidth = routerParamOptions.view.parentWidth
    this.parentHeight = routerParamOptions.view.parentHeight
    this.targetWidth = routerParamOptions.view.targetWidth
    this.targetHeight = routerParamOptions.view.targetHeight
  }

  commonStyle(instance: CommonMethod) {
    instance.margin(0)
    instance.flexBasis(this._flexBasis)
    instance.width(this.targetWidth)
    instance.height(this.targetHeight)
    instance.backgroundColor(Color.White)
    instance.key(this.componentKey)
  }

  @Builder
  buildTargetView() {
    if (this.targetView == 'AlphabetIndexer') {
      AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 })
        .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Button') {
      Button('button1').applyStyles(this.commonStyle)
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
      Divider().strokeWidth(8).vertical(true).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Gauge') {
      Gauge({ value: 75 }).colors([[Color.White, 1], [Color.Black, 1]]).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Image') {
      Image($r('app.media.icon')).applyStyles(this.commonStyle)
    } else if (this.targetView == 'ImageAnimator') {
      ImageAnimator().images([{ src: $r('app.media.icon') }]).applyStyles(this.commonStyle)
    } else if (this.targetView == 'LoadingProgress') {
      LoadingProgress().color(Color.Blue).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Marquee') {
      Marquee({ start: true, step: 50, src: 'Running Marquee starts rolling' })
        .fontWeight(700).fontColor(Color.White).fontSize(48).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Menu') {
      Menu() {
        MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
      }.applyStyles(this.commonStyle).constraintSize({ minWidth: 0 })
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
      // }//.commonStyle()
    } else if (this.targetView == 'Progress') {
      Progress({ value: 50, type: ProgressType.Linear }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'QRCode') {
      QRCode('QRCode').color(0xF7CE00).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Radio') {
      Radio({ value: 'Radio1', group: 'radioGroup' }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Rating') {
      Rating({ rating: 4 }).stars(5).applyStyles(this.commonStyle)
    } else if (this.targetView == 'ScrollBar') {
      ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
        Text().width(20).height(20).borderRadius(10)
      }.width(20).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Search') {
      Search({ placeholder: 'Type to search...' })
        .searchButton('SEARCH')
        .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Select') {
      Select([{ value: 'aaa', icon: '/common/public_icon.svg' },
        { value: 'bbb', icon: '/common/public_icon.svg' }])
        .applyStyles(this.commonStyle)
        .constraintSize({ minWidth: 0 })
    } else if (this.targetView == 'Slider') {
      Slider({ value: 50, style: SliderStyle.OutSet, direction: Axis.Vertical })
        .blockColor('#191970')
        .trackColor('#ADD8E6')
        .selectedColor('#4169E1')
        .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Text') {
      Text('text').fontColor(Color.White).fontSize(30).applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextArea') {
      TextArea({ placeholder: 'TextArea', }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextClock') {
      TextClock({ timeZoneOffset: -8 }).format('hms').applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextInput') {
      TextInput({ placeholder: 'TextInput' }).applyStyles(this.commonStyle)
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
        style: { badgeSize: 6, badgeColor: Color.Red } as BadgeStyle
      } as BadgeParamWithString) {
        Button('BadgeContent')
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Column') {
      Column().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Counter') {
      Counter() {
        Text('1')
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Flex') {
      Flex().applyStyles(this.commonStyle)
    } else if (this.targetView == 'GridRow') {
      GridRow({
        columns: 5,
        direction: GridRowDirection.Row
      }) {
        GridCol({
          span: {
            xs: 1,
            sm: 2,
            md: 3,
            lg: 4
          } as GridColColumnOption
        }) {
          Row().width('100%').height('20vp')
        }
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Grid') {
      Grid() {
        GridItem() {
          Text()
            .width('100%').height('100%').textAlign(TextAlign.Center)
        }
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')

      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'List') {
      List({ space: 20, initialIndex: 0 }) {
        ListItem() {
          Text('')
            .width('100%')
            .textAlign(TextAlign.Center)
        }
      }
      .listDirection(Axis.Vertical)

      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Navigator') {
      // Navigator({ target: 'MainAbility/pages/index/Index' }) {
      //   Text('Navigator Go to index page')
      //     .width('100%').textAlign(TextAlign.Center)
      // }//.commonStyle()
    } else if (this.targetView == 'RelativeContainer') {
      RelativeContainer() {
        Row()
          .width(100)
          .height(100)
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            left: { anchor: '__container__', align: HorizontalAlign.Start }
          } as AlignRuleOption)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Row') {
      Row().applyStyles(this.commonStyle)
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
          Text('Scroll')
            .width('90%')
            .height(10)
            .textAlign(TextAlign.Center)
        }.width('100%')
      }
      .scrollBar(BarState.On)

      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'SideBarContainer') {
      SideBarContainer(SideBarContainerType.Embed) {
        Column() {
          Column({ space: 5 } as ColumnOptions) {
            Image($r('app.media.icon')).width(64).height(64)
            Text('Index0').fontSize(25)
          }
        }.width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)

        Column() {
          Text('SideBarContainer content').fontSize(25)
        }
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Stack') {
      Stack() {
        Text('Stack').fontColor(Color.White)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Swiper') {
      Swiper() {
        Text('Swiper').width('90%').height(160)
      }

      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Tabs') {
      Tabs() {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'WaterFlow') {
      WaterFlow() {
        FlowItem() {
          Column() {
            Text('WaterFlow').fontSize(12).height('16')
            Image($r('app.media.icon')).width(50).height(50).objectFit(ImageFit.Fill)
          }
        }
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Circle') {
      Circle({ width: 150, height: 150 }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Ellipse') {
      Ellipse({ width: 150, height: 80 }).applyStyles(this.commonStyle)
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
      // Shape() {
      //   Path().width(20).height(20).commands('M0 0 L400 0 L400 150 Z')
      // }
      // .viewPort({ x: -20, y: -5, width: 310, height: 90 })
      // .fill(0x317AF7)
      // .stroke(0xEE8443)
      // .strokeWidth(10)
      // .strokeLineJoin(LineJoinStyle.Miter)
      // .strokeMiterLimit(5)
      // .applyStyles(this.commonStyle)
    } else if (this.targetView == 'ColumnSplit') {
      ColumnSplit() {
        Text('1').width('100%').height(20).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      }

      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'RowSplit') {
      RowSplit() {
        Text('1').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Blank') {
      Blank().applyStyles(this.commonStyle)
    }
  }

  build() {
    Column() {
      if (this.targetView == 'GridCol') {
        //for GridCol
        GridRow() {
          GridCol() {
            Row().width('100%').height('20vp')
          }.applyStyles(this.commonStyle)
        }
        .width(this.parentWidth)
        .height(this.parentHeight)
        .backgroundColor(Color.Green)
      } else {
        //for different containerView
        if (this.containerView == 'Row') {
          Row() {
            this.buildTargetView();
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .backgroundColor(Color.Green)
        } else if (this.containerView == 'Column') {
          Column() {
            this.buildTargetView();
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .backgroundColor(Color.Green)
        } else if (this.containerView == 'FlexRow') {
          Flex({ direction: FlexDirection.Row }) {
            this.buildTargetView();
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .backgroundColor(Color.Green)
        } else if (this.containerView == 'FlexRowReverse') {
          Flex({ direction: FlexDirection.RowReverse }) {
            this.buildTargetView();
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .backgroundColor(Color.Green)
        } else if (this.containerView == 'FlexColumn') {
          Flex({ direction: FlexDirection.Column }) {
            this.buildTargetView();
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .backgroundColor(Color.Green)
        } else if (this.containerView == 'FlexColumnReverse') {
          Flex({ direction: FlexDirection.ColumnReverse }) {
            this.buildTargetView();
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .backgroundColor(Color.Green)
        }
      }
    }.backgroundColor(Color.Yellow).width('100%').height('100%')
  }
}