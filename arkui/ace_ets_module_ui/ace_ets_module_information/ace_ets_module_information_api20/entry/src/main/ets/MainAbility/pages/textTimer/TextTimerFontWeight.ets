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
struct TextTimerFontWeight {
  build() {
    Column({ space: 8 }) {
      TextTimer().format('mm:ss').fontWeight($r('app.string.lighter')).id('TextTimer')
      TextTimer().format('mm:ss').fontWeight(undefined).id('TextTimer1')
      TextTimer().format('mm:ss').fontWeight(null).id('TextTimer2')
      TextTimer().format('mm:ss').fontWeight(FontWeight.Lighter).id('TextTimer3')
      TextTimer().format('mm:ss').id('TextTimer_base')
    }
  }
}