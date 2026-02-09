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
import { Entry, Component, Column, Scroller, Row, /*WebController,*/ TextTimerController } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { RouterParams } from '../../common/Utils';
import router from '@ohos.router';
import { AlphabetIndexer, Blank, Button, Checkbox, CheckboxGroup, DataPanel, DatePicker, Divider, Gauge, Image, ImageAnimator, LoadingProgress, Marquee,
  Menu, Navigation, Progress, QRCode, Radio, Rating, RichText, ScrollBar, Search, Select, Slider, Text,
  TextArea, TextClock, TextInput, TextPicker, TextTimer, TimePicker, Toggle, Web, Badge, ColumnSplit, Counter, Flex, WaterFlow, GridRow,
  Grid, List, Refresh, RelativeContainer, RowSplit, Scroll, SideBarContainer, Stack, Swiper, Tabs, Circle,
  Ellipse, Line, Polyline, Polygon, Path, Rect, Shape, Color, $r, MenuItem, MenuItemGroup, ToggleType, TextAlign, FlowItem, GridCol, GridItem,
  ListItem, ListItemGroup, SideBarContainerType, NavPathStack, TabContent, MenuItemOptions, BadgeParam, BadgeStyle, BadgeParamWithString,
  CommonMethod,applyStyles, WebviewController, Builder } from '@ohos.arkui.component'
import { RouterParams } from '../../common/Utils';

