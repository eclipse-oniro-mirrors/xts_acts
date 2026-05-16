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
struct EllipseResource1 {
  build() {
    Column({ space: 10 }) {

      Ellipse({ width: 100, height: 50 }).id('EllipseResource1')

      Ellipse({ width: $r('app.string.Width_100'), height: $r('app.string.Height_50') }).id('EllipseResource2')

      Ellipse()
        .id('EllipseResource3')
        .width($r('app.string.Width_100'))
        .height($r('app.string.Height_50'))
        .fillOpacity(0)
        .stroke(Color.Blue)
        .strokeWidth(3)
    }.width('100%')
  }
}