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
import { ComponentContent } from '@kit.ArkUI';

class Params {
  text: string | undefined | null = "";

  constructor(text: string | undefined | null) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  ReusableChildComponent({ text: params.text })
}

@Component
struct ReusableChildComponent {
  @Prop text: string | undefined | null = "";

  aboutToReuse(params: Record<string, object>) {
    console.info(`ReusableChildComponent Reusable ${JSON.stringify(params)}`);
  }

  aboutToRecycle(): void {
    console.info("ReusableChildComponent aboutToRecycle " + this.text);
  }

  build() {
    Column() {
      Text(this.text)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .height('100%')
    }.backgroundColor('#FFF0F0F0')
  }
}

@Entry
@Component
struct createFromComponent {
  @State pixmap: image.PixelMap | undefined = undefined;
  @State message: string | undefined | null = "hello";
  @State time: (number | null | undefined)[] = [0, -1]
  @State timeIndex: number = 0
  uiContext: UIContext = this.getUIContext();

  build() {
    Row() {
      Column() {
        Button("点击生成组件截图")
          .onClick(() => {
            let uiContext = this.getUIContext();
            let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText), new Params(this.message));
            this.uiContext.getComponentSnapshot()
              .createFromComponent(contentNode
                , this.time[this.timeIndex], true, { scale: 2, waitUntilRenderFinished: true })
              .then((pixmap: image.PixelMap) => {
                AppStorage.setOrCreate('success', 'success')
                this.pixmap = pixmap;
              })
              .catch((err: Error) => {
                AppStorage.setOrCreate('success', 'success')
                console.error("error: " + err.message);
              })
          }).width('80%')
          .height('5%')
          .margin('2%')
          .id('createFromComponent')

        Image(this.pixmap)
          .margin(10)
          .height('50%')
          .width('50%')
          .border({ color: Color.Black, width: 2 })
        Button('time: ' + this.time[this.timeIndex])
          .id('time3')
          .width('60%')
          .height('5%')
          .margin('2%')
          .onClick(() => {
            this.timeIndex++
            if (this.timeIndex > 1) {
              this.timeIndex = 0
            }
          })
      }.width('100%').margin({ left: 10, top: 5, bottom: 5 }).height('90%')
    }
    .width('100%')
    .height('100%')
  }
}