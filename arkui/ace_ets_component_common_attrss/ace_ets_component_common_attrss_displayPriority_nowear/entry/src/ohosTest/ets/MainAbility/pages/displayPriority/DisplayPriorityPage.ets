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
import router from '@ohos.router';

@Entry
@Component
struct DisplayPriorityPage {
  @State _displayPriority: number = 1.0;
  @State _compareOneButtonDisplayPriority: number = 2.0;
  @State containerView: string = router.getParams() ? (router.getParams() as ESObject)['view']['containerView'] : ''
  @State targetView: string = router.getParams() ? (router.getParams() as ESObject)['view']['targetView'] : ''
  @State targetGroupView: string = router.getParams() ? (router.getParams() as ESObject)['view']['targetGroupView'] : ''
  @State componentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['componentKey'] : ''
  @State targetWidth: number = router.getParams() ? (router.getParams() as ESObject)['view']['targetWidth'] : 0
  @State targetHeight: number = router.getParams() ? (router.getParams() as ESObject)['view']['targetHeight'] : 0
  @State compareOneButtonWidth: number = router.getParams() ? (router.getParams() as ESObject)['view']['compareOneButtonWidth'] : 0
  @State compareOneButtonHeight: number = router.getParams() ? (router.getParams() as ESObject)['view']['compareOneButtonHeight'] : 0
  @State compareOneButtonDisplayPriority: number =
    router.getParams() ? (router.getParams() as ESObject)['view']['compareOneButtonDisplayPriority'] : 0
  @State compareOneButtonKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['compareOneButtonKey'] : ''
  @State compareTwoButtonWidth: number = router.getParams() ? (router.getParams() as ESObject)['view']['compareTwoButtonWidth'] : 0
  @State compareTwoButtonHeight: number = router.getParams() ? (router.getParams() as ESObject)['view']['compareTwoButtonHeight'] : 0
  @State compareTwoButtonDisplayPriority: number =
    router.getParams() ? (router.getParams() as ESObject)['view']['compareTwoButtonDisplayPriority'] : 0
  @State compareTwoButtonKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['compareTwoButtonKey'] : ''
  @State parentWidth: number = router.getParams() ? (router.getParams() as ESObject)['view']['parentWidth'] : 0
  @State parentHeight: number = router.getParams() ? (router.getParams() as ESObject)['view']['parentHeight'] : 0
  @State parentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['parentKey'] : ''
  textTimerController: TextTimerController = new TextTimerController()
  private scroller: Scroller = new Scroller()
  private value: string[] = ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'];
  private src: string = 'Running Marquee starts rolling A B C D E F G H I J K L M N O P Q R S T U V W X Y Z';

  onPageShow() {
    console.info('DisplayPriorityPage page show called')
    AttrsManager.registerDataChange((value: ESObject) => {
      if (value.displayPriority != undefined) {
        this._displayPriority = value.displayPriority
      }
      if (value.compareOneButtonDisplayPriority != undefined) {
        this._compareOneButtonDisplayPriority = value.compareOneButtonDisplayPriority
      }
    })
  }

  /*
   * Set common style.
   */
  @Styles
  commonStyle(){
    .width(this.targetWidth)
    .height(this.targetHeight)
    .displayPriority(this._displayPriority)
    .key(this.componentKey)
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
        .margin(0)
        .commonStyle()
    } else if (this.targetView == 'CheckboxGroup') {
      CheckboxGroup({ group: 'checkboxGroup' })
        .margin(0)
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
    } else if (this.targetView == 'Navigation') {
      Navigation()
        .backgroundColor(Color.Pink)
        .commonStyle()
    } else if (this.targetView == 'NavRouter') {
      NavRouter().backgroundColor(Color.Pink).commonStyle()
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
        .margin(0)
        .commonStyle()
    } else if (this.targetView == 'Rating') {
      Rating()
        .backgroundColor(Color.Pink)
        .commonStyle()
    } else if (this.targetView == 'ScrollBar') {
      ScrollBar({ scroller: this.scroller }) {
        Text('1')
      }.backgroundColor(Color.Pink).commonStyle()
    } else if (this.targetView == 'Search') {
      Search()
        .backgroundColor(Color.Pink)
        .margin(0)
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
        .margin(0)
        .commonStyle()
    } else if (this.targetView == 'Badge') {
      Badge({
        value: '',
        style: { badgeSize: 6, badgeColor: '#FA2A2D' }
      }) {
        Text('1')
      }.backgroundColor(Color.Pink).commonStyle()
    } else if (this.targetView == 'Column') {
      Column()
        .backgroundColor(Color.Pink)
        .commonStyle()
    } else if (this.targetView == 'ColumnSplit') {
      ColumnSplit() {
        Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        Text('2').width('100%').height(50).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
        Text('3').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
      }
      .backgroundColor(Color.Pink)
      .commonStyle()
    } else if (this.targetView == 'Counter') {
      Counter()
        .backgroundColor(Color.Pink)
        .commonStyle()
    } else if (this.targetView == 'Flex') {
      Flex()
        .backgroundColor(Color.Pink)
        .commonStyle()
    } else if (this.targetView == 'GridRow') {
      GridRow() {
        GridCol() {
          Text('GridCol')
        }.backgroundColor(Color.Pink)
      }.commonStyle()
    } else if (this.targetView == 'Grid') {
      Grid() {
        GridItem() {
          Text('Grid').backgroundColor(Color.White)
        }
      }
      .backgroundColor(Color.Pink)
      .commonStyle()
    } else if (this.targetView == 'List') {
      List()
        .backgroundColor(Color.Pink)
        .commonStyle()
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
        Text('1')
      }.backgroundColor(Color.Pink).commonStyle()
    } else if (this.targetView == 'Row') {
      Row()
        .backgroundColor(Color.Pink)
        .commonStyle()
    } else if (this.targetView == 'RowSplit') {
      RowSplit() {
        Text('Text')
      }.commonStyle()
    } else if (this.targetView == 'Scroll') {
      Scroll(this.scroller) {
        Text('1')
      }.backgroundColor(Color.Pink).commonStyle()
    } else if (this.targetView == 'SideBarContainer') {
      SideBarContainer(SideBarContainerType.Embed) {
        Column() {
          Text('SideBarContainer content')
        }.backgroundColor(Color.Orange)
      }
      .backgroundColor(Color.Pink)
      .commonStyle()
    } else if (this.targetView == 'Stack') {
      Stack()
        .backgroundColor(Color.Pink)
        .commonStyle()
    } else if (this.targetView == 'Swiper') {
      Swiper() {
        ForEach([1, 2, 3], (item: number) => {
          Text('Swiper' + item)
        }, (item: number) => item.toString())
      }
      .indicator(true)
      .backgroundColor(Color.Pink)
      .commonStyle()
    } else if (this.targetView == 'Tabs') {
      Tabs()
        .backgroundColor(Color.Pink)
        .commonStyle()
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
      }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Green).key(this.parentKey)
    } else if (this.containerView == 'Column') {
      Column() {
        this.buildTargetView();
      }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Green).key(this.parentKey)
    } else if (this.containerView == 'Flex') {
      Flex() {
        this.buildTargetView();
      }.width(this.parentWidth).height(this.parentHeight).backgroundColor(Color.Green).key(this.parentKey)
    }
  }
}