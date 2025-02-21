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

import attrsManager from '../../common/AttrsManager';
import router from '@ohos.router'

@Entry
@Component
struct sizePage {
  //Use for TimePicker.
  private selectedTime: Date = new Date('2022-07-22T08:00:00')
  //Use for QRCode,Marquee.
  private src: string = 'Running Marquee starts rolling'
  //Use for AlphabetIndexer,TextPicker.
  private value: string[] = ['#', 'A', 'B']
  //Use for Scroll,Grid,DataPanel.
  public valueArr: number[] = [5, 10, 10, 7, 9, 10, 10, 10, 10]
  @State _size: SizeOptions = { width: 0, height: 0 };
  @State targetView: string = router.getParams() ? router.getParams()['view']['targetView'] : ''
  @State componentKey: string = router.getParams() ? router.getParams()['view']['componentKey'] : ''
  @State parentWidth: number = router.getParams() ? router.getParams()['view']['parentWidth'] : 0
  @State parentHeight: number = router.getParams() ? router.getParams()['view']['parentHeight'] : 0
  @State parentBackGroundColor: string = router.getParams() ? router.getParams()['view']['parentBackGroundColor'] : ''
  @State BackGroundColor: string = router.getParams() ? router.getParams()['view']['BackGroundColor'] : ''

  onPageShow() {
    console.info('size page show called ')
    attrsManager.registerDataChange(value => this._size = value)
  }

  @Styles commonStyle(){
    .size(this._size)
    .key(this.componentKey)
  }

