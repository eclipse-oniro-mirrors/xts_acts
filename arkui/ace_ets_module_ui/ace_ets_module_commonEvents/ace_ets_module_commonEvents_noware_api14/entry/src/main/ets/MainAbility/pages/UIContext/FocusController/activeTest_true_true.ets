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
@Entry
@Component
struct activeTest_true_true {
  aboutToAppear() {
    this.getUIContext().getFocusController().activate(true, true)
  }

  build() {
    Column() {
      Button('Button1')
      .id('Button1')
        .width(200)
        .height(70)
        .defaultFocus(true)

      Button('Button2')
        .width(200)
        .height(70)
        .id('Button2')
    }
    .padding(10)
    .width('100%')
  }
}