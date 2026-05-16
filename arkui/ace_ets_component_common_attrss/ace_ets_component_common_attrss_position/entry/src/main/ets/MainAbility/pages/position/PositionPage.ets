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

import { ListItemGroupView } from '../../view/position/ListItemGroupView';
import { FlowItemView } from '../../view/position/FlowItemView';
import { StepperItemView } from '../../view/position/StepperItemView';
import { StepperView } from '../../view/position/StepperView';
import { NavRouterView } from '../../view/position/NavRouterView';
import { WaterFlowView } from '../../view/position/WaterFlowView';
import { TabsView } from '../../view/position/TabsView';
import { AlphabetIndexerView } from '../../view/position/AlphabetIndexerView';
import { NavigationView } from '../../view/position/NavigationView';
import attrsManager from '../../common/AttrsManager';
import router from '@ohos.router'

/**
 * Test page of common attribute: position
 */
@Entry
@Component
struct PositionPage {
  @State _position: Position = { x: 0, y: 0 };
  @State targetView: string = router.getParams() ? (router.getParams() as ESObject)?.['view']?.['targetView'] : ''
  @State componentKey: string = router.getParams() ? (router.getParams() as ESObject)?.['view']?.['componentKey'] : ''
  @State parentWidth: number = router.getParams() ? (router.getParams() as ESObject)?.['view']?.['parentWidth'] : 0
  @State parentHeight: number = router.getParams() ? (router.getParams() as ESObject)?.['view']?.['parentHeight'] : 0
  @State parentComponentKey: string = router.getParams() ? (router.getParams() as ESObject)?.['view']?.['parentComponentKey'] : ''
  @State referenceComponentKey: string =
    router.getParams() ? (router.getParams() as ESObject)?.['view']?.['referenceComponentKey'] : ''

  onPageShow() {
    console.info('[PositionPage] page show called ')

    //Register data change call back.
    attrsManager.registerDataChange((value: ESObject) => {
      this._position = value
    })
  }

  /**
   * Set common style.
   */
  @Styles
  commonStyle(){
    .position(this._position)
    .key(this.componentKey)
    .borderWidth(0)
    .padding(0)
    .margin(0)
  }

