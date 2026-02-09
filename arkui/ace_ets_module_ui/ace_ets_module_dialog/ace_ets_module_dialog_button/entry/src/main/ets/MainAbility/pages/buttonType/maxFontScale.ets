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
struct MaxFontScaleIndex {
  build() {
    Column() {
        Button('1')
          .key('btn01')
          .margin({top:10})
          .maxFontScale(1)
        Button('1.5')
          .id('btn02')
          .margin({top:10})
          .maxFontScale(1.5)
        Button('3.2')
          .id('btn03')
          .margin({top:10})
          .maxFontScale(3.2)
        Button('20')
          .id('btn04')
          .margin({top:10})
          .maxFontScale(20)
        Button('undefined')
          .id('btn05')
          .margin({top:10})
          .maxFontScale(undefined)
        Button('null')
          .id('btn06')
          .margin({top:10})
          .maxFontScale(null)
        Button('0')
          .id('btn07')
          .margin({top:10})
          .maxFontScale(0)
    }
  }
}