/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import Logger from '../model/Logger';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';
import { image } from '@kit.ImageKit';
import { CursorController } from '@kit.ArkUI';

@Entry
@Component
struct transform3DDemo {
  @State name: string = 'SetCustomCursor';
  @State isOk: boolean = false;
  @State intervalNum: number = 0;
  @State stepTips: string =
    '操作步骤:\n' +
    '1、点击load image按钮加载自定义光标图片\n' +
    '2、鼠标悬浮在蓝色区域，查看自定义光标效果,(这个接口只对鼠标光标生效，无法连接鼠标的设备无法生效)\n' +
    '预期结果：\n' +
    '1、鼠标放在蓝色区域光标变为自定义图片，离开蓝色区域恢复默认光标\n';
    
  cursorController: CursorController = this.getUIContext().getCursorController();
  @State pixelMap: image.PixelMap | undefined = undefined;

  async loadPixelMapFromRawFile(): Promise<void> {
    try {
      const uiContext = this.getUIContext();
      if (!uiContext) {
        console.error('UIContext is undefined');
        return;
      }
      const context = uiContext.getHostContext();
      if (!context) {
        console.error('HostContext is undefined');
        return;
      }
      const resourceMgr = context.resourceManager;
      if (!resourceMgr) {
        console.error('ResourceManager is undefined');
        return;
      }
      const fileData: Uint8Array = await resourceMgr.getRawFileContent('image2.png');
      const buffer = fileData.buffer.slice(0);
      const imageSource = image.createImageSource(buffer);
      const pixelMap = await imageSource.createPixelMap({
        desiredSize: { width: 32, height: 32 }
      });
      this.pixelMap = pixelMap;
      console.info('Custom cursor loaded successfully');
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to load cursor: ${err.code}, ${err.message}`);
    }
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    Button({ stateEffect: this.isOk }) {
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
      });
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  aboutToAppear() {
    // 修改：使用stepTips弹出提示框（和参考代码格式一致）
    FirstDialog.ChooseDialog(this.stepTips, this.name);
  }

  onPageHide() {
    clearInterval(this.intervalNum);
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum);
    // 释放自定义光标资源
    if (this.pixelMap) {
      this.pixelMap.release();
      this.pixelMap = undefined;
    }
    this.cursorController.restoreDefault();
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
          Column({ space: 5 }) {
            // 加载自定义光标按钮
            Button('load image')
             .width('40%')
             .height('7%')
             .fontSize('30vp')
             .margin(70)
             .backgroundColor(Color.Blue)
             .onClick(() => {
                this.loadPixelMapFromRawFile();
              })
            // 自定义光标触发区域
            Row()
             .height(200)
             .width(200)
             .backgroundColor(Color.Blue)
             .onHover((isHover: boolean) => {
                if (isHover && this.pixelMap != undefined) {
                  this.cursorController.setCustomCursor(this.pixelMap, 16, 16);
                } else {
                  this.cursorController.restoreDefault();
                }
              })
          }.width('100%')
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