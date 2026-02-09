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

class RichEditorModifier implements AttributeModifier<RichEditorAttribute> {

  applyNormalAttribute(RichEditorInstance: RichEditorAttribute): void {
    RichEditorInstance.width(200);
  }
}

@Entry
@Component
struct RichEditorModifier1 {
  @State value: string = 'init';
  @State modifier: RichEditorModifier = new RichEditorModifier();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  aboutToAppear(): void {
    this.value = typeof RichEditorInstance;
  }

  build() {
    Column({ space: 5 }) {
      RichEditor(this.options)
        .attributeModifier(this.modifier)
        .id('RichEditorModifier_get_width')
        .height('20%')
        .onReady(()=>{
          this.controller.addTextSpan('RichEditorModifier',
            {
              style:
              {
                fontColor: Color.Green,
                fontSize: 20
              }
            })
        })

      TextArea({ text: this.value })
        .id('RichEditorModifier_get_type')
        .height('10%')
    }
  }
}