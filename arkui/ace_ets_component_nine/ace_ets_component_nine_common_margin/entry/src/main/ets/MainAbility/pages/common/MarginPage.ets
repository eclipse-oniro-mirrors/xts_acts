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

class MarginButtonModifier implements AttributeModifier<CommonAttribute> {
  mMargin: Margin | Length = 0
  applyNormalAttribute(instance: CommonAttribute): void {
    instance.margin(this.mMargin);
  }
}

@Entry
@Component
struct MarginPage {
  @State _marginButtonModifier: MarginButtonModifier = new MarginButtonModifier()
  @State targetView: string = router.getParams() ? (router.getParams() as Record<string, ESObject>).view.targetView : ''
  @State componentKey: string = router.getParams() ? (router.getParams() as Record<string, ESObject>).view.componentKey : ''
  @State targetComponentWidth: number = router.getParams() ? (router.getParams() as Record<string, ESObject>).view.targetComponentWidth : 0
  @State targetComponentHeight: number = router.getParams() ? (router.getParams() as Record<string, ESObject>).view.targetComponentHeight : 0
  @State referenceComponentKey: string = router.getParams() ? (router.getParams() as Record<string, ESObject>).view.referenceComponentKey : ''
  @State parentComponentKey: string = router.getParams() ? (router.getParams() as Record<string, ESObject>).view.parentComponentKey : ''

  onPageShow() {
    console.info('margin page show called ')
    AttrsManager.registerDataChange((value : ESObject) => {
      this._marginButtonModifier.mMargin = value
    })
  }

  @Styles commonStyle(){
    .attributeModifier(this._marginButtonModifier)
    .width(this.targetComponentWidth)
    .height(this.targetComponentHeight)
    .key(this.componentKey)
  }

  @Styles referenceComponentCommonStyle(){
    .width(this.targetComponentWidth)
    .height(this.targetComponentHeight)
    .key(this.referenceComponentKey)
  }

