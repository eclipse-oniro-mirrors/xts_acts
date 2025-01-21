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

import AttrsManager from '../../common/AttrsManager';
import router from '@ohos.router'

@Entry
@Component
struct OnVisibleAreaChangePage {
  _yOffSetValue: number = 0;
  @State _ratiosLeft: number = 0.0;
  @State _ratiosRight: number = 0.0;
  @State _compositionValue: string = '';
  @State targetView: string = router.getParams() ? router.getParams()['view']['targetView'] : ''
  @State componentKey: string = router.getParams() ? router.getParams()['view']['componentKey'] : ''
  @State compareTextKey: string = router.getParams() ? router.getParams()['view']['compareTextKey'] : ''
  @State compareTextWidth: number = router.getParams() ? router.getParams()['view']['compareTextWidth'] : 0
  @State compareTextHeight: number = router.getParams() ? router.getParams()['view']['compareTextHeight'] : 0
  @State scrollWidth: number = router.getParams() ? router.getParams()['view']['scrollWidth'] : 0
  @State scrollHeight: number = router.getParams() ? router.getParams()['view']['scrollHeight'] : 0
  @State columnWidth: number = router.getParams() ? router.getParams()['view']['columnWidth'] : 0
  @State columnHeight: number = router.getParams() ? router.getParams()['view']['columnHeight'] : 0
  @State buttonWidth: number = router.getParams() ? router.getParams()['view']['buttonWidth'] : 0
  @State buttonHeight: number = router.getParams() ? router.getParams()['view']['buttonHeight'] : 0
  @State componentWidth: number = router.getParams() ? router.getParams()['view']['componentWidth'] : 0
  @State componentHeight: number = router.getParams() ? router.getParams()['view']['componentHeight'] : 0
  textTimerController: TextTimerController = new TextTimerController() //Use by TextTimer
  private scroller: Scroller = new Scroller()
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G']; //Use by AlphabetIndexer TextPicker
  private src: string = 'Running Marquee starts rolling A B C D E F G H I J'; //Use by Marquee QRCode

  onPageShow() {
    console.info('OnVisibleAreaChangePage show called ')
    AttrsManager.registerDataChange(value => {
      if (value.yOffSetValueLeave != undefined) {
        this._yOffSetValue = value.yOffSetValueLeave
      }
      if (value.yOffSetValueEnter != undefined) {
        this._yOffSetValue = value.yOffSetValueEnter
      }
      if (value.ratiosLeft != undefined) {
        this._ratiosLeft = value.ratiosLeft
        console.info('this._ratiosLeft:' + this._ratiosLeft);
      }
      if (value.ratiosRight != undefined) {
        this._ratiosRight = value.ratiosRight
        console.info('this._ratiosRight:' + this._ratiosRight);
      }
    })
  }

  /*
   * Set common style.
   */
  @Styles commonStyle(){
    .key(this.componentKey)
    .width(this.componentWidth)
    .height(this.componentHeight)
    .onVisibleAreaChange([this._ratiosLeft, this._ratiosRight], (isVisible: boolean, currentRatio: number) => {
      console.info('Text isVisible: ' + isVisible + ', currentRatio:' + currentRatio)
      this._compositionValue += '@' + JSON.stringify({
        isVisible: JSON.stringify(isVisible),
        currentRatio: JSON.stringify(currentRatio)
      })
    })
  }

