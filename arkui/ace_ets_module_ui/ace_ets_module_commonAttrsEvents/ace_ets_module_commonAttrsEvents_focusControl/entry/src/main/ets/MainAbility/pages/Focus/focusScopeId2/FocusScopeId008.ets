/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { ColorMetrics, LengthMetrics } from '@ohos.arkui.node'
@Entry
@Component
struct FocusScopeId008 {
  @State text1: string = 'text1'
  @State modeValue: NavigationMode = NavigationMode.Stack
  @State pageInfos: NavPathStack = new NavPathStack()
  @State flag: boolean = true
  @State visibilityValue: Visibility = Visibility.Visible
  @State focusId: (string | undefined | null) [] =
    ['FocusScopeId008_focusGroup1', undefined, null, 'FocusScopeId008_focusGroup2']
  @State focusIdIndex: number = 0
  @State isGroupValue: boolean = true

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOne()
    }
  }

  @Builder
  pageOne() {
    NavDestination() {
      Column({ space: 5 }) {
        Text('焦点组内组件设置focuxBox')
        Column({ space: 5 }) {
          Button('btn1')
            .focusOnTouch(true)
            .focusBox({
              margin: new LengthMetrics(0),
              strokeColor: ColorMetrics.rgba(255, 0, 0)
            })

          Button('btn2')
            .focusOnTouch(true)
            .focusBox({
              margin: new LengthMetrics(0),
              strokeColor: ColorMetrics.rgba(255, 0, 0)
            })
        }.focusScopeId('FocusScopeId008_focusGroup7', true)
        .borderWidth(1)

        Button('btn3')
          .focusOnTouch(true)
          .focusBox({
            margin: new LengthMetrics(0),
            strokeColor: ColorMetrics.rgba(255, 0, 0)
          })
      }
    }.title('pageOne')
  }

  build() {
    Column() {
      Navigation(this.pageInfos) {
        Scroll() {
          Column() {
            Row({ space: 5 }) {
              Column({ space: 2 }) {
                Text('焦点组1')
                if (this.flag) {
                  Column({ space: 5 }) {
                    Button('btn1').focusOnTouch(true).id('FocusScopeId008_btn1_1')
                    Button('btn2').focusOnTouch(true).id('FocusScopeId008_btn2_1')
                    Button('btn3').focusOnTouch(true).id('FocusScopeId008_btn3_1')
                  }.focusScopeId(this.focusId[this.focusIdIndex], this.isGroupValue)
                  .borderWidth(1)
                }

                Button('del').focusOnTouch(true)
                  .id('FocusScopeId008_btn_del')
                  .onClick(() => {
                    this.flag = !this.flag
                  })
              }.width('16%')

              Column({ space: 2 }) {
                Text('焦点组2')
                Column({ space: 5 }) {
                  Button('btn1').focusOnTouch(true).id('FocusScopeId008_btn1_2')
                  Button('btn2').focusOnTouch(true).id('FocusScopeId008_btn2_2')
                  Button('btn3').focusOnTouch(true)
                }
                .focusScopeId('FocusScopeId008_focusGroup2', true)
                .borderWidth(1)

                Button('button1').focusOnTouch(true).id('FocusScopeId008_btn_btn')
              }.width('16%')

              Column({ space: 2 }) {
                Text('焦点组3')
                Column({ space: 5 }) {
                  Text('123')
                }
                .focusScopeId('FocusScopeId008_focusGroup3', true).focusable(true).backgroundColor(Color.Pink)
                .borderWidth(1)
              }.width('16%')

              Column({ space: 2 }) {
                Text('焦点组4')
                Column({ space: 5 }) {
                  Button('btn1').focusOnTouch(true).id('FocusScopeId008_btn1_4')
                  Button('btn2').focusOnTouch(true)
                }
                .focusScopeId('FocusScopeId008_focusGroup4', true)
                .borderWidth(1)
                .visibility(this.visibilityValue)

                Button('隐藏')
                  .id('FocusScopeId008_btn_hide')
                  .focusOnTouch(true)
                  .onClick(() => {
                    this.visibilityValue =
                      (this.visibilityValue == Visibility.Visible) ? Visibility.Hidden : Visibility.Visible
                  })
              }.width('16%')

              Column({ space: 2 }) {
                Text('焦点组5')
                Column({ space: 5 }) {
                  Button('单栏')
                    .id('FocusScopeId008_btn1_5')
                    .onClick(() => {
                      this.modeValue = NavigationMode.Stack
                    })
                    .focusOnTouch(true)

                  Button('双栏')
                    .id('FocusScopeId008_btn2_5')
                    .onClick(() => {
                      this.modeValue = NavigationMode.Split
                    })
                    .focusOnTouch(true)

                  Button('pushPageOne')
                    .id('FocusScopeId008_btn3_5')
                    .onClick(() => {
                      this.pageInfos.pushPath({ name: 'pageOne' })
                    })
                    .focusOnTouch(true)
                }
                .focusScopeId('FocusScopeId008_focusGroup5', true)
                .borderWidth(1)
              }.width('16%')

              Column({ space: 2 }) {
                Text('焦点组6')
                Column({ space: 5 }) {
                  Button('btn1').focusOnTouch(true)
                    .id('FocusScopeId008_btn1_6')
                  Button('btn2').focusOnTouch(true)
                    .id('FocusScopeId008_btn2_6')
                  Button('defaultFocus:true').focusOnTouch(true).defaultFocus(true)
                    .id('FocusScopeId008_btn3_6')
                }
                .focusScopeId('FocusScopeId008_focusGroup6', true)
                .borderWidth(1)
              }.width('16%')
            }.height('65%').width('100%')
            .id('FocusScopeId008_scroll')

            Divider().strokeWidth(2).height('5%').width('100%')

            Column({ space: 2 }) {
              Row() {
                Button('clearFocus')
                  .id('FocusScopeId008_clearFocus')
                  .onClick(() => {
                    this.getUIContext().getFocusController().clearFocus()
                  })

                Button('改第一组的id:' + String(this.focusId[this.focusIdIndex]))
                  .id('FocusScopeId008_changFocusId')
                  .focusOnTouch(true)
                  .onClick(() => {
                    this.focusIdIndex++
                    if (this.focusIdIndex > this.focusId.length - 1) {
                      this.focusIdIndex = 0
                    }
                  })
              }

              Button('更改第一个焦点组的isGroup:' + this.isGroupValue)
                .id('FocusScopeId008_changIsGroup')
                .focusOnTouch(true)
                .onClick(() => {
                  this.isGroupValue = !this.isGroupValue
                })
            }.height('30%').width('100%')
          }
        }.id('FocusScopeId008_scroll')
      }
      .id('FocusScopeId008_nav')
      .mode(this.modeValue)
      .title('navigation')
      .navDestination(this.PageMap)
      .height('100%')

    }.width('100%').height('90%').align(Alignment.Top)
    .id('FocusScopeId008_col')
  }
}