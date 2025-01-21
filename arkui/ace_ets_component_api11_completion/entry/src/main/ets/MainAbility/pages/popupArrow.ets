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
struct PopupArrowExample {
  @State customPopup: boolean = false;

  build() {
    Column() {
      Button("customPopup").key('popup_arrow')
        .margin(10)
        .onClick(() => {
          this.customPopup = !this.customPopup
        })
        .bindPopup(this.customPopup, {
          message: "this is a popup",
          popupColor: Color.Pink,
          arrowWidth: 20,
          arrowHeight: 20,
          radius: 20,
          shadow: ShadowStyle.OUTER_DEFAULT_XS,
          backgroundBlurStyle: BlurStyle.Thin
        })
    }
    .width('100%')
  }
}