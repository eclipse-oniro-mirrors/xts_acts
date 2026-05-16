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

class ButtonModifier1 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.type(ButtonType.Circle)
      .stateEffect(true)
      .fontColor(0xCCCCCC)
      .fontSize(12)
      .fontWeight(FontWeight.Normal)
      .fontFamily('cursive')
      .fontStyle(FontStyle.Normal)
      //.labelStyle({overflow: TextOverflow.Clip})
  }
}

class ButtonModifier2 implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.labelStyle({overflow: TextOverflow.Clip})
  }
}

@Entry
@Component
struct ButtonExample {
  @State buttonModifier: ButtonModifier1 = new ButtonModifier1();
  @State buttonModifier2: ButtonModifier2 = new ButtonModifier2();
  @State buttonTypeValue: ButtonType = ButtonType.Normal;
  @State fontSizeValue: string = '20px';
  @State fontColorValue: Color = Color.Black;
  @State text: string = '';
  @State onClickValue: boolean = false;

  onPageShow() {
    console.info('Button page show called');
  }

  build() {
    Column() {
      Button('Ok', { type: this.buttonTypeValue, stateEffect: true })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .key('button')
        .attributeModifier(this.buttonModifier)

      Button('Ok2', { type: this.buttonTypeValue, stateEffect: true })
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(90)
        .key('button2')
        .attributeModifier(this.buttonModifier2)
    }

  }
}