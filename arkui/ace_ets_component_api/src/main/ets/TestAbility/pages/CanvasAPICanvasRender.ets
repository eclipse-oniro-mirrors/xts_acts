/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct CanvasAPICanvasRender {
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  private offContext: OffscreenCanvasRenderingContext2D = new OffscreenCanvasRenderingContext2D(600, 600, this.settings)

  build() {
    Scroll() {
      Column() {
        Canvas(this.context)
          .margin(20)
          .width('100%')
          .height('30%')
          .backgroundColor('#ffff00')
          .key('CanvasAPICanvasRender_Canvas1')
          .onReady(() => {
            this.context_fillText1()
            this.context_fillText2()
            this.context_fillText3()
            this.context_fillText4()
            this.context_fillText5()
            this.context_fillText6()
            this.context_fillText7()
            this.context_fillText8()
            this.context_fillText9()
            this.context_strokeText1()
            this.context_strokeText2()
            this.context_strokeText3()
            this.context_strokeText4()
            this.context_strokeText5()
            this.context_strokeText6()
            this.context_strokeText7()
            this.context_strokeText8()
            this.context_strokeText9()
            this.off_context_fillText1()
            this.off_context_fillText2()
            this.off_context_fillText3()
            this.off_context_fillText4()
            this.off_context_fillText5()
            this.off_context_fillText6()
            this.off_context_fillText7()
            this.off_context_fillText8()
            this.off_context_fillText9()
            this.off_context_fillText10()
            this.off_context_strokeText1()
            this.off_context_strokeText2()
            this.off_context_strokeText3()
            this.off_context_strokeText4()
            this.off_context_strokeText5()
            this.off_context_strokeText6()
            this.off_context_strokeText7()
            this.off_context_strokeText8()
            this.off_context_strokeText9()
            this.off_context_strokeText10()
          })
      }
    }
  }

  context_fillText1() {
    this.context.font = '50px'
    this.context.fillText("Hello World!", 20, 100, 50)
  }

  context_fillText2() {
    this.context.font = '50px'
    this.context.fillText("Hello World!", 20, 100, 300)
  }

  context_fillText3() {
    this.context.font = '50px'
    this.context.fillText("Hello World!", 20, 100, 0)
  }

  context_fillText4() {
    this.context.font = '50px'
    this.context.fillText("Hello World!", 20, 100, -1)
  }

  context_fillText5() {
    this.context.font = "50px"
    this.context.fillText("Hello World!", 20, 100)
  }

  context_fillText6() {
    this.context.font = "50px"
    this.context.fillText("Hello World!", 20, 100, null)
  }

  context_fillText7() {
    this.context.font = "50px"
    this.context.fillText("Hello World!", 20, 100, undefined)
  }

  context_fillText8() {
    this.context.font = "150px"
    this.context.fillText("1,2,3,4,5,6,7,8,9", 20, 100, 1000)
  }

  context_fillText9() {
    this.context.font = "150px"
    this.context.fillText("1,2,3,4,5,6,7,8,9", 20, 100, 210)
  }

  context_strokeText1() {
    this.context.font = '50px'
    this.context.strokeText("Hello World!", 20, 100, 20)
  }

  context_strokeText2() {
    this.context.font = '50px'
    this.context.strokeText("Hello World!", 20, 100, 100)
  }

  context_strokeText3() {
    this.context.font = '50px'
    this.context.strokeText("Hello World!", 20, 100, 0)
  }

  context_strokeText4() {
    this.context.font = '50px'
    this.context.strokeText("Hello World!", 20, 100, -1)
  }

  context_strokeText5() {
    this.context.font = "50px"
    this.context.strokeText("Hello World!", 20, 100)
  }

  context_strokeText6() {
    this.context.font = "50px"
    this.context.strokeText("Hello World!", 20, 100, null)
  }

  context_strokeText7() {
    this.context.font = "50px"
    this.context.strokeText("Hello World!", 20, 100, undefined)
  }

  context_strokeText8() {
    this.context.font = "150px"
    this.context.strokeText("1,2,3,4,5,6,7,8,9", 20, 100, 1000)
  }

  context_strokeText9() {
    this.context.font = "150px"
    this.context.strokeText("1,2,3,4,5,6,7,8,9", 20, 100, 210)
  }

  off_context_fillText1() {
    this.offContext.font = '50px'
    this.offContext.fillText("Hello World!", 20, 100, 20)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_fillText2() {
    this.offContext.font = '50px'
    this.offContext.fillText("Hello World!", 20, 100, 100)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_fillText3() {
    this.offContext.font = '150px'
    this.offContext.fillText("Hello World!", 20, 100, 100)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_fillText4() {
    this.offContext.font = '50px'
    this.offContext.fillText("Hello World!", 20, 100, 0)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_fillText5() {
    this.offContext.font = '50px'
    this.offContext.fillText("Hello World!", 20, 100, -1)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_fillText6() {
    this.offContext.font = '50px'
    this.offContext.fillText("Hello World!", 20, 100)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_fillText7() {
    this.offContext.font = '50px'
    this.offContext.fillText("Hello World!", 20, 100, null)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_fillText8() {
    this.offContext.font = '50px'
    this.offContext.fillText("Hello World!", 20, 100, undefined)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_fillText9() {
    this.offContext.font = '150px'
    this.offContext.fillText("1,2,3,4,5,6,7,8,9", 20, 100, 1000)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_fillText10() {
    this.offContext.font = '150px'
    this.offContext.fillText("1,2,3,4,5,6,7,8,9", 20, 100, 210)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_strokeText1() {
    this.offContext.font = '50px'
    this.offContext.strokeText("Hello World!", 20, 100, 50)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_strokeText2() {
    this.offContext.font = '50px'
    this.offContext.strokeText("Hello World!", 20, 100, 100)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_strokeText3() {
    this.offContext.font = '150px'
    this.offContext.strokeText("Hello World!", 20, 100, 100)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_strokeText4() {
    this.offContext.font = '50px'
    this.offContext.strokeText("Hello World!", 20, 100, 0)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_strokeText5() {
    this.offContext.font = '50px'
    this.offContext.strokeText("Hello World!", 20, 100, -1)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_strokeText6() {
    this.offContext.font = '50px'
    this.offContext.strokeText("Hello World!", 20, 100)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_strokeText7() {
    this.offContext.font = '50px'
    this.offContext.strokeText("Hello World!", 20, 100, null)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_strokeText8() {
    this.offContext.font = '50px'
    this.offContext.strokeText("Hello World!", 20, 100, undefined)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_strokeText9() {
    this.offContext.font = '150px'
    this.offContext.strokeText("1,2,3,4,5,6,7,8,9", 20, 100, 1000)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }

  off_context_strokeText10() {
    this.offContext.font = '150px'
    this.offContext.strokeText("1,2,3,4,5,6,7,8,9", 20, 100, 210)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image)
  }
}