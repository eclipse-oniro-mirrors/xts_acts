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
import router from '@ohos.router';
import { DisplayValue, RouterParams } from '../../common/Utils';
import { AppStorage, State, StoragePropRef } from '@ohos.arkui.stateManagement';
import {
  $r,
  AlphabetIndexer,
  applyStyles,
  Axis,
  Badge,
  BadgeParamWithString,
  BadgeStyle,
  BarState,
  Blank,
  Builder,
  Button,
  Checkbox,
  CheckboxGroup,
  Circle,
  Color,
  Column,
  ColumnOptions,
  ColumnSplit,
  CommonMethod,
  Component,
  Counter,
  DataPanel,
  DataPanelType,
  DatePicker,
  Divider,
  Ellipse,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlowItem,
  ForEach,
  Gauge,
  Grid,
  GridCol,
  GridColColumnOption,
  GridItem,
  GridRow,
  GridRowDirection,
  HorizontalAlign,
  Image,
  ImageAnimator,
  ItemAlign,
  Line,
  List,
  ListItem,
  LoadingProgress,
  Marquee,
  Menu,
  MenuItem,
  MenuItemOptions,
  Navigation,
  NavPathStack,
  Path,
  Polygon,
  Polyline,
  PolylineOptions,
  Progress,
  ProgressType,
  QRCode,
  Radio,
  Rating,
  Rect,
  RectOptions,
  Refresh,
  RelativeContainer,
  Row,
  RowSplit,
  Scroll,
  ScrollBar,
  Scroller,
  Search,
  Select,
  Shape,
  SideBarContainer,
  SideBarContainerType,
  Slider,
  SliderStyle,
  Stack,
  Swiper,
  TabContent,
  Tabs,
  Text,
  TextAlign,
  TextArea,
  TextClock,
  TextInput,
  TextPicker,
  TextTimer,
  TextTimerController,
  TimePicker,
  Toggle,
  ToggleType,
  VerticalAlign,
  WaterFlow,
} from '@ohos.arkui.component'


@Entry
@Component
struct DisplayPriorityPage {
  @StoragePropRef("_displayPriority") _displayPriority: number = 1.0
  @StoragePropRef("_compareOneButtonDisplayPriority") _compareOneButtonDisplayPriority: number = 2.0
  @State containerView: string = ''
  @State targetView: string = ''
  @State targetGroupView: string = ''
  @State componentKey: string = ''
  @State targetWidth: number = 0.0
  @State targetHeight: number = 0.0
  @State compareOneButtonWidth: number = 0.0
  @State compareOneButtonHeight: number = 0.0
  @State compareOneButtonDisplayPriority: number = 0.0
  @State compareOneButtonKey: string = ''
  @State compareTwoButtonWidth: number = 0.0
  @State compareTwoButtonHeight: number = 0.0
  @State compareTwoButtonDisplayPriority: number = 0.0
  @State compareTwoButtonKey: string = ''
  @State parentWidth: number = 0.0
  @State parentHeight: number = 0.0
  @State parentKey: string = ''
  textTimerController: TextTimerController = new TextTimerController()
  private scroller: Scroller = new Scroller()
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'];
  private src: string = 'Running Marquee starts rolling A B C D E F G H I J K L M N O P Q R S T U V W X Y Z';

  onPageShow() {
    console.info('DisplayPriorityPage page show called');

    let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
    AppStorage.setOrCreate<number>('_displayPriority', routerParamOptions.view.testValue.setValue.displayPriority!)
    this._compareOneButtonDisplayPriority =
      routerParamOptions.view.testValue.setValue.compareOneButtonDisplayPriority ?? 2.0
    // if (routerParamOptions.view.testValue.setValue.compareOneButtonDisplayPriority) {
    //   AppStorage.setOrCreate<number>('_compareOneButtonDisplayPriority',
    //     routerParamOptions.view.testValue.setValue.compareOneButtonDisplayPriority!)
    // }

    console.log('test start displayPriority: ' + routerParamOptions.view.testValue.setValue.displayPriority + ' ' +
    this._displayPriority)
    console.log('test start compareOneButtonDisplayPriority: ' +
    routerParamOptions.view.testValue.setValue.compareOneButtonDisplayPriority + ' ' +
    this._compareOneButtonDisplayPriority)

    try {
      console.log('aboutToAppear routerParamOptions before' + this.targetView)
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
      this.containerView = routerParamOptions.view.containerView ?? ''
      this.targetView = routerParamOptions.view.targetView
      this.targetGroupView = routerParamOptions.view.targetGroupView ?? ''
      this.componentKey = routerParamOptions.view.componentKey ?? ''
      this.targetWidth = routerParamOptions.view.targetWidth ?? 0.0
      this.targetHeight = routerParamOptions.view.targetHeight ?? 0.0
      this.compareOneButtonWidth = routerParamOptions.view.compareOneButtonWidth ?? 0.0
      this.compareOneButtonHeight = routerParamOptions.view.compareOneButtonHeight ?? 0.0
      this.compareOneButtonDisplayPriority = routerParamOptions.view.compareOneButtonDisplayPriority ?? 0.0
      this.compareOneButtonKey = routerParamOptions.view.compareOneButtonKey ?? ''
      this.compareTwoButtonWidth = routerParamOptions.view.compareTwoButtonWidth ?? 0.0
      this.compareTwoButtonHeight = routerParamOptions.view.compareTwoButtonHeight ?? 0.0
      this.compareTwoButtonDisplayPriority = routerParamOptions.view.compareTwoButtonDisplayPriority ?? 0.0
      this.compareTwoButtonKey = routerParamOptions.view.compareTwoButtonKey ?? ''
      this.parentWidth = routerParamOptions.view.parentWidth
      this.parentHeight = routerParamOptions.view.parentHeight
      this.parentKey = routerParamOptions.view.parentKey ?? ''

      console.log('aboutToAppear routerParamOptions success' + this.targetView)
    } catch (error: Error) {
      console.log(' routerParamOptions error ' + error);
    }
  }