  build() {
    Column() {
      if (this.targetView == 'ListItem') {
        List({ space: 0, initialIndex: 0 }) {
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
          }.referenceComponentCommonStyle()
        }
        .width(400)
        .height(400)
        .listDirection(Axis.Vertical)
        .backgroundColor(Color.Pink)
        .key(this.parentComponentKey)
      } else if (this.targetView == 'ListItemGroup') {
        List({ space: 0, initialIndex: 0 }) {
          ListItemGroup() {
            ListItem() {
              Text('item1')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }
          }.backgroundColor(Color.Yellow).commonStyle()
          ListItemGroup() {
            ListItem() {
              Text('referenceComponentKey')
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }
          }.backgroundColor(Color.Red).referenceComponentCommonStyle()
        }
        .backgroundColor(Color.Pink)
        .width(200)
        .height(400)
        .listDirection(Axis.Vertical)
        .key(this.parentComponentKey)
      } else if (this.targetView == 'MenuItem') {
        Row() {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
              .backgroundColor(Color.Yellow).commonStyle()
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
              .backgroundColor(Color.Red).referenceComponentCommonStyle()
          }.backgroundColor(Color.Pink).width(200).height(400)
        }.width('100%').height('100%').backgroundColor(Color.Green).key(this.parentComponentKey)
      } else if (this.targetView == 'MenuItemGroup') {
        Row() {
          Menu() {
            MenuItemGroup({ header: 'MenuItemGroup' }) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
            }.backgroundColor(Color.Yellow).commonStyle()

            MenuItemGroup({ header: 'MenuItemGroup' }) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
            }.backgroundColor(Color.Red).referenceComponentCommonStyle()
          }.backgroundColor(Color.Pink).width(200).height(400)
        }.width('100%').height('100%').backgroundColor(Color.Green).key(this.parentComponentKey)
      } else if (this.targetView == 'GridCol') {
        GridRow({
          columns: 1,
          direction: GridRowDirection.Row
        }) {
          GridCol() {
            Row().width('100%').height('20vp')
          }.commonStyle()

          GridCol() {
            Row().width('100%').height('20vp')
          }.referenceComponentCommonStyle()
        }.backgroundColor(Color.Pink).width(200).height(400).key(this.parentComponentKey)
      } else if (this.targetView == 'FlowItem') {
        WaterFlow() {
          FlowItem() {
            Column() {
              Text('WaterFlow').fontSize(12).height('16')
              Image($r('app.media.icon')).width(50).height(50).objectFit(ImageFit.Fill)
            }
          }.commonStyle()
          FlowItem() {
            Column() {
              Text('WaterFlow').fontSize(12).height('16')
              Image($r('app.media.icon')).width(50).height(50).objectFit(ImageFit.Fill)
            }
          }.referenceComponentCommonStyle()
        }.backgroundColor(Color.Pink).width(200).height(400).key(this.parentComponentKey)
      } else if (this.targetView == 'GridItem') {
        Grid() {
          GridItem() {
            Text('4').backgroundColor(0xFAEEE0).width('100%').height('100%').textAlign(TextAlign.Center)
          }.commonStyle()

          GridItem() {
            Text('4').backgroundColor(0xFAEEE0).width('100%').height('100%').textAlign(TextAlign.Center)
          }.referenceComponentCommonStyle()
        }.backgroundColor(Color.Pink).width(200).height(400).key(this.parentComponentKey)
      } else {
        Row() {
          if (this.targetView == 'Button') {
            Button('button1').commonStyle()
          } else if (this.targetView == 'Text') {
            Text('text1').commonStyle()
          } else if (this.targetView == 'AlphabetIndexer') {
            AlphabetIndexer({ arrayValue: ['#', 'A', 'B', 'C', 'D', 'E', 'F', 'G'], selected: 0 }).commonStyle()
          } else if (this.targetView == 'Blank') {
            Blank().backgroundColor(Color.Yellow).commonStyle()
          } else if (this.targetView == 'Checkbox') {
            Checkbox().commonStyle()
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
            Image($r('app.media.icon')).commonStyle()
          } else if (this.targetView == 'ImageAnimator') {
            ImageAnimator()
              .images([
                {
                  src: $r('app.media.icon')
                }
              ]).commonStyle()
          } else if (this.targetView == 'LoadingProgress') {
            LoadingProgress().commonStyle()
          } else if (this.targetView == 'Marquee') {
            Marquee({
              start: true,
              step: 50,
              loop: Infinity,
              fromStart: true,
              src: 'Running Marquee starts rolling'
            }).commonStyle()
          } else if (this.targetView == 'Navigation') {
            Navigation() {
            }.commonStyle()
          } else if (this.targetView == 'Menu') {
            Menu() {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
            }.backgroundColor(Color.Yellow).commonStyle()
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
            Progress({ value: 10, type: ProgressType.Eclipse }).commonStyle()
          } else if (this.targetView == 'QRCode') {
            QRCode('Running Marquee starts rolling').commonStyle()
          } else if (this.targetView == 'Radio') {
            Radio({ value: 'Radio1', group: 'radioGroup' }).commonStyle()
          } else if (this.targetView == 'Rating') {
            Rating({ rating: 3.5, indicator: false }).commonStyle()
          } else if (this.targetView == 'ScrollBar') {
            ScrollBar({ scroller: new Scroller(), state: BarState.On }) {
              Text()
                .width(20)
                .height(100)
                .borderRadius(10)
                .backgroundColor('#C0C0C0')
            }.commonStyle()
          } else if (this.targetView == 'Search') {
            Search({ placeholder: 'Type to search...' })
              .backgroundColor(Color.White)
              .searchButton('SEARCH').commonStyle()
          } else if (this.targetView == 'Select') {
            Select([{ value: 'aaa', icon: '/common/public_icon.svg' },
              { value: 'bbb', icon: '/common/public_icon.svg' }]).commonStyle()
          } else if (this.targetView == 'Slider') {
            Slider({
              value: 50,
              min: 0,
              max: 100,
              style: SliderStyle.OutSet
            })
              .showTips(true)
              .commonStyle()
          } else if (this.targetView == 'Stepper') {
            Stepper() {
              StepperItem() {
                Column() {
                  Text('Page One')
                }
              }
            }.commonStyle()
          } else if (this.targetView == 'TextArea') {
            TextArea({
              placeholder: 'The text area can hold an unlimited amount of text. input your word...'
            }).commonStyle()
          } else if (this.targetView == 'TextClock') {
            TextClock({ timeZoneOffset: -8 })
              .format('hms')
              .commonStyle()
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
              selected: new Date('2022-07-22T08:00:00'),
            }).commonStyle()
          } else if (this.targetView == 'Toggle') {
            Toggle({ type: ToggleType.Switch, isOn: false }).commonStyle()
          } else if (this.targetView == 'Web') {
            Web({ src: 'www.example.com', controller: new WebController() }).commonStyle()
          } else if (this.targetView == 'Circle') {
            Circle().commonStyle()
          } else if (this.targetView == 'Ellipse') {
            Ellipse().commonStyle()
          } else if (this.targetView == 'Line') {
            Line()
              .commonStyle()
              .startPoint([0, 0])
              .endPoint([50, 100])
              .backgroundColor(Color.Black)
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
              Rect().width(100).height(50)
            }.commonStyle()
          } else if (this.targetView == 'Badge') {
            Badge({
              count: 50,
              style: { color: 0xFFFFFF, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
            }) {
              Button('message')
                .width(100).height(50).backgroundColor(0x317aff)
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
              Text('Counter')
            }.commonStyle()
          } else if (this.targetView == 'Flex') {
            Flex() {
              Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
            }.commonStyle()
          } else if (this.targetView == 'GridRow') {
            GridRow({
              columns: 1,
              direction: GridRowDirection.Row
            }) {
              ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green,
                Color.Pink, Color.Grey, Color.Blue, Color.Brown], (color: Color) => {
                GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
                  Row().width('100%').height('20vp')
                }.borderColor(color).borderWidth(2)
              })
            }.commonStyle()
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
            .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
            .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
            .commonStyle()
            .backgroundColor(0xFAEEE0)
          } else if (this.targetView == 'GridItem') {
            Grid() {
              GridItem() {
                Text('4')
                  .backgroundColor(0xFAEEE0)
                  .width('100%')
                  .height('100%')
                  .textAlign(TextAlign.Center)
              }.rowStart(1).rowEnd(4).commonStyle()
            }
          } else if (this.targetView == 'List') {
            List() {
            }.commonStyle()
          } else if (this.targetView == 'Navigator') {
            Navigator({ target: '' }) {
              Text('Go to back page').width('100%').height(20)
            }.commonStyle().backgroundColor(Color.Red)
          } else if (this.targetView == 'Panel') {
            Panel(true) {
              Text('Text')
            }.backgroundColor(Color.Yellow).commonStyle()
          } else if (this.targetView == 'Refresh') {
            Refresh({ refreshing: true }) {
              Text('123')
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
                .id('visibility')
            }.commonStyle()
          } else if (this.targetView == 'Row') {
            Row() {
              Text('Row')
            }.commonStyle()
          } else if (this.targetView == 'RowSplit') {
            RowSplit() {
              Text('Text')
            }.commonStyle()
          } else if (this.targetView == 'Scroll') {
            Scroll() {
              Column() {
                ForEach([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], (item: number) => {
                  Text('Scroll' + item.toString())
                    .width('90%')
                    .height(50)
                    .backgroundColor(Color.White)
                    .textAlign(TextAlign.Center)
                }, (item: number) => item.toString())
              }.width('100%')
            }.scrollBar(BarState.On).commonStyle()
          } else if (this.targetView == 'SideBarContainer') {
            SideBarContainer(SideBarContainerType.Embed) {
              Column() {
                ForEach([1, 2, 3], (item: number) => {
                  Column({ space: 5 }) {
                    Image($r('app.media.icon')).width(50).height(50)
                    Text('Index0' + item).fontSize(25)
                  }
                })
              }.width('100%').justifyContent(FlexAlign.SpaceEvenly).backgroundColor(Color.Green)

              Column() {
                Text('SideBarContainer content').fontSize(25)
              }.backgroundColor(Color.Orange)
            }.commonStyle()
          } else if (this.targetView == 'Stack') {
            Stack() {
              Text('Stack')
            }.commonStyle()
          } else if (this.targetView == 'Swiper') {
            Swiper() {
              ForEach([1, 2, 3], (item: number) => {
                Text('Swiper' + item).width('90%').height(50)
              }, (item: number) => item.toString())
            }
            .indicator(true)
            .backgroundColor(Color.White)
            .commonStyle()
          } else if (this.targetView == 'Tabs') {
            Tabs() {
              TabContent() {
                Column().width('100%').height('100%').backgroundColor('#00CB87')
              }
            }.commonStyle()
          } else if (this.targetView == 'WaterFlow') {
            WaterFlow() {
              ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9], (item: number) => {
                FlowItem() {
                  Column() {
                    Text('WaterFlow' + item).fontSize(12).height('16')
                    Image($r('app.media.icon'))
                      .width(50)
                      .height(50)
                      .objectFit(ImageFit.Fill)
                  }
                }
              }, (item: number) => item.toString())
            }.commonStyle()
          }
          Text('referenceComponentKey')
            .backgroundColor(0xc1cbac)
            .referenceComponentCommonStyle()
        }.width(400).height(200).backgroundColor(Color.Pink).key(this.parentComponentKey)
      }
    }.backgroundColor(Color.Yellow)
  }
}