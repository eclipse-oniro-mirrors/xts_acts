'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Entry,
  Component,
  CustomSpan,
  CustomSpanMeasureInfo,
  CustomSpanMetrics,
  DrawContext,
  CustomSpanDrawInfo,
  TextController,
  InputType,
  TextAreaType,
  Resource,
  $r,
  TextStyle,
  Column,
  Margin,
  Text,
  TextInput,
  CopyOptions,
  EditableTextOnChangeCallback,
  PreviewText,
  TextChangeOptions,
  MutableStyledString,
  StyledStringKey,
  Color,
  FontStyle,
  FontWeight,
  StyledString
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import { UIContext } from "@ohos.arkui.UIContext";
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image'
import { LengthMetrics } from '@ohos.arkui.node';
import drawing from '@ohos.graphics.drawing';
import image from '@ohos.multimedia.image'
import { AppStorage } from '@ohos.arkui.stateManagement';
class MyCustomSpan extends CustomSpan {

  constructor(word: string, width: number, height: number) {
    super();
    this.word = word;
    this.width = width;
    this.height = height;
  }

  onMeasure(measureInfo: CustomSpanMeasureInfo): CustomSpanMetrics {
    return { width: this.width, height: this.height };
  }

  onDraw(context: DrawContext, options: CustomSpanDrawInfo) {
    let canvas = context.canvas;

    const brush = new drawing.Brush();
    brush.setColor({ alpha: 255, red: 1, green: 74, blue: 175 });
    const font = new drawing.Font();
    font.setSize(25);
    const textBlob = drawing.TextBlob.makeFromString(this.word, font, drawing.TextEncoding.TEXT_ENCODING_UTF8)!;
    canvas.attachBrush(brush);
    // canvas.drawRect({
    //   left: options.x + 10,
    //   right: options.x + AppStorage.get<UIContext>('uiContext')!.vp2px(this.width) - 10,
    //   top: options.lineTop + 10,
    //   bottom: options.lineBottom - 10
    // });
    //
    // brush.setColor({ alpha: 255, red: 23, green: 169, blue: 141 });
    // canvas.attachBrush(brush);
    // canvas.drawTextBlob(textBlob, options.x + 20, options.lineBottom - 15);
    // canvas.detachBrush();
  }

  setWord(word: string) {
    this.word = word;
  }
  public width: number = 160;
  public word: string = 'drawing';
  public height: number = 10;
}

@Entry
@Component
struct styled_string_demo1 {
  @State text: string = ''
  @State text2: string = ''
  customSpan2: MyCustomSpan = new MyCustomSpan('change', 130, 10);
  customSpan1: MyCustomSpan = new MyCustomSpan('Hello', 80, 10);
  customSpan3: MyCustomSpan = new MyCustomSpan('World', 80, 40);
  style2: MutableStyledString = new MutableStyledString(this.customSpan2);
  style1: MutableStyledString = new MutableStyledString(this.customSpan1);
  textStyle: MutableStyledString = new MutableStyledString('123');
  textController: TextController = new TextController();
  imagePixelMap: image.PixelMap | undefined = undefined;
  isPageShow: boolean = true;

  @State inputType: InputType = InputType.Normal
  @State areaType: TextAreaType = TextAreaType.NORMAL

   aboutToAppear() {
    console.info('aboutToAppear initial imagePixelMap')
    this.imagePixelMap = this.getPixmapFromMedia($r('app.media.icon'))
  }

  private getPixmapFromMedia(resource: Resource) {
    let unit8Array = await this.getUIContext()!.getHostContext()!.resourceManager.getMediaContent(resource.id);
    let imageSource = image.createImageSource(unit8Array.buffer.slice(0, unit8Array.buffer.byteLength));
    let createPixelMap: image.PixelMap = await imageSource!.createPixelMap({
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
      desiredSize: { width: 50, height: 50 }
    }) as image.PixelMap;
    await imageSource!.release();
    return createPixelMap;
  }

  onPageShow() {
    if (!this.isPageShow) {
      return
    }
    this.isPageShow = false;

    this.style1.appendStyledString(new MutableStyledString('文本绘制 示例代码 CustomSpan文本绘制 示例代码 CustomSpan文本绘制 示例代码 CustomSpan', [
      {
        start: 0,
        length: 5,
        styledKey: StyledStringKey.FONT,
        styledValue: new TextStyle({ fontColor: Color.Pink })
      }, {
      start: 5,
      length: 5,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontColor: Color.Orange, fontStyle: FontStyle.Italic })
    }, {
      start: 10,
      length: 500,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontColor: Color.Green, fontWeight: FontWeight.Bold })
    }
    ]))
    this.style1.appendStyledString(new StyledString(this.customSpan3))
    this.style1.appendStyledString(new StyledString('自定义绘制', [{
      start: 0,
      length: 5,
      styledKey: StyledStringKey.FONT,
      styledValue: new TextStyle({ fontColor: Color.Green, fontSize: LengthMetrics.px(50) })
    }]))
    this.textController.setStyledString(this.style1)
    this.imagePixelMap = this.getPixmapFromMedia($r('app.media.icon'))
  }

  build() {
    Column() {

      Text(this.text)
        .key('changeText')
        .copyOption(CopyOptions.LocalDevice)
        .draggable(true)

      Text(this.text2)
        .key('changeText2')
        .copyOption(CopyOptions.LocalDevice)
        .draggable(true)

      TextInput({text: ''})
        .type(this.inputType)
        .height(100)
        .key('styledStringInput')
        .margin({ top:50 } as Margin)
        .onChange((value: String) :void=> {
          this.text = 'change'
        })
        .onPaste((): void => {
          this.text2 = 'paste'
        })

      Text(undefined, { controller: this.textController })
        .key('styledStringText')
        .draggable(true)
        .copyOption(CopyOptions.LocalDevice)
        .fontSize(30)
        .height(35)
        .margin(20)



    }.margin({ top: 50 } as Margin)
  }
}