  build() {
    Row() {
      Column() {
        //Create view by config.
        if (this.targetView == 'MenuItem') {
          Row() {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' }).commonStyle()
              MenuItem({ startIcon: $r('app.media.icon'), content: 'referenceComponent' })
                .key(this.referenceComponentKey)
            }
            .backgroundColor(Color.Yellow)
            .width(this.parentWidth)
            .height(this.parentHeight)
            .key(this.parentComponentKey)
            .borderWidth(0).padding(0).margin(0)
          }.width('100%').height('100%').backgroundColor(Color.Green)
        } else if (this.targetView == 'MenuItemGroup') {
          Row() {
            Menu() {
              MenuItemGroup({ header: 'MenuItemGroup' }) {
                MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
              }.commonStyle()

              MenuItem({ startIcon: $r('app.media.icon'), content: 'referenceComponent' })
                .key(this.referenceComponentKey)
            }
            .backgroundColor(Color.Yellow)
            .width(this.parentWidth)
            .height(this.parentHeight)
            .key(this.parentComponentKey)
            .borderWidth(0).padding(0).margin(0)
          }
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Green)
        } else if (this.targetView == 'ListItem') {
          List({ space: 20, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle()

            ListItem() {
              Text('referenceComponent')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.key(this.referenceComponentKey)
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
          .listDirection(Axis.Vertical)
          .borderWidth(0).padding(0).margin(0)
        } else if (this.targetView == 'ListItemGroup') {
          ListItemGroupView({
            _position: $_position,
            componentKey: this.componentKey,
            parentWidth: this.parentWidth,
            parentHeight: this.parentHeight,
            parentComponentKey: this.parentComponentKey,
            referenceComponentKey: this.referenceComponentKey
          })
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test')
                .width('100%')
                .height('100%')
                .backgroundColor(Color.White)
            }
            .tabBar('Tabs1')
            .commonStyle()

            TabContent() {
              Text('referenceComponent')
                .width('100%')
                .height('100%')
                .backgroundColor(Color.Orange)
            }
            .tabBar('Tabs2')
            .key(this.referenceComponentKey)
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
          .borderWidth(0).padding(0).margin(0)
        } else if (this.targetView == 'ColumnSplit') {
          Column() {
            Text('The secant line can be dragged').fontSize(9)
              .fontColor(0xCCCCCC)
              .width('90%')
              .key(this.referenceComponentKey)
            ColumnSplit() {
              Text('1')
                .width('100%')
                .height(50)
                .backgroundColor(0xF5DEB3)
                .textAlign(TextAlign.Center)
            }
            .commonStyle()
            .backgroundColor(Color.Pink)
            .width('90%').height('60%')
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
          .borderWidth(0).padding(0).margin(0)
        } else if (this.targetView == 'RowSplit') {
          Column() {
            Text('The second line can be dragged').fontSize(9)
              .fontColor(0xCCCCCC)
              .width('90%')
              .key(this.referenceComponentKey)
            RowSplit() {
              Text('1')
                .width('10%')
                .height(100)
                .backgroundColor(0xF5DEB3)
                .textAlign(TextAlign.Center)
              Text('2')
                .width('10%')
                .height(100)
                .backgroundColor(0xD2B48C)
                .textAlign(TextAlign.Center)
              Text('3')
                .width('10%')
                .height(100)
                .backgroundColor(0xF5DEB3)
                .textAlign(TextAlign.Center)
              Text('4')
                .width('10%')
                .height(100)
                .backgroundColor(0xD2B48C)
                .textAlign(TextAlign.Center)
              Text('5')
                .width('10%')
                .height(100)
                .backgroundColor(0xF5DEB3)
                .textAlign(TextAlign.Center)
            }
            .width('90%')
            .height(100)
            .commonStyle()
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
          .borderWidth(0).padding(0).margin(0)
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 5,
            gutter: { x: 5, y: 10 },
            breakpoints: { value: ['400vp', '600vp', '800vp'], reference: BreakpointsReference.WindowSize },
            direction: GridRowDirection.Row
          }) {
            GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
              Row()
                .width('100%')
                .height('20vp')
            }
            .backgroundColor(Color.Green)
            .commonStyle()

            GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
              Row()
                .width('100%')
                .height('20vp')
            }
            .backgroundColor(Color.Yellow)
            .key(this.referenceComponentKey)
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
          .borderWidth(0).padding(0).margin(0)
        } else if (this.targetView == 'GridItem') {
          Grid() {
            GridItem() {
              Text('GridItem1').backgroundColor(Color.White)
                .width('100%').height('100%').textAlign(TextAlign.Center)
            }.commonStyle()

            GridItem() {
              Text('GridItem2').backgroundColor(Color.White)
                .width('100%').height('100%').textAlign(TextAlign.Center)
            }.key(this.referenceComponentKey)
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .backgroundColor(Color.Black)
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
          .borderWidth(0).padding(0).margin(0)
        } else if (this.targetView == 'StepperItem') {
          StepperItemView({
            _position: $_position,
            componentKey: this.componentKey,
            parentWidth: this.parentWidth,
            parentHeight: this.parentHeight,
            parentComponentKey: this.parentComponentKey,
            referenceComponentKey: this.referenceComponentKey
          })
        } else if (this.targetView == 'FlowItem') {
          FlowItemView({
            _position: $_position,
            componentKey: this.componentKey,
            parentWidth: this.parentWidth,
            parentHeight: this.parentHeight,
            parentComponentKey: this.parentComponentKey,
            referenceComponentKey: this.referenceComponentKey
          })
        } else {
          Row() {
            //Set view by page config.
            if (this.targetView == 'AlphabetIndexer') {
              AlphabetIndexerView({ _position: $_position, componentKey: this.componentKey })
            } else if (this.targetView == 'Blank') {
              Blank().backgroundColor(Color.Orange).commonStyle()
            } else if (this.targetView == 'Button') {
              Button('button1').commonStyle()
            } else if (this.targetView == 'Checkbox') {
              Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
                .commonStyle()
                .margin(0)
            } else if (this.targetView == 'CheckboxGroup') {
              CheckboxGroup({ group: 'checkboxGroup' })
                .commonStyle()
                .margin(0)
            } else if (this.targetView == 'DataPanel') {
              DataPanel({ values: [25], max: 100, type: DataPanelType.Circle })
                .commonStyle()
            } else if (this.targetView == 'DatePicker') {
              DatePicker({
                start: new Date('1970-1-1'),
                end: new Date('2100-1-1'),
                selected: new Date()
              }).commonStyle()
            } else if (this.targetView == 'Divider') {
              Divider()
                .strokeWidth(8)
                .vertical(true)
                .commonStyle()
            } else if (this.targetView == 'Gauge') {
              Gauge({ value: 75 }).colors([[Color.White, 1], [Color.Black, 1]])
                .commonStyle()
            } else if (this.targetView == 'Image') {
              Image($r('app.media.icon')).commonStyle()
            } else if (this.targetView == 'ImageAnimator') {
              ImageAnimator().images([{ src: $r('app.media.icon') }])
                .width('100%')
                .height('100%')
                .commonStyle()
            } else if (this.targetView == 'LoadingProgress') {
              LoadingProgress().color(Color.Blue).commonStyle()
            } else if (this.targetView == 'Marquee') {
              Marquee({ start: true, step: 50, src: 'Running Marquee starts rolling' })
                .fontWeight(700).fontColor(Color.White).fontSize(48).commonStyle()
            } else if (this.targetView == 'Menu') {
              Menu() {
                MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
              }.backgroundColor(Color.Yellow).commonStyle()
            } else if (this.targetView == 'Navigation') {
              NavigationView({ _position: $_position, componentKey: this.componentKey })
            } else if (this.targetView == 'NavRouter') {
              NavRouterView({ _position: $_position, componentKey: this.componentKey })
            } else if (this.targetView == 'Progress') {
              Progress({ value: 50, type: ProgressType.Linear }).commonStyle()
            } else if (this.targetView == 'QRCode') {
              QRCode('QRCode')
                .color(0xF7CE00)
                .width(200)
                .height(200)
                .commonStyle()
            } else if (this.targetView == 'Radio') {
              Radio({ value: 'Radio1', group: 'radioGroup' })
                .commonStyle()
                .margin(0)
            } else if (this.targetView == 'Rating') {
              Rating({ rating: 4 })
                .stars(5)
                .commonStyle()
            } else if (this.targetView == 'ScrollBar') {
              ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
                Text()
                  .width(20)
                  .height(100)
                  .borderRadius(10)
                  .backgroundColor('#C0C0C0')
              }
              .width(20)
              .backgroundColor('#ededed')
              .commonStyle()
            } else if (this.targetView == 'Stepper') {
              StepperView({ _position: $_position, componentKey: this.componentKey });
            } else if (this.targetView == 'Search') {
              Search({ placeholder: 'Type to search...' })
                .backgroundColor(Color.White)
                .searchButton('SEARCH')
                .commonStyle()
                .margin(0)
            } else if (this.targetView == 'Select') {
              Select([{ value: 'aaa', icon: '/common/public_icon.svg' },
                { value: 'bbb', icon: '/common/public_icon.svg' }]).commonStyle()
            } else if (this.targetView == 'Slider') {
              Slider({ value: 50, style: SliderStyle.OutSet, direction: Axis.Vertical })
                .blockColor('#191970')
                .trackColor('#ADD8E6')
                .selectedColor('#4169E1')
                .commonStyle()
            } else if (this.targetView == 'Text') {
              Text('text')
                .fontColor(Color.White)
                .fontSize(30)
                .commonStyle()
            } else if (this.targetView == 'TextArea') {
              TextArea({ placeholder: 'TextArea', })
                .backgroundColor(Color.White)
                .commonStyle()
            } else if (this.targetView == 'TextClock') {
              TextClock({ timeZoneOffset: -8 })
                .format('hms')
                .commonStyle()
            } else if (this.targetView == 'TextInput') {
              TextInput({ placeholder: 'TextInput' })
                .backgroundColor(Color.White)
                .commonStyle()
            } else if (this.targetView == 'TextPicker') {
              TextPicker({ range: ['apple1', 'orange2', 'peach3'], selected: 1 }).commonStyle()
            } else if (this.targetView == 'TextTimer') {
              TextTimer({ count: 30000 }).commonStyle()
            } else if (this.targetView == 'TimePicker') {
              TimePicker().commonStyle()
            } else if (this.targetView == 'Toggle') {
              Toggle({ type: ToggleType.Switch }).commonStyle().margin(0)
            } else if (this.targetView == 'Badge') {
              Badge({
                value: '',
                style: { badgeSize: 6, badgeColor: Color.Red }
              }) {
                Button('BadgeContent')
              }.commonStyle()
            } else if (this.targetView == 'Column') {
              Column()
                .height('50%')
                .width('50%')
                .backgroundColor(Color.Green)
                .commonStyle()
            } else if (this.targetView == 'Counter') {
              Counter() {
                Text('1')
              }.commonStyle()
            } else if (this.targetView == 'Flex') {
              Flex()
                .height('50%')
                .width('50%')
                .backgroundColor(Color.Green)
                .commonStyle()
            } else if (this.targetView == 'GridRow') {
              GridRow({
                columns: 5,
                gutter: { x: 5, y: 10 },
                breakpoints: { value: ['400vp', '600vp', '800vp'], reference: BreakpointsReference.WindowSize },
                direction: GridRowDirection.Row
              }) {
                ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green,
                  Color.Pink, Color.Grey, Color.Blue, Color.Brown], (color: Color) => {
                  GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
                    Row()
                      .width('100%')
                      .height('20vp')
                  }.backgroundColor(color)
                })
              }
              .width('100%')
              .height('100%')
              .commonStyle()
            } else if (this.targetView == 'Grid') {
              Grid() {
                ForEach(['0', '1', '2', '3', '4'], () => {
                  ForEach(['0', '1', '2', '3', '4'], (day: string) => {
                    GridItem() {
                      Text(day)
                        .backgroundColor(Color.White)
                        .width('100%')
                        .height('100%')
                        .textAlign(TextAlign.Center)
                    }
                  })
                })
              }
              .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
              .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
              .commonStyle()
            } else if (this.targetView == 'List') {
              List({ space: 20, initialIndex: 0 }) {
                ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: string) => {
                  ListItem() {
                    Text('' + item)
                      .width('100%')
                      .textAlign(TextAlign.Center)
                      .backgroundColor(Color.White)
                  }
                }, (item: string) => item)
              }
              .width('100%')
              .height('100%')
              .listDirection(Axis.Vertical)
              .commonStyle()
            } else if (this.targetView == 'Navigator') {
              Navigator({ target: 'MainAbility/pages/index/Index' }) {
                Text('Navigator Go to index page')
                  .width('100%').textAlign(TextAlign.Center)
              }.commonStyle()
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
                  .id('PositionPageRow')
              }
              .height('50%')
              .width('50%')
              .backgroundColor(Color.Green)
              .commonStyle()
            } else if (this.targetView == 'Row') {
              Row()
                .height('50%')
                .width('50%')
                .backgroundColor(Color.Green)
                .commonStyle()
            } else if (this.targetView == 'Panel') {
              Panel(true) {
                Column() {
                  Text('Panel')
                }
              }
              .mode(PanelMode.Half)
              .commonStyle()
            } else if (this.targetView == 'Refresh') {
              Refresh({ refreshing: true }) {
                Text('Refresh').fontSize(30)
              }
              .commonStyle()
            } else if (this.targetView == 'Scroll') {
              Scroll() {
                Column() {
                  ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: string) => {
                    Text('Scroll' + item.toString())
                      .width('90%')
                      .height(150)
                      .backgroundColor(Color.White)
                      .textAlign(TextAlign.Center)
                  }, (item: string) => item)
                }.width('100%')
              }
              .scrollBar(BarState.On)
              .commonStyle()
            } else if (this.targetView == 'SideBarContainer') {
              SideBarContainer(SideBarContainerType.Embed) {
                Column() {
                  ForEach([1, 2, 3], (item: string) => {
                    Column({ space: 5 }) {
                      Image($r('app.media.icon'))
                        .width(64)
                        .height(64)
                      Text('Index0' + item)
                        .fontSize(25)
                    }
                  })
                }.width('100%')
                .justifyContent(FlexAlign.SpaceEvenly)
                .backgroundColor(Color.Green)

                Column() {
                  Text('SideBarContainer content')
                    .fontSize(25)
                }.backgroundColor(Color.Orange)
              }.commonStyle()
            } else if (this.targetView == 'Stack') {
              Stack() {
                Text('Stack').fontColor(Color.White)
              }
              .backgroundColor(Color.Orange)
              .width('50%')
              .height('50%')
              .commonStyle()
            } else if (this.targetView == 'Swiper') {
              Swiper() {
                ForEach([1, 2, 3], (item: string) => {
                  Text('Swiper' + item)
                    .width('90%')
                    .height(160)
                }, (item: string) => item)
              }
              .indicator(true)
              .backgroundColor(Color.White)
              .commonStyle()
            } else if (this.targetView == 'Tabs') {
              TabsView({ _position: $_position, componentKey: this.componentKey })
            } else if (this.targetView == 'WaterFlow') {
              WaterFlowView({ _position: $_position, componentKey: this.componentKey })
            } else if (this.targetView == 'Circle') {
              Circle({ width: 150, height: 150 }).commonStyle()
            } else if (this.targetView == 'Ellipse') {
              Ellipse({ width: 150, height: 80 }).commonStyle()
            } else if (this.targetView == 'Line') {
              Line()
                .width(200)
                .height(150)
                .startPoint([0, 0])
                .endPoint([50, 100])
                .stroke(Color.Black)
                .backgroundColor('#F5F5F5')
                .commonStyle()
            } else if (this.targetView == 'Polyline') {
              Polyline({ width: 100, height: 100 })
                .points([[0, 0], [20, 60], [100, 100]])
                .fillOpacity(0)
                .stroke(Color.Blue)
                .strokeWidth(3)
                .commonStyle()
            } else if (this.targetView == 'Polygon') {
              Polygon()
                .width(100)
                .height(100)
                .points([[50, 0], [0, 50], [20, 100], [80, 100], [100, 50]])
                .fill(Color.Red)
                .fillOpacity(0.6)
                .commonStyle()
            } else if (this.targetView == 'Path') {
              Path()
                .width('210px')
                .height('310px')
                .commands('M0 100 A30 20 20 0 0 200 100 Z')
                .fillOpacity(0)
                .stroke(Color.Black)
                .strokeWidth(3)
                .commonStyle()
            } else if (this.targetView == 'Rect') {
              Rect({ width: '90%', height: 80 })
                .radius(20)
                .fill(Color.Pink)
                .stroke(Color.Transparent)
                .commonStyle()
            } else if (this.targetView == 'Shape') {
              Shape() {
                Path().width(200).height(60).commands('M0 0 L400 0 L400 150 Z')
              }
              .width(300)
              .height(200)
              .viewPort({ x: -20, y: -5, width: 310, height: 90 })
              .fill(0x317AF7)
              .stroke(0xEE8443)
              .strokeWidth(10)
              .strokeLineJoin(LineJoinStyle.Miter)
              .strokeMiterLimit(5)
              .commonStyle()
            }

            Button('ReferenceComponent').key(this.referenceComponentKey)
          }
          .width(this.parentWidth)
          .height(this.parentHeight)
          .key(this.parentComponentKey)
          .backgroundColor(Color.Gray)
          .borderWidth(0).padding(0).margin(0)
        }
      }
      .width('100%')
      .height('90%')
      .backgroundColor(Color.Pink)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Yellow)
  }
}