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
struct MinFontScaleIndex {
build() {
    Column() {
        Button('0.5')
          .key('btn1')
          .margin({top:10})
          .minFontScale(0.5)
        Button('0.7')
          .id('btn2')
          .margin({top:10})
          .minFontScale(0.7)
        Button('0')
          .id('btn3')
          .margin({top:10})
          .minFontScale(0)
        Button('1')
          .id('btn4')
          .margin({top:10})
          .minFontScale(1)
        Button('undefined')
          .id('btn5')
          .margin({top:10})
          .minFontScale(undefined)
        Button('null')
          .id('btn6')
          .margin({top:10})
          .minFontScale(null)
        Button('-1')
          .id('btn7')
          .margin({top:10})
          .minFontScale(-1)
        }
    }
}