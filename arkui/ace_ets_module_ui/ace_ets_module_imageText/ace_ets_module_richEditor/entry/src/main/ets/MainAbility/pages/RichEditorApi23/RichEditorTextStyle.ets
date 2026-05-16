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
import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct RichEditorTextStyle23 {
  controller: RichEditorController = new RichEditorController();
  @State strokeWidthStr:string = '';
  @State strokeColorStr:string = '';
  @State content: string = '';
  @State strokeWidthIndex: number = 0;
  @State paragraphStyle: RichEditorParagraphStyle = { textDirection: TextDirection.LTR }
  @State srcColor: ResourceColor[] = ['#FFFF0000', 0xFFFFFF, Color.Green, $r('app.color.start_window_background')];
  @State strokeWidthValue: (LengthMetrics | undefined)[] = [LengthMetrics.vp(10) ,LengthMetrics.px(10),
    LengthMetrics.fp(10), LengthMetrics.percent(10), LengthMetrics.lpx(10), undefined];
  private richEditorTextStyle: RichEditorTextStyle = {
    strokeWidth: this.strokeWidthValue[this.strokeWidthIndex],
    strokeColor: this.srcColor[this.strokeWidthIndex]
  }

  onPageShow(): void {
    this.controller.setTypingStyle(this.richEditorTextStyle)
    this.controller.setTypingParagraphStyle(this.paragraphStyle)
  }

  build() {
    Column() {
      Row(){
        Text(this.strokeWidthStr).height('3%').textAlign(TextAlign.LEFT).margin({ right: 5 })
        Text(this.strokeColorStr).height('3%').textAlign(TextAlign.RIGHT).margin({ right: 5 })
      }

      RichEditor({controller:this.controller})
        .onReady(()=>{
          this.controller.addTextSpan('Test RichEditorTextStyle')
        })
        .height('10%')
        .id('RichEditor_TextStyle')
      Row(){
        Button('setTypingStyle1')
          .fontSize(10).width('50%').id('setTypingStyle1')
          .onClick(() => {
            this.controller.setTypingStyle(this.richEditorTextStyle)
          })
        Button('set ParagraphStyle').onClick(() => {
          this.controller.setTypingParagraphStyle(this.paragraphStyle)
        })
      }.height('5%')

      Button('getTextStyleValue').onClick(() => {
        this.richEditorTextStyle = this.controller.getTypingStyle()
        this.strokeWidthStr = JSON.stringify(this.richEditorTextStyle.strokeWidth)
        AppStorage.setOrCreate('RichEditorTextStyle_strokeWidth', this.strokeWidthStr)
        this.strokeColorStr = JSON.stringify(this.richEditorTextStyle.strokeColor)
        AppStorage.setOrCreate('RichEditorTextStyle_strokeColor', this.strokeColorStr)
      }).height('5%').fontSize(10).id('getTextStyleValue')
    }
    .width('100%')
    .height('100%')
  }
}