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

class TMPBuilder0120 {
  msg: string = 'HelloTMP'
}

@Builder
function funBuilder0120(msg: string) {
  Text(msg)
    .id('tvGlobalBuilder0120')
}

@Entry
@ComponentV2
struct Builder0120 {
  @Local tmpClass: TMPBuilder0120 = new TMPBuilder0120()

  @Builder
  fun(msg: string) {
    Text(msg)
      .id('tvCommentBuilder0120')
  }

  build() {
    Column() {
      funBuilder0120(this.tmpClass.msg)
      this.fun(this.tmpClass.msg)
      Button('Change Msg')
        .id('btnBuilder0120Change')
        .onClick(()=>{
          this.tmpClass.msg = 'HelloWorld'
        })
    }
  }
}