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
struct LineResource {
  build() {
    Column({ space: 5 }) {

      Line({width: 100, height: 50})
        .id('LineResource1')
        .startPoint([0, 0])
        .endPoint([50, 50])
        .stroke(Color.Black)
        .backgroundColor('#F5F5F5')

      Line({width: $r('app.string.Width_100'), height: $r('app.string.Height_50')})
        .id('LineResource2')
        .startPoint([0, 0])
        .endPoint([50, 50])
        .stroke(Color.Black)
        .backgroundColor('#F5F5F5')

      Line()
        .id('LineResource3')
        .width($r('app.string.Width_100'))
        .height($r('app.string.Height_50'))
        .startPoint([0, 0])
        .endPoint([50, 50])
        .strokeWidth(5)
        .stroke(Color.Orange)
        .strokeOpacity(0.5)
        .backgroundColor('#F5F5F5')
    }.width('100%')
  }
}