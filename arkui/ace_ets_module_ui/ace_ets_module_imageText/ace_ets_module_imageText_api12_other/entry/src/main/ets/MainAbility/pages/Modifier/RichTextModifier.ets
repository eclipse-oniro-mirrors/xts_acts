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

class RichTextModifier implements AttributeModifier<RichTextAttribute> {

  applyNormalAttribute(RichTextInstance: RichTextAttribute): void {
    RichTextInstance.width(200);
  }
}

@Entry
@Component
struct RichTextModifier1 {
  @State value: string = 'init';
  @State modifier: RichTextModifier = new RichTextModifier();
  @State data: string = '<h1 style="text-align: center;">h1标题</h1>' +
    '<h1 style="text-align: center;"><i>h1斜体</i></h1>' +
    '<h1 style="text-align: center;"><u>h1下划线</u></h1>' +
    '<h2 style="text-align: center;">h2标题</h2>' +
    '<h3 style="text-align: center;">h3标题</h3>' +
    '<p style="text-align: center;">p常规</p><hr/>' +
    '<div style="width: 500px;height: 500px;border: 1px solid;margin: 0 auto;">' +
    '<p style="font-size: 35px;text-align: center;">字体大小35px,行高45px</p>' +
    '<p style="background-color: #e5e5e5;line-height: 45px;font-size: 35px;text-indent: 2em;">' +
    '<p>这是一段文字这是一段文字这是一段文字这是一段文字这是一段文字</p>';

  aboutToAppear(): void {
    this.value = typeof RichTextInstance;
  }

  build() {
    Column({ space: 5 }) {
      RichText(this.data)
        .attributeModifier(this.modifier)
        .id('RichTextModifier_get_width')
        .height('20%')

      TextArea({ text: this.value })
        .id('RichTextModifier_get_type')
        .height('10%')
    }
  }
}