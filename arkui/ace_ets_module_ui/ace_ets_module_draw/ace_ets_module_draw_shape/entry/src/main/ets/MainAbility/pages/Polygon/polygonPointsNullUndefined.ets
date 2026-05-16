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
struct polygonPointsNullUndefined {

  build() {
    Column({ space:2 }) {
      Row({space:2}){
        Polygon({ width: '80', height: '80' })
          .points(null)
          .stroke(Color.Black)
          .backgroundColor('#F5F5F5')
          .fillOpacity(0)
          .id('polygonPointsNull')

        Polygon({ width: 80, height: 80 })
          .points(undefined)
          .stroke(Color.Black)
          .backgroundColor('#F5F5F5')
          .id('polygonPointsUndefined')
      }
      Row({space:2}){
        Polygon({ width: '80', height: '80' })
          .points([])
          .stroke(Color.Black)
          .backgroundColor('#F5F5F5')
          .fillOpacity(0)
          .id('polygonPointsNullList')
      }

    }
    .width('100%')
    .height('100%')
  }
}