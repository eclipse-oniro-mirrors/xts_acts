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

import { image } from '@kit.ImageKit';
import { LengthMetrics } from '@ohos.arkui.node'
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct styled_string_demo8 {
  imagePixelMap: image.PixelMap | undefined = undefined;
  @State html: string | undefined = undefined;
  @State styledString: StyledString | undefined = undefined;
  controller1: TextController = new TextController;
  controller2: TextController = new TextController;
  private uiContext: UIContext = this.getUIContext();

  async aboutToAppear() {
    console.info("aboutToAppear initial imagePixelMap");
    this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.app_icon'));
  }

  private async getPixmapFromMedia(resource: Resource) {
    let unit8Array = await this.uiContext.getHostContext()?.resourceManager?.getMediaContent({
      bundleName: resource.bundleName,
      moduleName: resource.moduleName,
      id: resource.id
    });
    let imageSource = image.createImageSource(unit8Array?.buffer.slice(0, unit8Array.buffer.byteLength));
    let createPixelMap: image.PixelMap = await imageSource.createPixelMap({
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888
    });
    await imageSource.release();
    return createPixelMap;
  }

  build() {
    Column({ space: 2 }) {
      Text(undefined, { controller: this.controller1 })
        .id('Text_content_1')
        .height('15%')

      Button("添加属性字符串")
        .id('button_add_styleString')
        .onClick(() => {
          let mutableStyledString1: MutableStyledString = new MutableStyledString("属性字符串", [{
            start: 0,
            length: 6,
            styledKey: StyledStringKey.FONT,
            styledValue: new TextStyle({ fontColor: Color.Green, fontSize: LengthMetrics.px(50) })
          }]);
          if (this.imagePixelMap !== undefined) {
            let mutableStyledString2 = new MutableStyledString(new ImageAttachment({
              value: this.imagePixelMap,
              size: { width: 50, height: 50 },
            }));
            mutableStyledString1.appendStyledString(mutableStyledString2);
          }
          this.styledString = mutableStyledString1;
          this.controller1.setStyledString(mutableStyledString1);
        })

      Button("toHtml")
        .id('button_toHtml')
        .height('5%')
        .onClick(() => {
          this.html = StyledString.toHtml(this.styledString);
        })

      Button("fromHtml")
        .id('button_fromHtml')
        .height('5%')
        .onClick(async () => {
          let styledString = await StyledString.fromHtml(this.html);
          this.controller2.setStyledString(styledString);
        })
      Button('test170001')
        .id('button_fromHtml_170001')
        .height('5%')
        .onClick(async () => {
          try {
            await StyledString.fromHtml('')
          }catch (e){
            console.log('fromHtmlErrorCode170001:'+(e as BusinessError).code)
            AppStorage.SetOrCreate('fromHtmlErrorCode170001',(e as BusinessError).code)
          }
        })
      Button('test401')
        .id('button_fromHtml_401')
        .height('5%')
        .onClick(async () => {
          try {
            await StyledString.fromHtml(null)
          }catch (e){
            console.log('fromHtmlErrorCode401:'+(e as BusinessError).code)
            AppStorage.SetOrCreate('fromHtmlErrorCode401',(e as BusinessError).code)
          }
        })
      Text(undefined, { controller: this.controller2 })
        .id('Text_content_2')
        .height('15%')
      Text(this.html)
    }.width("100%")
  }
}