  //Draw screen
  build() {
    Column() {
      Scroll(this.scroller) {
        Column() {
          Text(this._compositionValue)
            .key(this.compareTextKey)
            .width(this.compareTextWidth)
            .height(this.compareTextHeight)
          if (this.targetView == 'AlphabetIndexer') {
            AlphabetIndexer({ arrayValue: this.value, selected: 0 })
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Blank') {
            Blank()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Button') {
            Button('button').commonStyle()
          } else if (this.targetView == 'Checkbox') {
            Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'CheckboxGroup') {
            CheckboxGroup({ group: 'checkboxGroup' })
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'DataPanel') {
            DataPanel({ values: [25] })
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'DatePicker') {
            DatePicker()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Divider') {
            Divider()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Gauge') {
            Gauge({ value: 75 })
              .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Image') {
            Image($r('app.media.icon'))
              .commonStyle()
          } else if (this.targetView == 'ImageAnimator') {
            ImageAnimator()
              .images([{ src: $r('app.media.icon') }])
              .commonStyle()
          } else if (this.targetView == 'LoadingProgress') {
            LoadingProgress()
              .color(Color.Blue)
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Marquee') {
            Marquee({
              start: true,
              src: this.src
            })
              .fontSize(15)
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Menu') {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
            }.backgroundColor(Color.Pink).commonStyle()
          } else if (this.targetView == 'MenuItem') {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
                .backgroundColor(Color.Pink)
                .commonStyle()
            }
          } else if (this.targetView == 'MenuItemGroup') {
            Menu() {
              MenuItemGroup({ header: 'MenuItemGroup' }) {
                MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
              }.commonStyle()
            }
          } else if (this.targetView == 'Navigation') {
            Navigation()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'NavRouter') {
            NavRouter().backgroundColor(Color.Pink).commonStyle()
          } else if (this.targetView == 'NavDestination') {
            NavRouter() {
              NavDestination().backgroundColor(Color.Pink).commonStyle()
            }
          } else if (this.targetView == 'PatternLock') {
            PatternLock()
              .sideLength(this.componentWidth)
              .key(this.componentKey)
              .onVisibleAreaChange([this._ratiosLeft, this._ratiosRight], (isVisible: boolean, currentRatio: number) => {
                console.info('Text isVisible: ' + isVisible + ', currentRatio:' + currentRatio)
                this._compositionValue += '@' + JSON.stringify({
                  isVisible: JSON.stringify(isVisible),
                  currentRatio: Number(JSON.stringify(currentRatio)).toFixed(2)
                })
              })
          } else if (this.targetView == 'Progress') {
            Progress({ value: 20 })
              .border({ width: 2 })
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'QRCode') {
            QRCode(this.src)
              .border({ width: 2 })
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Radio') {
            Radio({ value: 'Radio1', group: 'radioGroup' })
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Rating') {
            Rating()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'RichText') {
            RichText('RichText').backgroundColor(Color.Pink).commonStyle()
          } else if (this.targetView == 'ScrollBar') {
            ScrollBar({ scroller: this.scroller, state: BarState.On }) {
              Text('text')
            }
            .backgroundColor(Color.Pink)
            .commonStyle()
          } else if (this.targetView == 'Search') {
            Search()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Select') {
            Select([{ value: 'aaa' }, { value: 'bbb' }, { value: 'ccc' }])
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Slider') {
            Slider()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Stepper') {
            Stepper() {
              StepperItem()
            }.backgroundColor(Color.Pink).commonStyle()
          } else if (this.targetView == 'StepperItem') {
            Stepper() {
              StepperItem().backgroundColor(Color.Pink).commonStyle()
            }
          } else if (this.targetView == 'Text') {
            Text('text')
              .fontSize(15)
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'TextArea') {
            TextArea()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'TextClock') {
            TextClock()
              .fontSize(15)
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'TextInput') {
            TextInput()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'TextPicker') {
            TextPicker({ range: this.value })
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'TextTimer') {
            TextTimer({ controller: this.textTimerController })
              .fontSize(15)
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'TimePicker') {
            TimePicker()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Toggle') {
            Toggle({ type: ToggleType.Switch })
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Badge') {
            Badge({
              count: 50,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
            }) {
              Button('message').backgroundColor(0x317aff)
            }
            .backgroundColor(Color.Pink)
            .commonStyle()
          } else if (this.targetView == 'Column') {
            Column()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'ColumnSplit') {
            ColumnSplit() {
              Text('1').backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
              Text('2').backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
            }
            .backgroundColor(Color.Pink)
            .commonStyle()
          } else if (this.targetView == 'Flex') {
            Flex()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'FlowItem') {
            WaterFlow() {
              FlowItem().backgroundColor(Color.Pink).commonStyle()
            }
          } else if (this.targetView == 'GridRow') {
            GridRow()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'GridCol') {
            GridRow() {
              GridCol() {
                Text('GridCol')
              }.backgroundColor(Color.Pink).commonStyle()
            }
          } else if (this.targetView == 'Grid') {
            Grid() {
              GridItem() {
                Text('Grid').backgroundColor(Color.White)
              }
            }
            .backgroundColor(Color.Pink)
            .commonStyle()
          } else if (this.targetView == 'GridItem') {
            Grid() {
              GridItem().backgroundColor(Color.Pink).commonStyle()
            }
          } else if (this.targetView == 'List') {
            List()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'ListItem') {
            List() {
              ListItem() {
                Button('ListItem')
              }
              .backgroundColor(Color.Pink)
              .commonStyle()
            }
          } else if (this.targetView == 'ListItemGroup') {
            List() {
              ListItemGroup().backgroundColor(Color.Pink).commonStyle()
            }
          } else if (this.targetView == 'Navigator') {
            Navigator({ target: '' }).backgroundColor(Color.Pink).commonStyle()
          } else if (this.targetView == 'Panel') {
            Panel(true)
              .backgroundMask(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Refresh') {
            Refresh({ refreshing: false })
              .backgroundColor(Color.Pink)
              .commonStyle()
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
                .id('OnVisibleAreaChange')
            }
            .backgroundColor(Color.Pink)
            .commonStyle()
          } else if (this.targetView == 'Row') {
            Row()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'RowSplit') {
            RowSplit() {
              Text('Text')
            }.commonStyle()
          } else if (this.targetView == 'Scroll') {
            Scroll() {
              Column() {
                ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item) => {
                  Text('Scroll' + item.toString())
                    .width('90%')
                    .height(150)
                    .backgroundColor(Color.White)
                    .textAlign(TextAlign.Center)
                }, item => item)
              }.width('100%')
            }.scrollBar(BarState.On).commonStyle()
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
            Stack()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Swiper') {
            Swiper() {
              ForEach([1, 2, 3], (item: string) => {
                Text('Swiper' + item)
              }, item => item)
            }
            .indicator(true)
            .backgroundColor(Color.Pink)
            .commonStyle()
          } else if (this.targetView == 'Tabs') {
            Tabs()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'TabContent') {
            Tabs() {
              TabContent() {
                Text('TabContent Test')
              }.backgroundColor(Color.Pink).commonStyle()
            }
          } else if (this.targetView == 'WaterFlow') {
            WaterFlow()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Circle') {
            Circle()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Ellipse') {
            Ellipse()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Line') {
            Line()
              .backgroundColor(Color.Pink)
              .startPoint([0, 0])
              .endPoint([50, 100])
              .commonStyle()
          } else if (this.targetView == 'Polyline') {
            Polyline()
              .points([[0, 0], [20, 60], [100, 100]])
              .fillOpacity(0)
              .stroke(Color.Blue)
              .strokeWidth(3)
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Polygon') {
            Polygon()
              .points([[0, 0], [0, 100], [100, 100], [100, 0]])
              .fillOpacity(0)
              .strokeWidth(5)
              .stroke(Color.Blue)
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Path') {
            Path()
              .commands('M100 0 L200 240 L0 240 Z')
              .fillOpacity(0)
              .stroke(Color.Black)
              .strokeWidth(3)
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Rect') {
            Rect()
              .fillOpacity(0)
              .stroke(Color.Red)
              .strokeWidth(3)
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Shape') {
            Shape()
              .backgroundColor(Color.Pink)
              .commonStyle()
          } else if (this.targetView == 'Counter') {
            Counter()
              .backgroundColor(Color.Pink)
              .commonStyle()
          }
        }.width(this.columnWidth).height(this.columnHeight)
      }
      .width(this.scrollWidth)
      .height(this.scrollHeight)
      .backgroundColor(Color.Blue)

      Button('Button')
        .id('OnVisibleAreaChangeButton')
        .width(this.buttonWidth)
        .height(this.buttonHeight)
        .onClick(() => {
          this._compositionValue = ''
          this.scroller.scrollTo({
            xOffset: 0,
            yOffset: this._yOffSetValue,
            animation: { duration: 3000, curve: Curve.Linear }
          })
        })
    }
  }
}