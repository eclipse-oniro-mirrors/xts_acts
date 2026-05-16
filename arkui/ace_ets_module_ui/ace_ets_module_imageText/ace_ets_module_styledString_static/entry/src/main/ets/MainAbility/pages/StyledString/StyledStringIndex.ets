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

'use static'

import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Button,
  Text,
  Scroll,
  TextAlign,
  TextOverflow,
  FontWeight,
  Color,
  WordBreak,
  TextDecorationType,
  StyledString,
  MutableStyledString,
  TextStyle,
  DecorationStyle,
  BaselineOffsetStyle,
  LetterSpacingStyle,
  LineHeightStyle,
  UrlStyle,
  ParagraphStyle,
  ParagraphStyleInterface,
  ImageAttachment,
  ResourceImageAttachmentOptions,
  TextDirection
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { LengthMetrics } from '@ohos.arkui.node';

@Entry
@Component
struct StyledStringIndex {
  // 展示用 StyledString
  private displayStr: StyledString = new StyledString('StyledString Demo 演示');

  // 每个操作按钮对应一个 @State label
  @State mStrLen: string = 'str_len_init'
  @State mStrGet: string = 'str_get_init'
  @State mStrEqTrue: string = 'str_eq_init'
  @State mStrEqFalse: string = 'str_eq2_init'
  @State mStrSub: string = 'str_sub_init'
  @State mMstrApp: string = 'mstr_app_init'
  @State mMstrIns: string = 'mstr_ins_init'
  @State mMstrRep: string = 'mstr_rep_init'
  @State mParaDirLtr: string = 'para_dir_ltr_init'
  @State mParaDirRtl: string = 'para_dir_rtl_init'
  @State mParaAlign: string = 'para_align_init'
  @State mParaMaxLines: string = 'para_maxlines_init'
  @State mParaOverflow: string = 'para_overflow_init'
  @State mParaWordBreak: string = 'para_wordbreak_init'
  @State mTstyleColor: string = 'tstyle_color_init'
  @State mTstyleWeight: string = 'tstyle_weight_init'
  @State mDecoUnder: string = 'deco_under_init'
  @State mDecoThrough: string = 'deco_through_init'
  @State mBaseline: string = 'baseline_init'
  @State mLetter: string = 'letter_init'
  @State mLineHeight: string = 'lineheight_init'
  @State mImgRv: string = 'img_rv_init'
  @State mUrl: string = 'url_init'

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('StyledStringIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column({ space: 8 } as ColumnOptions) {

        // 展示用 Text 组件，绑定真实 StyledString
        Text(this.displayStr.getString())
          .id('styledStringDisplay')
          .width('90%')
          .fontSize(16)

        // ====== StyledString 操作 ======
        Button(this.mStrLen)
          .id('btnStrLen')
          .onClick(() => {
            let str = new StyledString('Hello World');
            this.mStrLen = 'str_len:' + str.length;
          })

        Button(this.mStrGet)
          .id('btnStrGet')
          .onClick(() => {
            let str = new StyledString('Hello');
            this.mStrGet = 'str_get:' + str.getString();
          })

        Button(this.mStrEqTrue)
          .id('btnStrEqTrue')
          .onClick(() => {
            let str1 = new StyledString('Hello');
            let str2 = new StyledString('Hello');
            this.mStrEqTrue = 'str_eq:' + (str1.equals(str2) ? 'match' : 'nomatch');
          })

        Button(this.mStrEqFalse)
          .id('btnStrEqFalse')
          .onClick(() => {
            let str1 = new StyledString('Hello');
            let str2 = new StyledString('World');
            this.mStrEqFalse = 'str_eq2:' + (str1.equals(str2) ? 'match' : 'nomatch');
          })

        Button(this.mStrSub)
          .id('btnStrSub')
          .onClick(() => {
            let str = new StyledString('Hello World');
            let sub = str.subStyledString(0, 5);
            this.mStrSub = 'str_sub:' + (sub?.getString() ?? 'none');
          })

        // ====== MutableStyledString 操作 ======
        Button(this.mMstrApp)
          .id('btnMstrApp')
          .onClick(() => {
            let mstr = new MutableStyledString('Hello');
            mstr.appendStyledString(new StyledString('XYZ'));
            this.mMstrApp = 'mstr_app:' + mstr.getString();
          })

        Button(this.mMstrIns)
          .id('btnMstrIns')
          .onClick(() => {
            let mstr = new MutableStyledString('Hello');
            mstr.insertString(0, 'Hi');
            this.mMstrIns = 'mstr_ins:' + mstr.getString();
          })

        Button(this.mMstrRep)
          .id('btnMstrRep')
          .onClick(() => {
            let mstr = new MutableStyledString('Hello');
            mstr.replaceString(0, 5, 'Hi');
            this.mMstrRep = 'mstr_rep:' + mstr.getString();
          })

        // ====== ParagraphStyle ======
        Button(this.mParaDirLtr)
          .id('btnParaDirLtr')
          .onClick(() => {
            let para = new ParagraphStyle({ textDirection: TextDirection.LTR } as ParagraphStyleInterface);
            this.mParaDirLtr = 'para_dir_ltr:' + (para.textDirection === TextDirection.LTR ? 'match' : 'nomatch');
          })

        Button(this.mParaDirRtl)
          .id('btnParaDirRtl')
          .onClick(() => {
            let para = new ParagraphStyle({ textDirection: TextDirection.RTL } as ParagraphStyleInterface);
            this.mParaDirRtl = 'para_dir_rtl:' + (para.textDirection === TextDirection.RTL ? 'match' : 'nomatch');
          })

        Button(this.mParaAlign)
          .id('btnParaAlign')
          .onClick(() => {
            let para = new ParagraphStyle({ textAlign: TextAlign.Center } as ParagraphStyleInterface);
            this.mParaAlign = 'para_align:' + (para.textAlign === TextAlign.Center ? 'match' : 'nomatch');
          })

        Button(this.mParaMaxLines)
          .id('btnParaMaxLines')
          .onClick(() => {
            let para = new ParagraphStyle({ maxLines: 3 } as ParagraphStyleInterface);
            this.mParaMaxLines = 'para_maxlines:' + (para.maxLines ?? -1);
          })

        Button(this.mParaOverflow)
          .id('btnParaOverflow')
          .onClick(() => {
            let para = new ParagraphStyle({ overflow: TextOverflow.Ellipsis } as ParagraphStyleInterface);
            this.mParaOverflow = 'para_overflow:' + (para.overflow === TextOverflow.Ellipsis ? 'match' : 'nomatch');
          })

        Button(this.mParaWordBreak)
          .id('btnParaWordBreak')
          .onClick(() => {
            let para = new ParagraphStyle({ wordBreak: WordBreak.BREAK_WORD } as ParagraphStyleInterface);
            this.mParaWordBreak = 'para_wordbreak:' + (para.wordBreak === WordBreak.BREAK_WORD ? 'match' : 'nomatch');
          })

        // ====== TextStyle ======
        Button(this.mTstyleColor)
          .id('btnTstyleColor')
          .onClick(() => {
            let ts = new TextStyle({ fontColor: Color.Red });
            this.mTstyleColor = 'tstyle_color:' + (ts.fontColor === Color.Red ? 'match' : 'nomatch');
          })

        Button(this.mTstyleWeight)
          .id('btnTstyleWeight')
          .onClick(() => {
            let ts = new TextStyle({ fontWeight: FontWeight.Bold });
            this.mTstyleWeight = 'tstyle_weight:' + (ts.fontWeight !== undefined ? 'match' : 'nomatch');
          })

        // ====== DecorationStyle ======
        Button(this.mDecoUnder)
          .id('btnDecoUnder')
          .onClick(() => {
            let deco = new DecorationStyle({ type: TextDecorationType.Underline });
            this.mDecoUnder = 'deco_under:' + (deco.type === TextDecorationType.Underline ? 'match' : 'nomatch');
          })

        Button(this.mDecoThrough)
          .id('btnDecoThrough')
          .onClick(() => {
            let deco = new DecorationStyle({ type: TextDecorationType.LineThrough });
            this.mDecoThrough = 'deco_through:' + (deco.type === TextDecorationType.LineThrough ? 'match' : 'nomatch');
          })

        // ====== SimpleStyle classes ======
        Button(this.mBaseline)
          .id('btnBaseline')
          .onClick(() => {
            let style = new BaselineOffsetStyle(LengthMetrics.vp(10));
            this.mBaseline = 'baseline:' + style.baselineOffset;
          })

        Button(this.mLetter)
          .id('btnLetter')
          .onClick(() => {
            let style = new LetterSpacingStyle(LengthMetrics.vp(2));
            this.mLetter = 'letter:' + style.letterSpacing;
          })

        Button(this.mLineHeight)
          .id('btnLineHeight')
          .onClick(() => {
            let style = new LineHeightStyle(LengthMetrics.vp(24));
            this.mLineHeight = 'lineheight:' + style.lineHeight;
          })

        // ====== ImageAttachment ======
        Button(this.mImgRv)
          .id('btnImgRv')
          .onClick(() => {
            let img = new ImageAttachment({ resourceValue: 'icon.png' } as ResourceImageAttachmentOptions);
            this.mImgRv = 'img_rv:' + (img.resourceValue ?? 'none');
          })

        // ====== UrlStyle ======
        Button(this.mUrl)
          .id('btnUrl')
          .onClick(() => {
            let urlStyle = new UrlStyle('local_resource_link');
            this.mUrl = 'url:' + urlStyle.url;
          })

      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
