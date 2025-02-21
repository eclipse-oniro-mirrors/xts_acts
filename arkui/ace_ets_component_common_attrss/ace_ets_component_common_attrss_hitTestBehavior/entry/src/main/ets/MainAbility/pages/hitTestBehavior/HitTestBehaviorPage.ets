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

/**
 * Test page of common attribute: hitTestBehavior
 */
@Entry
@Component
struct HitTestBehaviorPage {
  @State _hitTestBehavior: HitTestMode = HitTestMode.Default;
  @State targetView: string = router.getParams() ? router.getParams()['view']['targetView'] : ''
  @State componentKey: string = router.getParams() ? router.getParams()['view']['componentKey'] : ''
  @State TargetEventCallBackStr: string = ''
  @State ChildEventCallBackStr: string = ''
  @State BrotherEventCallBackStr: string = ''
  @State containerView: string = router.getParams() ? router.getParams()['view']['containerView'] : ''
  @State referenceTargetComponentKey: string = router.getParams() ?
  router.getParams()['view']['referenceTargetComponentKey'] : ''
  @State referenceBrotherComponentKey: string = router.getParams() ?
  router.getParams()['view']['referenceBrotherComponentKey'] : ''
  @State referenceChildComponentKey: string = router.getParams() ?
  router.getParams()['view']['referenceChildComponentKey'] : ''

  onPageShow() {
    attrsManager.registerDataChange(value => {
      this._hitTestBehavior = value.HitTestMode
      this.TargetEventCallBackStr = ''
      this.ChildEventCallBackStr = ''
      this.BrotherEventCallBackStr = ''
    })
  }

  /**
   * Set common style.
   */
  @Styles commonStyle(){
    .width(100)
    .height(100)
    .hitTestBehavior(this._hitTestBehavior)
    .id(this.componentKey)
    .onTouch((event: TouchEvent) => {
      console.info('[HitTestBehaviorPage] ' + this.targetView + ' onTouch called at' + event.timestamp);
      this.TargetEventCallBackStr = 'onTargetTouch'
    })
  }

  @Styles onChildTouchStyle(){
    .width(100)
    .height(100)
    .onTouch((event: TouchEvent) => {
      console.info('[HitTestBehaviorPage] ' + this.targetView + ' onTouch called at' + event.timestamp);
      this.ChildEventCallBackStr = 'onChildTouch'
    })
  }

  @Styles onBrotherTouchStyle(){
    .width(100)
    .height(100)
    .onTouch((event: TouchEvent) => {
      console.info('[HitTestBehaviorPage] ' + this.targetView + ' onTouch called at' + event.timestamp);
      this.BrotherEventCallBackStr = 'onBrotherTouch'
    })
  }

  @Builder buttonBrotherView() {
    Button()
      .onBrotherTouchStyle()
      .id('button')
  }