  /*
   * Set common style.
   */

  commonStyle(instance: CommonMethod) {
    instance.key(this.componentKey)
    instance.width(this.targetWidth)
    instance.height(this.targetHeight)
    instance.displayPriority(this._displayPriority)
  }

  @Builder
  buildTargetView() {
    Button('compareOneButton')
      .displayPriority(this._compareOneButtonDisplayPriority)
      .width(this.compareOneButtonWidth)
      .height(this.compareOneButtonHeight)
      .backgroundColor(Color.Yellow)
      .key(this.compareOneButtonKey)
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
        .margin(0)
        .applyStyles(this.commonStyle)
    } else if (this.targetView == 'CheckboxGroup') {
      CheckboxGroup({ group: 'checkboxGroup' })
        .margin(0)
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
        .colors([['0x317AF7', 1], ['0x5BA854', 1], ['0xE08C3A', 1], ['0x9C554B', 1]])
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
    } else if (this.targetView == 'NavRouter') {
      // Navigation(new NavPathStack()).backgroundColor(Color.Pink).applyStyles(this.commonStyle)
      // NavRouter().backgroundColor(Color.Pink).applyStyles(this.commonStyle)
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
        .margin(0)
        .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Rating') {
      Rating()
        .backgroundColor(Color.Pink)
        .applyStyles(this.commonStyle)
    } else if (this.targetView == 'ScrollBar') {
      ScrollBar({ scroller: this.scroller }) {
        Text('1')
      }.backgroundColor(Color.Pink).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Search') {
      Search()
        .backgroundColor(Color.Pink)
        .margin(0)
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
        .margin(0)
        .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Badge') {
      Badge({
        value: '',
        style: { badgeSize: 6, badgeColor: '#FA2A2D' } as BadgeStyle
      } as BadgeParamWithString) {
        Text('1')
      }.backgroundColor(Color.Pink).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Column') {
      Column()
        .backgroundColor(Color.Pink)
        .applyStyles(this.commonStyle)
    } else if (this.targetView == 'ColumnSplit') {
      ColumnSplit() {
        Text('1').width('100%').height(50).backgroundColor('0xF5DEB3').textAlign(TextAlign.Center)
        Text('2').width('100%').height(50).backgroundColor('0xD2B48C').textAlign(TextAlign.Center)
        Text('3').width('100%').height(50).backgroundColor('0xF5DEB3').textAlign(TextAlign.Center)
      }
      .backgroundColor(Color.Pink)
      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Counter') {
      Counter()
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
        }.backgroundColor(Color.Pink)
      }.applyStyles(this.commonStyle)
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
    } else if (this.targetView == 'Navigator') {
      // Navigator()
      //   .backgroundColor(Color.Pink)
      //   .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Panel') {
      // Panel(true)
      //   .backgroundMask(Color.Pink)
      //   .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Refresh') {
      Refresh({ refreshing: false })
        .backgroundColor(Color.Pink)
        .applyStyles(this.commonStyle)
    } else if (this.targetView == 'RelativeContainer') {
      RelativeContainer() {
        Text('1')
      }.backgroundColor(Color.Pink).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Row') {
      Row()
        .backgroundColor(Color.Pink)
        .applyStyles(this.commonStyle)
    } else if (this.targetView == 'RowSplit') {
      RowSplit() {
        Text('Text')
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Scroll') {
      Scroll(this.scroller) {
        Text('1')
      }.backgroundColor(Color.Pink).applyStyles(this.commonStyle)
    } else if (this.targetView == 'SideBarContainer') {
      SideBarContainer(SideBarContainerType.Embed) {
        Column() {
          Text('SideBarContainer content')
        }.backgroundColor(Color.Orange)
      }
      .backgroundColor(Color.Pink)
      .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Stack') {
      Stack()
        .backgroundColor(Color.Pink)
        .applyStyles(this.commonStyle)
    } else if (this.targetView == 'Swiper') {
      Swiper() {
        ForEach([1, 2, 3], (item: Int, index: Int) => {
          Text('Swiper' + item)
        }, (item: Int, index: Int) => String(item))
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
    }
    Button('compareTwoButton')
      .displayPriority(this.compareTwoButtonDisplayPriority)
      .width(this.compareTwoButtonWidth)
      .height(this.compareTwoButtonHeight)
      .backgroundColor(Color.Red)
      .key(this.compareTwoButtonKey)
  }

  //Draw screen
  build() {
    if (this.containerView == 'Row') {
      Row() {
        this.buildTargetView();
      }
      .width(this.parentWidth)
      .height(this.parentHeight)
      .backgroundColor(Color.Green)
      .key(this.parentKey)
    } else if (this.containerView == 'Column') {
      Column() {
        this.buildTargetView();
      }.width(this.parentWidth)
      .height(this.parentHeight)
      .backgroundColor(Color.Green)
      .key(this.parentKey)
    } else if (this.containerView == 'Flex') {
      Flex() {
        this.buildTargetView();
      }
      .width(this.parentWidth)
      .height(this.parentHeight)
      .backgroundColor(Color.Green)
      .key(this.parentKey)
    }
  }
}