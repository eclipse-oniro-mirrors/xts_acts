/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
@Entry
@Component
struct CanvasParamsImageAnalyzerPage {
  private get_rendering_context: CanvasRenderingContext2D = new CanvasRenderingContext2D();

  private config: ImageAnalyzerConfig = {
    types: [ImageAnalyzerType.SUBJECT, ImageAnalyzerType.TEXT, ImageAnalyzerType.OBJECT_LOOKUP]
  }
  private aiController: ImageAnalyzerController = new ImageAnalyzerController()
  private options: ImageAIOptions = {
    types: [ImageAnalyzerType.SUBJECT, ImageAnalyzerType.TEXT, ImageAnalyzerType.OBJECT_LOOKUP],
    aiController: this.aiController
  }
  private img = new ImageBitmap('resources/base/media/ImageAnalyzer.webp')

  build() {
    Column() {
      Canvas({ imageAIOptions: this.options })
        .height(160)
        .enableAnalyzer(true)
        .key('CanvasParamsImageAnalyzerPage_canvas')
        .onReady((drawingContext?: DrawingRenderingContext) => {
          if (!drawingContext) {
            return
          }

          this.get_rendering_context = CanvasRenderingContext2D.getContext2DFromDrawingContext(drawingContext);
          this.get_rendering_context.drawImage(this.img, 0, 0, 200, 200)
        })

      Row() {
        Button('start')
          .key('CanvasParamsImageAnalyzerPage_start')
          .onClick(() => {
            this.get_rendering_context.startImageAnalyzer(this.config)
              .then(() => {
                console.info('analysis complete')
              })
              .catch((error: BusinessError) => {
                console.info('error code: ' + error.code)
              })
          })
        Button('stop')
          .key('CanvasParamsImageAnalyzerPage_stop')
          .onClick(() => {
            this.get_rendering_context.stopImageAnalyzer()
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}