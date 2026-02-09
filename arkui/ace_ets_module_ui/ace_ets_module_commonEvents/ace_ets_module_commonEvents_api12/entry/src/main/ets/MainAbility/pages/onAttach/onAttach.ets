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
struct OnAttach1 {
  @State isShow: boolean = false
  @State changeAppear: string = '点我卸载挂载组件'
  @State myText: string = 'Text for onAppear'

  build() {
    Column() {
      Button(this.changeAppear).id('OnAttach_button')
        .onClick(() => {
          this.isShow = !this.isShow
        }).margin(15)
      Text(this.myText).id('OnAttach_text')
      if (this.isShow) {
        Text(this.myText).fontSize(26)
          .onAttach(() => {
            this.myText = 'onAttach succ'
          })
          .onDetach(() => {
            this.myText = 'onDetach succ'
          })
      }
    }.padding(30).width('100%')
  }
}