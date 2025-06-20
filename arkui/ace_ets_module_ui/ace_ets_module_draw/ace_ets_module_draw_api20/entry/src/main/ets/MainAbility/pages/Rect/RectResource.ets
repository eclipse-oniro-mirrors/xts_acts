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

@Entry
@Component
struct RectResource1 {
  build() {
    Column({ space: 2 }) {

      Row() {

        Column({ space: 2 }) {
          Rect({ width: $r('app.string.Width_100'), height: $r('app.string.Height_50') })
            .radiusHeight($r('app.string.Rect_Radius_20'))
            .radiusWidth($r('app.string.Rect_Radius_40'))
            .fill(Color.Pink)
            .id('RectResource1')
          Rect({ width: $r('app.string.Width_100'), height: $r('app.string.Height_50') })
            .radius($r('app.string.Rect_Radius_20'))
            .fill(Color.Pink)
            .stroke(Color.Transparent)
            .id('RectResource2')
          Rect({ width: 100, height: 50 })
            .radiusHeight(20)
            .radiusWidth(40)
            .fill(Color.Pink)
            .id('RectResource3')
          Rect({ width: 100, height: 50 })
            .radius(20)
            .fill(Color.Pink)
            .stroke(Color.Transparent)
            .id('RectResource4')

        }
      }
    }.width('100%')
  }
}