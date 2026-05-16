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

@Entry
@Component
struct TextfieldMulti {


  controller: TextInputController = new TextInputController()

  build() {
    Column() {
      Button("Password")

      TextInput({ placeholder: 'input ...', controller: this.controller })
        .key("ArkUX_Text_Visual_0110")
        .width(380)
        .height(60)
        .cancelButton({
          style: CancelButtonStyle.CONSTANT,
          icon: {
            size: 45,
            src: $r('app.media.icon'),
            color: Color.Blue
          }
        })

      TextInput({ placeholder: 'input ...', controller: this.controller })
        .key("ArkUX_Text_Visual_0120")
        .width(380)
        .height(60)
        .cancelButton({
          style: CancelButtonStyle.INVISIBLE,
          icon: {
            size: 60,
            src: $r('app.media.icon'),
            color: Color.Green
          }
        })

      TextInput({ placeholder: 'input ...', controller: this.controller })
        .key("ArkUX_Text_Visual_0130")
        .width(380)
        .height(60)
        .cancelButton({
          style: CancelButtonStyle.INPUT,
          icon: {
            size: 70,
            src: $r('app.media.icon'),
            color: Color.White
          }
        })

      TextInput({ placeholder: 'input ...', controller: this.controller })
        .key("ArkUX_Text_Visual_0140")
        .width(380)
        .height(60)
        .cancelButton({})
    }
  }
}