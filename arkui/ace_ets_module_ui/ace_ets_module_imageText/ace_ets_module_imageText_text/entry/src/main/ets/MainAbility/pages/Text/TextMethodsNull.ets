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
struct TextMethodsNull {
  controller1: TextController = new TextController();
  controller2: TextController = new TextController();
  controller3: TextController = new TextController();
  controller4: TextController = new TextController();
  controller5: TextController = new TextController();
  controller6: TextController = new TextController();
  controller7: TextController = new TextController();
  controller8: TextController = new TextController();
  controller9: TextController = new TextController();
  controller10: TextController = new TextController();
  controller11: TextController = new TextController();
  controller12: TextController = new TextController();
  controller13: TextController = new TextController();
  controller14: TextController = new TextController();
  controller15: TextController = new TextController();
  controller16: TextController = new TextController();

  @Builder
  CustomMenuBuilder() {
    Column() {
      Text('Menu Item')
        .fontSize(20)
    }
  }

  build() {
    Column({ space: 10 }) {
      // onMarqueeStateChange null test
      Text('Marquee text')
        .id('text_onMarqueeStateChange_null')
        .onMarqueeStateChange(null)
        .height('5%')

      // onMarqueeStateChange undefined test
      Text('Marquee text')
        .id('text_onMarqueeStateChange_undefined')
        .onMarqueeStateChange(undefined)
        .height('5%')

      // bindSelectionMenu spanType null test
      Text('Selection menu text')
        .id('text_bindSelectionMenu_spanType_null')
        .bindSelectionMenu(null, this.CustomMenuBuilder, TextResponseType.LONG_PRESS)
        .height('5%')

      // bindSelectionMenu spanType undefined test
      Text('Selection menu text')
        .id('text_bindSelectionMenu_spanType_undefined')
        .bindSelectionMenu(undefined, this.CustomMenuBuilder, TextResponseType.LONG_PRESS)
        .height('5%')

      // bindSelectionMenu content null test
      Text('Selection menu text')
        .id('text_bindSelectionMenu_content_null')
        .bindSelectionMenu(TextSpanType.TEXT, null, TextResponseType.LONG_PRESS)
        .height('5%')

      // bindSelectionMenu content undefined test
      Text('Selection menu text')
        .id('text_bindSelectionMenu_content_undefined')
        .bindSelectionMenu(TextSpanType.TEXT, undefined, TextResponseType.LONG_PRESS)
        .height('5%')

      // bindSelectionMenu responseType null test
      Text('Selection menu text')
        .id('text_bindSelectionMenu_responseType_null')
        .bindSelectionMenu(TextSpanType.TEXT, this.CustomMenuBuilder, null)
        .height('5%')

      // bindSelectionMenu responseType undefined test
      Text('Selection menu text')
        .id('text_bindSelectionMenu_responseType_undefined')
        .bindSelectionMenu(TextSpanType.TEXT, this.CustomMenuBuilder, undefined)
        .height('5%')

      // bindSelectionMenu options null test
      Text('Selection menu text')
        .id('text_bindSelectionMenu_options_null')
        .bindSelectionMenu(TextSpanType.TEXT, this.CustomMenuBuilder, TextResponseType.LONG_PRESS, null)
        .height('5%')

      // bindSelectionMenu options undefined test
      Text('Selection menu text')
        .id('text_bindSelectionMenu_options_undefined')
        .bindSelectionMenu(TextSpanType.TEXT, this.CustomMenuBuilder, TextResponseType.LONG_PRESS, undefined)
        .height('5%')

      // setTextSelection selectionStart null test
      Text('Selection text', { controller: this.controller1 })
        .id('text_setTextSelection_start_null')
        .height('5%')

      // setTextSelection selectionStart undefined test
      Text('Selection text', { controller: this.controller2 })
        .id('text_setTextSelection_start_undefined')
        .height('5%')

      // bindSelectionMenu all null test
      Text('Selection menu text')
        .id('text_bindSelectionMenu_all_null')
        .bindSelectionMenu(null, null, null)
        .height('5%')

      // bindSelectionMenu all undefined test
      Text('Selection menu text')
        .id('text_bindSelectionMenu_all_undefined')
        .bindSelectionMenu(undefined, undefined, undefined)
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .onAppear(() => {
      try {
        this.controller1.setTextSelection(null, null, null);
      } catch (e) {
        console.info('setStyledString null error: ' + JSON.stringify(e));
      }
      try {
        this.controller2.setTextSelection(undefined, undefined, undefined);
      } catch (e) {
        console.info('setStyledString undefined error: ' + JSON.stringify(e));
      }
    })
  }
}
