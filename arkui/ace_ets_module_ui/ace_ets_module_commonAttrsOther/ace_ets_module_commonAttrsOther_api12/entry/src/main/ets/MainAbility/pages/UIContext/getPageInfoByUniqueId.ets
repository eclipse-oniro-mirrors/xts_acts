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

import { UIContext, PageInfo } from '@ohos.arkui.UIContext';

@Entry
@Component
struct getPageInfoByUniqueIdExample {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack();

  build() {
    Column() {
      Navigation(this.pageInfos) {
        NavDestination() {
          MyComponentUniqueId()
        }
      }.id('getNavigationInfoByUniqueId_id')
    }
  }
}

@Component
struct MyComponentUniqueId {
  @State pageInfo: string = 'Init'
  @State navigationInfo: string = 'Init'

  build() {
    Column() {
      Button(this.pageInfo).id('getPageInfoByUniqueId')
      Button(this.navigationInfo).id('getNavigationInfoByUniqueId')
        .onClick(() => {
          const uiContext: UIContext = this.getUIContext();
          const uniqueId: number = this.getUniqueId();
          const pageInfo: PageInfo = uiContext.getPageInfoByUniqueId(uniqueId);
          this.pageInfo = '' + JSON.stringify(pageInfo.routerPageInfo?.index)
          console.info('pageInfo: ' + this.pageInfo);
          this.navigationInfo = '' + JSON.stringify(uiContext.getNavigationInfoByUniqueId(uniqueId)?.navigationId)
          console.info('navigationInfo: ' + this.navigationInfo);
        })
      TextArea({
        text: this.navigationInfo
      })
        .width('100%')
        .height(100)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}