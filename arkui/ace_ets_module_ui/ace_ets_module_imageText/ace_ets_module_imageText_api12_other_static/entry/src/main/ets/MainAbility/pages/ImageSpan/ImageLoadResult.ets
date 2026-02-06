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
  Text,
  ImageSpan,
  $r,
  Callback,
  ImageCompleteCallback,
  ImageLoadResult,
  ImageCompleteCallback
} from '@ohos.arkui.component'
import { AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';


@Entry
@Component
struct ImageLoadResult1 {
  build() {
    Column() {
      Text() {
        ImageSpan($r('app.media.icon'))
          .id('ImageLoadResult_test')
          .width(100)
          .height(100)
          .onComplete((result: ImageLoadResult) => {
            AppStorage.setOrCreate<number>('ImageLoadResult.width', result.width ?? 0)
            AppStorage.setOrCreate<number>('ImageLoadResult.height', result.height ?? 0)
            AppStorage.setOrCreate<number>('ImageLoadResult.componentWidth', result.componentWidth ?? 0)
            AppStorage.setOrCreate<number>('ImageLoadResult.componentHeight', result.componentHeight ?? 0)
          } as ImageCompleteCallback)
      }
    }.width('100%').height('100%')
  }
}
