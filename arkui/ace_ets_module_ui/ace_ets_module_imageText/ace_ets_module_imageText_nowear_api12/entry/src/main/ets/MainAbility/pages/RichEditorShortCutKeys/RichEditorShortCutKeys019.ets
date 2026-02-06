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
struct RichEditorShortCutKeys019 {
  @State content: string = '';
  @State stylesInfo: string = '';

  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  textStyle: TextStyle = new TextStyle({
    fontWeight: FontWeight.Bolder,
    fontFamily: Utils.FONT_FAMILY,
    fontColor: Color.Green,
    fontSize: LengthMetrics.vp(30),
    fontStyle: FontStyle.Italic
  })

  mutableStyledString: MutableStyledString = new MutableStyledString('abc',
    [{ start: 0, length: 4, styledKey: StyledStringKey.FONT, styledValue: this.textStyle },
      { start: 0, length: 4, styledKey: StyledStringKey.DECORATION,
        styledValue: new DecorationStyle({ type: TextDecorationType.Underline, color: Color.Blue })}]);

  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller};


  build() {
    Column() {

      Button('get content').onClick(() => {
        this.richEditorStyledString = this.controller.getStyledString();
        this.content = this.richEditorStyledString.subStyledString(0, 6).getString();
        console.log('RichEditorController this.content:' + this.content);

      }).id('getContent')
      Button('getStyles')
        .onClick(() => {
          let richEditorStyledString = this.controller.getStyledString();
          let styles = richEditorStyledString.getStyles(0, richEditorStyledString.length)
          if (styles.length !== 0) {
            for (let i = 0; i < styles.length; i++) {
              console.info('mutableStyledString1 style object start:' + styles[i].start)
              console.info('mutableStyledString1 style object length:' + styles[i].length)
              console.info('mutableStyledString1 style object key:' + styles[i].styledKey)
              this.stylesInfo += 'start:' + styles[i].start + ',';
              this.stylesInfo += 'length:' + styles[i].length + ',';
              this.stylesInfo += 'styledKey:' + styles[i].styledKey + ',';
              if (styles[i].styledKey === 0) {
                let fontAttr = styles[i].styledValue as TextStyle;
                this.stylesInfo += 'fontWeight:' + fontAttr.fontWeight + ',';
                this.stylesInfo += 'fontStyle:' + fontAttr.fontStyle + ',';
              }
              if (styles[i].styledKey === 1) {
                let decoAttr = styles[i].styledValue as DecorationStyle;
                this.stylesInfo += 'decoration type:' + decoAttr.type + ',';
                this.stylesInfo += 'decoration color:' + decoAttr.color;
              }
            }
          }
        })
        .id('getStyles')

      Text('content:' + this.content).id('content')
      Text('stylesInfo:' + this.stylesInfo).id('stylesInfo')


      RichEditor(this.options)
        .onReady(() => {
          this.controller.setStyledString(this.mutableStyledString);
        })
        .height('20%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black).id('RichEditorShortCutKeys019')

    }
  }
}