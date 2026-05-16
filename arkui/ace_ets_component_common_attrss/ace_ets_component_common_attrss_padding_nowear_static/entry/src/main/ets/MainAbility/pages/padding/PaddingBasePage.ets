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
import { attrsManager  }  from '../../common/AttrsManager';
import { RouterParams , SetValue, RectValue } from '../../common/Utils';
import router from '@ohos.router'
import {
  Entry,
  Component,
  Text,
  AlphabetIndexer,Checkbox,CheckboxGroup,DataPanel,DatePicker,Divider,Gauge,ImageAnimator,LoadingProgress,Marquee,Menu,Navigation,
  Progress,QRCode,Radio,Rating,ScrollBar,Select,Slider,TextArea,TextClock,TextInput,TextPicker,TextTimer,TimePicker,Toggle,Badge,
  Counter,GridRow,Grid,List,RelativeContainer,Row,Refresh,TextAlign,SideBarContainer,Stack,Swiper,Tabs,WaterFlow,
  Circle,Ellipse,Line,Polyline,Polygon,Path,Rect,Shape,ColumnSplit,RowSplit,Blank,applyStyles
,Builder,Button,DataPanelType,Color,Image,MenuItem,ProgressType,BarState,Search,SliderStyle,Axis,ToggleType,Column,Flex,GridRowDirection,GridCol
,GridItem,ListItem,Scroll,SideBarContainerType,TabContent,FlowItem,$r,MenuItemOptions,Scroller,BadgeParamWithNumber,BadgeStyle,GridColOptions,GridColColumnOption,
  AlignRuleOption,VerticalAlign,HorizontalAlign,ColumnOptions,FlexAlign,ImageFit,Position,PolylineOptions,RectOptions,FlexDirection
,Padding,Web,WebviewController,RichText,MenuItemGroup,CommonMethod
} from '@ohos.arkui.component'

import { MessageManager, Callback } from '../../common/MessageManager';
import { AppStorage, State,StoragePropRef } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { Color } from '@ohos.arkui.component'
interface ViewOption {
targetView: string
componentKey: string
parentBackGroundColor: Color
parentComponentKey: string
}
interface RouterParamOptions {
  view: ViewOption
}
@Entry
@Component
struct paddingPage {
  //Use for TimePicker.
  private selectedTime: Date = new Date('2022-07-22T08:00:00');
  //Use for QRCode,Marquee.
  private src: string = 'Running Marquee starts rolling';
  //Use for AlphabetIndexer,TextPicker.
  private value: string[] = ['#', 'A', 'B'];
  //Use for DataPanel.
  public valueArr: Array<number> = [5, 10, 10, 7, 9, 10, 10, 10, 10] as Array<number>;
  @StoragePropRef('_padding') _padding: Padding|String|number = { left: 0, right: 0, top: 0, bottom: 0 } as Padding;
  @State targetView: string = ''
  @State componentKey: string = ''
  @State parentBackGroundColor: Color = Color.Pink
  @State parentComponentKey: string = ''

  onPageShow() {
    console.info('padding page show called ')
    try {
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
      AppStorage.setOrCreate<Padding>('_padding', (routerParamOptions.view.testValue.setValue as SetValue)!.padding as Padding)
      this.targetView = routerParamOptions.view.targetView
      this.componentKey = routerParamOptions.view.componentKey
      this.parentBackGroundColor = routerParamOptions.view.parentBackGroundColor
      this.parentComponentKey = routerParamOptions.view.parentComponentKey

  } catch (error: Error) {
    console.log(' routerParamOptions error ' + error);
  }
  }

