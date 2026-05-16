/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct ZIndexPropertyTest {
  build() {
    Column() {
      Text('ZIndex Property Test')
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)

      Stack() {
        Text('zIndex null')
          .id('zIndexNull')
          .width('90%')
          .height('30%')
          .backgroundColor('#FF0000FF')
          .align(Alignment.TopStart)
          .zIndex(null)

        Text('zIndex undefined')
          .id('zIndexUndefined')
          .width('70%')
          .height('20%')
          .backgroundColor('#FF00FF00')
          .align(Alignment.Center)
          .zIndex(undefined)
      }
      .width('100%')
      .height('40%')
    }
    .width('100%')
    .height('100%')
  }
}
