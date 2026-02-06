'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Router } from '@ohos.arkui.UIContext';
import { Entry, Column, Component, Text, Button, Navigation, NavigationTitleMode, ClickEvent, Margin, NavigationMode} from '@ohos.arkui.component'
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct OnNewParamRouter {
  build() {
    Navigation() {
      Column() {
        Button('push pageOne')
          .onClick((e:ClickEvent) => {
            const router = AppStorage.get<Router>("router") as Router
            router.pushUrl({ url: 'MainAbility/pages/router/PageOne'})
          })
          .id('pushId')
          .height('10%')
      }
    }
    .title('MainPage')
    .hideBackButton(true)
    .titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
  }
}

