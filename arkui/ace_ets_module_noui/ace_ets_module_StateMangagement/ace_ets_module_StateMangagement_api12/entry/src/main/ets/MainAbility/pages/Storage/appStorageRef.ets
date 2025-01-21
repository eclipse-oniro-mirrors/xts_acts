/*
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

AppStorage.setAndRef("PropAAk", 52)
AppStorage.setAndRef("PropAkk", 37)
@Entry
@Component
struct appStorageRef {
  private content: string = "AppStorage";
  @State refA1Value: AbstractProperty<number> = AppStorage.ref("PropAAk")
  @State refA2Value: AbstractProperty<number> = AppStorage.get("PropAkk")

  build() {
    Column() {
      Text(`${this.content}`)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)

      Button(`ref:${AppStorage.get("PropAAk")}`)
        .id('app_ref_1')
        .margin(15)
        .fontWeight(FontWeight.Bold)
        .fontSize(20)

      Button(`setAndRef:${this.refA2Value}`)
        .id('app_ref_2')
        .margin(15)
        .fontWeight(FontWeight.Bold)
        .fontSize(20)
    }
    .width('100%')
    .height('100%')
  }
}