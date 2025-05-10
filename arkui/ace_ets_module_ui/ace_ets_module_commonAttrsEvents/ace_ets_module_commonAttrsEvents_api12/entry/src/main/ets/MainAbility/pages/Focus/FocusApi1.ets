/*
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

@Entry
@Component
struct FocusApi1{
  @State label:string = 'before focus'
  build() {
    Column(){
      Row({space:20}){
        Column({space:5}){
          Button('Group1')
            .width(165)
            .height(40)
          Row({space:5}){
            Button()
              .width(80)
              .height(40)
            Button(this.label)
              .onFocus(() => {
                this.label = 'after focus'
              })
              .focusScopePriority('columnScope1',FocusPriority.PRIOR)
              .id('FocusApi1_btn1')
          }
          Row({space:5}){
            Button()
              .width(80)
              .height(40)
            Button()
              .width(80)
              .height(40)
          }
        }
      }.focusScopeId('columnScope1')
    }
  }
}