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
import router from '@ohos.router';
import { StepperView } from '../../view/markAnchor/StepperView';
import { StepperItemView } from '../../view/markAnchor/StepperItemView';
import { ListItemGroupView } from '../../view/markAnchor/ListItemGroupView';
import { NavRouterView } from '../../view/markAnchor/NavRouterView';

/**
 * Test page of common attribute: markAnchor
 */

@Entry
@Component
struct MarkAnchor {
  private scroller: Scroller = new Scroller() //For Scroll and ScrollBar
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15] //For Scroll
  @State show: boolean = false //For Panel
  @State _markAnchor: Position = { x: 0, y: 0 };
  @State targetView: string = router.getParams() ? (router.getParams() as ESObject)['view']['targetView'] : ''
  @State componentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['componentKey'] : ''
  @State parentWidth: number = router.getParams() ? (router.getParams() as ESObject)['view']['parentWidth'] : 0
  @State parentHeight: number = router.getParams() ? (router.getParams() as ESObject)['view']['parentHeight'] : 0
  @State subassemblyWidth: number = router.getParams() ? (router.getParams() as ESObject)['view']['subassemblyWidth'] : 0
  @State subassemblyHeight: number = router.getParams() ? (router.getParams() as ESObject)['view']['subassemblyHeight'] : 0

  onPageShow() {
    console.info('[MarkAnchor] page show called ')

    //Register data change call back.
    attrsManager.registerDataChange((value: ESObject) => {
      this._markAnchor = value
    })
  }

  /**
   * Set common style.
   *
   */
  @Styles
  commonStyle(){
    .markAnchor(this._markAnchor)
    .key(this.componentKey)
  }

  build() {
    Row() {
      //Set view by page config.
      if (this.targetView == 'Button') {
        Button('button1')
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Radio') {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Select') {
        Select([{ value: 'aaa', icon: '/common/public_icon.svg' },
          { value: 'bbb', icon: '/common/public_icon.svg' }])
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Blank') {
        Row() {
          Blank().color(Color.Black).commonStyle()
        }
        .width(this.subassemblyWidth)
        .height(this.subassemblyHeight)

      } else if (this.targetView == 'Checkbox') {
        Checkbox({ name: 'checkbox1' })
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'CheckboxGroup') {
        CheckboxGroup()
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'DataPanel') {
        DataPanel({ values: [25] })
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'DatePicker') {
        DatePicker({})
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Divider') {
        Divider()
          .strokeWidth(10)
          .color(Color.Black)
          .vertical(false)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Gauge') {
        Gauge({ value: 0 })
          .colors([[0x317AF7, 1], [0x9C554B, 1]])
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'LoadingProgress') {
        LoadingProgress()
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Marquee') {
        Marquee({ start: true, src: 'Marquee' })
          .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'Navigation') {
        Navigation()
          .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'Image') {
        Image($r('app.media.icon'))
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'ImageAnimator') {
        ImageAnimator()
          .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'AlphabetIndexer') {
        AlphabetIndexer({ arrayValue: ['A', 'B', 'C', 'D'], selected: 0 })
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'NavRouter') {
        NavRouterView({ _markAnchor: $_markAnchor, componentKey: this.componentKey })
      } else if (this.targetView == 'Progress') {
        Progress({ value: 10, type: ProgressType.Ring })
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'QRCode') {
        QRCode('Hello Harmony')
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Rating') {
        Rating({ rating: 3.5 })
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Search') {
        Search()
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Slider') {
        Slider()
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Text') {
        Text('Text')
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'TextArea') {
        TextArea()
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'TextClock') {
        TextClock()
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'TextInput') {
        TextInput()
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'TextPicker') {
        TextPicker({ range: ['apple1', 'orange2', 'peach3', 'grape4'] })
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'TimePicker') {
        TimePicker().width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'Toggle') {
        Toggle({ type: ToggleType.Switch }).width(this.subassemblyWidth).height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Badge') {
        Badge({ value: '', style: { badgeSize: 6, badgeColor: Color.Red } }) {
          Button('BadgeContent')
        }.width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'Column') {
        Column()
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Counter') {
        Counter()
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Flex') {
        Flex()
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Grid') {
        Grid() {
          ForEach(['0', '1', '2', '3', '4'], () => {
            ForEach(['0', '1', '2', '3', '4'], (day: string) => {
              GridItem() {
                Text(day).backgroundColor(Color.White)
                  .width('100%').height('100%').textAlign(TextAlign.Center)
              }
            })
          })
        }
        .width(this.subassemblyWidth)
        .height(this.subassemblyHeight)
        .commonStyle()
      } else if (this.targetView == 'GridRow') {
        GridRow({
          columns: 5,
          gutter: { x: 5, y: 10 },
          breakpoints: { value: ['400vp', '600vp', '800vp'], reference: BreakpointsReference.WindowSize },
          direction: GridRowDirection.Row
        }) {
          ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue],
            (color: Color) => {
              GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
                Row().width('100%').height('20vp')
              }.borderColor(color).borderWidth(2)
            })
        }
        .width(this.subassemblyWidth)
        .height(this.subassemblyHeight)
        .commonStyle()
      } else if (this.targetView == 'List') {
        List()
          .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'Row') {
        Row()
          .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'SideBarContainer') {
        SideBarContainer(SideBarContainerType.Embed) {
          Column() {
            ForEach([1, 2, 3], (item: number) => {
              Column({ space: 5 }) {
                Image($r('app.media.icon')).width(64).height(64)
                Text('Index0' + item).fontSize(25)
              }
            })
          }.width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)
          .backgroundColor(Color.Green)

          Column() {
            Text('SideBarContainer content').fontSize(25)
          }.backgroundColor(Color.Orange)
        }.width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'Stack') {
        Stack()
          .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'Tabs') {
        Tabs()
          .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'WaterFlow') {
        WaterFlow()
          .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'Circle') {
        Circle()
          .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'Ellipse') {
        Ellipse()
          .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'Line') {
        Line()
          .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'Polyline') {
        Polyline()
          .points([[50, 10], [50, 50], [90, 90]])
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Polygon') {
        Polygon()
          .points([[50, 10], [50, 50], [90, 90]])
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Path') {
        Path()
          .commands('M100 0 L200 240 L0 240 Z')
          .backgroundColor(Color.Blue)
          .width(this.subassemblyWidth)
          .height(this.subassemblyHeight)
          .commonStyle()
      } else if (this.targetView == 'Rect') {
        Rect()
          .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'Shape') {
        Shape() {
          Rect().width('100%').height('100%')
        }
        .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'Panel') {
        Panel(this.show = true) {
          Column() {
          }
        }
        .width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'Refresh') {
        Refresh({ refreshing: false }) {
          Text('Pull Down and refresh:0 ')
        }
        .width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent() {
            Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
          }.tabBar('Tabs1').commonStyle()
        }.width(this.parentWidth).height(this.parentHeight)
      } else if (this.targetView == 'ListItem') {
        List({ space: 20, initialIndex: 0 }) {
          ListItem() {
            Text('item1')
              .width('100%').textAlign(TextAlign.Center).backgroundColor(Color.White)
          }.width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
        }.width(this.parentWidth).height(this.parentHeight).listDirection(Axis.Vertical)
      } else if (this.targetView == 'RowSplit') {
        RowSplit() {
          Text('1').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          Text('2').width('10%').height(100).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
        }.width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'ColumnSplit') {
        ColumnSplit() {
          Text('1').width('10%').height(100).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          Text('2').width('10%').height(100).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
        }.width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'RelativeContainer') {
        RelativeContainer() {
          Row()
            .width(100)
            .height(100)
            .backgroundColor('#FF3333')
            .alignRules({
              top: { anchor: '__container__', align: VerticalAlign.Top },
              left: { anchor: '__container__', align: HorizontalAlign.Start }
            })
            .id('markAnchor')
        }
        .backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'Swiper') {
        Swiper() {
          ForEach([1, 2, 3], (item: number) => {
            Text('Swiper' + item).width('90%').height(160)
          }, (item: number) => item.toString())
        }
        .indicator(true)
        .backgroundColor(Color.White)
        .width(this.subassemblyWidth)
        .height(this.subassemblyHeight)
        .commonStyle()
      } else if (this.targetView == 'Navigator') {
        Navigator() {
          Text('Back to previous page').width('100%').textAlign(TextAlign.Center)
        }.backgroundColor(Color.Blue).width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'Scroll') {
        Scroll(this.scroller) {
          Flex({ direction: FlexDirection.Column }) {
            ForEach(this.arr, (item: number) => {
              Row() {
                Text(item.toString())
                  .width(80)
                  .height(20)
                  .backgroundColor('#3366CC')
                  .borderRadius(15)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .margin({ top: 5 })
              }
            }, (item: number) => item.toString())
          }.margin({ right: 15 })
        }.width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'TextTimer') {
        TextTimer({ isCountDown: true, count: 30000 })
          .width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'GridCol') {
        GridRow({
          columns: 5,
          gutter: { x: 5, y: 10 },
          breakpoints: { value: ['400vp', '600vp', '800vp'], reference: BreakpointsReference.WindowSize },
          direction: GridRowDirection.Row
        }) {
          ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue],
            (color: Color) => {
              GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
                Row().width('100%').height('20vp')
              }
              .borderColor(color)
              .borderWidth(2)
              .width(this.subassemblyWidth)
              .height(this.subassemblyHeight)
              .commonStyle()
            })
        }.width(this.parentWidth).height(this.parentHeight)
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem() {
            Text('text').fontSize(12).height('16')
          }.width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
        }.width(this.parentWidth).height(this.parentHeight)
      } else if (this.targetView == 'Stepper') {
        StepperView({ _markAnchor: $_markAnchor, componentKey: this.componentKey });
      } else if (this.targetView == 'StepperItem') {
        StepperItemView({
          _markAnchor: $_markAnchor,
          componentKey: this.componentKey,
          parentWidth: this.parentWidth,
          subassemblyWidth: this.subassemblyWidth,
          subassemblyHeight: this.subassemblyHeight,
          parentHeight: this.parentHeight,
        })
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem() {
            Text('GridItem1').backgroundColor(Color.White)
              .width('100%').height('100%').textAlign(TextAlign.Center)
          }.width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
        }
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
        .backgroundColor(Color.Black)
        .width(this.parentWidth)
        .height(this.parentHeight)
      } else if (this.targetView == 'ScrollBar') {
        ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
          Text().width(20).height(100).borderRadius(10)
            .backgroundColor('#C0C0C0')
        }.width(this.subassemblyWidth).height(this.subassemblyHeight).backgroundColor('#ededed').commonStyle()
      } else if (this.targetView == 'ListItemGroup') {
        ListItemGroupView({
          _markAnchor: $_markAnchor,
          componentKey: this.componentKey,
          subassemblyWidth: this.subassemblyWidth,
          subassemblyHeight: this.subassemblyHeight,
        })
      } else if (this.targetView == 'Menu') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
        }.backgroundColor(Color.Yellow).width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
      } else if (this.targetView == 'MenuItem') {
        Row() {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
              .width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
          }.backgroundColor(Color.Yellow).width(this.parentWidth).height(this.parentHeight)
        }.width('100%').height('100%').backgroundColor(Color.Green)
      } else if (this.targetView == 'MenuItemGroup') {
        Row() {
          Menu() {
            MenuItemGroup({ header: 'MenuItemGroup' }) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
            }.width(this.subassemblyWidth).height(this.subassemblyHeight).commonStyle()
          }.backgroundColor(Color.Yellow).width(this.parentWidth).height(this.parentHeight)
        }.width('100%').height('100%').backgroundColor(Color.Green)
      }
    }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Pink)
  }
}