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

import { BusinessError } from '@ohos.base';


@Entry
@Component
struct Navigation_NavPathStackTest2 {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()

  @Builder pageOneTmp() {
    NavDestination() {
      Column({space:10}) {
        Text('pageOne2').id('NavPathStackApi2_text_pageOne')

      }.width('100%').height('100%')
    }.title('pageOne')
    .onBackPressed(() => {
      this.pageInfos.pop()
      return true
    })
  }



  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column() {

        Text('Navigation')

        Button('pushDestinationByName', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .onClick(() => {
            this.pageInfos.pushDestinationByName('pageOne',null, true)
          })
          .id('NavPathStackApi2_pushDestinationByName')

      }
    }.title('NavIndex').navDestination(this.PageMap)
  }
}
