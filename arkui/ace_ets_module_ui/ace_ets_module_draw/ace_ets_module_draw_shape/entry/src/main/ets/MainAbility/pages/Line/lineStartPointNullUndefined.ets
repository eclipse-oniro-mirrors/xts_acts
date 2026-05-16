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
struct lineStartPointNullUndefined {

  build() {
    Column({ space:2 }) {
      Row({space:2}){
        Line({ width: '80', height: '80' })
          .startPoint([])
          .endPoint([])
          .stroke(Color.Black)
          .backgroundColor('#F5F5F5')
          .id('lineStartPointNullList')

        Line({ width: 80, height: 80 })
          .startPoint(null)
          .endPoint(null)
          .stroke(Color.Black)
          .backgroundColor('#F5F5F5')
          .id('lineStartPointNull')
      }
      Row({space:2}){
        Line({ width: '80', height: '80' })
          .startPoint(undefined)
          .endPoint(undefined)
          .stroke(Color.Black)
          .backgroundColor('#F5F5F5')
          .id('lineStartPointUndefined')
      }
      
    }
    .width('100%')
    .height('100%')
  }
}