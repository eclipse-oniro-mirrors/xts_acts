/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct isActive {
  @State setFocus: string = ""
  @State notSetFocus: string = ""
  build() {
    Column({space:'10%'}) {
      Button(this.setFocus)
        .id("setFocus")
        .width("100%")
        .height("20%")
        .defaultFocus(true)
        .onClick(() => {
          this.getUIContext().getFocusController().activate(true, true);
          let result = this.getUIContext().getFocusController().isActive()
          AppStorage.setOrCreate('isActiveTestTrueResult', result);
        })
      Button(this.notSetFocus)
        .id("notSetFocus")
        .width("100%")
        .height("20%")
        .defaultFocus(true)
        .onClick(() => {
          this.getUIContext().getFocusController().activate(false, true);
          let result1 = this.getUIContext().getFocusController().isActive()
          AppStorage.setOrCreate('isActiveTestFalseResult', result1);
        })
    }
    .width("100%")
    .height("100%")
  }
}