  build() {
    Row() {
      if (this.targetView == 'Button') {
        Button('button1').commonStyle()
      } else if (this.targetView == 'Text') {
        Text('text1').commonStyle()
      } else if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: this.value, selected: 0 }).commonStyle()
      } else if (this.targetView == 'BlankRow') {
        Blank().color(this.BackGroundColor).commonStyle()
      } else if (this.targetView == 'BlankColumn') {
        Column() {
          Blank().color(this.BackGroundColor).commonStyle()
        }.width(this.parentWidth).height(this.parentHeight)
      } else if (this.targetView == 'Checkbox') {
        Checkbox().backgroundColor(this.BackGroundColor).commonStyle().margin(0)
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup({ group: 'checkboxGroup' }).commonStyle().backgroundColor(this.BackGroundColor).margin(0)
      } else if (this.targetView == 'DataPanel') {
        DataPanel({ values: this.valueArr }).commonStyle()
      } else if (this.targetView == 'DatePicker') {
        DatePicker({
          start: new Date('1970-1-1'),
          end: new Date('2100-1-1'),
        }).commonStyle()
      } else if (this.targetView == 'Divider') {
        Divider().strokeWidth(8).color(Color.Red).commonStyle()
      } else if (this.targetView == 'Gauge') {
        Gauge({ value: 105 }).commonStyle().colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon')).commonStyle().backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .images([
            {
              src: $r('app.media.icon')
            }
          ]).commonStyle()
      } else if (this.targetView == 'LoadingProgress') {
        LoadingProgress().backgroundColor(this.BackGroundColor).commonStyle()
      } else if (this.targetView == 'Marquee') {
        Marquee({
          start: true,
          step: 50,
          loop: Infinity,
          fromStart: true,
          src: this.src
        }).commonStyle()
      } else if (this.targetView == 'Navigation') {
        Navigation().commonStyle()
      } else if (this.targetView == 'NavRouter') {
        NavRouter().commonStyle()
      } else if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle()
      } else if (this.targetView == 'QRCode') {
        QRCode(this.src).commonStyle().backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .checked(true)
          .commonStyle()
          .backgroundColor(this.BackGroundColor)
          .margin(0)
      } else if (this.targetView == 'Rating') {
        Rating({ rating: 3.5 }).commonStyle()
      } else if (this.targetView == 'RichText') {
        RichText('RichText').commonStyle().backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
          Text().width(10).height(50).backgroundColor('#C0C0C0')
        }.commonStyle().backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Search') {
        Search().commonStyle().margin(0)
      } else if (this.targetView == 'Select') {
        Select([{ value: 'aaa' }, { value: 'bbb' }]).backgroundColor(this.BackGroundColor).commonStyle()
      } else if (this.targetView == 'Slider') {
        Slider({
          value: 50
        }).showTips(true).commonStyle()
      } else if (this.targetView == 'TextArea') {
        TextArea({ placeholder: 'TextArea' }).commonStyle()
      } else if (this.targetView == 'TextClock') {
        TextClock({ timeZoneOffset: -8 })
          .format('hms')
          .commonStyle()
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'TextInput') {
        TextInput({ placeholder: 'input your word...' }).commonStyle()
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: this.value }).commonStyle()
      } else if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 })
          .format('mm:ss.SS')
          .commonStyle()
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'TimePicker') {
        TimePicker({
          selected: this.selectedTime,
        }).useMilitaryTime(true).commonStyle()
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch, isOn: false }).commonStyle().backgroundColor(this.BackGroundColor).margin(0)
      } else if (this.targetView == 'Circle') {
        Circle().commonStyle()
      } else if (this.targetView == 'Ellipse') {
        Ellipse().commonStyle()
      } else if (this.targetView == 'Line') {
        Line()
          .startPoint([0, 0])
          .endPoint([50, 100])
          .commonStyle()
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Polyline') {
        Polyline().commonStyle().points([[20, 0], [0, 100], [100, 90]]).backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Polygon') {
        Polygon()
          .commonStyle()
          .points([[0, 0], [0, 100], [100, 100], [100, 0]])
          .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Path') {
        Path().commonStyle().backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Rect') {
        Rect().commonStyle()
      } else if (this.targetView == 'Shape') {
        Shape() {
          Rect().width(100).height(50)
        }.commonStyle().backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Badge') {
        Badge({
          count: 50,
          style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
        }) {
          Button('message').width(100).height(50).backgroundColor(0x317aff)
        }.commonStyle()
      } else if (this.targetView == 'Column') {
        Column() {
          Column().width('100%').height(30).backgroundColor(0xAFEEEE)
        }.commonStyle()
      } else if (this.targetView == 'ColumnSplit') {
        ColumnSplit() {
          Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        }.commonStyle()
      } else if (this.targetView == 'Counter') {
        Counter() {
        }.commonStyle()
      } else if (this.targetView == 'Flex') {
        Flex() {
          Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
        }.commonStyle()
      } else if (this.targetView == 'GridRow') {
        GridRow({
          columns: 5,
          gutter: { x: 5, y: 10 },
          breakpoints: { value: ['400vp', '600vp', '800vp'], reference: BreakpointsReference.WindowSize },
          direction: GridRowDirection.Row
        }) {
          ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink], (color) => {
            GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
              Row().width('100%').height('20vp')
            }.borderColor(color).borderWidth(2)
          })
        }.commonStyle().backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Grid') {
        Grid() {
          ForEach(this.valueArr, (day: string) => {
            GridItem() {
              Text(day)
            }
          }, day => day)
        }.columnsTemplate('1fr 1fr 1fr 1fr 1fr').commonStyle().backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'List') {
        List() {
        }.width('0')
        .height('0')
        .commonStyle()
        .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'ListItem') {
        List() {
          ListItem() {
          }.commonStyle()
        }.width(this.parentWidth).height(this.parentHeight)
      } else if (this.targetView == 'Panel') {
        Panel(true) {
          Column() {
          }
        }.commonStyle()
      } else if (this.targetView == 'Refresh') {
        Refresh({ refreshing: false }) {
          Text('Pull Down and refresh:0 ')
        }.commonStyle().backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'Row') {
        Row() {
          Row().width('30%').height(50).backgroundColor(0xAFEEEE)
        }.commonStyle().backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('1').width('20%').height(100).backgroundColor(0xF5DEB3)
        }.commonStyle()
      } else if (this.targetView == 'Scroll') {
        Scroll() {
          List() {
            ForEach(this.valueArr, (item) => {
              ListItem() {
                Text('ListItem' + item)
              }.width('100%').height(100)
            }, item => item)
          }.width(200)
          .height(200)
        }.commonStyle()
        .backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed) {
          Column() {
            ForEach([1, 2, 3], (item) => {
              Column({ space: 5 }) {
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
        }.commonStyle()
      } else if (this.targetView == 'Stack') {
        Stack().commonStyle()
      } else if (this.targetView == 'Swiper') {
        Swiper() {
          ForEach([1, 2, 3], (item: string) => {
            Text('Swiper' + item).width('90%').height(50)
          }, item => item)
        }.indicator(true).commonStyle()
      } else if (this.targetView == 'Tabs') {
        Tabs() {
          TabContent() {
            Column().width('100%').height('100%').backgroundColor('#00CB87')
          }
        }.commonStyle().backgroundColor(this.BackGroundColor)
      } else if (this.targetView == 'WaterFlow') {
        WaterFlow().commonStyle().backgroundColor(this.BackGroundColor)
      }
      else if (this.targetView == 'Stepper') {
        Stepper() {
          StepperItem()
        }.commonStyle()
      } else if (this.targetView == 'StepperItem') {
        Stepper() {
          StepperItem() {
            Text('Page One')
          }.commonStyle()
        }.width(this.parentWidth).height(this.parentHeight)
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem().commonStyle()
        }.width(this.parentWidth).height(this.parentHeight)
      } else if (this.targetView == 'GridCol') {
        GridRow() {
          GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
            Row().width('100%').height('20vp')
          }.commonStyle()
        }
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem().commonStyle()
        }.width(this.parentWidth).height(this.parentHeight)
      } else if (this.targetView == 'RelativeContainer') {
        RelativeContainer() {
          Row()
            .width('100%')
            .height('100%')
            .backgroundColor('#FF3333')
            .alignRules({
              center: { anchor: '__container__', align: VerticalAlign.Center },
              middle: { anchor: '__container__', align: HorizontalAlign.Center }
            })
        }.backgroundColor(Color.Green).commonStyle()
      } else if (this.targetView == 'Navigator') {
        Navigator().commonStyle()
      } else if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
        }.backgroundColor(Color.Yellow).commonStyle().padding(0)
      } else if (this.targetView == 'MenuItem') {
        Row() {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
              .size(this._size)
              .key(this.componentKey)
          }.width(this.parentWidth).height(this.parentHeight).padding(0)
        }
      } else if (this.targetView == 'MenuItemGroup') {
        Row() {
          Menu() {
            MenuItemGroup({ header: 'MenuItemGroup' }) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
            }.key(this.componentKey).size(this._size)
          }.width(this.parentWidth).height(this.parentHeight).padding(0)
        }
      }
    }
    .height(this.parentHeight)
    .width(this.parentWidth)
    .backgroundColor(this.parentBackGroundColor)
  }
}