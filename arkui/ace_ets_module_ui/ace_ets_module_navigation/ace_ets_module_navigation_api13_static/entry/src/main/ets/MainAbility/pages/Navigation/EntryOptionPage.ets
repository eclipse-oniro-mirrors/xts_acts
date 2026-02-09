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
import { Entry, Component, NavPathStack, Builder, Navigation, Column, Button, ColumnOptions, ClickEvent, NavigationTitleMode,
  NavigationMode, NavDestination, NavPathInfo, BarStyle, Stack, StackOptions, BlurStyle, Text
} from '@ohos.arkui.component'
import { State, Provide, Consume, AppStorage, LocalStorage, LocalStoragePropRef } from '@ohos.arkui.stateManagement'

let storages = new LocalStorage();
storages.setOrCreate<int>('eee', 22)
let storageFunc = ():LocalStorage=>{
  return storages;
}

@Entry({storage: 'storageFunc', useSharedStorage: false})
@Component
struct EntryOptionPage {
  @LocalStoragePropRef('eee') eee: int = 222;

  build() {
    Navigation(new NavPathStack()) {
      Column() {
        Text(this.eee + '').id('textId')
      }
    }
    .title('MainPage')
    .titleMode(NavigationTitleMode.Mini)
    .mode(NavigationMode.Stack)
  }
}
