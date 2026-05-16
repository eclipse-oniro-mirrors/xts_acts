/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import { AnimatedDrawableDescriptor, PixelMapDrawableDescriptor } from '@kit.ArkUI'
import image from '@ohos.multimedia.image'
import { AnimationController } from '@ohos.arkui.drawableDescriptor'


@Entry
@Component
struct AnimationControllerPage {
  @State animatedDrawable1?: AnimatedDrawableDescriptor | Resource = undefined
  @State animatedDrawable2?: AnimatedDrawableDescriptor = undefined
  @State animatedDrawable3?: AnimatedDrawableDescriptor = undefined
  @State pixelmapDrawable?: DrawableDescriptor = undefined
  @State pixelmap?: PixelMap = undefined
  @State visible: Visibility = Visibility.Visible
  @State componentSize: string = '20%'
  @State status: AnimationStatus = AnimationStatus.Running
  @State msetxt: string = ''
  @State statusText: string = ''
  error?: BusinessError<void> = undefined

  aboutToAppear(): void {
    let resManager = this.getUIContext().getHostContext()?.resourceManager
    if (resManager) {
      let buffer1 = resManager.getMediaContentSync($r('app.media.img1')).buffer
      let buffer2 = resManager.getMediaContentSync($r('app.media.img2')).buffer
      let buffer3 = resManager.getMediaContentSync($r('app.media.img3')).buffer
      let imageSource1 = image.createImageSource(buffer1)
      let imageSource2 = image.createImageSource(buffer2)
      let imageSource3 = image.createImageSource(buffer3)
      if (imageSource1) {
        imageSource1.createPixelMapList().then((pixelMaps: Array<PixelMap>) => {
          this.animatedDrawable1 =
          new AnimatedDrawableDescriptor(pixelMaps, { iterations: -1, duration: 3000, autoPlay: false })
        })
      }
      if (imageSource2) {
        imageSource2.createPixelMapList().then((pixelMaps: Array<PixelMap>) => {
          this.animatedDrawable2 =
          new AnimatedDrawableDescriptor(pixelMaps, { iterations: -1, duration: 3000, autoPlay: true })
        })
      }
      if (imageSource3) {
        imageSource3.createPixelMapList().then((pixelMaps: Array<PixelMap>) => {
          this.animatedDrawable3 =
          new AnimatedDrawableDescriptor(pixelMaps, { iterations: 1, duration: 3000, autoPlay: true })
        })
      }
    }
  }

  convertToAnimationStatus(status: AnimationStatus | undefined): string {
    switch (status) {
      case AnimationStatus.Initial:
        return 'Initial';
      case AnimationStatus.Running:
        return 'Running';
      case AnimationStatus.Stopped:
        return 'Stopped';
      case AnimationStatus.Paused:
        return 'Paused';
    }
    return 'undefined'
  }

  build() {
    Column({ space: 10 }) {
      Row({ space: 3 }) {
        Image(this.animatedDrawable1)
          .borderColor(Color.Red)
          .borderWidth(1)
          .width(this.componentSize)
          .height(this.componentSize)
          .renderMode(ImageRenderMode.Template)
          .visibility(this.visible)
          .id('Component1')

        Image(this.animatedDrawable2)
          .borderColor(Color.Red)
          .borderWidth(1)
          .width(this.componentSize)
          .height(this.componentSize)
          .renderMode(ImageRenderMode.Template)
          .visibility(this.visible)
          .syncLoad(true)
          .id('Component2')

        Image(this.animatedDrawable2)
          .borderColor(Color.Red)
          .borderWidth(1)
          .width(this.componentSize)
          .height(this.componentSize)
          .renderMode(ImageRenderMode.Template)
          .visibility(this.visible)
          .syncLoad(true)
      }

      Row({ space: 4 }) {
        Button('c1 start')
          .id('c1start')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animatedDrawable1 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animatedDrawable1 as AnimatedDrawableDescriptor
              drawable?.getAnimationController('Component1')?.start()
            }
          })
        Button('c1 stop')
          .id('c1stop')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animatedDrawable1 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animatedDrawable1 as AnimatedDrawableDescriptor
              drawable?.getAnimationController('Component1')?.stop()
            }
          })
        Button('c1 pause')
          .id('c1pause')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animatedDrawable1 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animatedDrawable1 as AnimatedDrawableDescriptor
              drawable?.getAnimationController('Component1')?.pause()
            }
          })
        Button('c1 resume')
          .id('c1resume')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animatedDrawable1 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animatedDrawable1 as AnimatedDrawableDescriptor
              drawable?.getAnimationController('Component1')?.resume()
            }
          })
      }

      Row({ space: 4 }) {
        Button('c2 start')
          .id('c2start')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
              drawable?.getAnimationController('Component2')?.start()
            }
          })
        Button('c2 stop')
          .id('c2stop')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
              drawable?.getAnimationController('Component2')?.stop()
            }
          })
        Button('c2 pause')
          .id('c2pause')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
              drawable?.getAnimationController('Component2')?.pause()
            }
          })
        Button('c2 resume')
          .id('c2resume')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
              drawable?.getAnimationController('Component2')?.resume()
            }
          })
      }

      Row({ space: 4 }) {
        Button('c3 start')
          .id('c3start')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
              drawable?.getAnimationController()?.start()
            }
          })
        Button('c3 stop')
          .id('c3stop')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
              drawable?.getAnimationController()?.stop()
            }
          })
        Button('c3 pause')
          .id('c3pause')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
              drawable?.getAnimationController()?.pause()
            }
          })
        Button('c3 resume')
          .id('c3resume')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
              drawable?.getAnimationController()?.resume()
            }
          })
      }

      Row({ space: 4 }) {
        Button('c1 status')
          .id('c1status')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animatedDrawable1 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animatedDrawable1 as AnimatedDrawableDescriptor
              let status = drawable?.getAnimationController('Component1')?.getStatus()
              try {
                this.msetxt = 'status'
                this.getUIContext()
                  .getPromptAction()
                  .showToast({ message: `status: ${this.convertToAnimationStatus(status)}` })
                this.statusText = this.convertToAnimationStatus(status)
              } catch (error) {
                // TODO: Implement error handling.
              }
            }
          })
        Button('c2 status')
          .id('c2status')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
              let status = drawable?.getAnimationController('Component2')?.getStatus()
              try {
                this.getUIContext()
                  .getPromptAction()
                  .showToast({ message: `status: ${this.convertToAnimationStatus(status)}` })
                this.statusText = this.convertToAnimationStatus(status)
              } catch (error) {
                // TODO: Implement error handling.
              }
            }
          })
        Button('c3 status')
          .id('c3status')
          .height('6%')
          .fontSize(10)
          .padding({ left: 5, right: 5 })
          .onClick(() => {
            if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
              let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
              let status = drawable?.getAnimationController()?.getStatus()
              try {
                this.getUIContext()
                  .getPromptAction()
                  .showToast({ message: `status: ${this.convertToAnimationStatus(status)}` })
                this.statusText = this.convertToAnimationStatus(status)
              } catch (error) {
                // TODO: Implement error handling.
              }
            }
          })
      }

      Text(this.statusText).id('statusText')
    }
    .height('100%')
    .width('100%')
    .margin({ top: 30 })
  }
}