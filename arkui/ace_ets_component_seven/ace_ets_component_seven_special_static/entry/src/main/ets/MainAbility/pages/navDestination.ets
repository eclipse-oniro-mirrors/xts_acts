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
import { Entry, Component, Column, AttributeModifier, NavDestinationAttribute, NavDestination, Text } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class hideTitleBarModifier implements AttributeModifier<NavDestinationAttribute> {

  applyNormalAttribute(instance: NavDestinationAttribute): void {
    instance.hideTitleBar(false)
  }
}

@Entry
@Component
struct hideTitleBarTest {
  @State myModifier: hideTitleBarModifier = new hideTitleBarModifier()

  build() {
    Column() {
      NavDestination() {
        Text(`我是NavDestination第1页内容`).fontSize(50)
      }
      .key('NavDestination1')
      .attributeModifier(this.myModifier)
      .backgroundColor('#ccc')
      .title(`NavDestination`)

    }.height('100%')
  }
}