  @Builder buildTargetView() {
    if (this.targetView == 'Button') {
      Button() {
        Text().onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'Blank') {
      Row() {
        Blank().backgroundColor(Color.Yellow).commonStyle()
      }
    } else if (this.targetView == 'Text') {
      Text('text1') {
        Span('span').onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'Checkbox') {
      Checkbox({ name: 'checkbox1', group: 'checkboxGroup' }).commonStyle()
    } else if (this.targetView == 'CheckboxGroup') {
      CheckboxGroup({ group: 'checkboxGroup' }).commonStyle()
    } else if (this.targetView == 'DataPanel') {
      DataPanel({ values: [5, 10, 10, 7, 9, 10, 10, 10, 10] }).commonStyle()
    } else if (this.targetView == 'DatePicker') {
      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
      }).commonStyle()
    } else if (this.targetView == 'Divider') {
      Divider().commonStyle()
    } else if (this.targetView == 'Gauge') {
      Gauge({ value: 105 })
        .commonStyle()
        .colors([[0x317AF7, 1], [0x5BA854, 1], [0xE08C3A, 1], [0x9C554B, 1]])
    } else if (this.targetView == 'Image') {
      Image($r('app.media.icon'))
        .draggable(false)
        .commonStyle()
    } else if (this.targetView == 'Marquee') {
      Marquee({
        start: true,
        step: 50,
        loop: Infinity,
        fromStart: true,
        src: 'Running Marquee starts rolling'
      }).commonStyle()
    } else if (this.targetView == 'Progress') {
      Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle()
    } else if (this.targetView == 'QRCode') {
      QRCode('Running Marquee starts rolling').commonStyle()
    } else if (this.targetView == 'Radio') {
      Radio({ value: 'Radio1', group: 'radioGroup' }).commonStyle()
    } else if (this.targetView == 'ScrollBar') {
      ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
        Text()
          .width(100)
          .height(100)
          .backgroundColor('#C0C0C0')
          .onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'Select') {
      Select([{ value: 'aaa' },
        { value: 'bbb' }]).commonStyle()
    } else if (this.targetView == 'TextArea') {
      TextArea({
        placeholder: 'The text area can hold an unlimited amount of text. input your word...'
      }).commonStyle()
    } else if (this.targetView == 'TextClock') {
      TextClock({ timeZoneOffset: -8 }).format('hms').commonStyle()
    } else if (this.targetView == 'TextInput') {
      TextInput({ placeholder: 'input your word...' }).commonStyle()
    } else if (this.targetView == 'TextPicker') {
      TextPicker({ range: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'] }).commonStyle()
    } else if (this.targetView == 'TextTimer') {
      TextTimer({ isCountDown: true, count: 30000 })
        .format('mm:ss.SS')
        .fontColor(Color.Black)
        .commonStyle()
    } else if (this.targetView == 'TimePicker') {
      TimePicker({
        selected: new Date('2022-07-22T08:00:00')
      }).commonStyle()
    } else if (this.targetView == 'Toggle') {
      Toggle({ type: ToggleType.Button, isOn: false }) {
        Text('status button').fontColor('#182431').fontSize(12).onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'Circle') {
      Circle().commonStyle()
    } else if (this.targetView == 'Ellipse') {
      Ellipse().commonStyle()
    } else if (this.targetView == 'Line') {
      Line().commonStyle().backgroundColor(Color.Black)
    } else if (this.targetView == 'Polyline') {
      Polyline().commonStyle()
    } else if (this.targetView == 'Polygon') {
      Polygon().commonStyle()
    } else if (this.targetView == 'Path') {
      Path().commonStyle()
    } else if (this.targetView == 'Rect') {
      Rect().commonStyle()
    } else if (this.targetView == 'Shape') {
      Shape() {
        Rect().width(100).height(100).onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'Column') {
      Column() {
        Column().width(100).height(100).backgroundColor(0xAFEEEE).onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'ColumnSplit') {
      ColumnSplit() {
        Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        Text('2')
          .width('100%')
          .height(50)
          .backgroundColor(0xF5DEB3)
          .textAlign(TextAlign.Center)
          .onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'Flex') {
      Flex() {
        Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          .onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'Grid') {
      Grid() {
        GridItem() {
          Text('day').backgroundColor(Color.White)
            .width('100%').height('100%').textAlign(TextAlign.Center)
        }.onChildTouchStyle()
      }.backgroundColor(0xFAEEE0)
      .commonStyle()
    } else if (this.targetView == 'List') {
      List() {
        ListItem() {
          Text('text')
            .width('100%')
            .height(100)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0xFFFFFF)
        }.onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'Navigator') {
      Navigator({ target: '' }) {
        Text('Go to back page').width('100%').height(20).onChildTouchStyle()
      }.commonStyle().backgroundColor(Color.Red)
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
          .onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'Row') {
      Row() {
        Button('buttonRow').onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'RowSplit') {
      RowSplit() {
        Text('Text').onChildTouchStyle()
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
        }.width('100%').onChildTouchStyle()
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
        .onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'Stack') {
      Stack() {
        Button('buttonStack').onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'Swiper') {
      Swiper() {
        ForEach([1, 2, 3], (item: string) => {
          Text('Swiper' + item).width('90%').height(50)
            .onChildTouchStyle()
        }, item => item)
      }.indicator(true).backgroundColor(Color.White).commonStyle()
    } else if (this.targetView == 'WaterFlow') {
      WaterFlow() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: number) => {
          FlowItem() {
            Column() {
              Text('WaterFlow' + item).fontSize(12).height('16')
              Image($r('app.media.icon')).width(50).height(50).objectFit(ImageFit.Fill)
            }
          }.onChildTouchStyle()
        }, item => item)
      }.commonStyle()
    } else if (this.targetView == 'GridItem') {
      Grid() {
        GridItem() {
          Text('GridItem1').backgroundColor(Color.White)
            .width('100%').height('100%').textAlign(TextAlign.Center)
        }.onBrotherTouchStyle()

        GridItem() {
          Text('GridItem2')
            .backgroundColor(Color.White)
            .width('100%')
            .height('100%')
            .textAlign(TextAlign.Center)
            .onChildTouchStyle()
        }.commonStyle()
      }
      .width('100%')
      .height('70%')
      .backgroundColor(Color.Black)
    } else if (this.targetView == 'StepperItem') {
      Stepper() {
        StepperItem() {
          Column() {
            Text('Page One')
          }
        }.onBrotherTouchStyle()

        StepperItem() {
          Column() {
            Text('Page One')
          }.onChildTouchStyle()
        }.width('100%').height('100%').commonStyle()
      }
    } else if (this.targetView == 'FlowItem') {
      WaterFlow() {
        FlowItem() {
          Column() {
            Text('WaterFlow').fontSize(12).height('16')
            Image($r('app.media.icon')).width(50).height(50).objectFit(ImageFit.Fill)
          }
        }.onBrotherTouchStyle()

        FlowItem() {
          Column() {
            Text('WaterFlow').fontSize(12).height('16')
            Image($r('app.media.icon')).width(50).height(50).objectFit(ImageFit.Fill)
          }.onChildTouchStyle()
        }.commonStyle().width('100%').height('100%')
      }
    } else if (this.targetView == 'ListItem') {
      List({ space: 20, initialIndex: 0 }) {
        ListItem() {
          Text('item1')
            .width('100%')
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.White)
        }.onBrotherTouchStyle()

        ListItem() {
          Text('item1')
            .width('100%')
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.White)
            .onChildTouchStyle()
        }.commonStyle()
      }.width('100%').height('70%')
    } else if (this.targetView == 'TabContent') {
      Tabs() {
        TabContent() {
          Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White)
        }.tabBar('Tabs1').onBrotherTouchStyle()

        TabContent() {
          Text('referenceComponent').width('100%').height('100%').backgroundColor(Color.Orange).onChildTouchStyle()
        }.tabBar('Tabs2').commonStyle()
      }.width('100%')
      .height('70%')
    } else if (this.targetView == 'AlphabetIndexer') {
      AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 }).commonStyle()
    } else if (this.targetView == 'ImageAnimator') {
      ImageAnimator()
        .images([{ src: $r('app.media.icon') }])
        .commonStyle()
    } else if (this.targetView == 'LoadingProgress') {
      LoadingProgress()
        .commonStyle()
    } else if (this.targetView == 'Menu') {
      Menu() {
        MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
          .onChildTouchStyle()
      }.backgroundColor(Color.Yellow).commonStyle()
    } else if (this.targetView == 'Navigation') {
      Navigation().commonStyle()
    } else if (this.targetView == 'NavRouter') {
      NavRouter() {
        Row() {
          Image($r('app.media.icon'))
        }

        NavDestination() {
          Text('NavDestination').fontSize(10)
        }
        .onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'Rating') {
      Rating({ rating: 3.5, indicator: false }).commonStyle()
    } else if (this.targetView == 'Search') {
      Search().commonStyle()
    } else if (this.targetView == 'Slider') {
      Slider({
        value: 50,
        min: 0,
        max: 100,
        style: SliderStyle.OutSet
      }).showTips(true).commonStyle()
    } else if (this.targetView == 'Stepper') {
      Stepper() {
        StepperItem() {
          Column() {
            Text('Page One')
          }
        }.onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'Badge') {
      Badge({
        count: 50,
        style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
      }) {
        Button('message')
          .width(100).height(50).backgroundColor(0x317aff).onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'Counter') {
      Counter() {
        Button('buttonCounter')
          .onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'GridRow') {
      GridRow({
        columns: 1,
        gutter: { x: 5, y: 10 },
        direction: GridRowDirection.Row
      }) {
        ForEach([Color.Red], (color) => {
          GridCol({ span: 1 }) {
            Row().width('100%').height('20vp')
          }.borderColor(color).borderWidth(2).onChildTouchStyle()
        })
      }.commonStyle()
    } else if (this.targetView == 'Panel') {
      Panel(true) {
        Text('Text').onChildTouchStyle()
      }.backgroundColor(Color.Yellow).commonStyle()
    } else if (this.targetView == 'Refresh') {
      Refresh({ refreshing: false }) {
        Text('123').onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'Tabs') {
      Tabs() {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.onChildTouchStyle()
      }.commonStyle()
    } else if (this.targetView == 'MenuItem') {
      Menu() {
        MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
          .onBrotherTouchStyle()
        MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' }).commonStyle()
      }.width('100%').height('70%').backgroundColor(Color.Yellow)
    } else if (this.targetView == 'MenuItemGroup') {
      Menu() {
        MenuItemGroup({ header: 'MenuItemGroup' }) {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
        }.onBrotherTouchStyle()

        MenuItemGroup({ header: 'MenuItemGroup' }) {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' }).onChildTouchStyle()
        }.commonStyle()
      }.width('100%').height('70%').backgroundColor(Color.Yellow)
    } else if (this.targetView == 'ListItemGroup') {
      List({ space: 0, initialIndex: 0 }) {
        ListItemGroup().backgroundColor(Color.Yellow).onBrotherTouchStyle()
        ListItemGroup() {
          ListItem().onChildTouchStyle()
        }.backgroundColor(Color.Red).commonStyle()
      }
    } else if (this.targetView == 'GridCol') {
      GridRow({}) {
        GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
          Row().width('100%').height('20vp')
        }.onBrotherTouchStyle()

        GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
          Row().width('100%').height('20vp').onChildTouchStyle()
        }.commonStyle()
      }.width('100%').height('70%')
    }
  }

  build() {
    Column() {
      Text(this.TargetEventCallBackStr).key(this.referenceTargetComponentKey).fontSize(30).width(100).height(100)
      Text(this.BrotherEventCallBackStr).key(this.referenceBrotherComponentKey).fontSize(30).width(100).height(100)
      Text(this.ChildEventCallBackStr).key(this.referenceChildComponentKey).fontSize(30).width(100).height(100)
      if (this.containerView == 'RelativeContainer') {
        RelativeContainer() {
          if (this.targetView == 'TabContent' || this.targetView == 'ListItemGroup' || this.targetView == 'ListItem'
          || this.targetView == 'GridItem' || this.targetView == 'GridCol' || this.targetView == 'FlowItem'
          || this.targetView == 'StepperItem' || this.targetView == 'MenuItemGroup' || this.targetView == 'Blank') {
            this.buildTargetView();
          } else {
            this.buttonBrotherView();
            this.buildTargetView();
          }
        }.width('80%').height('80%').backgroundColor(Color.Pink)
      } else {
        Stack() {
          if (this.targetView == 'TabContent' || this.targetView == 'ListItemGroup' || this.targetView == 'ListItem'
          || this.targetView == 'GridItem' || this.targetView == 'GridCol' || this.targetView == 'FlowItem'
          || this.targetView == 'StepperItem' || this.targetView == 'MenuItemGroup' || this.targetView == 'Blank') {
            this.buildTargetView();
          } else {
            this.buttonBrotherView();
            this.buildTargetView();
          }
        }.width('80%').height('80%').backgroundColor(Color.Pink)
      }
    }.width('100%').height('100%').backgroundColor(Color.White)
  }
}