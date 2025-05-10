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
@ObservedV2
class Son5{
  age :number =18
}
class Father5 {
  son:Son5 = new Son5()
}
@Entry
@Component
struct OnlyObserve{
  father : Father5  = new Father5()
  build() {
    Column() {
      Text(`${this.father.son.age}`)
        .id('OnlyObserve_1A')
        .onClick(()=>{
          this.father.son.age++
        })
    }
    .width('100%')
  }
}