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

@Entry
@Component
struct ImageAnimatorIterationsUndefinedAndNullTest {

  build() {
    Column({ space: 10 }) {
      ImageAnimator()
        .id('iterationsUndefined')
        .images([
          {
            src: $r('app.media.tree')
          }
        ])
        .iterations(undefined)
        .border({ width:2, color: Color.Black })
        .width(150)
        .height(150)

      ImageAnimator()
        .id('iterationsNull')
        .images([
          {
            src: $r('app.media.tree')
          }
        ])
        .iterations(null)
        .border({ width:2, color: Color.Black })
        .width(150)
        .height(150)
    }.width('100%').height('100%')
  }
}