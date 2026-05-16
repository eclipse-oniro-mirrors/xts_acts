/*
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
import font from '@ohos.font';

@Entry
@Component
struct textFontWeightTest {
  build() {
    Column() {
      Text('fontWeight边界值测试--负数')
        .height('10%')
        .fontWeight(-100)
        .id('textFontWeightTest01')
      Text('fontWeight边界值测试--99')
        .height('10%')
        .fontWeight(99)
        .id('textFontWeightTest02')
      Text('fontWeight边界值测试--901')
        .height('10%')
        .fontWeight(901)
        .id('textFontWeightTest03')
      Text('fontWeight边界值测试--负数')
        .height('10%')
        .fontWeight(-100,{ enableVariableFontWeight: true })
        .id('textFontWeightTest04')
      Text('fontWeight边界值测试--99')
        .height('10%')
        .fontWeight(99,{ enableVariableFontWeight: true })
        .id('textFontWeightTest05')
      Text('fontWeight边界值测试--901')
        .height('10%')
        .fontWeight(901,{ enableVariableFontWeight: true })
        .id('textFontWeightTest06')
    }
    .width('100%')
    .height('80%')
  }
}
