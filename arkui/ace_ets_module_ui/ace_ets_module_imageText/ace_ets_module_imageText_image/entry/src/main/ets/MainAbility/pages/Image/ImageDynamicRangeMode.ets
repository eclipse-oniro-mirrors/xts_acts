/**
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
struct ImageDynamicRangeModePage {
  build() {
    Column() {
      Image($r('app.media.icon'))
        .height(100)
        .width(100)
        .dynamicRangeMode(DynamicRangeMode.STANDARD)
        .key('imageAddApi')
      Image($r('app.media.icon'))
        .height(100)
        .width(100)
        .dynamicRangeMode(DynamicRangeMode.HIGH)
        .key('imageAddApi2')
      Image($r('app.media.icon'))
        .height(100)
        .width(100)
        .dynamicRangeMode(DynamicRangeMode.CONSTRAINT)
        .key('imageAddApi3')
    }.height(320).width(360).padding({ right: 10, top: 10 })
  }
}