/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {$r, Color, HorizontalAlign, Entry, Component, Column, Row, Badge, NodeContainer, Image, ProgressType, Progress,
  CapsuleStyleOptions, LinearStyleOptions , RingStyleOptions ,ProgressStyleOptions,
} from '@ohos.arkui.component'

@Entry
@Component
struct ProgressContent {

  build() {
    Column() {
      Progress({ value: 10, type: ProgressType.Capsule })
        .width(100).height(30)
        .style({
          // content: $r('app.string.module_desc')
        } as CapsuleStyleOptions).id('ProgressStyleContent')
      Progress({ value: 10, type: ProgressType.Capsule })
        .width(100).height(30)
        .style({
          content: undefined
        } as  CapsuleStyleOptions ).id('ProgressStyleContent1')
      Progress({ value: 10, type: ProgressType.Capsule } )
        .width(100).height(30)
        .style({
          // content: null
        }as CapsuleStyleOptions).id('ProgressStyleContent2')
      Progress({ value: 10, type: ProgressType.Capsule })
        .width(100).height(30)
        .style({
          content: 'Progress'
        } as  CapsuleStyleOptions).id('ProgressStyleContent3')
    }.width('100%').height('100%')
  }
}
