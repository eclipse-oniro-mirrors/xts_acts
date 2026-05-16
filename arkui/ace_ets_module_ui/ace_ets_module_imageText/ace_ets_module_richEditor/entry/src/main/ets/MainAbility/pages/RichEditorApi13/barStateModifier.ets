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

class RichEditorModifier1 implements AttributeModifier<RichEditorAttribute> {

  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`RichEditor page Test Type BarState.Auto`)
    instance.barState(BarState.Auto);
  }
}

class RichEditorModifier2 implements AttributeModifier<RichEditorAttribute> {

  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`RichEditor page Test Type BarState.Off`)
    instance.barState(BarState.Off);
  }
}

class RichEditorModifier3 implements AttributeModifier<RichEditorAttribute> {

  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`RichEditor page Test Type BarState.On`)
    instance.barState(BarState.On);
  }
}

class RichEditorModifier4 implements AttributeModifier<RichEditorAttribute> {

  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`RichEditor page Test Type BarState default`)
    instance.borderWidth(1);
  }
}

class RichEditorModifier5 implements AttributeModifier<RichEditorAttribute> {

  applyNormalAttribute(instance: RichEditorAttribute): void {
    console.info(`RichEditor page Test Type BarState undefined`)
    instance.barState(undefined);
  }
}


@Entry
@Component
struct RichEditorBarStateModifier {
  controller1: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();
  controller3: RichEditorController = new RichEditorController();
  controller4: RichEditorController = new RichEditorController();
  controller5: RichEditorController = new RichEditorController();
  options1: RichEditorOptions = { controller: this.controller1 };
  options2: RichEditorOptions = { controller: this.controller2 };
  options3: RichEditorOptions = { controller: this.controller3 };
  options4: RichEditorOptions = { controller: this.controller4 };
  options5: RichEditorOptions = { controller: this.controller5 };

  build() {
    Column() {
      RichEditor(this.options1)
        .attributeModifier(new RichEditorModifier1())
        .id('RichEditorModifier_BarState_Auto')
        .height('5%').borderWidth(1)
        .onReady(() => {
          this.controller1.addTextSpan('BarState.Auto')
        })

      RichEditor(this.options2)
        .attributeModifier(new RichEditorModifier2())
        .id('RichEditorModifier_BarState_Off')
        .height('5%').borderWidth(1)
        .onReady(() => {
          this.controller2.addTextSpan('BarState.Off')
        })

      RichEditor(this.options3)
        .attributeModifier(new RichEditorModifier3())
        .id('RichEditorModifier_BarState_On')
        .height('5%').borderWidth(1)
        .onReady(() => {
          this.controller3.addTextSpan('BarState.On')
        })

      RichEditor(this.options4)
        .attributeModifier(new RichEditorModifier4())
        .id('RichEditorModifier_barState_default')
        .height('5%')
        .onReady(() => {
          this.controller4.addTextSpan('default')
        })

      RichEditor(this.options5)
        .attributeModifier(new RichEditorModifier5())
        .id('RichEditorModifier_barState_undefined')
        .height('5%').borderWidth(1)
        .onReady(() => {
          this.controller5.addTextSpan('undefined')
        })
    }.justifyContent(FlexAlign.Center)
  }
}