'use static';
/**
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
import { Entry, Component, NavPathStack, Navigation, Column, Button, ColumnOptions, ClickEvent, BarStyle, Stack, StackOptions, BlurStyle, Text, Color
} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct NavigationBarStyle {
  @State str1:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();

  build() {
    Column({space:5} as ColumnOptions){
      Text('BarStyle.SAFE_AREA_PADDING')
      Navigation(this.pageInfos) {
        Column({space:10} as ColumnOptions) {
          Text('content')
        }
        .width('100%')
        .height('100%')
        .backgroundColor(Color.Pink)
        .id('NavigationBarStyle_content2')
      }
      .title('NavigationTitle', {barStyle: BarStyle.SAFE_AREA_PADDING, backgroundColor:Color.Orange})
      .id('BarStyle_SafeAreaPadding')
    }
  }
}
