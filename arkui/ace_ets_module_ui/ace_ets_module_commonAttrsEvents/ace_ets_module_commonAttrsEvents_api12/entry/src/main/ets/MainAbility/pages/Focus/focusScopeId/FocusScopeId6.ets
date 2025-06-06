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
struct FocusScopeId6 {
  @State text1:string = 'text1'
  @State modeValue: NavigationMode = NavigationMode.Stack
  @State pageInfos: NavPathStack = new NavPathStack()
  @State flag: boolean = true

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
        }.focusScopeId('FocusScopeId6_focusGroup7',true)
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

            Text('焦点组1，可删除')
            if(this.flag) {
              Column({space:5}){
                Button('btn1').focusOnTouch(true).id('FocusScopeId6_btn1_1')
                Button('btn2').focusOnTouch(true)
                Button('btn3').focusOnTouch(true)
              }.focusScopeId('FocusScopeId6_focusGroup1',true)
              .borderWidth(1)
            }

            Button('del').focusOnTouch(true).id('FocusScopeId6_btn_del')
              .onClick(()=>{
                this.flag = !this.flag
              })

            Text('焦点组2')
            Column({space:5}){
              Button('btn1').focusOnTouch(true).id('FocusScopeId6_btn1_2')
              Button('btn2').focusOnTouch(true)
              Button('btn3').focusOnTouch(true)
            }
            .focusScopeId('FocusScopeId6_focusGroup2',true)
            .borderWidth(1)

            Button('button').focusOnTouch(true).id('FocusScopeId6_btn_btn')

            Button('clearFocus')
              .id('FocusScopeId6_clearFocus')
              .onClick(()=>{
                this.getUIContext().getFocusController().clearFocus()
              })

          }
        }
      }
      .id('FocusScopeId6_nav')
      .mode(this.modeValue)
      .title('navigation')
      .navDestination(this.PageMap)
      .height('100%')

    }.width('100%')
    .id('FocusScopeId6_col')
  }
}