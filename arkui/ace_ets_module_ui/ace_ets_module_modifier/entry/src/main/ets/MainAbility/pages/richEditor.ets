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

 import { RichEditorModifier } from "@ohos.arkui.modifier";

 class CustomModifier extends RichEditorModifier {
  applyNormalAttribute(instance: RichEditorAttribute): void {
    super.applyNormalAttribute?.(instance);
  }
  onChangeRichEditor() {
    this.copyOptions(CopyOptions.None)
  }
}


@Entry
@Component
struct RichEditorPage {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State phoneNumber: string = '(86) (755) ********';
  @State url: string = 'www.********.com';
  @State email: string = '***@example.com';
  @State address: string = 'XX省XX市XX区XXXX';
  @State enableDataDetector: boolean = true;
  @State types: TextDataDetectorType[] = [];
  @State customModifier: RichEditorAttribute = new CustomModifier()
    .copyOptions(CopyOptions.InApp)

  build() {
    Row(){
      Button("change value").onClick(() => {
        (this.customModifier as CustomModifier).onChangeRichEditor();
      }).key("changeButton")

    RichEditor(this.options)
      .onReady(() => {
        this.controller.addTextSpan('电话号码：' + this.phoneNumber + '\n',
          {
            style:
            {
              fontSize: 30
            }
          })
        this.controller.addTextSpan('链接：' + this.url + '\n',
          {
            style:
            {
              fontSize: 30
            }
          })
        this.controller.addTextSpan('邮箱：' + this.email + '\n',
          {
            style:
            {
              fontSize: 30
            }
          })
        this.controller.addTextSpan('地址：' + this.address,
          {
            style:
            {
              fontSize: 30
            }
          })
      })
      .attributeModifier(this.customModifier as CustomModifier)
      .key('richEditor')
      .enableDataDetector(this.enableDataDetector)
      .dataDetectorConfig({types : this.types, onDetectResultUpdate: (result: string)=>{}})
      .borderWidth(1)
      .padding(10)
      .width('100%')
      .height("100%")

    }
    
  }
}