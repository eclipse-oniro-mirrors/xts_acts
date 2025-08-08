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
import { LengthMetrics } from '@ohos.arkui.node'
import { drawing, common2D } from '@kit.ArkGraphics2D';

@Entry
@Component
struct VerticalAlign {
  private ColorFilterMatrix: number[] = [0.239, 0, 0, 0, 0, 0, 0.616, 0, 0, 0, 0, 0, 0.706, 0, 0, 0, 0, 0, 1, 0];
  private color: common2D.Color = { alpha: 125, red: 125, green: 125, blue: 255 };
  @State DrawingColorFilterFirst: ColorFilter | DrawingColorFilter | undefined = new ColorFilter(this.ColorFilterMatrix)
  @State mutableStyledString1: MutableStyledString = new MutableStyledString("Init");
  @State ImageSpanAlignment: ImageSpanAlignment = ImageSpanAlignment.BASELINE
  @State verticalAlign: string = 'verticalAlign'
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller };

  update(){
    this.controller.setStyledString(this.mutableStyledString1)
  }
  build() {
    Column({ space: 1 }) {
      RichEditor( this.options ).width('100%')
        .height('10%')
      Button("TOP").id('Set_VerticalAlign_TOP').height('5%')
        .onClick(()=>{
          this.ImageSpanAlignment = ImageSpanAlignment.TOP
        })
      Row() {
        Button("CENTER").id('Set_VerticalAlign_CENTER').height('5%')
          .onClick(()=>{
            this.ImageSpanAlignment = ImageSpanAlignment.CENTER
          })
        Button("BOTTOM").id('Set_VerticalAlign_BOTTOM').height('5%')
          .onClick(()=>{
            this.ImageSpanAlignment = ImageSpanAlignment.BOTTOM
          })
      }
      Row() {
        Button('append resource').height('5%').id('set_VerticalAlign_append')
          .onClick(()=>{
            this.mutableStyledString1.appendStyledString(new MutableStyledString(new ImageAttachment({
              resourceValue: $r('app.media.icon'),
              size: { width: '100px', height: 50 },
              layoutStyle: { borderRadius: LengthMetrics.vp(10) },
              verticalAlign: this.ImageSpanAlignment,
              objectFit: ImageFit.Auto,
              colorFilter: drawing.ColorFilter.createBlendModeColorFilter(this.color, drawing.BlendMode.DST_OVER)
            })))
            this.update()
          })
        Button('getStyles').width('50%').height('5%').id('get_VerticalAlign_styles')
          .onClick(() => {
            let imageArray = this.mutableStyledString1.getStyles(0,  this.mutableStyledString1.length)
            for (let i = 0; i < imageArray.length; ++i) {
              if (imageArray[i].styledKey === 300) {
                let attachment = imageArray[i].styledValue as ImageAttachment
                console.info('ImageAttachment value  ' + JSON.stringify(attachment.value))
                console.info('ImageAttachment size  ' + JSON.stringify(attachment.size))
                console.info('ImageAttachment verticalAlign  ' + JSON.stringify(attachment.verticalAlign))
                this.verticalAlign = '' + JSON.stringify(attachment.verticalAlign)
                console.info('ImageAttachment objectFit  ' + JSON.stringify(attachment.objectFit))
                console.info('ImageAttachment layoutStyle  ' + JSON.stringify(attachment.layoutStyle))
                if (attachment.colorFilter) {
                  this.DrawingColorFilterFirst = attachment.colorFilter
                  console.info('ImageAttachment colorFilter  ' + JSON.stringify(attachment.colorFilter))
                }
              }
            }
          }).height(35).padding(8).margin({top:10,right:10})
      }
      Text(this.verticalAlign).id('get_verticalAlign').height('5%')
    }.width('100%')
  }
}