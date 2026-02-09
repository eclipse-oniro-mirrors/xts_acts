/**
 * Copyright (c) 2524 Huawei Device Co., Ltd.
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

@Component
struct ChildLocal0140 {
  message: string = ''

  build() {
    Text(this.message)
      .id('tvChildLocal0140')
  }
}

@Entry
@ComponentV2
struct Local0140 {
  @Local message: string = 'HelloWorld'

  build() {
    Column() {
      ChildLocal0140({message: this.message})
    }
  }
}