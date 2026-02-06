'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { UIObserver } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,
  DataChangeListener,
  DataOperation,
  LazyForEach,
  IDataSource,
  DataOperationType,ComponentV2
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,Local
} from '@ohos.arkui.stateManagement'

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
        this.getUIContext().getPromptAction().showToast({ message: 'onPageShow', duration: 2000 });
      } else if (info.state == 3) {
        this.state = 'onPageHide'
        console.debug('onPageHide')
        this.getUIContext().getPromptAction().showToast({ message: 'onPageHide', duration: 2000 });
      }
    }
  }

  aboutToAppear(): void {
    let uiObserver: UIObserver = this.getUIContext().getUIObserver()
    uiObserver.onRouterPageUpdate((info) => this.cb(info))
  }

  aboutToDisappear(): void {
    this.getUIContext().getUIObserver().offRouterPageUpdate((info) => this.cb(info))
  }


  build() {
    Column() {
      Text(this.state).fontSize(9).id('tvLifeCycle0120Page')
      Button('BackSelf')
        .id('btnLifeCycle0120Back')
        .onClick(():void => {
          this.getUIContext().getRouter().back()
        })
    }
  }
}