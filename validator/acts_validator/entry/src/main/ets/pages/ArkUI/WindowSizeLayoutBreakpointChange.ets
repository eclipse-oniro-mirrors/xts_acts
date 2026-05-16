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


import promptAction from '@ohos.promptAction';
import fs from '@ohos.file.fs';
import { router, ComponentContent } from '@kit.ArkUI';
import { matrix4 } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';
import FirstDialog from '../model/FirstDialog';
import Logger from '../model/Logger';
import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { uiObserver } from '@kit.ArkUI';
import window from '@ohos.window';
@Entry
@Component
struct TabBarIndicatorPixmap {
  @State name: string = 'RichEditior ComponentContent Keyboard';
  @State stepTips: string = '操作步骤:\n' + '1.注册窗口尺寸布局断点变化监听 \n' +
    '2.点击横屏 最上方出现文本，文本信息搜索log.\n' +'3.点击竖屏 最上方出现文本，文本信息搜索log.\n'+ '4.如果在非手机设备上进行测试，不使用23步。通过手动调整窗口大小来进行打印\n'+
    '预期结果：\n' + '234.触发widthBreakpoint和heightBreakpoint的callback回调，具体值与demo上方text文本一致\n'
  @State intervalNum: number = 0;
  @State text: string = '文本';
  @State isOk: boolean = false;
  @State barMode: BarMode = BarMode.Fixed;
  private changeOrientation(isLandscape: boolean) {
    let context = getContext(this) as common.UIAbilityContext;
    window.getLastWindow(context).then((lastWindow) => {
      lastWindow.setPreferredOrientation(isLandscape ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT)
    });
  }

  @State message: string = '';
  @State widthBreakpoint: WidthBreakpoint = WidthBreakpoint.WIDTH_SM;
  @State heightBreakpoint: HeightBreakpoint = HeightBreakpoint.HEIGHT_SM;
  winSizeLayoutBreakpointCallback = (info: uiObserver.WindowSizeLayoutBreakpointInfo) => {
    this.widthBreakpoint = info.widthBreakpoint;
    this.heightBreakpoint = info.heightBreakpoint;
    this.message = 'page1--widthBpt:' + this.widthBreakpoint.toString() + 'heightBpt:' + this.heightBreakpoint.toString();
    console.log('GBR page1 widthBpt：'+ this.widthBreakpoint.toString() + ' ' +'heightBpt:'+ this.heightBreakpoint.toString())
  }

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

  aboutToAppear(): void {
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
        Text(this.message)
        Button('注册窗口尺寸布局断点变化监听').fontSize(20).width('80%').margin({top: 20})
          .onClick(() => {
            this.getUIContext()
              .getUIObserver()
              .on('windowSizeLayoutBreakpointChange', this.winSizeLayoutBreakpointCallback);
          })
        Button('注销窗口尺寸布局断点变化监听').fontSize(20).width('80%').margin({top: 20})
          .onClick(() => {
            this.getUIContext()
              .getUIObserver()
              .off('windowSizeLayoutBreakpointChange', this.winSizeLayoutBreakpointCallback);
          })
        Button('全部解除').fontSize(20).width('80%').margin({top: 20})
          .onClick(() => {
            this.getUIContext()
              .getUIObserver()
              .off('windowSizeLayoutBreakpointChange');
          })
        Button('竖屏').fontSize(20).width('80%').margin({top: 20})
          .onClick(() => {
            this.changeOrientation(false)
          })
        Button('横屏').fontSize(20).width('80%').margin({top: 20})
          .onClick(() => {
            this.changeOrientation(true)
          })
      }.width('100%')
      .height('80%')
      .backgroundColor('#F1F3F5')

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