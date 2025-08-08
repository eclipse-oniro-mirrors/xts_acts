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
struct FocusScopeId010 {
  @State text1:string = 'text1'
  @State modeValue: NavigationMode = NavigationMode.Stack
  @State pageInfos: NavPathStack = new NavPathStack()
  @State flag: boolean = true
  @State visibilityValue: Visibility = Visibility.Visible
  @State focusId: (string | undefined |null) []= ['FocusScopeId010_focusGroup1', undefined, null, 'FocusScopeId010_focusGroup2']
  @State focusIdIndex: number = 0
  @State isGroupValue: boolean = true

  @Builder PageMap(name:string){
    if (name === 'pageOne'){
      this.pageOne()
    }
  }

  @Builder pageOne(){
    NavDestination(){
      Column({space:5}){
        Text('焦点组内组件设置focuxBox')
        Column({space:5}){
          Button('btn1')
            .focusOnTouch(true)
            .focusBox({
              margin:new LengthMetrics(0),
              strokeColor: ColorMetrics.rgba(255,0,0)
            })

          Button('btn2')
            .focusOnTouch(true)
            .focusBox({
              margin:new LengthMetrics(0),
              strokeColor: ColorMetrics.rgba(255,0,0)
            })
        }.focusScopeId('FocusScopeId010_focusGroup7',true)
        .borderWidth(1)

        Button('btn3')
          .focusOnTouch(true)
          .focusBox({
            margin:new LengthMetrics(0),
            strokeColor: ColorMetrics.rgba(255,0,0)
          })

      }
    }.title('pageOne')
  }

  build() {
    Column() {
      Navigation(this.pageInfos){
        Scroll(){
          Column({space:5}){

            Text('焦点组2')
            Column({space:5}){
              Button('btn1').focusOnTouch(true).id('FocusScopeId010_btn1_2')
              Button('btn2').focusOnTouch(true).id('FocusScopeId010_btn2_2')
              Button('btn3').focusOnTouch(true)
            }
            .focusScopeId('FocusScopeId010_focusGroup2',true)
            .borderWidth(1)

            Text('焦点组4，可设置不可见')
            Column({space:5}){
              Button('btn1').focusOnTouch(true)
              Button('btn2').focusOnTouch(true)
            }
            .focusScopeId('FocusScopeId010_focusGroup4',true)
            .borderWidth(1)
            .visibility(this.visibilityValue)

            Button('隐藏')
              .id('FocusScopeId010_btn_hide')
              .focusOnTouch(true)
              .onClick(()=>{
                this.visibilityValue = (this.visibilityValue == Visibility.Visible) ? Visibility.Hidden:Visibility.Visible
              })

            Button('clearFocus')
              .id('FocusScopeId010_clearFocus')
              .onClick(()=>{
                this.getUIContext().getFocusController().clearFocus()
              })

          }
        }
        .id('FocusScopeId010_scroll')
      }
      .id('FocusScopeId010_nav')
      .mode(this.modeValue)
      .title('navigation')
      .navDestination(this.PageMap)
      .height('100%')

    }.width('100%')
    .id('FocusScopeId010_col')
  }
}