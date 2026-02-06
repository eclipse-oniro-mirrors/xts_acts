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
import { CircleShape, EllipseShape, PathShape, RectShape } from "@ohos.arkui.shape"

@Entry
@Component
struct APIClipMaskShapePage {
  build() {
    Column({ space: 15 }) {
      Image($r('app.media.icon'))
        .key('APIClipMaskShape_Image1')
        .clipShape(new CircleShape({ width: '100px', height: '100px' }))
        .width('500px')
        .height('280px')

      Image($r('app.media.icon'))
        .key('APIClipMaskShape_Image2')
        .maskShape(new RectShape().width('200px').height('200px').fill(Color.Red))
        .width('300px')
        .height('300px')
    }
    .width('100%')
    .margin({ top: 15 })
  }
}