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
import observer from '@ohos.arkui.observer';
import prompt from '@system.prompt';
import { UIObserver } from '@ohos.arkui.UIContext';
import router from '@ohos.router';

@Entry
@ComponentV2
struct LifeCycle0120 {
  @Local state: string = 'hello'
  cb(info: observer.RouterPageInfo) {
    let routerInfo: observer.RouterPageInfo | undefined = this.queryRouterPageInfo()
    if (info.pageId == routerInfo?.pageId) {
      if (info.state == 2) {
        this.state = 'onPageShow'
        console.debug('onPageShow')
        prompt.showToast({ message: 'onPageShow', duration: 2000 })
      } else if (info.state == 3) {
        this.state = 'onPageHide'
        console.debug('onPageHide')
        prompt.showToast({ message: 'onPageHide', duration: 2000 })
      }
    }
  }

  aboutToAppear(): void {
    let uiObserver: UIObserver = this.getUIContext().getUIObserver()
    uiObserver.on('routerPageUpdate', this.cb.bind(this))
  }

  aboutToDisappear(): void {
    this.getUIContext().getUIObserver().off('routerPageUpdate', this.cb.bind(this))
  }


  build() {
    Column() {
      Text(this.state).fontSize(9).id('tvLifeCycle0120Page')
      Button('BackSelf')
        .id('btnLifeCycle0120Back')
        .onClick(() => {
          router.back()
        })
    }
  }
}