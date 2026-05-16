/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct LayoutGravityNullUndefinedTest {
  @State layoutGravityValue: LocalizedAlignment | null | undefined = LocalizedAlignment.TOP_START;

  build() {
    Column() {
      Row() {
        Button('TOP')
          .onClick(() => {
            this.layoutGravityValue = LocalizedAlignment.TOP;
          })
          .width('30%')
          .id('LayoutGravityNullUndefinedTest_btn_valid')

        Button('null')
          .onClick(() => {
            this.layoutGravityValue = null;
          })
          .width('30%')
          .id('LayoutGravityNullUndefinedTest_btn_null')

        Button('undefined')
          .onClick(() => {
            this.layoutGravityValue = undefined;
          })
          .width('30%')
          .id('LayoutGravityNullUndefinedTest_btn_undefined')
      }

      Stack({
        alignContent: Alignment.TopStart
      }) {
        Text('Child Text')
          .width(150)
          .height(150)
          .backgroundColor(Color.Yellow)
          .fontSize(15)
          .layoutGravity(this.layoutGravityValue)
          .id('LayoutGravityNullUndefinedTest_text')
      }
      .width('100%')
      .height(200)
      .backgroundColor(Color.Grey)
    }
    .height('100%')
  }
}