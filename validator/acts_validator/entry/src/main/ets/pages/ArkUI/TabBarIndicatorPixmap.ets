/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import Logger from '../model/Logger';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';
import { matrix4 } from '@kit.ArkUI';
import {
  DrawableDescriptor,
  PixelMapDrawableDescriptor,
} from '@kit.ArkUI';
import { image } from '@kit.ImageKit';

@Entry
@Component
struct TabBarIndicatorPixmap {
  @State name: string = 'TabBarIndicatorPixmap';
  @State stepTips: string = '操作步骤:\n' + '1.反复切换tabs\n' +
    '2.观察文本1下面的indicator\n' +
    '预期结果：\n' + '1.tabs切换效果正常\n' +
    '2.文本1下面的indicator显示正常\n'
  @State isOk: boolean = false;
  @State intervalNum: number = 0;
  @State isVertical: boolean = false;
  @State barOverlap: boolean = false;
  @State fadingEdge: boolean = false;
  @State currentIndex: number = 2;
  @State selectedIndex: number = 2;
  private controller: TabsController = new TabsController();

  @State text: string = '文本';
  @State barMode: BarMode = BarMode.Fixed;

  // 声明DrawableDescriptor对象
  @State pixmapDesc: DrawableDescriptor | null = null;
  @State pixelMapDesc: PixelMapDrawableDescriptor | null = null;

  @State subTabBorderRadius: number = 20;
  @State selectedMode: SelectedMode = SelectedMode.INDICATOR;

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    Button({ stateEffect: this.isOk }) {
      Image($r('app.media.ic_public_pass'))
        .width('20vp')
        .height('20vp')
    }
    .margin({ bottom: '20vp' })
    .width('30%')
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

  @Builder
  FailBtn(text: Resource, isFullScreen: boolean) {
    Button() {
      Image($r('app.media.ic_public_fail'))
        .width('20vp')
        .height('20vp')
    }
    .margin({ bottom: '20vp' })
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: {
          result: 'false', title: this.name,
        }
      });
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  async aboutToAppears() {
    const resManager = this.getUIContext().getHostContext()?.resourceManager;
    if (!resManager) {
      return;
    }
    // 创建普通DrawableDescriptor
    let pixmapDescResult = resManager.getDrawableDescriptor($r('app.media.icon').id);
    if (pixmapDescResult) {
      this.pixmapDesc = pixmapDescResult as DrawableDescriptor;
    }
    // 创建PixelMapDrawableDescriptor
    const pixelMap = await this.getPixmapFromMedia($r('app.media.icon'));
    this.pixelMapDesc = new PixelMapDrawableDescriptor(pixelMap);
  }

  // 辅助方法：从资源获取PixelMap
  private async getPixmapFromMedia(resource: Resource): Promise<image.PixelMap | undefined> {
    const unit8Array = await this.getUIContext().getHostContext()?.resourceManager.getMediaContent(resource.id);
    if (!unit8Array) {
      return undefined;
    }
    const imageSource = image.createImageSource(unit8Array.buffer.slice(0, unit8Array.buffer.byteLength));
    const pixelMap = await imageSource.createPixelMap({
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888
    });
    await imageSource.release();
    return pixelMap;
  }

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.stepTips, this.name);
  }

  onPageHide() {
    clearInterval(this.intervalNum);
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum);
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
          });
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

      Column() {
        Scroll() {
          Column() {

            Tabs({ index: this.currentIndex, controller: this.controller }) {
              TabContent() {
                Column().width('100%').height('100%').backgroundColor(Color.Pink)
              }.tabBar(SubTabBarStyle.of(this.text + '1')
                .indicator({
                  drawable: this.pixmapDesc,
                }))

              TabContent() {
                Column().width('100%').height('100%').backgroundColor(Color.Blue).borderRadius('12vp')
              }.tabBar('blue')
            }
            .backgroundColor(0xf1f3f5)
            .barMode(this.barMode)
            .vertical(this.isVertical)
            .barOverlap(this.barOverlap)
            .fadingEdge(this.fadingEdge)
            .onChange((index: number) => {
              this.currentIndex = index;
              this.selectedIndex = index;
            })
            .barHeight(140)
            .height('60%')
          }
          .width('100%')
          .height(500)
          .padding('24vp')
        }
      }.height('80%')
      .width('100%')
      .backgroundColor(Color.White)

      Row() {
        this.PassBtn($r('app.string.btn_fullscreen'), true);
        Button() {
          Image($r('app.media.ic_public_help'))
            .width('20vp')
            .height('20vp')
        }
        .margin({ bottom: '20vp' })
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          AlertDialog.show(
            {
              title: '操作提示',
              message: this.stepTips,
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

    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}