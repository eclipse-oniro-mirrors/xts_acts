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
struct RectCommonShapeMethodPage {
  build() {
    Column({ space: 2 }) {
      Rect({ width: '90%', height: "30%", radius: 20 })
        .id("RectCommonShapeMethodRect_1")
        .strokeMiterLimit(10)

      Rect({ width: '90%', height: "30%" })
        .id("RectCommonShapeMethodRect_2")
        .radius(20)
        .strokeOpacity(0.5)
    }
    .width("100%").height("100%")
  }
}

