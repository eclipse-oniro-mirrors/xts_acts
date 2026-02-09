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
import { LengthMetrics } from '@ohos.arkui.node'
@Entry
@Component
struct BorderOptionsTest1 {
  @State text:string = ''

  build() {
    Column() {
      Text('text')
        .id('BorderOptionsTest1_text')
        .width('100vp')
        .height('100vp')
        .border({width: 1, style:BorderStyle.Dashed, dashGap:LengthMetrics.vp(5), dashWidth: LengthMetrics.vp(10)})
    }
    .width('100%')
  }
}