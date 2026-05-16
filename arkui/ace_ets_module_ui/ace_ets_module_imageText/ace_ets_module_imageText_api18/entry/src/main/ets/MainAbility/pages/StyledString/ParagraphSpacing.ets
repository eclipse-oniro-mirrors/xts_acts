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
import { LengthMetrics, LengthUnit } from '@ohos.arkui.node';

@Entry
@Component
struct ParagraphSpacingTest {
  titleParagraphStyleAttr: ParagraphStyle = new ParagraphStyle({ textAlign: TextAlign.Center,
    paragraphSpacing: LengthMetrics.vp(10)});
  // 第一段落首行缩进15vp
  paragraphStyleAttr1: ParagraphStyle = new ParagraphStyle({ textIndent: LengthMetrics.vp(15),
    paragraphSpacing: new LengthMetrics(20, LengthUnit.VP)} as ParagraphStyleInterface );
  // 第二段落缩进15vp且首行有placeholder占位显示
  paragraphStyleAttr2: ParagraphStyle = new ParagraphStyle({ textAlign: TextAlign.Start,
    paragraphSpacing: LengthMetrics.vp(-10) });
  // 第三段落不设置缩进配置最大行数及超长显示方式
  paragraphStyleAttr3: ParagraphStyle = new ParagraphStyle({ textAlign: TextAlign.Start, paragraphSpacing: undefined });
  // 行高样式对象
  lineHeightStyle1: LineHeightStyle= new LineHeightStyle(new LengthMetrics(24));
  // 创建含段落样式的对象paragraphStyledString1
  paragraphStyledString1: StyledString = new StyledString('段落标题\n正文第一段落开始0123456789正文第一段落结束\n' +
    '正文第二段落开始hello world正文第二段落结束\n正文第三段落ABCDEFGHIJKLMNOPQRSTUVWXYZ。\n', [
    {
      start: 0,
      length: 4,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue: this.titleParagraphStyleAttr
    },
    {
      start: 5,
      length: 3,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue: this.paragraphStyleAttr1
    },
    {
      start: 5,
      length: 20,
      styledKey: StyledStringKey.LINE_HEIGHT,
      styledValue: this.lineHeightStyle1
    },
    {
      start: 32,
      length: 5,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue: this.paragraphStyleAttr2
    },
    {
      start: 32,
      length: 20,
      styledKey: StyledStringKey.LINE_HEIGHT,
      styledValue: this.lineHeightStyle1
    },
    {
      start: 60,
      length: 5,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue: this.paragraphStyleAttr3
    },
    {
      start: 60,
      length: 5,
      styledKey: StyledStringKey.LINE_HEIGHT,
      styledValue: this.lineHeightStyle1
    }
  ]);
  controller: TextController = new TextController();

  async onPageShow() {
    this.controller.setStyledString(this.paragraphStyledString1)
    let styles = this.paragraphStyledString1.getStyles(0, this.paragraphStyledString1.length)
    if (styles.length !== 0) {
      for (let i = 0; i < styles.length; i++) {
        console.info('paragraphStyledString1 style object start:' + styles[i].start)
        console.info('paragraphStyledString1 style object length:' + styles[i].length)
        console.info('paragraphStyledString1 style object key:' + styles[i].styledKey)
        if (styles[i].styledKey === 200) {
          let paraAttr = styles[i].styledValue as ParagraphStyle;
          console.info('paragraphStyledString1 paragraphSpacing:' + paraAttr.paragraphSpacing)
          if (styles[i].start == 0){
            AppStorage.setOrCreate('paragraphSpacing1', paraAttr.paragraphSpacing)
            console.info('paragraphStyledString666 paragraphSpacing1:' + paraAttr.paragraphSpacing)
          }else if (styles[i].start == 5){
            AppStorage.setOrCreate('paragraphSpacing2', paraAttr.paragraphSpacing)
            console.info('paragraphStyledString666 paragraphSpacing2:' + paraAttr.paragraphSpacing)
          }else if (styles[i].start == 32){
            AppStorage.setOrCreate('paragraphSpacing3', paraAttr.paragraphSpacing)
            console.info('paragraphStyledString666 paragraphSpacing3:' + paraAttr.paragraphSpacing)
          }else if (styles[i].start == 60){
            AppStorage.setOrCreate('paragraphSpacing4', paraAttr.paragraphSpacing)
            console.info('paragraphStyledString666 paragraphSpacing4:' + paraAttr.paragraphSpacing)
          }
        }
      }
    }
  }

  build() {
    Row() {
      Column( { space : 5 }) {
        Text(undefined, { controller: this.controller })
          .width('90%')
          .height('80%')
          .borderWidth(1)
          .copyOption(CopyOptions.InApp)
          .draggable(true)
      }
      .width('100%')
    }
    .height('100%')
  }
}