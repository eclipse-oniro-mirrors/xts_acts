'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, Column, VerticalAlign, Color, Navigation,NavPathStack,Row,Text,ClickEvent,NavPathInfo } from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement';

interface PushParam{
  data:number
}

@Entry
@Component
struct row_testcase {
  @State alignItems: VerticalAlign = VerticalAlign.Top
  @State active: boolean = false
  pathStack: NavPathStack = new NavPathStack()

  build() {
    Column() {
      Navigation(this.pathStack) {
        Row() {
          Column() {
            Text("Row-Demo1")
          }

          Column() {
            Text("Demo2")
          }
        }
        .key('row')
        .alignItems(this.alignItems)

      }
      .onClick((e: ClickEvent)=>{
        this.pathStack.pushPath(new NavPathInfo('index',{
            data: 26
          } as PushParam))
      })
    }
    .width(300)
    .height(300)
    .borderColor(Color.Pink)
    .borderWidth(2)
  }
}

