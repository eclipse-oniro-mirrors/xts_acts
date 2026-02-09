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

import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';

import { AnimatedDrawableDescriptor, PixelMapDrawableDescriptor } from '@kit.ArkUI'
import image from '@ohos.multimedia.image'
import { AnimationController } from '@ohos.arkui.drawableDescriptor'

const TAG = '[AnimationControllerPage]';

@Entry
@Component
struct AnimationControllerPage {
  @State name: string = 'AnimationControllerPage';
  @State StepTips: string =
    '操作步骤：' + '\n' + '1、点击c1 start,c1 stop,c1 pause,c1 resume(可不按照顺序点击),再点击c1 status' + '\n' +
      '2、点击c2 start,c2 stop,c2 pause,c2 resume(可不按照顺序点击),再点击c2 status' + '\n' +
      '3、点击c3 start,c3 stop,c3 pause,c3 resume(可不按照顺序点击),再点击c3 status' + '\n' +
      '预期结果：点击对应status按钮，可获取对应动图的状态（c3 status均返回undefined）,所有操作完成后，点击确认按钮';
  @State Vue: boolean = false;
  @State animatedDrawable1?: AnimatedDrawableDescriptor | Resource = undefined
  @State animatedDrawable2?: AnimatedDrawableDescriptor = undefined
  @State animatedDrawable3?: AnimatedDrawableDescriptor = undefined
  @State pixelmapDrawable?: DrawableDescriptor = undefined
  @State pixelmap?: PixelMap = undefined
  @State visible: Visibility = Visibility.Visible
  @State componentSize: string = '20%'
  @State status: AnimationStatus = AnimationStatus.Running
  @State msetxt: string = ''
  error?: BusinessError<void> = undefined

  aboutToAppear(): void {
    FirstDialog.ChooseDialog(this.StepTips, this.name);
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

  convertToAnimationStatus(status: AnimationStatus): string {
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

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.Vue == false) {
      Button({ stateEffect: this.Vue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .opacity(0.4)
      .onClick(() => {

      })
    } else {
      Button({ stateEffect: this.Vue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }.width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .onClick(() => {
        router.back({
          url: 'pages/ArkUI/ArkUI_index',
          params: {
            result: 'true ', title: this.name,
          }
        })
        promptAction.showToast({
          message: '通过', duration: 1000
        });
      })
    }
  }

  @Builder
  FailBtn(text: Resource, isFullScreen: boolean) {
    Button() {
      Image($r('app.media.ic_public_fail'))
        .width('20vp')
        .height('20vp')
    }
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: {
          result: 'false', title: this.name,
        }
      })
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($r('app.media.ic_public_back'))
            .width('20vp')
            .height('18vp')
            .margin({ left: '20vp' })
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          router.back({
            url: 'pages/ArkUI/ArkUI_index',
            params: { result: 'None' }
          })
        })

        Text(this.name)
          .fontColor(Color.White)
          .fontSize('18fp')
          .margin({ left: '-20vp' })

