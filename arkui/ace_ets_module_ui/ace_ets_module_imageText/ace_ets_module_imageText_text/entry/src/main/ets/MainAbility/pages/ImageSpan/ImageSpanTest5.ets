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
struct TextImageSpan5 {
  @State flag1: string = 'Init'
  @State flag2: string = 'Init'
  @State flag3: string = 'Init'
  @State flag4: string = 'Init'
  @State flag5: string = 'Init'

  build() {
    Column({ space: 10 }) {
      Text(this.flag1).id('ImageSpan_onComplete_51').margin({top:50})
      Text(this.flag2).id('ImageSpan_onComplete_52')
      Text(this.flag3).id('ImageSpan_onComplete_53')
      Text(this.flag4).id('ImageSpan_onComplete_54')
      Text(this.flag5).id('ImageSpan_onComplete_55')
      Text(){
        ImageSpan('app.media.icon').width(100).height(100)
          .onError(()=>{
            this.flag1 = 'png onError'
          })
          .onComplete(()=>{
            this.flag1 = 'png onComplete succ'
          })
        ImageSpan('app.media.bm').width(100).height(100)
          .onError(()=>{
            this.flag2 = 'jpg onError'
          })
          .onComplete(()=>{
            this.flag2 = 'jpg onComplete succ'
          })
        ImageSpan('app.media.gif').width(100).height(100)
          .onError(()=>{
            this.flag3 = 'gif onError'
          })
          .onComplete(()=>{
            this.flag3 = 'gif onComplete succ'
          })
        ImageSpan('app.media.svg').width(100).height(100)
          .onError(()=>{
            this.flag4 = 'svg onError'
          })
          .onComplete(()=>{
            this.flag4 = 'svg onComplete succ'
          })
        ImageSpan('app.media.bmp').width(100).height(100)
          .onError(()=>{
            this.flag5 = 'bmp onError'
          })
          .onComplete(()=>{
            this.flag5 = 'bmp onComplete succ'
          })
      }
      .borderWidth(1)
    }
  }
}