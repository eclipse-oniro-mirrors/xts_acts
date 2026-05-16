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
struct relativeContainerGuideLineNullUndefined {

  build() {
    Column({ space:2 }) {
      Row({space:2}) {
        RelativeContainer() {
          Row()
            .width(70)
            .height(70)
            .backgroundColor('#a3cf62')
        }
        .id('relativeContainerGuideLineNull')
        .width(80)
        .height(80)
        .barrier(null)
        .guideLine(null)
        RelativeContainer() {
          Row()
            .width(70)
            .height(70)
            .backgroundColor('#a3cf62')
        }
        .id('relativeContaineGuideLineUndefined')
        .width(80)
        .height(80)
        .barrier(undefined)
        .guideLine(undefined)
      }
      Row({space:2}) {
        RelativeContainer() {
          Row()
            .width(70)
            .height(70)
            .backgroundColor('#a3cf62')
        }
        .id('relativeContainerGuideLineNullList')
        .width(80)
        .height(80)
        .barrier([])
        .guideLine([])
      }
      
    }
    .width('100%')
    .height('100%')
  }
}