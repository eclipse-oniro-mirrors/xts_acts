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
struct AboutToAppearTest {
  controller1 : TextController = new TextController
  mutableStyledString1: MutableStyledString = new MutableStyledString('运动45分钟');

  async aboutToAppear() {
    console.info('aboutToAppear initial succ')
    this.controller1.setStyledString(this.mutableStyledString1)
  }


  build() {
    Column() {
      Text(undefined, { controller: this.controller1 }).height('10%').id('AboutToAppearText')
    }.width('100%')
  }
}