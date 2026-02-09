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
  $r,
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
  ThemeColorMode,
  BlurStyle,
  ImageSize,
  AdaptiveColor,
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
struct backgroundImageResizable12 {
  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('backgroundImageResizable')
        .id('backgroundImageResizable_1')
        .backgroundImage($r('app.media.icon'))
        .backgroundImageSize({ width:100,height:100 } as SizeOptions)
        .backgroundImageResizable({slice:{top:'20px',left:'20px',right:'20px',bottom:'20px'}})
        .width(200)
        .height(200)
        .border({ width: 1 })
    }
    .width('100%').height('100%').padding({ top: 5 } as Padding)
  }
}