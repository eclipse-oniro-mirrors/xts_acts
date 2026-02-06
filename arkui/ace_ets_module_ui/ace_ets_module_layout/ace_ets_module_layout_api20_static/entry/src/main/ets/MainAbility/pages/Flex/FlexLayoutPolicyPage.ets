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
import { LengthMetrics } from '@kit.ArkUI'
import { Entry, Column, Component, Flex, Color, ColumnOptions, $r, LayoutPolicy } from '@ohos.arkui.component'
import { AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct FlexLayoutPolicyPage {
  build() {
    Flex() {
      Flex().backgroundColor(Color.Pink)
        .width(LayoutPolicy.matchParent)
        .height(LayoutPolicy.matchParent)
        .id('FlexLayoutPolicyTest_static_0100_Flex_child')
    }
    .width(200)
    .height(200)
    .padding(20)
    .border({ width: 5, color: Color.Yellow })
    .safeAreaPadding(LengthMetrics.vp(10))
    .backgroundColor(Color.Red)
    .id('FlexLayoutPolicyTest_static_0100_Flex_parent')
  }
}