@Entry
@Component
struct DefaultPage {
  @State targetGroupView: string = ''
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G']; //Use by AlphabetIndexer TextPicker
  private Marquee_src: string = 'Running Marquee starts rolling A B C D E F G H I J K L'; //Use by Marquee QRCode
  // controller: WebviewController = new WebviewController() //Use by Web
  textTimerController: TextTimerController = new TextTimerController() //Use by TextTimer
  private scroller: Scroller = new Scroller() //Use by ScrollBar Scroll
  @State targetView: string = ''
  @State componentKey: string = ''
  @State parentWidth: number = 100
  @State parentHeight: number = 100
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
    try {
      let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
      this.targetView = routerParamOptions.view.targetView
      this.componentKey = routerParamOptions.view.componentKey ?? ""
      this.parentWidth = routerParamOptions.view.parentWidth
      this.parentHeight = routerParamOptions.view.parentHeight
      this.targetGroupView = routerParamOptions.view.targetGroupView  ?? ""
    } catch (error: Error) {
      console.log(' routerParamOptions error ' + error);
    }
  }

  aboutToAppear(){

  }
  
  globalFancy(instance: CommonMethod){
    instance.key(this.componentKey)
  }

  //Draw screen
  build() {
    Row() {
      if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 }).applyStyles(this.globalFancy)
      } else if (this.targetView == 'Blank') {
        Blank().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Button') {
        Button('button').applyStyles(this.globalFancy)
      } else if (this.targetView == 'Checkbox') {
        Checkbox().applyStyles(this.globalFancy)
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup().applyStyles(this.globalFancy)
      } else if (this.targetView == 'DataPanel') {
        DataPanel({ values: [25] }).applyStyles(this.globalFancy)
      } else if (this.targetView == 'DatePicker') {
        DatePicker().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Divider') {
        Divider().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Gauge') {
        Gauge({ value: 75 }).applyStyles(this.globalFancy)
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon')).applyStyles(this.globalFancy)
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([{ src: $r('app.media.icon') }])
          .applyStyles(this.globalFancy)
      } else if (this.targetView == 'LoadingProgress') {
        LoadingProgress().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Marquee') {
        Marquee({
          start: true,
          src: this.Marquee_src
        }).applyStyles(this.globalFancy)
      } else if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }.applyStyles(this.globalFancy)
      } else if (this.targetView == 'MenuItem') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions).applyStyles(this.globalFancy)
        }
      } else if (this.targetView == 'MenuItemGroup') {
        Menu() {
          MenuItemGroup({ header: 'MenuItemGroup' }) {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
          }.applyStyles(this.globalFancy)
        }
      } else if (this.targetView == 'Navigation') {
        Navigation().applyStyles(this.globalFancy)
      } else if (this.targetView == 'NavRouter') {
        // NavRouter().commonStyle()
      } else if (this.targetView == 'Progress') {
        Progress({ value: 20 }).applyStyles(this.globalFancy)
      } else if (this.targetView == 'QRCode') {
        QRCode(this.Marquee_src).applyStyles(this.globalFancy)
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' }).applyStyles(this.globalFancy)
      } else if (this.targetView == 'Rating') {
        Rating().applyStyles(this.globalFancy)
      } else if (this.targetView == 'RichText') {
        RichText('RichText').applyStyles(this.globalFancy)
      } else if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: this.scroller }).applyStyles(this.globalFancy)
      } else if (this.targetView == 'Search') {
        Search().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Select') {
        Select([{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }]).applyStyles(this.globalFancy)
      } else if (this.targetView == 'Slider') {
        Slider().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Text') {
        Text('text').applyStyles(this.globalFancy)
      } else if (this.targetView == 'TextArea') {
        TextArea().applyStyles(this.globalFancy)
      } else if (this.targetView == 'TextClock') {
        TextClock().applyStyles(this.globalFancy)
      } else if (this.targetView == 'TextInput') {
        TextInput().applyStyles(this.globalFancy)
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: this.value }).applyStyles(this.globalFancy)
      } else if (this.targetView == 'TextTimer') {
        TextTimer({ controller: this.textTimerController }).applyStyles(this.globalFancy)
      } else if (this.targetView == 'TimePicker') {
        TimePicker().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch }).applyStyles(this.globalFancy)
      } else if (this.targetView == 'Web') {
        // Web({ src: 'www.example.com', controller: this.controller }).applyStyles(this.globalFancy)
      } else if (this.targetView == 'Badge') {
        Badge({
          value: '',
          style: { badgeSize: 6, badgeColor: '#FA2A2D' } as BadgeStyle
        } as BadgeParamWithString).applyStyles(this.globalFancy)
      } else if (this.targetView == 'Column') {
        Column().applyStyles(this.globalFancy)
      } else if (this.targetView == 'ColumnSplit') {
        ColumnSplit() {
          Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          Text('2').width('100%').height(50).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
          Text('3').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        }.applyStyles(this.globalFancy)
      } else if (this.targetView == 'Counter') {
        Counter().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Flex') {
        Flex().applyStyles(this.globalFancy)
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem().applyStyles(this.globalFancy)
        }
      } else if (this.targetView == 'GridCol') {
        GridRow() {
          GridCol().applyStyles(this.globalFancy)
        }
      } else if (this.targetView == 'GridRow') {
        GridRow().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Grid') {
        Grid().applyStyles(this.globalFancy)
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem().applyStyles(this.globalFancy)
        }
      } else if (this.targetView == 'List') {
        List().applyStyles(this.globalFancy).width(100).height(100)
      } else if (this.targetView == 'ListItem') {
        List() {
          ListItem()
            .applyStyles(this.globalFancy)
        }.width(100).height(100)
      } else if (this.targetView == 'ListItemGroup') {
        List() {
          ListItemGroup()
            .applyStyles(this.globalFancy)
        }.width(100).height(100)
      } else if (this.targetView == 'Navigator') {
        Navigation().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Panel') {
        Column(){
        }
        .applyStyles(this.globalFancy)
        .bindSheet(true,this.myBuilder,{
          height: 300,
          backgroundColor: Color.Red
        })
      } else if (this.targetView == 'Refresh') {
        Refresh({ refreshing: false }).applyStyles(this.globalFancy)
      } else if (this.targetView == 'RelativeContainer') {
        RelativeContainer().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Row') {
        Row().applyStyles(this.globalFancy)
      } else if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('1')
          Text('2')
        }.applyStyles(this.globalFancy)
      } else if (this.targetView == 'Scroll') {
        Scroll(this.scroller).applyStyles(this.globalFancy)
      } else if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed).applyStyles(this.globalFancy)
      } else if (this.targetView == 'Stack') {
        Stack().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Swiper') {
        Swiper().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Tabs') {
        Tabs().applyStyles(this.globalFancy)
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent().applyStyles(this.globalFancy)
        }
      } else if (this.targetView == 'WaterFlow') {
        WaterFlow().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Circle') {
        Circle().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Ellipse') {
        Ellipse().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Line') {
        Line()
          .startPoint([0, 0])
          .endPoint([50, 100])
          .applyStyles(this.globalFancy)
      } else if (this.targetView == 'Polyline') {
        Polyline().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Polygon') {
        Polygon().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Path') {
        Path().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Rect') {
        Rect().applyStyles(this.globalFancy)
      } else if (this.targetView == 'Shape') {
        Shape().applyStyles(this.globalFancy)
      }
    }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Green)
  }
}