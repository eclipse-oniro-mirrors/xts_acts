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


import { State } from '@ohos.arkui.stateManagement';
import { RouterParams } from '../../common/Utils';
import { Entry, Component, TextTimerController, Scroller, Builder, AlphabetIndexer, Blank, Button, Checkbox,
  CheckboxGroup, DataPanel, DatePicker, Divider, Gauge, Image, ImageAnimator, LoadingProgress, Marquee, Menu,
  Navigation, Progress, QRCode, Radio, Rating, ScrollBar, Search, Select, Slider, Text, TextArea,
  TextClock, TextInput, TextPicker, TextTimer, TimePicker, Toggle, Badge, Column, ColumnSplit, Counter, Flex, GridRow,
  Grid, List, Refresh, RelativeContainer, Row, RowSplit, Scroll, SideBarContainer, Stack, Swiper,
  Tabs, WaterFlow, Circle, Ellipse, Line, Polyline, Polygon, Path, Rect, Shape, $r, ToggleType,
  BadgeStyle, BadgeParamWithString, SideBarContainerType, TextAlign, Color, FlexDirection, MenuItem, NavPathStack,
  MenuItemOptions, CommonMethod, applyStyles } from '@ohos.arkui.component';

@Entry
@Component
struct DefaultFlexPage {
  @State containerView: string = ''
  @State parentWidth: number = 0
  @State parentHeight: number = 0
  @State targetView: string = ""
  @State targetGroupView: string = ""
  @State componentKey: string = ""
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G']; //Use by AlphabetIndexer TextPicker
  private Marquee_src: string = 'Running Marquee starts rolling A B C D E F G H I J K L'; //Use by Marquee QRCode
  textTimerController: TextTimerController = new TextTimerController() //Use by TextTimer
  private scroller: Scroller = new Scroller() //Use by ScrollBar Scroll

  onPageShow() {
    console.info('DefaultFlexPage show called ')
    let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
    this.containerView = routerParamOptions.view.containerView ?? ""
    this.componentKey = routerParamOptions.view.componentKey ?? ""
    this.parentWidth = routerParamOptions.view.parentWidth
    this.parentHeight = routerParamOptions.view.parentHeight
    this.targetGroupView = routerParamOptions.view.targetGroupView ?? ""
    this.targetView = routerParamOptions.view.targetView
  }