        Text('hello')
          .fontColor(Color.White)
          .visibility(Visibility.Hidden)
      }
      .backgroundColor(Color.Black)
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

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

        Divider().width('100%').height(10)
        Row({ space: 4 }) {
          Button('c1 start')
            .height('6%').fontSize(10).padding({ left: 5, right: 5 })
            .onClick(() => {
              if (this.animatedDrawable1 instanceof AnimatedDrawableDescriptor) {
                let drawable = this.animatedDrawable1 as AnimatedDrawableDescriptor
                drawable?.getAnimationController('Component1')?.start()
              }
            })
          Button('c1 stop')
            .height('6%').fontSize(10).padding({ left: 5, right: 5 })
            .onClick(() => {
              if (this.animatedDrawable1 instanceof AnimatedDrawableDescriptor) {
                let drawable = this.animatedDrawable1 as AnimatedDrawableDescriptor
                drawable?.getAnimationController('Component1')?.stop()
              }
            })
          Button('c1 pause')
            .height('6%').fontSize(10).padding({ left: 5, right: 5 })
            .onClick(() => {
              if (this.animatedDrawable1 instanceof AnimatedDrawableDescriptor) {
                let drawable = this.animatedDrawable1 as AnimatedDrawableDescriptor
                drawable?.getAnimationController('Component1')?.pause()
              }
            })
          Button('c1 resume')
            .height('6%').fontSize(10).padding({ left: 5, right: 5 })
            .onClick(() => {
              if (this.animatedDrawable1 instanceof AnimatedDrawableDescriptor) {
                let drawable = this.animatedDrawable1 as AnimatedDrawableDescriptor
                drawable?.getAnimationController('Component1')?.resume()
              }
            })
        }

        Divider().width('100%').height(10)
        Row({ space: 4 }) {
          Button('c2 start')
            .height('6%').fontSize(10).padding({ left: 5, right: 5 })
            .onClick(() => {
              if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
                let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
                drawable?.getAnimationController('Component2')?.start()
              }
            })
          Button('c2 stop')
            .height('6%').fontSize(10).padding({ left: 5, right: 5 })
            .onClick(() => {
              if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
                let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
                drawable?.getAnimationController('Component2')?.stop()
              }
            })
          Button('c2 pause')
            .height('6%').fontSize(10).padding({ left: 5, right: 5 })
            .onClick(() => {
              if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
                let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
                drawable?.getAnimationController('Component2')?.pause()
              }
            })
          Button('c2 resume')
            .height('6%').fontSize(10).padding({ left: 5, right: 5 })
            .onClick(() => {
              if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
                let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
                drawable?.getAnimationController('Component2')?.resume()
              }
            })
        }

        Divider().width('100%').height(10)
        Row({ space: 4 }) {
          Button('c3 start')
            .height('6%').fontSize(10).padding({ left: 5, right: 5 })
            .onClick(() => {
              if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
                let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
                drawable?.getAnimationController()?.start()
              }
            })
          Button('c3 stop')
            .height('6%').fontSize(10).padding({ left: 5, right: 5 })
            .onClick(() => {
              if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
                let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
                drawable?.getAnimationController()?.stop()
              }
            })
          Button('c3 pause')
            .height('6%').fontSize(10).padding({ left: 5, right: 5 })
            .onClick(() => {
              if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
                let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
                drawable?.getAnimationController()?.pause()
              }
            })
          Button('c3 resume')
            .height('6%').fontSize(10).padding({ left: 5, right: 5 })
            .onClick(() => {
              if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
                let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
                drawable?.getAnimationController()?.resume()
              }
            })
        }

        Divider().width('100%').height(10)
        Row({ space: 4 }) {
          Button('c1 status')
            .height('6%').fontSize(10).padding({ left: 5, right: 5 })
            .onClick(() => {
              if (this.animatedDrawable1 instanceof AnimatedDrawableDescriptor) {
                let drawable = this.animatedDrawable1 as AnimatedDrawableDescriptor
                let status = drawable?.getAnimationController('Component1')?.getStatus()
                try {
                  this.msetxt = 'status'
                  this.getUIContext()
                    .getPromptAction()
                    .showToast({ message: `status: ${this.convertToAnimationStatus(status)}` })
                } catch (error) {
                  // TODO: Implement error handling.
                }
              }
            })
          Button('c2 status')
            .height('6%').fontSize(10).padding({ left: 5, right: 5 })
            .onClick(() => {
              if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
                let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
                let status = drawable?.getAnimationController('Component2')?.getStatus()
                try {
                  this.getUIContext()
                    .getPromptAction()
                    .showToast({ message: `status: ${this.convertToAnimationStatus(status)}` })
                } catch (error) {
                  // TODO: Implement error handling.
                }
              }
            })
          Button('c3 status')
            .height('6%').fontSize(10).padding({ left: 5, right: 5 })
            .onClick(() => {
              if (this.animatedDrawable2 instanceof AnimatedDrawableDescriptor) {
                let drawable = this.animatedDrawable2 as AnimatedDrawableDescriptor
                let status = drawable?.getAnimationController()?.getStatus()
                try {
                  this.getUIContext()
                    .getPromptAction()
                    .showToast({ message: `status: ${this.convertToAnimationStatus(status)}` })
                } catch (error) {
                  // TODO: Implement error handling.
                }
              }
            })
        }

        Button('确认')
          .margin(10)
          .width('30%')
          .height('6%')
          .onClick(() => {
            this.Vue = true;
          })
      }
      .height('70%')
      .width('100%')
      .backgroundColor(Color.White)

      Row() {
        this.PassBtn($r('app.string.btn_fullscreen'), true);
        Button() {
          Image($r('app.media.ic_public_help'))
            .width('20vp')
            .height('20vp')
        }
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          AlertDialog.show(
            {
              title: '操作提示',
              message: this.StepTips,
              confirm: {
                value: 'OK',
                action: () => {
                }
              }
            }
          )
        })

        this.FailBtn($r('app.string.btn_fullscreen'), true);
      }
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}