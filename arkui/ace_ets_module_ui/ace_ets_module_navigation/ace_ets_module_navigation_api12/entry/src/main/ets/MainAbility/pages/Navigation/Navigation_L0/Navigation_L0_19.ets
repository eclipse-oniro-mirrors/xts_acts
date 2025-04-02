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
struct Navigation_L0_19 {
  @State text:string = '';
  pageInfos: NavPathStack = new NavPathStack();


  build() {
    Navigation(this.pageInfos) {
      Button('pop').onClick((event: ClickEvent) => {
        this.text = '' +  this.pageInfos.pop()
      }).id('Navigation_L0_19_btn1')
      Text(this.text).id('Navigation_L0_19_text1')
    }
    .height('100%')
    .width('100%')
    .title('navigation')
  }
}

