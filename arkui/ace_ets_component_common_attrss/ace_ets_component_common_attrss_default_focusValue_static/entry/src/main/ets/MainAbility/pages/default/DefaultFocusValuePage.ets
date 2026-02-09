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
import { RouterParams } from '../../common/Utils';
import router from '@ohos.router';
import { Entry, Component, TextTimerController, Scroller, Row, MenuItemOptions, AlphabetIndexer, Button, Checkbox,
  CheckboxGroup, DatePicker, Image, ImageAnimator, Menu, Radio, Rating, Search, Select, Slider, Text,
  TextArea, TextInput, TextPicker, TimePicker, Toggle, Column, ColumnSplit, Counter, Flex, GridRow, Grid, List,
  RowSplit, Scroll, SideBarContainer, Stack, Swiper, Tabs, Color, $r, MenuItem, MenuItemGroup,
  ToggleType, TextAlign, GridCol, GridItem, ListItem, ListItemGroup, SideBarContainerType, ForEach, TabContent,
  CommonMethod, applyStyles } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct DefaultFocusValuePage {
  @State parentWidth: number = 0
  @State parentHeight: number = 0
  @State targetView: string = ""
  @State targetGroupView: string = ""
  @State componentKey: string = ""
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G']; //Use by AlphabetIndexer TextPicker
  // controller: WebController = new WebController() //Use by Web
  textTimerController: TextTimerController = new TextTimerController() //Use by TextTimer
  private scroller: Scroller = new Scroller() //Use by Scroll

  onPageShow() {
    console.info('DefaultFocusValuePage show called ')
    let routerParamOptions = this.getUIContext().getRouter().getParams() as RouterParams;
    this.parentWidth = routerParamOptions.view.parentWidth
    this.parentHeight = routerParamOptions.view.parentHeight
    this.targetView = routerParamOptions.view.targetView ?? ""
    this.componentKey = routerParamOptions.view.componentKey ?? ""
    this.targetGroupView = routerParamOptions.view.targetGroupView ?? ""
  }

  commonStyle(instance: CommonMethod){
    instance.key(this.componentKey)
  }

  //Draw screen
  build() {
    Row() {
      if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Button') {
        Button('button').applyStyles(this.commonStyle)
      } else if (this.targetView == 'Checkbox') {
        Checkbox().applyStyles(this.commonStyle)
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup().applyStyles(this.commonStyle)
      } else if (this.targetView == 'DatePicker') {
        DatePicker().applyStyles(this.commonStyle)
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon')).applyStyles(this.commonStyle)
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([{ src: $r('app.media.icon') }])
          .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' } as MenuItemOptions)
        }.applyStyles(this.commonStyle)
      } else if (this.targetView == 'MenuItem') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions).applyStyles(this.commonStyle)
        }
      } else if (this.targetView == 'MenuItemGroup') {
        Menu() {
          MenuItemGroup({ header: 'MenuItemGroup' }) {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' } as MenuItemOptions)
          }.applyStyles(this.commonStyle)
        }
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Rating') {
        Rating().applyStyles(this.commonStyle)
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
      } else if (this.targetView == 'TextInput') {
        TextInput().applyStyles(this.commonStyle)
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: this.value }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'TimePicker') {
        TimePicker().applyStyles(this.commonStyle)
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch }).applyStyles(this.commonStyle)
      } else if (this.targetView == 'Web') {
        // Web({ src: 'www.example.com', controller: this.controller }).commonStyle()
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
      } else if (this.targetView == 'GridCol') {
        GridRow() {
          GridCol().applyStyles(this.commonStyle)
        }
      } else if (this.targetView == 'GridRow') {
        GridRow().applyStyles(this.commonStyle)
      } else if (this.targetView == 'Grid') {
        Grid().applyStyles(this.commonStyle)
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem().applyStyles(this.commonStyle)
        }
      } else if (this.targetView == 'List') {
        List().applyStyles(this.commonStyle).width(100).height(100)
      } else if (this.targetView == 'ListItem') {
        List() {
          ListItem() {
            Text('ListItem')
          }
            .applyStyles(this.commonStyle)
        }.width(100).height(100)
      } else if (this.targetView == 'ListItemGroup') {
        List() {
          ListItemGroup()
            .applyStyles(this.commonStyle)
        }.width(100).height(100)
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
        Swiper() {
          ForEach([1, 2, 3], (item: Int, index: Int) => {
            Text('Swiper' + item)
          }, (item: Int, index: Int) => String(item))
        }
        .indicator(true)
        .backgroundColor(Color.Pink)
        .applyStyles(this.commonStyle)
      } else if (this.targetView == 'Tabs') {
        Tabs().applyStyles(this.commonStyle)
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent().applyStyles(this.commonStyle)
        }
      }
    }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Green)
  }
}