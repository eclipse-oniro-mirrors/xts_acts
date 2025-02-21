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

class Builder0080Class {
  title: string = ''
}

@Builder
function funBuilder0080(classA: Builder0080Class) {
  Text(classA.title)
    .id('tvGlobalBuilder0080')
}

@Entry
@ComponentV2
struct Builder0080 {
  @Local msg: string = 'HelloBuilder'

  @Builder
  fun(classB: Builder0080Class) {
    Text(classB.title)
      .id('tvCommentBuilder0080')
  }

  build() {
    Column({space: 3}) {
      funBuilder0080({title: this.msg})
      this.fun({title: this.msg})
      Button('Change Msg')
        .id('btnBuilder0080Change')
        .onClick(()=>{
          this.msg = 'HelloWorld'
        })
    }
  }
}