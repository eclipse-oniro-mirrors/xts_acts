/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct bindTips1 {
  build() {
    Column() {
      Button('1 正常')
        .id('bindTips')
        .width('100%')
        .height('100%')
        .bindTips('test bind tips', {
          appearingTime: 700,
          disappearingTime: 4000,
          appearingTimeWithContinuousOperation: 700,
          disappearingTimeWithContinuousOperation: 4000,
        })
    }
  }
}