  commonStyle(instance: CommonMethod) {
    instance.padding(this._padding)
    instance.key(this.componentKey)
  }
  build() {
    Row() {
      if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Text') {
        Text('1').applyStyles(this.commonStyle)
      } else if (this.targetView == 'Button') {
        Button('1').applyStyles(this.commonStyle)
      } else if (this.targetView == 'BlankRow') {
        Row() {
          Blank().color(Color.Red).applyStyles(this.commonStyle)
        }
      } else if (this.targetView == 'BlankColumn') {
        Column() {
          Blank().color(Color.Orange).applyStyles(this.commonStyle)
        }
      } else if (this.targetView == 'Checkbox') {
        Checkbox().backgroundColor(Color.Orange).applyStyles(this.commonStyle)
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup({ group: 'checkboxGroup' }).applyStyles(this.commonStyle).backgroundColor(Color.Orange)
      } else if (this.targetView == 'DataPanel') {
        DataPanel({ values: this.valueArr }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'DatePicker') {
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1'),
        }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Divider') {
        Divider().strokeWidth(8).color(Color.Red).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Gauge') {
        Gauge({ value: 105 }).applyStyles(this.commonStyle)
        .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon')).applyStyles(this.commonStyle)
        .height(110).backgroundColor(Color.Red)
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([
            {
              src: $r('app.media.icon')
            }
          ]).applyStyles(this.commonStyle)
      } else if (this.targetView == 'LoadingProgress') {
        LoadingProgress().backgroundColor(Color.Red).applyStyles(this.commonStyle)
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
        QRCode(this.src).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' }).checked(true)
          .applyStyles(this.commonStyle)
          .backgroundColor(Color.Red)
      } else if (this.targetView == 'Rating') {
        Rating({ rating: 3.5 }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'RichText') {
        RichText('RichText').applyStyles(this.commonStyle)
      } else if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
          Text()
            .width(10)
            .height(50)
            .backgroundColor('#C0C0C0')
        }
        .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Search') {
        Search()
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Select') {
        Select([{ value: 'aaa' },
          { value: 'bbb' }])
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Slider') {
        Slider({
          value: 50,
        }).showTips(true).applyStyles(this.commonStyle)
      } else if (this.targetView == 'TextArea') {
        TextArea({
          placeholder: 'The text area can hold an unlimited amount of text. input your word...'
        }).placeholderFont({ size: 16, weight: 400 }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'TextClock') {
        TextClock({ timeZoneOffset: -8 }).format('hms').applyStyles(this.commonStyle)
      } else if (this.targetView == 'TextInput') {
        TextInput({ placeholder: 'input your word...' }).applyStyles(this.commonStyle)
        .height(40)
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: this.value }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 }).format('mm:ss.SS').applyStyles(this.commonStyle)
      } else if (this.targetView == 'TimePicker') {
        TimePicker({
          selected: this.selectedTime,
        }).useMilitaryTime(true).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch, isOn: false }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Web') {
        Web({ src: 'www.example.com', controller: new WebviewController() }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Circle') {
        Circle().applyStyles(this.commonStyle)
      } else if (this.targetView == 'Ellipse') {
        Ellipse().applyStyles(this.commonStyle)
      } else if (this.targetView == 'Line') {
        Line()
          .startPoint([0, 0])
          .endPoint([50, 100])
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Polyline') {
        Polyline()
          .applyStyles(this.commonStyle)
          .points(
           [ [20,0],[0,100],[100,90]]
          )
      } else if (this.targetView == 'Polygon') {
        Polygon()
          .applyStyles(this.commonStyle)
          .points([[0, 0], [0, 100], [100, 100], [100, 0]]
        )
      } else if (this.targetView == 'Path') {
        Path()
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Rect') {
        Rect()
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Shape') {
        Shape() {
          Rect().width(100).height(50)
        }
        .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions )
        }.backgroundColor(Color.Yellow).applyStyles(this.commonStyle)
      } else if (this.targetView == 'MenuItem') {
        Row() {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions )
              .padding(this._padding)
              .key(this.componentKey)
          }
        }
      } else if (this.targetView == 'MenuItemGroup') {
        Row() {
          Menu() {
            MenuItemGroup({ header: 'MenuItemGroup' }) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
            }.key(this.componentKey).padding(this._padding)
          }
        }
      }
    }.backgroundColor(this.parentBackGroundColor)
  }
}