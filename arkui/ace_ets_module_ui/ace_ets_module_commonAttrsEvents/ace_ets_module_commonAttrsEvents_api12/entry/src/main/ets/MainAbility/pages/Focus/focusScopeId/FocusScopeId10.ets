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
struct FocusScopeId10 {

  build() {
    Column({space:5}) {
      Text('焦点组设置默认获焦')
      Column({space:5}){
        Button('btn1').focusOnTouch(true)
        Button('defaultFocus:true').defaultFocus(true).focusOnTouch(true)
        Button('FocusPriority.PREVIOUS')
          .id('FocusScopeId10_btn3')
          .focusScopePriority('FocusScopeId10_focusGroup1', FocusPriority.PREVIOUS)
          .focusOnTouch(true)
      }
      .focusScopeId('FocusScopeId10_focusGroup1',true)
      .borderWidth(1)

      Button('btn4').focusOnTouch(true) .id('FocusScopeId10_btn4')

      Text('非焦点组')
      Column({space:5}){
        Button('btn5').focusOnTouch(true)
          .id('FocusScopeId10_btn5')
          .onClick(()=>{
            this.getUIContext().getFocusController().clearFocus()
          })
        Button('FocusPriority.PRIOR')
          .id('FocusScopeId10_btn6')
          .focusScopePriority('FocusScopeId10_focusGroup2', FocusPriority.PRIOR)
          .focusOnTouch(true)
        Button('btn7')
          .id('FocusScopeId10_btn7')
          .focusOnTouch(true)
      }
      .focusScopeId('FocusScopeId10_focusGroup2',false)
      .borderWidth(1)


    }.width('100%')
  }
}