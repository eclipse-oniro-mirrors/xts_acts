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
import { LengthMetrics } from '@ohos.arkui.node';

@Entry
@Component
struct NavigationTitleTest1 {
  @State str1:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();

  build() {
    Column({space:5}){
      Navigation(this.pageInfos) {
        Column({space:10})
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Pink)
      }
      .width('80%')
      .borderWidth(1)
      .mode(NavigationMode.Stack)
      .title('NavigationTitle', {paddingStart: LengthMetrics.vp(50), paddingEnd: LengthMetrics.vp(50)})
      .id('NavigationTitleTest1_nav')
    }.width('100%')
  }
}
