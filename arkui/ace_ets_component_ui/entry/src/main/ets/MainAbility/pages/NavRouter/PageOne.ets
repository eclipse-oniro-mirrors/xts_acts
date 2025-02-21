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
class TmpClass{
  count:number=10
}
@Component
export struct PageOneTmp {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State text1: string = ''

  build() {
    NavDestination() {
      Column() {
        // Button('pop', { stateEffect: true, type: ButtonType.Capsule })
        //   .width('80%')
        //   .height(40)
        //   .margin(20)
        //   .onClick(() => {
        //     this.pageInfos.pop()
        //   })
      }.width('100%').height('100%')
    }.title('pageOne')
    .onBackPressed(() => {
      this.pageInfos.pop({number: 1})
      return true
    })
  }
}