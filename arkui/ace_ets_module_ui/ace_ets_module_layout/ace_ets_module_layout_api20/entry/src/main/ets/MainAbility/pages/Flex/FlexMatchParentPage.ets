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
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct FlexMatchParentPage {
  build() {
    Flex() {
      Flex().backgroundColor(Color.Pink)
        .width(LayoutPolicy.matchParent)
        .height(LayoutPolicy.matchParent)
        .key('FlexMatchParentTest_0100_child')
    }
    .width(200)
    .height(200)
    .padding(20)
    .border({ width: 10, color: Color.Yellow })
    .safeAreaPadding(LengthMetrics.vp(10))
    .backgroundColor(Color.Red)
    .key('FlexMatchParentTest_0100_parent')
  }
}