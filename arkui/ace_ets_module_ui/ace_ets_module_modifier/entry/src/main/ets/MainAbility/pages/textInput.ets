/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { TextInputModifier } from "@ohos.arkui.modifier";

class CustomModifier extends TextInputModifier {
  applyNormalAttribute(instance: TextInputAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.fontSize(15)
  }
}

@Entry
@Component
struct TextTimerExample {

  @State customModifier1: TextInputModifier = new CustomModifier()
    .caretPosition(20)

  @State customModifier: TextInputModifier = new CustomModifier()
    .maxLines(3)
    .showUnderline(true)
    .showError('Error')
    .passwordIcon({ onIconSrc: 'begin', offIconSrc: 'end' })
    .style(TextInputStyle.Inline)
    .selectionMenuHidden(true)
    .barState(BarState.Auto)
    .enableKeyboardOnFocus(true)
    .caretStyle({width:12})
    .selectedBackgroundColor(Color.Blue)
    .caretColor('#007DFF')
    .placeholderFont({ size: 14, weight: 400 })
    .placeholderColor('#80808080')
    .type(InputType.Password)
    .enterKeyType(EnterKeyType.Done)
    .maxLength(9)
    .fontSize(14)
    .fontStyle(FontStyle.Normal)
    .fontWeight(FontWeight.Bold)
    .fontFamily('fontFamily')
    .copyOption(CopyOptions.None)
    .showPasswordIcon(true)
    .textAlign(TextAlign.Center)
    .fontColor("#FF123456")

  build() {
    Column({ space: 5 }) {
    Button("change value").onClick(() => {
      (this.customModifier as CustomModifier).onChange1();
    }).key("changeButton")
    Column() {
      Button('Log Json Data')
        .onClick(() => {
          console.log(getInspectorByKey('textInputKey1'))
        })
      TextInput({ placeholder: 'input your password...' })
        .key('textInputKey1')
        .attributeModifier(this.customModifier as CustomModifier)

        TextInput({ placeholder: 'input your password...' })
        .key('textInputKey2')
        .attributeModifier(this.customModifier1 as CustomModifier)
    }
    }
    .margin({ top: 5 })
  }
}
