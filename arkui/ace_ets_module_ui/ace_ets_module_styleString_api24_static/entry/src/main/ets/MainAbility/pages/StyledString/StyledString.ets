/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Text,
  FlexAlign,
  TextController,
  LeadingMarginSpan,
  LeadingMarginSpanDrawInfo,
  ParagraphStyle,
  TextStyle,
  SuperscriptStyle,
  TextVerticalAlign,
  MutableStyledString,
  StyledStringKey,
  ImageAttachment,
  ResourceImageAttachmentOptions,
  GestureStyle,
  ClickEvent,
  $r
} from '@ohos.arkui.component';
import { DrawContext, LengthMetrics } from '@ohos.arkui.node';

const STYLED_TEXT_KEY = 'StyledString_text_bind';

class DemoLeadingMarginSpan extends LeadingMarginSpan {
  onDraw(_ctx: DrawContext, _info: LeadingMarginSpanDrawInfo): void {
  }

  getLeadingMargin(): LengthMetrics {
    return LengthMetrics.vp(4);
  }
}

@Entry
@Component
struct StyledStringPage {
  private ctl: TextController = new TextController();

  aboutToAppear(): void {
    const span = new DemoLeadingMarginSpan();
    const m = new MutableStyledString('Z');
    m.setStyle({
      start: 0,
      length: 1,
      styledKey: StyledStringKey.PARAGRAPH_STYLE,
      styledValue: new ParagraphStyle({ textVerticalAlign: TextVerticalAlign.TOP, leadingMarginSpan: span })
    });
    m.setStyle({
      start: 0,
      length: 1,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({
        superscript: SuperscriptStyle.NORMAL,
        strokeWidth: LengthMetrics.vp(1),
        strokeColor: '#111111'
      })
    });
    m.setStyle({
      start: 0,
      length: 1,
      styledKey: StyledStringKey.GESTURE,
      styledValue: new GestureStyle({
        onClick: (_ev: ClickEvent) => {
        }
      })
    });
    const rio: ResourceImageAttachmentOptions = {
      resourceValue: $r('sys.media.ohos_ic_public_voice'),
      supportSvg2: true
    };
    m.appendStyledString(new MutableStyledString(new ImageAttachment(rio)));
    this.ctl.setStyledString(m);
  }

  build() {
    Column({ space: 4 } as ColumnOptions) {
      Text('模块 styledString.d.ets：MutableStyledString + TextController.setStyledString，测试用 inspector')
        .fontSize(12)
        .width('100%')
      Text('', { controller: this.ctl })
        .key(STYLED_TEXT_KEY)
        .width('100%')
        .fontSize(14)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}
