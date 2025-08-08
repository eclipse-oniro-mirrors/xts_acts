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
 * Test page of common attribute: groupDefaultFocus
 */

@Entry
@Component
struct GroupDefaultFocusPage {
  private scroller: Scroller = new Scroller() //For Scroll and Scroll
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15] //For Scroll
  @State _groupDefaultFocus: boolean = true;
  @State callback: string = '';
  @State referenceOneCallback: string = '';
  @State referenceTwoCallback: string = '';
  @State targetView: string = router.getParams() ? (router.getParams() as ESObject)['view']['targetView'] : ''
  @State componentKey: string = router.getParams() ? (router.getParams() as ESObject)['view']['componentKey'] : ''
  @State textComponentKey: string =
    router.getParams() ? (router.getParams() as ESObject)['view']['textComponentKey'] : ''
  @State referenceOneComponentKey: string =
    router.getParams() ? (router.getParams() as ESObject)['view']['referenceOneComponentKey'] : ''
  @State referenceTwoComponentKey: string =
    router.getParams() ? (router.getParams() as ESObject)['view']['referenceTwoComponentKey'] : ''

  onPageShow() {
    console.info('[GroupDefaultFocusPage] page show called ');

    //Register data change call back.
    attrsManager.registerDataChange((value: ESObject) => {
      this._groupDefaultFocus = value;
    })
  }

  /**
   * Set common style.
   */
  @Styles
  commonStyle(){
    .groupDefaultFocus(this._groupDefaultFocus)
    .key(this.componentKey)
    .onFocus(() => {
      this.callback = 'onFocus'
      console.info('[GroupDefaultFocusPage] targetComponent onFocus called');
    })
    .onBlur(() => {
      this.callback = 'onBlur'
      console.info('[GroupDefaultFocusPage] targetComponent onBlur called');
    })
    .focusable(true)
  }

  build() {
    Column() {
      Text(this.callback)
        .width('100%')
        .height('20%')
        .fontSize(30)
        .fontColor(Color.Blue)
        .key(this.textComponentKey)

      Button(this.referenceOneCallback)
        .width(200)
        .height(100)
        .key(this.referenceOneComponentKey)
        .onFocus(() => {
          this.referenceOneCallback = 'onFocus'
          console.info('[GroupDefaultFocusPage] targetComponent onFocus called');
        })
        .onBlur(() => {
          this.referenceOneCallback = 'onBlur'
          console.info('[GroupDefaultFocusPage] targetComponent onBlur called');
        })

      Column() {
        Button(this.referenceTwoCallback)
          .width(100)
          .height(30)
          .onFocus(() => {
            this.referenceTwoCallback = 'onFocus'
            console.info('[GroupDefaultFocusPage] targetComponent onFocus called');
          })
          .onBlur(() => {
            this.referenceTwoCallback = 'onBlur'
            console.info('[GroupDefaultFocusPage] targetComponent onBlur called');
          })
          .key(this.referenceTwoComponentKey)
        if (this.targetView == 'Button') {
          Button('Button').width(200).height(100).commonStyle()
        } else if (this.targetView == 'TextInput') {
          TextInput().width(200).height(100).commonStyle()
        } else if (this.targetView == 'TextArea') {
          TextArea().width(200).height(100).commonStyle()
        } else if (this.targetView == 'Search') {
          Search().width(200).height(100).commonStyle()
        } else if (this.targetView == 'Text') {
          Text('Text').width(200).height(100).commonStyle()
        } else if (this.targetView == 'Image') {
          Image($r('app.media.icon')).width(200).height(100).commonStyle()
        } else if (this.targetView == 'List') {
          List() {
            ListItem() {
              Text('item1')
                .focusable(true)
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }
          }.width(200).height(100).backgroundColor(Color.Blue).commonStyle()
        } else if (this.targetView == 'Grid') {
          Grid() {
            GridItem() {
              Text('day')
                .backgroundColor(Color.White)
                .focusable(true)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
          }
          .width(200).height(100).commonStyle()
        } else if (this.targetView == 'Checkbox') {
          Checkbox({ name: 'checkbox1' }).width(200).height(100).commonStyle()
        } else if (this.targetView == 'CheckboxGroup') {
          CheckboxGroup().width(200).height(100).commonStyle()
        } else if (this.targetView == 'DatePicker') {
          DatePicker({}).width(200).height(100).commonStyle()
        } else if (this.targetView == 'ImageAnimator') {
          ImageAnimator()
            .backgroundColor(Color.Blue).width(200).height(300)
            .commonStyle()
        } else if (this.targetView == 'Menu') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'Menu' })
          }.backgroundColor(Color.Yellow).width(200)
          .height(300).commonStyle()
        } else if (this.targetView == 'MenuItem') {
          Menu() {
            MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
              .width(200).height(300).commonStyle()
          }.backgroundColor(Color.Yellow).width(200).height(300)
        } else if (this.targetView == 'MenuItemGroup') {
          Menu() {
            MenuItemGroup({ header: 'MenuItemGroup' }) {
              MenuItem({ startIcon: $r('app.media.icon'), content: 'MenuItem' })
            }.width(200).height(300).commonStyle()
          }.backgroundColor(Color.Yellow).width(200).height(300)
        } else if (this.targetView == 'Radio') {
          Radio({ value: 'Radio1', group: 'radioGroup' })
            .width(200)
            .height(300)
            .commonStyle()
        } else if (this.targetView == 'Rating') {
          Rating({ rating: 3.5 })
            .width(200)
            .height(300)
            .commonStyle()
        } else if (this.targetView == 'Select') {
          Select([{ value: 'aaa', icon: '/common/public_icon.svg' },
            { value: 'bbb', icon: '/common/public_icon.svg' }])
            .width(200)
            .height(300)
            .commonStyle()
        } else if (this.targetView == 'Slider') {
          Slider()
            .width(200)
            .height(300)
            .commonStyle()
        } else if (this.targetView == 'Stepper') {
          Stepper() {
            StepperItem() {
              Column() {
                Text('Page One').focusable(true)
              }
            }
          }.commonStyle()
        } else if (this.targetView == 'StepperItem') {
          Stepper() {
            StepperItem() {
              Column() {
                Text('Page One').focusable(true)
              }
            }
            .commonStyle()
            .backgroundColor(Color.Red)
            .width('100%')
            .height('100%')
          }.backgroundColor(Color.Yellow).width(200).height(100)
        } else if (this.targetView == 'TextPicker') {
          TextPicker({ range: ['apple1', 'orange2', 'peach3', 'grape4'] })
            .width(200)
            .height(300)
            .commonStyle()
        } else if (this.targetView == 'TimePicker') {
          TimePicker().width(200).height(300).commonStyle()
        } else if (this.targetView == 'Toggle') {
          Toggle({ type: ToggleType.Switch }).width(200).height(300)
            .commonStyle()
        } else if (this.targetView == 'Web') {
          Web({ src: '', controller: new WebController() }).commonStyle()
        } else if (this.targetView == 'AlphabetIndexer') {
          AlphabetIndexer({ arrayValue: ['A', 'B', 'C', 'D'], selected: 0 })
            .width(200)
            .height(300)
            .commonStyle()
        } else if (this.targetView == 'Column') {
          Column() {
            Button('Button')
          }
          .width(200)
          .height(300)
          .commonStyle()
        } else if (this.targetView == 'ColumnSplit') {
          ColumnSplit() {
            Text('1')
              .width('10%')
              .height(100)
              .backgroundColor(0xF5DEB3)
              .textAlign(TextAlign.Center)
              .focusable(true)
            Text('2')
              .width('10%')
              .height(100)
              .backgroundColor(0xD2B48C)
              .textAlign(TextAlign.Center)
              .focusable(true)
          }.width(200).height(300).commonStyle()
        } else if (this.targetView == 'Counter') {
          Counter() {
            Button('Button')
          }
          .width(200)
          .height(300)
          .commonStyle()
        } else if (this.targetView == 'Flex') {
          Flex() {
            Button('Button')
          }
          .width(200)
          .height(300)
          .commonStyle()
        } else if (this.targetView == 'GridCol') {
          GridRow({
            columns: 1,
            direction: GridRowDirection.Row
          }) {
            GridCol() {
              Row() {
                Button('Button')
              }.width('100%').height('20vp')
            }
            .commonStyle()
            .backgroundColor(Color.Yellow)
            .width('100%')
            .height('100%')
          }.width(200).height(200).backgroundColor(Color.Pink)
        } else if (this.targetView == 'GridRow') {
          GridRow({
            columns: 5,
            gutter: { x: 5, y: 10 },
            breakpoints: { value: ['400vp', '600vp', '800vp'], reference: BreakpointsReference.WindowSize },
            direction: GridRowDirection.Row
          }) {
            ForEach([Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue,],
              (color: Color) => {
                GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
                  Row() {
                    Button('Button')
                  }.width('100%').height('20vp')
                }.borderColor(color).borderWidth(2)
              })
          }.commonStyle()
        } else if (this.targetView == 'GridItem') {
          Grid() {
            GridItem() {
              Text('GridItem1')
                .backgroundColor(Color.White)
                .focusable(true)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }.width(200).height(300).commonStyle()
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .backgroundColor(Color.Black)
          .width(200)
          .height(300)
        } else if (this.targetView == 'ListItem') {
          List({ space: 0, initialIndex: 0 }) {
            ListItem() {
              Text('item1')
                .focusable(true)
                .width('100%')
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
            }.commonStyle()
          }.width(200).height(300).listDirection(Axis.Vertical)
        } else if (this.targetView == 'ListItemGroup') {
          List({ space: 0, initialIndex: 0 }) {
            ListItemGroup() {
              ListItem() {
                Text('item1')
                  .focusable(true)
                  .width('100%')
                  .textAlign(TextAlign.Center)
                  .backgroundColor(Color.White)
              }
            }.backgroundColor(Color.Yellow).commonStyle()
          }
          .backgroundColor(Color.Pink)
          .width(300)
          .height(400)
          .listDirection(Axis.Vertical)
        } else if (this.targetView == 'Row') {
          Row() {
            Button('Button')
          }
          .backgroundColor(Color.Blue).width(200).height(300).commonStyle()
        } else if (this.targetView == 'RowSplit') {
          RowSplit() {
            Text('1')
              .width('10%')
              .height(100)
              .backgroundColor(0xF5DEB3)
              .textAlign(TextAlign.Center)
              .focusable(true)
            Text('2')
              .width('10%')
              .height(100)
              .backgroundColor(0xD2B48C)
              .textAlign(TextAlign.Center)
              .focusable(true)
          }.width(200).height(300).commonStyle()
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
                    .focusable(true)
                }
              }, (item: number) => item.toString())
            }.margin({ right: 15 })
          }.width(200).height(300).commonStyle()
        } else if (this.targetView == 'SideBarContainer') {
          SideBarContainer(SideBarContainerType.Embed) {
            Column() {
              ForEach([1, 2, 3], (item: number) => {
                Column({ space: 5 }) {
                  Image($r('app.media.icon')).width(64).height(64).focusable(true)
                  Text('Index0' + item).fontSize(25).focusable(true)
                }
              })
            }.width('100%')
            .justifyContent(FlexAlign.SpaceEvenly)
            .backgroundColor(Color.Green)

            Column() {
              Text('SideBarContainer content').fontSize(25)
            }.backgroundColor(Color.Orange)
          }.width(200).height(300).commonStyle()
        } else if (this.targetView == 'Stack') {
          Stack() {
            Button('Button')
          }
          .backgroundColor(Color.Blue).width(200).height(300).commonStyle()
        } else if (this.targetView == 'Swiper') {
          Swiper() {
            ForEach([1, 2, 3], (item: number) => {
              Text('Swiper' + item).width('90%').height(160).focusable(true)
            }, (item: number) => item.toString())
          }
          .indicator(true)
          .backgroundColor(Color.White)
          .width(200)
          .height(300)
          .commonStyle()
        } else if (this.targetView == 'Tabs') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White).focusable(true)
            }.tabBar('Tabs1')
          }.backgroundColor(Color.Blue).width(200).height(300).commonStyle()
        } else if (this.targetView == 'TabContent') {
          Tabs() {
            TabContent() {
              Text('TabContent Test').width('100%').height('100%').backgroundColor(Color.White).focusable(true)
            }.tabBar('Tabs1').commonStyle()
          }.width(200).height(300)
        }
      }.width('100%').height('40%').tabIndex(1)
    }.width('100%').height('100%')
  }
}
