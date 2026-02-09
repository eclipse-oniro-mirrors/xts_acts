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
struct FocusScopeId004 {
  @State text1: string = 'text1'
  @State modeValue: NavigationMode = NavigationMode.Stack
  @State pageInfos: NavPathStack = new NavPathStack()
  @State flag: boolean = true
  @State visibilityValue: Visibility = Visibility.Visible
  @State focusId: (string | undefined | null) [] =
    ['FocusScopeId004_focusGroup1', undefined, null, 'FocusScopeId004_focusGroup2']
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
        }.focusScopeId('FocusScopeId004_focusGroup7', true)
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
        Row({ space: 5 }) {
          Column() {
            Text('焦点组2')
            Column({ space: 5 }) {
              Button('btn1').focusOnTouch(true).id('FocusScopeId004_btn1_2')
              Button('btn2').focusOnTouch(true).id('FocusScopeId004_btn2_2')
              Button('btn3').focusOnTouch(true)
            }
            .focusScopeId('FocusScopeId004_focusGroup2', true)
            .borderWidth(1)
          }

          Column() {
            Text('焦点组6，第三个按钮设置默认获焦')
            Column({ space: 5 }) {
              Button('btn1').focusOnTouch(true)
                .id('FocusScopeId004_btn1_6')
              Button('btn2').focusOnTouch(true)
                .id('FocusScopeId004_btn2_6')
              Button('defaultFocus:true').focusOnTouch(true).defaultFocus(true)
                .id('FocusScopeId004_btn3_6')
            }
            .focusScopeId('FocusScopeId004_focusGroup6', true)
            .borderWidth(1)


            Column({ space: 2 }) {
              Button('clearFocus')
                .id('FocusScopeId004_clearFocus')
                .onClick(() => {
                  this.getUIContext().getFocusController().clearFocus()
                })

            }
          }
        }
      }
      .id('FocusScopeId004_nav')
      .mode(this.modeValue)
      .title('navigation')
      .navDestination(this.PageMap)
      .height('100%')

    }.width('100%').height('90%').align(Alignment.Top)
    .id('FocusScopeId004_col')
  }
}