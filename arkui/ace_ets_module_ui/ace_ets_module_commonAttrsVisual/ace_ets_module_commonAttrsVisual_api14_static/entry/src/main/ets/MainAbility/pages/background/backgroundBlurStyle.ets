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
import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Text,
  Color,
  Image,
  SizeOptions,
  ImageSize,
  Position,
  Alignment,
  Row,
  Padding,
  ResourceColor,
  BlurStyle,
  BlurStyleActivePolicy,
  Stack,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
@Entry
@Component
struct backgroundBlurStyle1 {
  @State imageSize: number = 150;
  @State mInactiveColor: ResourceColor = '#FFFF0000'
  build() {
    Column({ space: 5 } as ColumnOptions) {
      // backgroundBlurStyle通过枚举值的方式设置模糊参数
      Stack() {
        Column()
          .id('backgroundBlurStyleValue')
          .width(this.imageSize)
          .height(this.imageSize)
          .backgroundBlurStyle(BlurStyle.Thin, {
            inactiveColor: this.mInactiveColor,
            policy: BlurStyleActivePolicy.ALWAYS_ACTIVE
          })
      }
    }
    .width('100%')
    .padding({ top: 5 } as Padding)
  }
}
