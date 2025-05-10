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
struct FocusScopeId18 {
  @State text1:string = 'text1'
  @State modeValue: NavigationMode = NavigationMode.Stack
  @State pageInfos: NavPathStack = new NavPathStack()


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
        }.focusScopeId('FocusScopeId18_focusGroup7',true)
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
          Column(){
            Column({space:5}){

              Text('焦点组5')
              Column({space:5}){
                Button('单栏')
                  .id('FocusScopeId18_btn1_5')
                  .onClick(()=>{
                    this.modeValue = NavigationMode.Stack
                  })
                  .focusOnTouch(true)

                Button('双栏1')
                  .id('FocusScopeId18_btn2_5')
                  .onClick(()=>{
                    this.modeValue = NavigationMode.Split
                  })
                  .focusOnTouch(true)

                Button('pushPageOne')
                  .id('FocusScopeId18_btn3_5')
                  .onClick(()=>{
                    this.pageInfos.pushPath({name:'pageOne'})
                  })
                  .focusOnTouch(true)
              }
              .focusScopeId('FocusScopeId18_focusGroup5',true)
              .borderWidth(1)


              Text('焦点组6，第三个按钮设置默认获焦')
              Column({space:5}){
                Button('btn1').focusOnTouch(true)
                  .id('FocusScopeId18_btn1_6')
                Button('btn2').focusOnTouch(true)
                  .id('FocusScopeId18_btn2_6')
                Button('defaultFocus:true').focusOnTouch(true).defaultFocus(true)
                  .id('FocusScopeId18_btn3_6')
              }
              .focusScopeId('FocusScopeId18_focusGroup6',true)
              .borderWidth(1)

              Button('clearFocus')
                .id('FocusScopeId18_clearFocus')
                .onClick(()=>{
                  this.getUIContext().getFocusController().clearFocus()
                })

            }
          }
        }
      }
      .id('FocusScopeId18_nav')
      .mode(this.modeValue)
      .title('navigation')
      .navDestination(this.PageMap)
      .height('100%')

    }.width('100%')
    .id('FocusScopeId18_col')
  }
}