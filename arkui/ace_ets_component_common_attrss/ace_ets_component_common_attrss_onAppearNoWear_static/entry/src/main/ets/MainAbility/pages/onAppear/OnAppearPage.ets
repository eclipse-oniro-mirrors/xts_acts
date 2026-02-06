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
import {
  Entry,CommonMethod,Text,Column,Button,Component,FlexDirection,ItemAlign,FlexAlign,FontWeight,$r,TextInput,TextArea,List,ListItem,Search,Image,
  Grid,GridItem,Rating,MenuItemGroup,MenuItem,Menu,ImageAnimator,DatePicker,CheckboxGroup,Checkbox,Search,Counter,ColumnSplit,AlphabetIndexer,Web,Toggle,
  TimePicker,TextPicker,Slider,Select,Swiper,Tabs,TabContent,SideBarContainer,Scroll,RowSplit,GridCol,ForEach,Row,GridRow,Flex,Color,
  FlexAlign,ColumnOptions,Scroller,Margin,TextAlign,MenuItemOptions,Radio,ToggleType,GridRowDirection,Axis,ListItemGroup,SideBarContainerType,Stack,BreakPoints,GridRowOptions,GutterOption,BreakpointsReference,
  GridColColumnOption,TextTimerController,Blank,DataPanel,Divider,Gauge,LoadingProgress,Marquee,Navigation,PatternLock,Progress,QRCode,RichText,ScrollBar,TextClock,TextTimer,Badge,
  WaterFlow,Refresh,RelativeContainer,BarState,Circle,Ellipse,applyStyles,Line,Polyline,Polygon,Path,Rect,Shape,BadgeParamWithNumber,FlowItem,VerticalAlign,HorizontalAlign
} from '@ohos.arkui.component'
import Utils, { SetValue } from '../../common/Utils';
import { attrsManager } from '../../common/AttrsManager';
import { RouterParams } from '../../common/Utils';
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct OnAppearPage {
  @State changeAppear: string = '';
  @State targetView: string = ''
  @State targetGroupView: string = ''
  @State componentKey: string = ''
  @State compareTextKey: string = ''
  @State targetWidth: number = 200
  @State targetHeight: number = 200
  textTimerController: TextTimerController = new TextTimerController() //Use by TextTimer
  private scroller: Scroller = new Scroller()
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G']; //Use by AlphabetIndexer TextPicker
  private src: string = 'Running Marquee starts rolling A B C D E F G H I J'; //Use by Marquee QRCode

  onPageShow() {
    console.info('OnAppearPage show called ')
    try {
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;

      this.targetView = routerParamOptions.view.targetView
      this.targetGroupView = routerParamOptions.view.targetGroupView
      this.componentKey = routerParamOptions.view.componentKey
      this.compareTextKey = routerParamOptions.view.compareTextKey
      this.targetWidth = routerParamOptions.view.targetWidth
      this.targetHeight = routerParamOptions.view.targetHeight
    } catch (error) {
      console.log(' routerParamOptions error ' + error);
    }
  }

  /*
   * Set common style.
   */

  commonStyle(instance: CommonMethod) {
    instance.width(this.targetWidth)
    instance.height(this.targetHeight)
    instance.key(this.componentKey)
    instance.onAppear(() => {
      console.info('onAppear onAppear');
      this.changeAppear = 'onAppear';
      console.info('this.changeAppear:' + this.changeAppear);
    })
  }
  //Draw screen
  build() {
    Row() {
      Text(this.changeAppear).key(this.compareTextKey)
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
      } else if (this.targetView == 'MenuItem') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions).backgroundColor(Color.Pink).applyStyles(this.commonStyle)
        }
      } else if (this.targetView == 'MenuItemGroup') {
        Menu() {
          MenuItemGroup({ header: 'MenuItemGroup' }) {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
          }.applyStyles(this.commonStyle)
        }
      } else if (this.targetView == 'Navigation') {
        Navigation({})
          .backgroundColor(Color.Pink)
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'PatternLock') {
        PatternLock()
          .sideLength(this.targetWidth)
          .key(this.componentKey)
          .onAppear(() => {
            console.info('onAppear onAppear');
            this.changeAppear = 'onAppear';
            console.info('this.changeAppear:' + this.changeAppear);
          })
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
          count: 50,
          style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
        }  as BadgeParamWithNumber) {
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
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem().backgroundColor(Color.Pink).applyStyles(this.commonStyle)
        }
      } else if (this.targetView == 'GridRow') {
        GridRow()
          .backgroundColor(Color.Pink)
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'GridCol') {
        GridRow() {
          GridCol() {
            Text('GridCol')
          }.backgroundColor(Color.Pink).applyStyles(this.commonStyle)
        }
      } else if (this.targetView == 'Grid') {
        Grid() {
          GridItem() {
            Text('Grid').backgroundColor(Color.White)
          }
        }
        .backgroundColor(Color.Pink)
        .applyStyles(this.commonStyle)
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem().backgroundColor(Color.Pink).applyStyles(this.commonStyle)
        }
      } else if (this.targetView == 'List') {
        List()
          .backgroundColor(Color.Pink)
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'ListItem') {
        List() {
          ListItem() {
            Button('ListItem')
          }
          .backgroundColor(Color.Pink)
          .applyStyles(this.commonStyle)
        }.width(60).height(60)
      } else if (this.targetView == 'ListItemGroup') {
        List() {
          ListItemGroup().backgroundColor(Color.Pink).applyStyles(this.commonStyle)
        }.width(60).height(60)
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
            })
            .id('OnAppear')
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
            ForEach(new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9), (item: number, index:Int):void => {
              Text('Scroll' + item.toString())
                .width('90%')
                .height(150)
                .backgroundColor(Color.White)
                .textAlign(TextAlign.Center)
            }, (item: number, index:Int):string => String(item))
          }.width('100%')
        }.scrollBar(BarState.On).applyStyles(this.commonStyle)
      } else if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed) {
          Column() {
            ForEach(new Array<number>(1, 2, 3), (item: number, index:Int):void => {
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
        }.applyStyles(this.commonStyle)
      } else if (this.targetView == 'Stack') {
        Stack()
          .backgroundColor(Color.Pink)
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Swiper') {
        Swiper() {
          ForEach(new Array<number>(1, 2, 3), (item: number, index:Int):void => {
            Text('Swiper' + item)
          }, (item: number, index:Int):string => String(item))
        }
        .indicator(true)
        .backgroundColor(Color.Pink)
        .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Tabs') {
        Tabs()
          .backgroundColor(Color.Pink)
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent() {
            Text('TabContent Test')
          }.backgroundColor(Color.Pink).applyStyles(this.commonStyle)
        }.width(60).height(60)
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
          .points([[0, 0], [0, 100], [100, 100], [100, 0]])
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
    }.width('100%').height('100%').backgroundColor(Color.Green)
  }
}