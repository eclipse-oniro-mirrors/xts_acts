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

@Builder
function funBuilder0070(msg: string) {
  Text(msg)
    .id('tvBuilder0070GlobalBuilder')
    .onClick(()=>{
      msg = 'HelloWorld'
    })
}

@Entry
@ComponentV2
struct Builder0070 {
  @Local msg: string = 'HelloBuilder'

  @Builder
  fun(msg: string) {
    Text(msg)
      .id('tvBuilder0070CommentBuilder')
      .onClick(()=>{
        msg = 'HelloWorld'
      })
  }

  build() {
    Column({space: 3}) {
      funBuilder0070(this.msg)
      this.fun(this.msg)
    }
  }
}