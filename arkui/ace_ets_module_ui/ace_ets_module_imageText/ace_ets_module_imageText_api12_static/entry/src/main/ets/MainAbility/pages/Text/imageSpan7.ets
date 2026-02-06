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
import { Entry, Component, Column, Text, ImageSpan, ColumnOptions,$r, Margin } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TextImageSpan7 {
  @State flag1: string = 'Init'
  @State flag2: string = 'Init'
  @State flag3: string = 'Init'
  @State flag4: string = 'Init'
  @State flag5: string = 'Init'

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text(this.flag1).id('ImageSpan_onComplete_71').margin({top:50} as Margin)
      Text(this.flag2).id('ImageSpan_onComplete_72')
      Text(this.flag3).id('ImageSpan_onComplete_73')
      Text(this.flag4).id('ImageSpan_onComplete_74')
      Text(this.flag5).id('ImageSpan_onComplete_75')
      Text(){
        ImageSpan($r("app.media.icon")).width(100).height(100)
          .onError(():void=>{
            this.flag1 = 'png onError'
          })
          .onComplete(():void=>{
            this.flag1 = 'png onComplete succ'
          })
        ImageSpan($r("app.media.jpg")).width(100).height(100)
          .onError(():void=>{
            this.flag2 = 'jpg onError'
          })
          .onComplete(():void=>{
            this.flag2 = 'jpg onComplete succ'
          })
        ImageSpan($r("app.media.gif")).width(100).height(100)
          .onError(():void=>{
            this.flag3 = 'gif onError'
          })
          .onComplete(():void=>{
            this.flag3 = 'gif onComplete succ'
          })
        ImageSpan("app.media.svg").width(100).height(100)
          .onError(():void=>{
            this.flag4 = 'svg onError'
          })
          .onComplete(():void=>{
            this.flag4 = 'svg onComplete succ'
          })
        ImageSpan("app.media.bmp").width(100).height(100)
          .onError(():void=>{
            this.flag5 = 'bmp onError'
          })
          .onComplete(():void=>{
            this.flag5 = 'bmp onComplete succ'
          })
      }
      .borderWidth(1)
    }
  }
}