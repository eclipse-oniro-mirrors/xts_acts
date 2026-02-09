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
struct navigation_pushDestination2 {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @State str:string = '1'
  @State code:string = '2'

  @Builder pageOneTmp() {
    NavDestination() {
      Column({space:5}) {

      }.width('100%').height('100%')
    }.title('pageOne')
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column({space:5}) {

        Button('pushPageThree')
          .fontSize(14)
          .onClick(() => {
            this.pageInfos.pushDestination({ name: 'pageThree',param:null })
              .then(()=>{
                this.str = 'success'
              })
              .catch((error: BusinessError)=>{
                this.code = (error.code).toString() + error.message
              })
          })
          .id('navigation_pushDestination2_pushDestination')

        Text(this.str).id('navigation_pushDestination2_text_str')
        Text(this.code).id('navigation_pushDestination2_text_code')



      }
    }.title('Navigation').navDestination(this.PageMap)
  }
}
