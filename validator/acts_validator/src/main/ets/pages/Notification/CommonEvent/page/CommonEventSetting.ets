/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import router from '@ohos.router';
import commonEvent from '@ohos.commonEventManager';
import common from '@ohos.app.ability.common';
import featureSetting from '../model/SettingFeature';
import fs from '@ohos.file.fs';
import promptAction from '@ohos.promptAction';
import screenshot from '@ohos.screenshot';
import image from '@ohos.multimedia.image';
import mediaLibrary from '@ohos.multimedia.mediaLibrary';
import Logger from '../../../model/Logger';
import FirstDialog from '../../../model/FirstDialog';

const TAG = '[Screenshot]';
let path = globalThis.dir;

class EventData {
  event: string = '';
  title: Resource | string = null;
}

@Entry
@Component
struct CommonEventSetting {
  scroller: Scroller = new Scroller();
  private featureSetting: featureSetting = new featureSetting(getContext() as common.UIAbilityContext);
  private dataSource: Array<EventData> = [
    { event: commonEvent.Support.COMMON_EVENT_SCREEN_OFF, title: '是否记录灭屏事件' },
    { event: commonEvent.Support.COMMON_EVENT_SCREEN_ON, title: '是否记录亮屏事件' },
    { event: commonEvent.Support.COMMON_EVENT_SCREEN_LOCKED, title: '是否记录锁屏事件' },
    { event: commonEvent.Support.COMMON_EVENT_SCREEN_UNLOCKED, title: '是否记录解锁屏事件' }
  ];
  @State name: string = 'CommonEventSetting'
  @State StepTips: string = '操作步骤：\n请选择不同事件的监听状态\n点击进入监听页按钮'

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
        url: 'pages/Notification/Notification_index',
        params: { result: 'false', title: this.name,
        }
      })
      this.getScreen(isFullScreen);
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
    this.featureSetting.init();
  }

  build() {
    Column({ space: 8 }) {
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
            url: 'pages/Notification/Notification_index',
            params: { result: 'None', }
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

      Row() {
        Flex({
          direction: FlexDirection.Column,
          alignItems: ItemAlign.Center,
          justifyContent: FlexAlign.SpaceBetween
        }) {
          Scroll(this.scroller) {
            Column() {
              ForEach(this.dataSource, (item: EventData) => {
                Column() {
                  Text(item.title)
                    .width('100%')
                    .fontSize(14)
                    .textAlign(TextAlign.Start)
                    .fontColor(Color.White)
                    .margin({ bottom: 5, top: 5 })
                  Flex({
                    direction: FlexDirection.Row,
                    justifyContent: FlexAlign.Center,
                    alignItems: ItemAlign.Center
                  }) {
                    Column() {
                      Text('一直').fontSize(14)
                      Radio({ value: 'always', group: item.event })
                        .id(item.event + '0')
                        .checked(this.featureSetting.checkStateForAlways(item.event))
                        .height(20)
                        .width(20)
                        .onChange((value: boolean) => {
                          console.info('onChange一直====' + value)
                          console.info('onChange一直==item.event==' + item.event)
                          if (value) {
                            console.info('onChange一直==changeStateToAlways==' + value)
                            this.featureSetting.changeStateToAlways(item.event)
                          }
                        })
                    }

                    Divider()
                      .vertical(true)
                      .margin(20)
                      .height(20)
                    Column() {
                      Text('从不')
                        .fontSize(14)
                      Radio({ value: 'never', group: item.event })
                        .id(item.event + '2')
                        .checked(this.featureSetting.checkStateForNever(item.event))
                        .height(20)
                        .width(20)
                        .onChange((value: boolean) => {
                          console.info('onChange从不====' + value)
                          console.info('onChange从不==item.event==' + item.event)
                          if (value) {
                            console.info('onChange从不==changeStateToAlways==' + value)
                            this.featureSetting.changeStateToNever(item.event)
                          }
                        })
                    }
                  }.padding({ top: 10 })
                  .backgroundColor(0xfbfafb)
                  .borderRadius(10)
                  .opacity(0.8)
                }
                .width('100%')
              })
              Button('进入监听页')
                .margin({ top: 54 })
                .onClick(() => {
                  router.pushUrl({ url: 'pages/Notification/CommonEvent/page/CommonEvent' })
                })
            }
            .width('100%')
          }
          .scrollBarWidth('6vp')
          .scrollBarColor('#cccccc')
        }
      }
      .width('100%')
      .height('80%')
      .justifyContent(FlexAlign.SpaceEvenly)

      Row() {
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
    .backgroundColor(Color.Black)
    .width('100%')
    .height('100%')
  }

  async savePicture(data: image.PixelMap, context: any) {
    Logger.info(TAG, `savePicture`);
    let packOpts: image.PackingOption = {
      format: "image/jpeg", quality: 100
    };
    let info = {
      prefix: 'IMG_', suffix: '.jpg', directory: mediaLibrary.DirectoryType.DIR_IMAGE
    };
    let name = this.name;
    let displayName = `${info.prefix}${name}${info.suffix}`;
    let dirPath = path + '/screenshot' + '/' + displayName;
    let imagePackerApi = image.createImagePacker();
    let arrayBuffer = await imagePackerApi.packing(data, packOpts);
    let fd = fs.openSync(dirPath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    imagePackerApi.release();
    try {
      await fs.write(fd.fd, arrayBuffer);
    } catch (err) {
      Logger.error(`write failed, code is ${err.code}, message is ${err.message}`);
    }
    await fs.close(fd);
    Logger.info(TAG, `write done`);
  }

  getScreen = (isFullScreen: boolean) => {
    let screenshotOptions: screenshot.ScreenshotOptions = {
      screenRect: { left: 0, top: 0, width: 400, height: 400 },
      imageSize: { width: 400, height: 400 },
      rotation: 0,
      displayId: 0
    };
    if (isFullScreen) {
      screenshotOptions = {
        rotation: 0
      }
    }
    try {
      screenshot.save(screenshotOptions, (err, data: image.PixelMap) => {
        if (err) {
          Logger.info(TAG, `Failed to save the screenshot. Error:${JSON.stringify(err)}`);
        }
        Logger.info(TAG, 'save callback');
        this.savePicture(data, getContext(this) as any);
      })
    } catch (err) {
      Logger.error(`save failed, code is ${err.code}, message is ${err.message}`);
    }
  }
}
