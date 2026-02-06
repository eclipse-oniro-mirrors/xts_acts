/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import router from '@ohos.router';

@Entry
@Component
struct DefaultPage {
  @State parentWidth: number = router.getParams() ? (router.getParams() as ESObject)['view']['parentWidth'] : 0
  @State parentHeight: number = router.getParams() ? (router.getParams() as ESObject)['view']['parentHeight'] : 0
  @State targetView: string = router.getParams() ? (router.getParams() as ESObject)['view']['targetView'] : ''
  @State targetGroupView: string = router.getParams() ? (router.getParams() as ESObject)['view']['targetGroupView'] : ''
  @State componentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['componentKey'] : ''
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G']; //Use by AlphabetIndexer TextPicker
  private Marquee_src: string = 'Running Marquee starts rolling A B C D E F G H I J K L'; //Use by Marquee QRCode
  controller: WebController = new WebController() //Use by Web
  textTimerController: TextTimerController = new TextTimerController() //Use by TextTimer
  private scroller: Scroller = new Scroller() //Use by ScrollBar Scroll

  onPageShow() {
    console.info('DefaultPage show called ')
  }

  /*
   * Set common style.
   */
  @Styles commonStyle(){
    .key(this.componentKey)
  }

  //Draw screen
  build() {
    Row() {
      if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 }).commonStyle()
      } else if (this.targetView == 'Blank') {
        Blank().commonStyle()
      } else if (this.targetView == 'Button') {
        Button('button').commonStyle()
      } else if (this.targetView == 'Checkbox') {
        Checkbox().commonStyle()
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup().commonStyle()
      } else if (this.targetView == 'DataPanel') {
        DataPanel({ values: [25] }).commonStyle()
      } else if (this.targetView == 'DatePicker') {
        DatePicker().commonStyle()
      } else if (this.targetView == 'Divider') {
        Divider().commonStyle()
      } else if (this.targetView == 'Gauge') {
        Gauge({ value: 75 }).commonStyle()
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon')).commonStyle()
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([{ src: $r('app.media.icon') }])
          .commonStyle()
      } else if (this.targetView == 'LoadingProgress') {
        LoadingProgress().commonStyle()
      } else if (this.targetView == 'Marquee') {
        Marquee({
          start: true,
          src: this.Marquee_src
        }).commonStyle()
      } else if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
        }.commonStyle()
      } else if (this.targetView == 'MenuItem') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' }).commonStyle()
        }
      } else if (this.targetView == 'MenuItemGroup') {
        Menu() {
          MenuItemGroup({ header: 'MenuItemGroup' }) {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
          }.commonStyle()
        }
      } else if (this.targetView == 'Navigation') {
        Navigation().commonStyle()
      } else if (this.targetView == 'NavRouter') {
        NavRouter().commonStyle()
      } else if (this.targetView == 'Progress') {
        Progress({ value: 20 }).commonStyle()
      } else if (this.targetView == 'QRCode') {
        QRCode(this.Marquee_src).commonStyle()
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' }).commonStyle()
      } else if (this.targetView == 'Rating') {
        Rating().commonStyle()
      } else if (this.targetView == 'RichText') {
        RichText('RichText').commonStyle()
      } else if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: this.scroller }).commonStyle()
      } else if (this.targetView == 'Search') {
        Search().commonStyle()
      } else if (this.targetView == 'Select') {
        Select([{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }]).commonStyle()
      } else if (this.targetView == 'Slider') {
        Slider().commonStyle()
      } else if (this.targetView == 'Stepper') {
        Stepper() {
          StepperItem()
        }.commonStyle()
      } else if (this.targetView == 'StepperItem') {
        Stepper() {
          StepperItem().commonStyle()
        }
      } else if (this.targetView == 'Text') {
        Text('text').commonStyle()
      } else if (this.targetView == 'TextArea') {
        TextArea().commonStyle()
      } else if (this.targetView == 'TextClock') {
        TextClock().commonStyle()
      } else if (this.targetView == 'TextInput') {
        TextInput().commonStyle()
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: this.value }).commonStyle()
      } else if (this.targetView == 'TextTimer') {
        TextTimer({ controller: this.textTimerController }).commonStyle()
      } else if (this.targetView == 'TimePicker') {
        TimePicker().commonStyle()
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch }).commonStyle()
      } else if (this.targetView == 'Web') {
        Web({ src: 'www.example.com', controller: this.controller }).commonStyle()
      } else if (this.targetView == 'Badge') {
        Badge({
          value: '',
          style: { badgeSize: 6, badgeColor: '#FA2A2D' }
        }).commonStyle()
      } else if (this.targetView == 'Column') {
        Column().commonStyle()
      } else if (this.targetView == 'ColumnSplit') {
        ColumnSplit() {
          Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          Text('2').width('100%').height(50).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
          Text('3').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        }.commonStyle()
      } else if (this.targetView == 'Counter') {
        Counter().commonStyle()
      } else if (this.targetView == 'Flex') {
        Flex().commonStyle()
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem().commonStyle()
        }
      } else if (this.targetView == 'GridCol') {
        GridRow() {
          GridCol().commonStyle()
        }
      } else if (this.targetView == 'GridRow') {
        GridRow().commonStyle()
      } else if (this.targetView == 'Grid') {
        Grid().commonStyle()
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem().commonStyle()
        }
      } else if (this.targetView == 'List') {
        List().commonStyle().width(100).height(100)
      } else if (this.targetView == 'ListItem') {
        List() {
          ListItem()
            .commonStyle()
        }.width(100).height(100)
      } else if (this.targetView == 'ListItemGroup') {
        List() {
          ListItemGroup()
            .commonStyle()
        }.width(100).height(100)
      } else if (this.targetView == 'Navigator') {
        Navigator({ target: '' }).commonStyle()
      } else if (this.targetView == 'Panel') {
        Panel(true).commonStyle()
      } else if (this.targetView == 'Refresh') {
        Refresh({ refreshing: false }).commonStyle()
      } else if (this.targetView == 'RelativeContainer') {
        RelativeContainer().commonStyle()
      } else if (this.targetView == 'Row') {
        Row().commonStyle()
      } else if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('1')
          Text('2')
        }.commonStyle()
      } else if (this.targetView == 'Scroll') {
        Scroll(this.scroller).commonStyle()
      } else if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed).commonStyle()
      } else if (this.targetView == 'Stack') {
        Stack().commonStyle()
      } else if (this.targetView == 'Swiper') {
        Swiper().commonStyle()
      } else if (this.targetView == 'Tabs') {
        Tabs().commonStyle()
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent().commonStyle()
        }
      } else if (this.targetView == 'WaterFlow') {
        WaterFlow().commonStyle()
      } else if (this.targetView == 'Circle') {
        Circle().commonStyle()
      } else if (this.targetView == 'Ellipse') {
        Ellipse().commonStyle()
      } else if (this.targetView == 'Line') {
        Line()
          .startPoint([0, 0])
          .endPoint([50, 100])
          .commonStyle()
      } else if (this.targetView == 'Polyline') {
        Polyline().commonStyle()
      } else if (this.targetView == 'Polygon') {
        Polygon().commonStyle()
      } else if (this.targetView == 'Path') {
        Path().commonStyle()
      } else if (this.targetView == 'Rect') {
        Rect().commonStyle()
      } else if (this.targetView == 'Shape') {
        Shape().commonStyle()
      }
    }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Green)
    .allowForceDark(true).allowForceDark(false)
  }
}