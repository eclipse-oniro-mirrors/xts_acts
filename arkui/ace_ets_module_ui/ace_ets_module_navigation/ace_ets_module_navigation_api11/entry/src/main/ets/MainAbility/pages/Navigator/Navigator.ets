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
struct navigator_testcase {
  @State active: boolean = false
  @State params: ESObject = { text: 'news' }

  build() {
    Column() {
      Navigator({ target: "pages/index", type: NavigationType.Back }) {
        Text('Navigator test  go to Navigator， back called')
      }.active(this.active)
      .key('navigator')
      .params({
        data: 24
      })

      Navigator({ target: "pages/index", type: NavigationType.Push }) {
        Text('Navigator test  go to Navigator, router called')
      }.active(this.active)
      .key('navigator2')
      .params({
        data: 24
      })

      Navigator({ target: "pages/index", type: NavigationType.Replace }) {
        Text('Navigator test  go to Navigator，changed called')
      }.active(this.active)
      .key('navigator3')
      .params({
        data: 24
      })
    }.width(300)
    .height(300)
    .borderColor(Color.Pink)
    .borderWidth(2)
  }
}
