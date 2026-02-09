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
struct TextImageSpan1 {
  @State flag: string = 'Init'

  build() {
    Column({ space: 100 }) {
      Text(this.flag).id('ImageSpan_onComplete_1')
      Text(){
        ImageSpan("resources/base/media/icon.png")
          .onError(()=>{
            this.flag = 'onError'
          })
          .onComplete(()=>{
            this.flag = 'onComplete succ'
          })
      }
      .width(200)
      .height(200)
      .borderWidth(1)
    }
  }
}