  commonStyle(instance: CommonMethod){
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

  @Builder buildTargetView() {
    if (this.targetView == 'AlphabetIndexer') {
      AlphabetIndexer({ arrayValue: this.value, selected: 0 }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Blank') {
      Blank().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Button') {
      Button('button').applyStyles(this.commonStyle)
    } else if (this.targetView == 'Checkbox') {
      Checkbox().applyStyles(this.commonStyle)
    } else if (this.targetView == 'CheckboxGroup') {
      CheckboxGroup().applyStyles(this.commonStyle)
    } else if (this.targetView == 'DataPanel') {
      DataPanel({ values: [25] }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'DatePicker') {
      DatePicker().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Divider') {
      Divider().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Gauge') {
      Gauge({ value: 75 }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Image') {
      Image($r('app.media.icon')).applyStyles(this.commonStyle)
    } else if (this.targetView == 'ImageAnimator') {
      ImageAnimator()
        .images([{ src: $r('app.media.icon') }])
        .applyStyles(this.commonStyle)
    } else if (this.targetView == 'LoadingProgress') {
      LoadingProgress().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Marquee') {
      Marquee({
        start: true,
        src: this.Marquee_src
      }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Menu') {
      Menu() {
        MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Navigation') {
      Navigation(new NavPathStack()).applyStyles(this.commonStyle)
    } else if (this.targetView == 'NavRouter') {
      Navigation(new NavPathStack()).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Progress') {
      Progress({ value: 20 }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'QRCode') {
      QRCode(this.Marquee_src).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Radio') {
      Radio({ value: 'Radio1', group: 'radioGroup' }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Rating') {
      Rating().applyStyles(this.commonStyle)
    } else if (this.targetView == 'ScrollBar') {
      ScrollBar({ scroller: this.scroller }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Search') {
      Search().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Select') {
      Select([{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }]).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Slider') {
      Slider().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Text') {
      Text('text').applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextArea') {
      TextArea().applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextClock') {
      TextClock().applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextInput') {
      TextInput().applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextPicker') {
      TextPicker({ range: this.value }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'TextTimer') {
      TextTimer({ controller: this.textTimerController }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'TimePicker') {
      TimePicker().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Toggle') {
      Toggle({ type: ToggleType.Switch }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Badge') {
      Badge({
        value: '',
        style: { badgeSize: 6, badgeColor: '#FA2A2D' } as BadgeStyle
      } as BadgeParamWithString).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Column') {
      Column().applyStyles(this.commonStyle)
    } else if (this.targetView == 'ColumnSplit') {
      ColumnSplit() {
        Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        Text('2').width('100%').height(50).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
        Text('3').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Counter') {
      Counter().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Flex') {
      Flex().applyStyles(this.commonStyle)
    } else if (this.targetView == 'GridRow') {
      GridRow().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Grid') {
      Grid().applyStyles(this.commonStyle)
    } else if (this.targetView == 'List') {
      List().applyStyles(this.commonStyle).width(100).height(100)
    } else if (this.targetView == 'Navigator') {
      // Navigator({ target: '' }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Panel') {
      Column(){
        Text('Text')
      }
      .backgroundColor(Color.Yellow)
      .applyStyles(this.commonStyle)
      .bindSheet(true,this.myBuilder)
    } else if (this.targetView == 'Refresh') {
      Refresh({ refreshing: false }).applyStyles(this.commonStyle)
    } else if (this.targetView == 'RelativeContainer') {
      RelativeContainer().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Row') {
      Row().applyStyles(this.commonStyle)
    } else if (this.targetView == 'RowSplit') {
      RowSplit() {
        Text('1')
        Text('2')
      }.applyStyles(this.commonStyle)
    } else if (this.targetView == 'Scroll') {
      Scroll(this.scroller).applyStyles(this.commonStyle)
    } else if (this.targetView == 'SideBarContainer') {
      SideBarContainer(SideBarContainerType.Embed).applyStyles(this.commonStyle)
    } else if (this.targetView == 'Stack') {
      Stack().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Swiper') {
      Swiper().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Tabs') {
      Tabs().applyStyles(this.commonStyle)
    } else if (this.targetView == 'WaterFlow') {
      WaterFlow().applyStyles(this.commonStyle)
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
      Polyline().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Polygon') {
      Polygon().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Path') {
      Path().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Rect') {
      Rect().applyStyles(this.commonStyle)
    } else if (this.targetView == 'Shape') {
      Shape().applyStyles(this.commonStyle)
    }
  }

  //Draw screen
  build() {
    if (this.containerView == 'Row') {
      Row() {
        this.buildTargetView();
      }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Green)
    } else if (this.containerView == 'Column') {
      Column() {
        this.buildTargetView();
      }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Green)
    } else if (this.containerView == 'FlexRow') {
      Flex({ direction: FlexDirection.Row }) {
        this.buildTargetView();
      }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Green)
    } else if (this.containerView == 'FlexRowReverse') {
      Flex({ direction: FlexDirection.RowReverse }) {
        this.buildTargetView();
      }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Green)
    } else if (this.containerView == 'FlexColumn') {
      Flex({ direction: FlexDirection.Column }) {
        this.buildTargetView();
      }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Green)
    } else if (this.containerView == 'FlexColumnReverse') {
      Flex({ direction: FlexDirection.ColumnReverse }) {
        this.buildTargetView();
      }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Green)
    }
  }
}