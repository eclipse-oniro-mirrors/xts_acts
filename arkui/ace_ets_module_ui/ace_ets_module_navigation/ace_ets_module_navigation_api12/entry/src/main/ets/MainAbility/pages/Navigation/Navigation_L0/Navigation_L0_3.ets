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
struct Navigation_L0_3 {
  @State text:string = '';
  @State mode:NavigationMode = NavigationMode.Stack;

  build() {
    Navigation() {
      Button('change mode').onClick((event: ClickEvent) => {
        this.mode = NavigationMode.Split
      }).id('Navigation_L0_3_btn1')
      Text(this.text).id('Navigation_L0_3_text1')
    }
    .onNavigationModeChange(() => {
      this.text = 'onNavigationModeChange'
    })
    .mode(this.mode)

    .height('100%')
    .width('100%')
    .title('navigation')
  }
}

