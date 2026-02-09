/*
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

import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct styled_string_demo4 {
  @State message: string = 'Hello World'
  mutableStr: MutableStyledString = new MutableStyledString('origin image:');
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };
  @State colorFilter: string = ''
  private colorFilterMatrix: number[] = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.5, 0];
  @State attachmentButtonIds: string[] = [];
  @State lastClickedButtonId: string = '';
  @State currentSupportSvg2: string = '';

  build() {
    Row() {
      Column({ space: 5 }) {
        Text(this.currentSupportSvg2 || '').id('ColorFilter_content');
        RichEditor(this.options).width('30%').height('7%')
        Row() {
          Column() {
            Button('richEditor1').fontSize(10).id('richEditor1')
              .onClick(() => {
                this.mutableStr.appendStyledString(new MutableStyledString(new ImageAttachment({
                  resourceValue: $r('app.media.strokeFile'),
                  size: { width: 50, height: 50 },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                  verticalAlign: ImageSpanAlignment.BASELINE,
                  objectFit: ImageFit.Contain,
                  colorFilter: this.colorFilterMatrix,
                  syncLoad: true,
                  supportSvg2: true,
                })));
                this.controller.setStyledString(this.mutableStr);
              })

            Button('richEditor2').fontSize(10).id('richEditor2')
              .onClick(() => {
                this.mutableStr.appendStyledString(new MutableStyledString(new ImageAttachment({
                  resourceValue: $r('app.media.strokeFile'),
                  size: { width: 50, height: 50 },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                  verticalAlign: ImageSpanAlignment.BASELINE,
                  objectFit: ImageFit.Contain,
                  colorFilter: this.colorFilterMatrix,
                  syncLoad: true,
                  supportSvg2: false,
                })));
                this.controller.setStyledString(this.mutableStr);
              })
          }

          Column() {
            Button('richEditor3').fontSize(10).id('richEditor3')
              .onClick(() => {
                this.mutableStr.appendStyledString(new MutableStyledString(new ImageAttachment({
                  resourceValue: $r('app.media.strokeFile'),
                  size: { width: 50, height: 50 },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                  verticalAlign: ImageSpanAlignment.BASELINE,
                  objectFit: ImageFit.Contain,
                  colorFilter: this.colorFilterMatrix,
                  syncLoad: true,
                  supportSvg2: undefined,
                })));
                this.controller.setStyledString(this.mutableStr);
              })

            Button('richEditor4').fontSize(10).id('richEditor4')
              .onClick(() => {
                this.mutableStr.appendStyledString(new MutableStyledString(new ImageAttachment({
                  resourceValue: $r('app.media.strokeFile'),
                  size: { width: 50, height: 50 },
                  layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                  verticalAlign: ImageSpanAlignment.BASELINE,
                  objectFit: ImageFit.Contain,
                  colorFilter: this.colorFilterMatrix,
                  syncLoad: true,
                })));
                this.controller.setStyledString(this.mutableStr);
              })
          }
        }

        Button('RichEditorGet').height('5%').id('get_styles')
          .onClick(() => {
            const imageArray = this.mutableStr.getStyles(0, this.mutableStr.length);
            const lastAttachment = imageArray[imageArray.length - 1];
            if (lastAttachment.styledKey === 300) {
              const attachment = lastAttachment.styledValue as ImageAttachment;
              this.currentSupportSvg2 = attachment.supportSvg2?.toString() || 'undefined';
              console.info(`supportSvg2: ${this.currentSupportSvg2}`);
            }
            this.mutableStr = new MutableStyledString('origin image:');
            this.attachmentButtonIds = [];
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding({top: 10})
    }
  }
}