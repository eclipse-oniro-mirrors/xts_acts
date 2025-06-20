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
struct TextImageSpan8 {
  @State flag: string = 'Init'
  @State numWidth: number = 50
  @State numHeight: number = 50
  @State count: number = 0

  build() {
    Column({ space: 100 }) {
      Text('动态切换图片宽高大小')
      Text(this.flag).id('ImageSpan_onComplete_8')
        .onClick(()=>{
          this.numWidth = 100
          this.numHeight = 100
        })
      Text(this.count.toString()).id('ImageSpan_onComplete_82')
      Text(){
        ImageSpan($r("app.media.jpg"))
          .width(this.numWidth)
          .height(this.numHeight)
          .onError(()=>{
            this.flag = 'onError'
          })
          .onComplete(()=>{
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