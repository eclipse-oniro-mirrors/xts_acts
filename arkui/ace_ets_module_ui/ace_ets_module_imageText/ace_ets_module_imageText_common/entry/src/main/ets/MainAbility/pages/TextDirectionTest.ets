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

import { LengthMetrics } from '@kit.ArkUI';

/**
 * 实现LeadingMarginSpan
 */
class MyLeadingMarginSpan1 extends LeadingMarginSpan {
  private text: string = ''
  constructor(text: string) {
    super()
    this.text = text
  }
  // 返回缩进距离
  getLeadingMargin(): LengthMetrics {
    return LengthMetrics.vp(20)
  }
  // 回调给开发者行信息，用于canvas绘制
  onDraw(context: DrawContext, options: LeadingMarginSpanDrawInfo) {
    AppStorage.setOrCreate('TextDirection',options.direction)
    console.info('direction = ' +options.direction)
  }
}

class MyLeadingMarginSpan2 extends LeadingMarginSpan {
  private text: string = ''
  constructor(text: string) {
    super()
    this.text = text
  }
  // 返回缩进距离
  getLeadingMargin(): LengthMetrics {
    return LengthMetrics.vp(20)
  }
  // 回调给开发者行信息，用于canvas绘制
  onDraw(context: DrawContext, options: LeadingMarginSpanDrawInfo) {
    AppStorage.setOrCreate('TextDirection',options.direction)
    console.info('direction = ' +options.direction)
  }
}

@Entry
@Component
struct TextDirectionTest {
  textController: TextController = new TextController();
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };
  leadingMarginSpan1: LeadingMarginSpan = new MyLeadingMarginSpan1('');
  leadingMarginSpan2: LeadingMarginSpan = new MyLeadingMarginSpan2('');
  paragraphStyleAttr1: ParagraphStyle =
    new ParagraphStyle({ leadingMarginSpan: this.leadingMarginSpan1 });
  paragraphStyleAttr2: ParagraphStyle =
    new ParagraphStyle({ leadingMarginSpan: this.leadingMarginSpan2 });
  StyledString1: StyledString = new StyledString('段落内容首行从左至右',
    [
      {
        start: 0,
        length: 1,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: this.paragraphStyleAttr1
      }
    ]
  );

  StyledString2: StyledString = new StyledString('段落内容首行从右至左',
    [
      {
        start: 0,
        length: 1,
        styledKey: StyledStringKey.PARAGRAPH_STYLE,
        styledValue: this.paragraphStyleAttr2
      }
    ]
  );

  build() {
    Column() {
      Column() {
        Row(){
          // 设置属性字符串,触发回调
          Button('setStyledString1')
            .onClick(() => {
              this.textController.setStyledString(this.StyledString1);
            }).width('50%').id('getTextDirectionTest1')
          Button('setStyledString2')
            .onClick(() => {
              this.controller.setStyledString(this.StyledString2);
            }).width('50%').id('getTextDirectionTest2')
        }.height('5%')
      }
      Text(undefined, { controller: this.textController })
        .width('90%')
        .height('20%')
        .borderWidth(1)
        .clip(true)
      RichEditor(this.options)
        .width('90%')
        .height('20%')
        .margin({ top: 2})
        .borderWidth(1)
        .direction(Direction.Rtl)
        .clip(true)
    }
    .width('100%')
  }
}