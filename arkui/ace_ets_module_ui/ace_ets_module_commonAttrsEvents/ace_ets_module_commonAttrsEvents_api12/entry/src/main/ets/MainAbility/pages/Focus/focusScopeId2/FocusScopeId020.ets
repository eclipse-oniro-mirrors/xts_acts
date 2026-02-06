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
struct FocusScopeId020 {
  @State text1: string = 'text1'
  @State modeValue: NavigationMode = NavigationMode.Stack
  @State pageInfos: NavPathStack = new NavPathStack()
  @State flag: boolean = true
  @State visibilityValue: Visibility = Visibility.Visible
  @State focusId: (string | undefined | null) [] =
    ['FocusScopeId020_focusGroup1', undefined, null, 'FocusScopeId020_focusGroup2']
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
            .id('FocusScopeId020_btn1_7')
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
        }.focusScopeId('FocusScopeId020_focusGroup7', true)
        .borderWidth(1)

        Button('btn3')
          .id('FocusScopeId020_btn3')
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
        Row({ space: 5 }) {
          Column({ space: 5 }) {
            Text('焦点组1')
            Column({ space: 5 }) {
              Button('btn1').focusOnTouch(true).id('FocusScopeId020_btn1_1')
              Button('btn2').focusOnTouch(true).id('FocusScopeId020_btn2_1')
              Button('btn3').focusOnTouch(true).id('FocusScopeId020_btn3_1')
            }.focusScopeId(this.focusId[this.focusIdIndex], this.isGroupValue)
            .borderWidth(1)
          }

          Column({ space: 5 }) {
            Text('焦点组5')
            Column({ space: 5 }) {
              Button('单栏')
                .id('FocusScopeId020_btn1_5')
                .onClick(() => {
                  this.modeValue = NavigationMode.Stack
                })
                .focusOnTouch(true)

              Button('双栏')
                .id('FocusScopeId020_btn2_5')
                .onClick(() => {
                  this.modeValue = NavigationMode.Split
                })
                .focusOnTouch(true)

              Button('pushPageOne')
                .id('FocusScopeId020_btn3_5')
                .onClick(() => {
                  this.pageInfos.pushPath({ name: 'pageOne' })
                })
                .focusOnTouch(true)
            }
            .focusScopeId('FocusScopeId020_focusGroup5', true)
            .borderWidth(1)
          }
        }

        Column({ space: 2 }) {
          Button('clearFocus')
            .id('FocusScopeId020_clearFocus')
            .onClick(() => {
              this.getUIContext().getFocusController().clearFocus()
            })

          Button('更改第一个焦点组的id:' + String(this.focusId[this.focusIdIndex]))
            .id('FocusScopeId020_changFocusId')
            .focusOnTouch(true)
            .onClick(() => {
              this.focusIdIndex++
              if (this.focusIdIndex > this.focusId.length - 1) {
                this.focusIdIndex = 0
              }
            })

          Button('更改第一个焦点组的isGroup:' + this.isGroupValue)
            .id('FocusScopeId020_changIsGroup')
            .focusOnTouch(true)
            .onClick(() => {
              this.isGroupValue = !this.isGroupValue
            })

        }.width('50%')

        .id('FocusScopeId020_scroll')
      }
      .id('FocusScopeId020_nav')
      .mode(this.modeValue)
      .title('navigation')
      .navDestination(this.PageMap)
      .height('100%')
      .width('100%')
    }.width('100%').height('90%').align(Alignment.Top)
    .id('FocusScopeId020_col')
  }
}