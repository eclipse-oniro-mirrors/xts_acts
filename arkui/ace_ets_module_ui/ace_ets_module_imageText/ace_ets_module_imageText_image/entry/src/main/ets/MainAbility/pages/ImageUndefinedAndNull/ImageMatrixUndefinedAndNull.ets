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

import { matrix4 } from '@kit.ArkUI';

@Entry
@Component
struct imageMatrixUndefinedAndNullTest {
  build() {
    Row() {
      Column({ space: 20 }) {
        Column({ space: 5 }) {
          Image($r('app.media.tree'))
            .id('imageMatrixUndefined')
            .objectFit(ImageFit.MATRIX)
            .imageMatrix(undefined)
            .border({ width:2, color: Color.Black })
            .width(150)
            .height(150)
          Text('通过imageMatrix变换，调整图源位置，实现最佳呈现。undefined')
            .fontSize('25px')
        }

        Column({ space: 5 }) {
          Image($r('app.media.tree'))
            .id('imageMatrixNull')
            .objectFit(ImageFit.MATRIX)
            .imageMatrix(null)
            .border({ width:2, color: Color.Black })
            .width(150)
            .height(150)
          Text('通过imageMatrix变换，调整图源位置，实现最佳呈现。null')
            .fontSize('25px')
        }
      }
      .width('100%')
    }
  }
}