/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct TextContentControllerBaseMethodsTest {
  controller1: TextInputController = new TextInputController();
  controller2: TextInputController = new TextInputController();
  controller3: TextInputController = new TextInputController();
  controller4: TextInputController = new TextInputController();
  controller5: TextInputController = new TextInputController();
  controller6: TextInputController = new TextInputController();
  controller7: TextInputController = new TextInputController();

  build() {
    Column() {
      Scroll() {
        Column() {
          Text('TextContentControllerBase Methods Test')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 10, bottom: 5 })
          // ========== addText tests ==========
          TextInput({ placeholder: 'Test addText valid', controller: this.controller1 })
            .width('100%')
            .height(50)
            .id('TextInput_addText_null')
          TextInput({ placeholder: 'Test addText valid', controller: this.controller2 })
            .width('100%')
            .height(50)
            .id('TextInput_addText_undefined')
          TextInput({ placeholder: 'Test addText valid', controller: this.controller3 })
            .width('100%')
            .height(50)
            .id('TextInput_addText_empty')
          Button('addText').onClick(()=>{
            this.controller1.addText(null,null)
            this.controller2.addText(undefined,undefined)
            this.controller1.addText('')
          })
            .id('TextContentControllerBase_addText')

          // ========== setStyledPlaceholder tests ==========
          TextInput({ placeholder: 'Test setStyledPlaceholder valid', controller: this.controller4  })
            .width('100%')
            .height(50)
            .id('TextInput_setStyledPlaceholder_null')
          TextInput({ placeholder: 'Test setStyledPlaceholder valid', controller: this.controller5  })
            .width('100%')
            .height(50)
            .id('TextInput_setStyledPlaceholder_undefined')
          Button('setStyledPlaceholder').onClick(()=>{
            this.controller4.setStyledPlaceholder(null)
            this.controller5.setStyledPlaceholder(undefined)
          })
            .id('TextContentControllerBase_setStyledPlaceholder')

          // ========== scrollToVisible tests ==========
          TextInput({ placeholder: 'Test scrollToVisible valid', controller: this.controller6 })
            .width('100%')
            .height(50)
            .id('TextInput_scrollToVisible_null')
          TextInput({ placeholder: 'Test scrollToVisible valid', controller: this.controller7 })
            .width('100%')
            .height(50)
            .id('TextInput_scrollToVisible_undefined')
          Button('setStyledPlaceholder').onClick(()=>{
            this.controller6.scrollToVisible(null)
            this.controller7.scrollToVisible(undefined)
          })
            .id('TextContentControllerBase_setStyledPlaceholder')
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}
