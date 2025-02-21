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

class MyUserDateSpan extends UserDataSpan {
  constructor(name: string) {
    super()
    this.name = name
  }
  name: string
}

@Entry
@Component
struct StyledStringKeyTest1 {
  @State name: string = "world"
  @State age: number = 10
  controller: TextController = new TextController()
  styleString: MutableStyledString = new MutableStyledString("hello world", [{
    start: 0,
    length: 11,
    styledKey: StyledStringKey.USER_DATA,
    styledValue: new MyUserDateSpan("hello")
  }])

  onPageShow(): void {
    this.controller.setStyledString(this.styleString)
  }

  build() {
    Column({space:10}) {
      Text(undefined, { controller: this.controller })
      Button("get user data")
        .id('StyledStringKeyTest1_btn')
        .onClick(() => {
          let arr = this.styleString.getStyles(0, this.styleString.length)
          let userDataSpan = arr[0].styledValue as MyUserDateSpan
          this.name = userDataSpan.name
        })
      Text(this.name).id('StyledStringKeyTest1_text')
    }.width('100%')
  }
}