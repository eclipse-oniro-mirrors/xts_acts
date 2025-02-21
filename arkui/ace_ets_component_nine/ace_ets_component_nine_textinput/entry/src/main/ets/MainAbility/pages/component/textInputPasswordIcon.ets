/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

class TextInputPasswordIconModifier implements AttributeModifier<TextInputAttribute> {
  
  applyNormalAttribute(instance: TextInputAttribute): void {
    instance.passwordIcon({ onIconSrc: "/test/assert/icon.png", offIconSrc: "/test/assert/icon.png" });
  }
}
@Entry
@Component
struct TextInputPasswordIcon {

  @State mod1: TextInputPasswordIconModifier = new TextInputPasswordIconModifier()

  private stateChangCallBack = (eventData) => {

  }

  onPageShow() {

  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.SpaceBetween }) {
      TextInput({ text: 'This is the TextInputPasswordIcon set. ' })
        .type(InputType.Password)
        .fontSize(12).border({ width: 1 }).padding(10)
        .attributeModifier(this.mod1)
        .key('key_textinput_passwordIcon')

    }.height(600).width(350).padding({ left: 35, right: 35, top: 35 })
  }
}