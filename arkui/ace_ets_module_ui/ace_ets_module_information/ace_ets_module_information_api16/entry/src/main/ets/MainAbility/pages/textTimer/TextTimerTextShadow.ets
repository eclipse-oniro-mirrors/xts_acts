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
struct TextTimerExample {
  @State textShadows1: ShadowOptions | Array<ShadowOptions> = { radius: 10, color: Color.Red, offsetX: 10, offsetY: 0 }
  @State textShadows2: ShadowOptions | Array<ShadowOptions> = { radius: -10, color: '#ff000000', offsetX: -10, offsetY: 0 }
  @State textShadows3: ShadowOptions | Array<ShadowOptions> = { radius: 50, color: $r('app.color.pink'), offsetX: 0, offsetY: 10 }

  build() {
    Column({ space: 8 }) {
      TextTimer().fontSize(20).textShadow(this.textShadows1).id('textTimer1')
      TextTimer().fontSize(20).textShadow(this.textShadows2).id('textTimer2')
      TextTimer().fontSize(20).textShadow(this.textShadows3).id('textTimer3')
    }
  }
}