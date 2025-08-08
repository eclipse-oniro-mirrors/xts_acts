/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { LengthMetrics } from '@kit.ArkUI'
import Utils from '../../common/Utils'

@Entry
@Component
struct RichEditorThreeStrikes006 {
  @State message: string = '';

  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  textStyle: TextStyle = new TextStyle({
    fontWeight: FontWeight.Lighter,
    fontFamily: Utils.FONT_FAMILY,
    fontColor: Color.Green,
    fontSize: LengthMetrics.vp(50),
    fontStyle: FontStyle.Normal
  })
  fontStyle1: TextStyle = new TextStyle({ fontColor: Color.Blue });
  // 创建属性字符串对象
  mutableStyledString: MutableStyledString = new MutableStyledString('123456',
    [{ start: 0, length: 6, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle1 }]);

  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller};


  build() {
    Column() {

      Text('message:' + this.message).id('message')

      RichEditor(this.options)
        .onReady(() => {
          this.controller.setStyledString(this.mutableStyledString);
        })
        .onSelectionChange((value: RichEditorRange) => {
          console.log('RichEditorController value:' + JSON.stringify(value));
          this.message = JSON.stringify(value);
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black).id('RichEditorThreeStrikes006')
    }
  }
}