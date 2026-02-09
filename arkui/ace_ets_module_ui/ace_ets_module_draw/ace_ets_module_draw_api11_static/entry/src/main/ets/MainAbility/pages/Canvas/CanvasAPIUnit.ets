'use static';
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
import {
  $r,
  Button,
  Canvas,
  CanvasRenderingContext2D,
  Color,
  Column,
  Component,
  Entry,
  ImageBitmap,
  OffscreenCanvasRenderingContext2D,
  RenderingContextSettings,
  Row,
  Scroll,
  Text
} from '@ohos.arkui.component';

@Entry
@Component
struct CanvasAPIUnit {
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
          .key('CanvasAPIUnit_Canvas1')
          .onReady(() => {
            this.context_font1()
            this.context_font2()
            this.context_font3()
            this.context_font4()
            this.context_font5()
            this.context_font6()
            this.off_context_font1()
            this.off_context_font2()
            this.off_context_font3()
            this.off_context_font4()
            this.off_context_font5()
            this.off_context_font6()
            this.context_putImageData1()
            this.context_putImageData2()
            this.context_putImageData3()
            this.context_putImageData4()
            this.context_putImageData5()
            this.context_putImageData6()
            this.off_context_putImageData1()
            this.off_context_putImageData2()
            this.off_context_putImageData3()
            this.off_context_putImageData4()
            this.off_context_putImageData5()
            this.off_context_putImageData6()
          })
      }
    }
  }

  context_font1() {
    this.context.font = '50px'
    this.context.fillText("Hello World!", 20, 100)
  }

  context_font2() {
    this.context.font = '50vp'
    this.context.fillText("Hello World!", 20, 100)
  }

  context_font3() {
    this.context.font = 'italic 50vp '
    this.context.fillText("Hello World!", 20, 100)
  }

  context_font4() {
    this.context.font = 'italic 50vp 500 '
    this.context.fillText("Hello World!", 20, 100)
  }

  context_font5() {
    this.context.font = 'italic 50vp 500 sans-serif '
    this.context.fillText("Hello World!", 20, 100)
  }

  context_font6() {
    this.context.font = "50"
    this.context.fillText("Hello World!", 20, 100)
  }

  off_context_font1() {
    this.offContext.font = '50px'
    this.offContext.fillText("Hello World!", 20, 100)
    let image = this.offContext.transferToImageBitmap();
    this.context.transferFromImageBitmap(image as ImageBitmap) ;
  }

  off_context_font2() {
    this.offContext.font = '50vp'
    this.offContext.fillText("Hello World!", 20, 100)
    let image = this.offContext.transferToImageBitmap();
    this.context.transferFromImageBitmap(image as ImageBitmap) ;
  }

  off_context_font3() {
    this.offContext.font = 'italic 50vp '
    this.offContext.fillText("Hello World!", 20, 100)
    let image = this.offContext.transferToImageBitmap();
    this.context.transferFromImageBitmap(image as ImageBitmap) ;
  }

  off_context_font4() {
    this.offContext.font = 'italic 50vp 500 '
    this.offContext.fillText("Hello World!", 20, 100)
    let image = this.offContext.transferToImageBitmap();
    this.context.transferFromImageBitmap(image as ImageBitmap) ;
  }

  off_context_font5() {
    this.offContext.font = 'italic 50vp 500 sans-serif '
    this.offContext.fillText("Hello World!", 20, 100)
    let image = this.offContext.transferToImageBitmap();
    this.context.transferFromImageBitmap(image as ImageBitmap) ;
  }

  off_context_font6() {
    this.offContext.font = "50"
    this.offContext.fillText("Hello World!", 20, 100)
    let image = this.offContext.transferToImageBitmap();
    this.context.transferFromImageBitmap(image as ImageBitmap) ;
  }

  context_putImageData1() {
    let imageData = this.context.createImageData(100, 100)
    for (let i = 0; i < imageData.data!.length; i += 4) {
      imageData.data![i + 0] = 255
      imageData.data![i + 1] = 0
      imageData.data![i + 2] = 255
      imageData.data![i + 3] = 255
    }
    this.context.putImageData(imageData, "50px", "50px")
  }

  context_putImageData2() {
    let imageData = this.context.createImageData(100, 100)
    for (let i = 0; i < imageData.data!.length; i += 4) {
      imageData.data![i + 0] = 255
      imageData.data![i + 1] = 0
      imageData.data![i + 2] = 255
      imageData.data![i + 3] = 255
    }
    this.context.putImageData(imageData, 50, 50)
  }

  context_putImageData3() {
    let imageData = this.context.createImageData(100, 100)
    for (let i = 0; i < imageData.data!.length; i += 4) {
      imageData.data![i + 0] = 255
      imageData.data![i + 1] = 0
      imageData.data![i + 2] = 255
      imageData.data![i + 3] = 255
    }
    this.context.putImageData(imageData, "50vp", "50vp")
  }

  context_putImageData4() {
    let imageData = this.context.createImageData(100, 100)
    for (let i = 0; i < imageData.data!.length; i += 4) {
      imageData.data![i + 0] = 255
      imageData.data![i + 1] = 0
      imageData.data![i + 2] = 255
      imageData.data![i + 3] = 255
    }
    this.context.putImageData(imageData, "50px", "50px", "50px", "50px", "75px", "75px")
  }

  context_putImageData5() {
    let imageData = this.context.createImageData(100, 100)
    for (let i = 0; i < imageData.data!.length; i += 4) {
      imageData.data![i + 0] = 255
      imageData.data![i + 1] = 0
      imageData.data![i + 2] = 255
      imageData.data![i + 3] = 255
    }
    this.context.putImageData(imageData, "50vp", "50vp", "50vp", "50vp", "50vp", "50vp")
  }

  context_putImageData6() {
    let imageData = this.context.createImageData(100, 100)
    for (let i = 0; i < imageData.data!.length; i += 4) {
      imageData.data![i + 0] = 255
      imageData.data![i + 1] = 0
      imageData.data![i + 2] = 255
      imageData.data![i + 3] = 255
    }
    this.context.putImageData(imageData, 50, 50, 50, 50, 50, 50)
  }

  off_context_putImageData1() {
    let imageData = this.offContext.createImageData(100, 100)
    for (let i = 0; i < imageData.data!.length; i += 4) {
      imageData.data![i + 0] = 255
      imageData.data![i + 1] = 0
      imageData.data![i + 2] = 255
      imageData.data![i + 3] = 255
    }
    this.offContext.putImageData(imageData, "50px", "50px")
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image as ImageBitmap) 
  }

  off_context_putImageData2() {
    let imageData = this.offContext.createImageData(100, 100)
    for (let i = 0; i < imageData.data!.length; i += 4) {
      imageData.data![i + 0] = 255
      imageData.data![i + 1] = 0
      imageData.data![i + 2] = 255
      imageData.data![i + 3] = 255
    }
    this.offContext.putImageData(imageData, 50, 50)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image as ImageBitmap) 
  }

  off_context_putImageData3() {
    let imageData = this.offContext.createImageData(100, 100)
    for (let i = 0; i < imageData.data!.length; i += 4) {
      imageData.data![i + 0] = 255
      imageData.data![i + 1] = 0
      imageData.data![i + 2] = 255
      imageData.data![i + 3] = 255
    }
    this.offContext.putImageData(imageData, "50vp", "50vp")
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image as ImageBitmap) 
  }

  off_context_putImageData4() {
    let imageData = this.offContext.createImageData(100, 100)
    for (let i = 0; i < imageData.data!.length; i += 4) {
      imageData.data![i + 0] = 255
      imageData.data![i + 1] = 0
      imageData.data![i + 2] = 255
      imageData.data![i + 3] = 255
    }
    this.offContext.putImageData(imageData, "50px", "50px", "50px", "50px", "75px", "75px")
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image as ImageBitmap) 
  }

  off_context_putImageData5() {
    let imageData = this.offContext.createImageData(100, 100)
    for (let i = 0; i < imageData.data!.length; i += 4) {
      imageData.data![i + 0] = 255
      imageData.data![i + 1] = 0
      imageData.data![i + 2] = 255
      imageData.data![i + 3] = 255
    }
    this.offContext.putImageData(imageData, "50vp", "50vp", "50vp", "50vp", "50vp", "50vp")
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image as ImageBitmap) 
  }

  off_context_putImageData6() {
    let imageData = this.offContext.createImageData(100, 100)
    for (let i = 0; i < imageData.data!.length; i += 4) {
      imageData.data![i + 0] = 255
      imageData.data![i + 1] = 0
      imageData.data![i + 2] = 255
      imageData.data![i + 3] = 255
    }
    this.offContext.putImageData(imageData, 50, 50, 50, 50, 50, 50)
    let image = this.offContext.transferToImageBitmap()
    this.context.transferFromImageBitmap(image as ImageBitmap) 
  }
}