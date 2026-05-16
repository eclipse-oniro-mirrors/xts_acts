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

import { AnimatedDrawableDescriptor } from '@kit.ArkUI'
import { image } from '@kit.ImageKit'

const TAG = '[AnimatedDrawableDescriptorFrameDurations]';

@Entry
@Component
struct AnimatedDrawableDescriptorFrameDurations {
  @State name: string = 'AnimatedDrawableDescriptorFrameDurations';
  @State StepTips: string =
    '操作步骤：观察两组图片播放速度' + '\n' +
      '预期结果：第一组播放速度快，间隔时间短；第二组播放速度慢，间隔时间长';
  @State Vue: boolean = false;
  @State drawable1?: DrawableDescriptor = undefined
  @State drawable2?: DrawableDescriptor = undefined
  resources: Resource[] = [
    $r('app.media.image1'),
    $r('app.media.image2'),
    $r('app.media.image3'),
    $r('app.media.image4')
  ]

  createPixelMap(src: Resource): image.PixelMap | undefined {
    let manager = this.getUIContext().getHostContext()?.resourceManager
    if (manager) {
      try {
        let buffer = manager.getMediaContentSync(src.id).buffer
        let source = image.createImageSource(buffer)
        let pixelmap = source.createPixelMapSync()
        return pixelmap;
      } catch (error) {
        console.info(`error = ${JSON.stringify(error)}`)
      }
    }
    return undefined
  }

  createAnimationDrawable() {
    let pixelMaps: Array<PixelMap> = []
    let frameDurations: Array<number> = []
    for (let i = 0; i < this.resources.length; i++) {
      let pixelMap = this.createPixelMap(this.resources[i])
      if (pixelMap) {
        pixelMaps.push(pixelMap)
        frameDurations.push(1000)
      }
    }
    this.drawable1 = new AnimatedDrawableDescriptor(pixelMaps, { iterations: -1, duration: 400 })
    this.drawable2 = new AnimatedDrawableDescriptor(pixelMaps, { iterations: -1, frameDurations: frameDurations })
  }

  aboutToAppear(): void {
    FirstDialog.ChooseDialog(this.StepTips, this.name);
    this.createAnimationDrawable()
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
        Row({ space: 5 }) {
          Image(this.drawable1)
            .width('40%')
            .height('45%')
            .borderColor(Color.Red)
            .borderWidth(1)
          Image(this.drawable2)
            .width('40%')
            .height('45%')
            .borderColor(Color.Red)
            .borderWidth(1)
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