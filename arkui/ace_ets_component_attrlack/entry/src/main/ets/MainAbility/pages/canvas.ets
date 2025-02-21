/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import Log from '../common/Log.ets';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct CanvasActualBoundingBoxAscent {
  private settings: RenderingContextSettings = new RenderingContextSettings(true) //antialias:boolean
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear CanvasActualBoundingBoxAscent start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear CanvasActualBoundingBoxAscent end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Canvas(this.context)
        .key('Canvas')
        .width('100%')
        .height('100%')
        .backgroundColor('#ffff00')
        .position({ x: 3, y: 5 })
        .align(Alignment.Center)
        .onReady(() => {
          this.context.font = '50px sans-serif'
          this.context.fillText("Hello World!", 20, 100)
          this.context.textBaseline = 'top'
          this.context.fillText("width:" + this.context.measureText("Hello World!").width, 20, 150)
          this.context.fillText("actualBoundingBoxAscent:" + this.context.measureText("Hello World!")
            .actualBoundingBoxAscent, 20, 200)
          this.context.fillText("actualBoundingBoxDescent:" + this.context.measureText("Hello World!")
            .actualBoundingBoxDescent, 20, 250)
          this.context.fillText("actualBoundingBoxLeft:" + this.context.measureText("Hello World!")
            .actualBoundingBoxLeft, 20, 300)
          this.context.fillText("actualBoundingBoxRight:" + this.context.measureText("Hello World!")
            .actualBoundingBoxRight, 20, 350)
          this.context.fillText("alphabeticBaseline:" + this.context.measureText("Hello World!")
            .alphabeticBaseline, 20, 400)
          this.context.fillText("emHeightAscent:" + this.context.measureText("Hello World!").emHeightAscent, 20, 450)
          this.context.fillText("emHeightDescent:" + this.context.measureText("Hello World!").emHeightDescent, 20, 500)
          this.context.fillText("fontBoundingBoxAscent:" + this.context.measureText("Hello World!")
            .fontBoundingBoxAscent, 20, 550)
          this.context.fillText("fontBoundingBoxDescent:" + this.context.measureText("Hello World!")
            .fontBoundingBoxDescent, 20, 600)
          this.context.fillText("hangingBaseline:" + this.context.measureText("Hello World!").hangingBaseline, 20, 650)
          this.context.fillText("ideographicBaseline" + this.context.measureText("Hello World!")
            .ideographicBaseline, 20, 700)
          //          this.context.fillText("antialias" + this.context.measureText("Hello World!").antialias, 20, 700)
        })
    }
    .width('100%')
    .height('100%')
  }
}

