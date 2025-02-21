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
struct TouchablePage {
  @State _touchable: boolean = false
  @State targetView: string = router.getParams() ? router.getParams()['view']['targetView'] : ''
  @State componentKey: string = router.getParams() ? router.getParams()['view']['componentKey'] : ''

  onPageShow() {
    console.info('TouchablePage page show called ')
    AttrsManager.registerDataChange(value => this._touchable = value)
  }

  @Styles commonStyle(){
    .touchable(this._touchable)
    .key(this.componentKey)
  }

  @Builder itemHead(text: string) {
    Button('Header' + text)
  }

  build() {
    Column() {
      //Create view by config.
      if (this.targetView == 'MenuItem') {
        Menu() {
          MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' }).commonStyle()
        }.width('100%').height('70%').backgroundColor(Color.Yellow)
      } else if (this.targetView == 'MenuItemGroup') {
        Menu() {
          MenuItemGroup({ header: 'MenuItemGroup' }).commonStyle()
        }.width('100%').height('70%').backgroundColor(Color.Yellow)
      } else if (this.targetView == 'ListItem') {
        List({ space: 20, initialIndex: 0 }) {
          ListItem() {
            Button('List')
          }.commonStyle()
        }.width('100%')
        .height('70%')
        .listDirection(Axis.Vertical)
      } else if (this.targetView == 'ListItemGroup') {
        List({ space: 0, initialIndex: 0 }) {
          ListItemGroup({ header: this.itemHead('Group1') }) {
            ListItem()
          }
          .backgroundColor(Color.Yellow)
          .commonStyle()
        }
        .width('100%')
        .height('70%')
      } else if (this.targetView == 'TabContent') {
        Tabs() {
          TabContent() {
            Button('TabContent Test')
          }.tabBar('Tabs1').commonStyle()
        }.width('100%')
        .height('70%')
      } else if (this.targetView == 'GridCol') {
        GridRow({ columns: 1, }) {
          GridCol({ span: 1 }) {
            Button('GridCol')
          }.backgroundColor(Color.Green).commonStyle()
        }.width('100%')
        .height('70%')
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem() {
            Text('GridItem1').focusable(true)
          }.commonStyle()
        }
        .width('100%')
        .height('70%')
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
        .backgroundColor(Color.Black)
      } else if (this.targetView == 'StepperItem') {
        Stepper() {
          StepperItem() {
            Button('StepperItem')
          }.backgroundColor(Color.Green).commonStyle()
        }
        .width('100%')
        .height('70%')
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem() {
            Button('FlowItem')
          }.backgroundColor(Color.Green).commonStyle()
        }
        .width('100%')
        .height('70%')
      } else {
        Row() {
          //Set view by page config.
          if (this.targetView == 'AlphabetIndexer') {
            AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D'], selected: 0 }).commonStyle()
          } else if (this.targetView == 'Blank') {
            Blank().backgroundColor(Color.Orange).commonStyle()
          } else if (this.targetView == 'Button') {
            Button('button1').commonStyle()
          } else if (this.targetView == 'Checkbox') {
            Checkbox({ name: 'checkbox1', group: 'checkboxGroup' }).commonStyle()
          } else if (this.targetView == 'CheckboxGroup') {
            CheckboxGroup({ group: 'checkboxGroup' }).commonStyle()
          } else if (this.targetView == 'DataPanel') {
            DataPanel({ values: [25], max: 100, type: DataPanelType.Circle }).commonStyle()
          } else if (this.targetView == 'DatePicker') {
            DatePicker({
              start: new Date('1970-1-1'),
              end: new Date('2100-1-1'),
              selected: new Date()
            }).commonStyle()
          } else if (this.targetView == 'Divider') {
            Divider().strokeWidth(8).vertical(true).commonStyle()
          } else if (this.targetView == 'Gauge') {
            Gauge({ value: 75 }).colors([[Color.White, 1], [Color.Black, 1]]).commonStyle()
          } else if (this.targetView == 'Image') {
            Image($r('app.media.icon')).commonStyle()
          } else if (this.targetView == 'ImageAnimator') {
            ImageAnimator().images([{ src: $r('app.media.icon') }]).commonStyle()
          } else if (this.targetView == 'LoadingProgress') {
            LoadingProgress().color(Color.Blue).commonStyle()
          } else if (this.targetView == 'Marquee') {
            Marquee({ start: true, step: 50, src: 'Running Marquee starts rolling' })
              .fontWeight(700).fontColor(Color.White).fontSize(48).commonStyle()
          } else if (this.targetView == 'Menu') {
            Menu() {
              MenuItem({ content: 'Menu' })
            }.backgroundColor(Color.Yellow).padding(100).commonStyle()
          } else if (this.targetView == 'Navigation') {
            Navigation().backgroundColor(Color.Green).commonStyle()
          } else if (this.targetView == 'NavRouter') {
            NavRouter() {
              Row() {
                Image($r('app.media.icon'))
              }

              NavDestination() {
                Text('NavDestination').fontSize(10)
              }
            }.commonStyle()
          } else if (this.targetView == 'Progress') {
            Progress({ value: 50, type: ProgressType.Linear }).commonStyle()
          } else if (this.targetView == 'QRCode') {
            QRCode('QRCode').color(0xF7CE00).commonStyle()
          } else if (this.targetView == 'Radio') {
            Radio({ value: 'Radio1', group: 'radioGroup' }).commonStyle()
          } else if (this.targetView == 'Rating') {
            Rating({ rating: 4 }).stars(5).commonStyle()
          } else if (this.targetView == 'ScrollBar') {
            ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
              Text().width(20).height(100).borderRadius(10)
                .backgroundColor('#C0C0C0')
            }.width(20).backgroundColor('#ededed').commonStyle()
          } else if (this.targetView == 'Stepper') {
            Stepper() {
              StepperItem() {
                Column() {
                  Text('Page One')
                }
              }
            }.commonStyle()
          } else if (this.targetView == 'Search') {
            Search({ placeholder: 'Type to search...' })
              .backgroundColor(Color.White)
              .searchButton('SEARCH')
              .commonStyle()
          } else if (this.targetView == 'Select') {
            Select([{ value: 'aaa' }]).backgroundColor(Color.Green).commonStyle()
          } else if (this.targetView == 'Slider') {
            Slider({ value: 50, style: SliderStyle.OutSet, direction: Axis.Vertical })
              .blockColor('#191970')
              .trackColor('#ADD8E6')
              .selectedColor('#4169E1')
              .commonStyle()
          } else if (this.targetView == 'Text') {
            Text('text').fontColor(Color.White).fontSize(30).commonStyle()
          } else if (this.targetView == 'TextArea') {
            TextArea({ placeholder: 'TextArea', }).backgroundColor(Color.White).commonStyle()
          } else if (this.targetView == 'TextClock') {
            TextClock({ timeZoneOffset: -8 }).format('hms').commonStyle()
          } else if (this.targetView == 'TextInput') {
            TextInput({ placeholder: 'TextInput' }).backgroundColor(Color.White).commonStyle()
          } else if (this.targetView == 'TextPicker') {
            TextPicker({ range: ['apple1', 'orange2', 'peach3'], selected: 1 }).commonStyle()
          } else if (this.targetView == 'TextTimer') {
            TextTimer({ count: 30000 }).commonStyle()
          } else if (this.targetView == 'TimePicker') {
            TimePicker().commonStyle()
          } else if (this.targetView == 'Toggle') {
            Toggle({ type: ToggleType.Switch }).commonStyle()
          } else if (this.targetView == 'Badge') {
            Badge({
              value: '',
              style: { badgeSize: 6, badgeColor: Color.Red }
            }) {
              Button('BadgeContent')
            }.commonStyle()
          } else if (this.targetView == 'Column') {
            Column() {
              Button('ColumnButton')
            }.backgroundColor(Color.Green).commonStyle()
          } else if (this.targetView == 'Counter') {
            Counter() {
              Text('1')
            }.commonStyle()
          } else if (this.targetView == 'Flex') {
            Flex() {
              Button('Flex')
            }.backgroundColor(Color.Green).commonStyle()
          } else if (this.targetView == 'GridRow') {
            GridRow({ columns: 1, }) {
              GridCol({ span: 1 }) {
                Button('GridRow Test')
              }.backgroundColor(Color.Green)
            }.commonStyle()
          } else if (this.targetView == 'Grid') {
            Grid() {
              ForEach(['0', '1', '2', '3', '4'], () => {
                ForEach(['0', '1', '2', '3', '4'], (day: string) => {
                  GridItem() {
                    Button('GridItem' + day)
                  }
                })
              })
            }
            .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
            .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
            .commonStyle()
          } else if (this.targetView == 'List') {
            List({ space: 20, initialIndex: 0 }) {
              ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item) => {
                ListItem() {
                  Button('ListItem' + item)
                }
              }, item => item)
            }
            .listDirection(Axis.Vertical)
            .commonStyle()
          } else if (this.targetView == 'Navigator') {
            Navigator({ target: '' }) {
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
                .id('touchable')
            }.backgroundColor(Color.Green).commonStyle()
          } else if (this.targetView == 'Row') {
            Row() {
              Button('RowButton')
            }.backgroundColor(Color.Green).commonStyle()
          } else if (this.targetView == 'ColumnSplit') {
            ColumnSplit() {
              Button('ColumnSplit')
            }.backgroundColor(Color.Green).commonStyle()
          } else if (this.targetView == 'RowSplit') {
            RowSplit() {
              Button('RowSplit')
            }.backgroundColor(Color.Green).commonStyle()
          } else if (this.targetView == 'Panel') {
            Panel(true) {
              Button('Panel')
            }
            .backgroundColor(Color.Green)
            .mode(PanelMode.Full)
            .commonStyle()
          } else if (this.targetView == 'Refresh') {
            Refresh({ refreshing: true }) {
              Text('Refresh').fontSize(30)
            }
            .commonStyle()
          } else if (this.targetView == 'Scroll') {
            Scroll() {
              Column() {
                ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item) => {
                  Button('Scroll item' + item)
                }, item => item)
              }.width('100%')
            }
            .scrollBar(BarState.On)
            .commonStyle()
          } else if (this.targetView == 'SideBarContainer') {
            SideBarContainer(SideBarContainerType.Embed) {
              Column() {
                Button('SideBarContainer')
              }.width('100%')
              .justifyContent(FlexAlign.SpaceEvenly)
              .backgroundColor(Color.Green)

              Column() {
                Button('SideBarContainer content')
              }.backgroundColor(Color.Orange)
            }.commonStyle()
          } else if (this.targetView == 'Stack') {
            Stack() {
              Button('Stack')
            }.backgroundColor(Color.Orange).commonStyle()
          } else if (this.targetView == 'Swiper') {
            Swiper() {
              ForEach([1, 2, 3], (item: string) => {
                Text('Swiper' + item).width('90%').height(160)
              }, item => item)
            }
            .indicator(true)
            .backgroundColor(Color.White)
            .commonStyle()
          } else if (this.targetView == 'Tabs') {
            Tabs() {
              TabContent() {
                Button('TabContent')
              }.tabBar('Tabs1')
            }.commonStyle()
          } else if (this.targetView == 'WaterFlow') {
            WaterFlow() {
              FlowItem() {
                Button('FlowItem')
              }
            }.commonStyle()
          } else if (this.targetView == 'Circle') {
            Circle().commonStyle()
          } else if (this.targetView == 'Ellipse') {
            Ellipse().commonStyle()
          } else if (this.targetView == 'Line') {
            Line()
              .startPoint([0, 0])
              .endPoint([50, 100])
              .stroke(Color.Black)
              .backgroundColor('#F5F5F5')
              .commonStyle()
          } else if (this.targetView == 'Polyline') {
            Polyline()
              .points([[0, 0], [20, 60], [100, 100]])
              .fillOpacity(0)
              .stroke(Color.Blue)
              .strokeWidth(3)
              .commonStyle()
          } else if (this.targetView == 'Polygon') {
            Polygon()
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
            Rect()
              .radius(20)
              .fill(Color.Pink)
              .stroke(Color.Transparent)
              .commonStyle()
          } else if (this.targetView == 'Shape') {
            Shape() {
              Path().width(200).height(60).commands('M0 0 L400 0 L400 150 Z')
            }
            .viewPort({ x: -20, y: -5, width: 310, height: 90 })
            .fill(0x317AF7)
            .stroke(0xEE8443)
            .strokeWidth(10)
            .strokeLineJoin(LineJoinStyle.Miter)
            .strokeMiterLimit(5)
            .commonStyle()
          }
        }
        .width('100%')
        .height('70%')
        .backgroundColor(Color.Gray)
        .focusable(true)
      }
    }
  }
}