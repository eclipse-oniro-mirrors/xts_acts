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
struct OptimizeTrailingSpaceTest {
  build() {
    Column() {
      Text('Trimmed space enabled     ')
        .fontWeight(FontWeight.Bold)
        .optimizeTrailingSpace(true)
        .textAlign(TextAlign.Center)
        .id('optimizeTrailingSpace_text1')
      Text('Trimmed space enabled     ')
        .fontWeight(FontWeight.Bold)
        .optimizeTrailingSpace(false)
        .textAlign(TextAlign.Center)
        .id('optimizeTrailingSpace_text2')
    }
    .width('100%')
  }
}