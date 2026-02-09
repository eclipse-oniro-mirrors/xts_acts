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

@Entry
@Component
struct NavigationBarStyle {
  @State str1:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();

  build() {
    Column({space:5}){
      Text('BarStyle.STACK')

      Navigation(this.pageInfos) {
        Column({space:10}) {
          Text('content')
        }
        .width('100%')
        .height('100%')
        .backgroundColor(Color.Pink)
        .id('NavigationBarStyle_content')
      }
      .title('NavigationTitle', {barStyle: BarStyle.STACK, backgroundColor:Color.Orange})
      .id('NavigationBarStyle_nav')

    }
  }
}
