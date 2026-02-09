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
import { Entry,Component,$r,Column,Button,NavDestination,ClickEvent,Text,
  NavDestinationAttribute} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { NavDestinationModifier } from "@ohos.arkui.modifier";

class CustomModifier extends NavDestinationModifier {
  applyNavDestinationAttribute(instance: NavDestinationAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.hideTitleBar(true)
  }
}

@Entry
@Component
struct hideTitleBarTest {
  @State customModifier: NavDestinationModifier = new CustomModifier()
    .hideTitleBar(false)

  build() {
    Column() {
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      NavDestination() {
        Text(`我是NavDestination第1页内容`).fontSize(50)
      }
      .key('NavDestination1')
      .attributeModifier(this.customModifier as CustomModifier)
      .backgroundColor('#ccc')
      .title(`NavDestination`)

    }.height('100%')
  }
}