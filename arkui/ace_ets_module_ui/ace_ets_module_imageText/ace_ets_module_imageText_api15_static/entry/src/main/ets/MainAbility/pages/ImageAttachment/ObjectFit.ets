'use static';
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
import {
  Entry,
  MutableStyledString,
  ColorFilter,
  ClickEvent,
  Component,
  RichEditor,
  Column,
  Text,
  ImageSpan,
  Visibility,
  $r,
  FlexAlign,
  HorizontalAlign,
  RichEditorStyledStringController,
  RichEditorStyledStringOptions,
  ColumnOptions,
  ImageAttachment,
  Button,
  Row,
  Margin,
  ResourceImageAttachmentOptions,
  ImageFit,
  ImageSpanAlignment
} from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { drawing, common2D } from '@kit.ArkGraphics2D';

@Entry
@Component
struct ObjectFit1 {
  private ColorFilterMatrix: Array<number> = new Array<number>(0.239, 0, 0, 0, 0, 0, 0.616, 0, 0, 0, 0, 0, 0.706, 0, 0, 0, 0, 0, 1, 0);
  private color: common2D.Color = { alpha: 125, red: 125, green: 125, blue: 255 } as common2D.Color;
  @State DrawingColorFilterFirst: ColorFilter   = new ColorFilter(this.ColorFilterMatrix)
  @State mutableStyledString1: MutableStyledString = new MutableStyledString("Init");
  @State ImageFit: ImageFit = ImageFit.Auto
  @State objectFit: string = 'ObjectFit'
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = { controller: this.controller } as RichEditorStyledStringOptions;

  update(){
    this.controller.setStyledString(this.mutableStyledString1)
  }
  build() {
    Column({ space: 1 } as ColumnOptions) {
      RichEditor( this.options ).width('100%')
        .height('10%')
      Row() {
        Button("Contain:1").id('Set_ImageFit_Contain').height('5%').width('30%')
          .onClick((e:ClickEvent) => {
            this.ImageFit = ImageFit.Contain
          })
        Button("Cover:2").id('Set_ImageFit_Cover').height('5%').width('30%')
          .onClick((e:ClickEvent) => {
            this.ImageFit = ImageFit.Cover
          })
        Button("Fill:0").id('Set_ImageFit_Fill').height('5%').width('30%')
          .onClick((e:ClickEvent) => {
            this.ImageFit = ImageFit.Fill
          })
      }
      Row() {
        Button("ScaleDown:6").id('Set_ImageFit_ScaleDown').height('5%').width('30%')
          .onClick((e:ClickEvent) => {
            this.ImageFit = ImageFit.ScaleDown
          })
        Button("None:5").id('Set_ImageFit_None').height('5%').width('30%')
          .onClick((e:ClickEvent) => {
            this.ImageFit = ImageFit.None
          })
        Button("TOP_START:7").id('Set_ImageFit_TOP_START').height('5%').width('30%')
          .onClick((e:ClickEvent) => {
            this.ImageFit = ImageFit.TOP_START
          })
      }
      Row() {
        Button("TOP:8").id('Set_ImageFit_TOP').height('5%').width('30%')
          .onClick((e:ClickEvent) => {
            this.ImageFit = ImageFit.TOP
          })
        Button("TOP_END:9").id('Set_ImageFit_TOP_END').height('5%').width('30%')
          .onClick((e:ClickEvent) => {
            this.ImageFit = ImageFit.TOP_END
          })
        Button("START:10").id('Set_ImageFit_START').height('5%').width('30%')
          .onClick((e:ClickEvent) => {
            this.ImageFit = ImageFit.START
          })
      }
      Row() {
        Button("CENTER:11").id('Set_ImageFit_CENTER').height('5%').width('30%')
          .onClick((e:ClickEvent) => {
            this.ImageFit = ImageFit.CENTER
          })
        Button("END:12").id('Set_ImageFit_END').height('5%').width('30%')
          .onClick((e:ClickEvent) => {
            this.ImageFit = ImageFit.END
          })
        Button("BOTTOM_START:13").id('Set_ImageFit_BOTTOM_START').height('5%').width('30%')
          .onClick((e:ClickEvent) => {
            this.ImageFit = ImageFit.BOTTOM_START
          })
      }
      Row() {
        Button("BOTTOM:14").id('Set_ImageFit_BOTTOM').height('5%').width('30%')
          .onClick((e:ClickEvent) => {
            this.ImageFit = ImageFit.BOTTOM
          })
        Button("BOTTOM_END:15").id('Set_ImageFit_BOTTOM_END').height('5%').width('30%')
          .onClick((e:ClickEvent) => {
            this.ImageFit = ImageFit.BOTTOM_END
          })
      }
      Row() {
        Button('append resource').height('5%').id('set_ObjectFit_append')
          .onClick((e:ClickEvent) => {
            this.mutableStyledString1.appendStyledString(new MutableStyledString(new ImageAttachment({
              resourceValue: $r('app.media.icon'),
              size: { width: 50, height: '50px' },
              layoutStyle: { borderRadius: LengthMetrics.vp(10) },
              verticalAlign: ImageSpanAlignment.CENTER,
              objectFit: this.ImageFit,
              colorFilter: drawing.ColorFilter.createBlendModeColorFilter(this.color, drawing.BlendMode.DST_OVER)
            } as ResourceImageAttachmentOptions)))
            this.update()
          })
        Button('getStyles').width('50%').height('5%').id('get_ObjectFit_styles')
          .onClick((e:ClickEvent) => {
            console.log('--------' + this.mutableStyledString1.length)
            let imageArray = this.mutableStyledString1.getStyles(0,  this.mutableStyledString1.length)
            console.info('imageArray.length: ' + imageArray!.length)
            for (let i = 0; i < imageArray!.length; ++i) {
              if (imageArray![i].styledKey === 300) {
                let attachment = imageArray![i].styledValue as ImageAttachment
                console.info('ImageAttachment value  ' + JSON.stringify(attachment.value))
                console.info('ImageAttachment size  ' + JSON.stringify(attachment.size))
                console.info('ImageAttachment verticalAlign  ' + attachment.verticalAlign)
                this.objectFit = '' + attachment.objectFit
                console.info('ImageAttachment objectFit  ' + attachment.objectFit)
                console.info('ImageAttachment layoutStyle  ' + JSON.stringify(attachment.layoutStyle))
                if (attachment.colorFilter) {
                  this.DrawingColorFilterFirst = attachment.colorFilter as ColorFilter
                  console.info('ImageAttachment colorFilter  ' + attachment.colorFilter)
                }
              }
            }
          }).height(35).padding(8).margin({top:10,right:10} as Margin)
      }
      Text(this.objectFit).id('get_ObjectFit').height('5%')
    }.width('100%')
  }
}