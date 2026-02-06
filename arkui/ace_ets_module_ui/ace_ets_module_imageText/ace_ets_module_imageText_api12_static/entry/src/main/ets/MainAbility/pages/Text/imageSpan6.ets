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
import { Entry, Component, Column, Text, ImageSpan,ClickEvent, ColumnOptions } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TextImageSpan6 {
  @State flag: string = 'Init'
  @State padding1: number = 0
  @State count: number = 0

  build() {
    Column({ space: 100 } as ColumnOptions) {
      Text(this.flag).id('ImageSpan_onComplete_6')
        .onClick((e:ClickEvent)=>{
          this.padding1 += 10
        })
      Text(`${this.count}`).id('ImageSpan_onComplete_62')
      Text(){
        ImageSpan("resources/base/media/jpg.jpg")
          .padding(this.padding1)
          .onError(():void=>{
            this.flag = 'onError'
          })
          .onComplete(():void=>{
            this.flag = 'onComplete succ'
            this.count++
          })
      }
      .width(200)
      .height(200)
      .borderWidth(1)
    }
  }
}