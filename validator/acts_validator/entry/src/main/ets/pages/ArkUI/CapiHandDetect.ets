/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';
import nativeNode from "libnativeNode.so";

const TAG = '[CapiHandDetect]';

@Entry
@Component
struct CapiHandDetect {
  @State FillColor: string = '#FF000000';
  @State name: string = 'CapiHandDetect';
  @State StepTips: string =  '提示：单一手势左右手识别接口，返回值hand1与hand2为:未知=0，左手=1，右手=2当前仅在当前旗舰手机机型上能正确识别，其它设备均识别为0，下面所有预期结果打印，需要在hilog日志中，搜索关键字handEvent，查看最后一组hand1与hand2的值\n' +
    '操作步骤：1、左手拿手机，左手长按‘单一手势+onTouch’按钮\n'+'\n'+
    '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n'+
    '操作步骤：左手拿手机，右手长按‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手长按‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手长按‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：双指长按‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：左手拿手机，左手拖动‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，右手拖动‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手拖动‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手拖动‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：双指拖动‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：双指捏合‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：双指旋转‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：左手拿手机，左手滑动‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，右手滑动‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手滑动‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手滑动‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：双指滑动‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：左手拿手机，左手点击‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，右手点击‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手点击‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手点击‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，左手双击‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，右手双击‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手双击‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手双击‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：双指点击‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：双指双击‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：左手拿手机，左手长按后松手再拖动‘互斥手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，右手长按后松手再拖动‘互斥手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手长按后松手再拖动‘互斥手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手长按后松手再拖动‘互斥手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：双指长按后松手再拖动‘互斥手势组’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：左手拿手机，左手长按+拖动‘并行手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，右手长按+拖动‘并行手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手长按+拖动‘并行手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手长按+拖动‘并行手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：双指长按+拖动‘并行手势组’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：左手拿手机，左手触摸‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，右手触摸‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手触摸‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手触摸‘单一手势+onTouch’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：双指触摸‘单一手势+onTouch’按钮\n' + '预期结果：hand1与hand2打印0“\n' +
    '操作步骤：左手拿手机，左手长按+拖动‘顺序手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：左手拿手机，右手长按+拖动‘顺序手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，左手长按+拖动‘顺序手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印1，其它设备均打印0“\n' +
    '操作步骤：右手拿手机，右手长按+拖动‘顺序手势组’按钮\n' + '预期结果：旗舰手机hand1与hand2打印2，其它设备均打印0“\n' +
    '操作步骤：双指长按+拖动‘顺序手势组’按钮\n' + '预期结果：hand1与hand2打印0“\n';
  @State Vue: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State yesEnable: boolean = false
  // 默认不支持
  @State onAccessibilityHoverEnable: boolean = false;
  @State hoverText: string = 'no hover';
  @State color: Color = Color.Blue;
  @State text1: string = ""
  @State text2: string = ""
  @State text3: string = ""
  @State text4: string = ""

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

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      if (this.text1 === 'HOVER_ENTER' && this.text2 === 'HOVER_MOVE' && this.text3 === 'HOVER_EXIT' &&this.text4 === 'HOVER_CANCEL') {
        this.Vue = true;
      }
    }, 500)
  }

  onPageHide() {
    clearInterval(this.intervalNum)
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum)
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

      Column() {
        XComponent({
          id: 'xcomponentId',
          type: "node",
          libraryname: 'nativeNode'
        }).backgroundColor(Color.White)
          .onAppear(() => {
            nativeNode.createNativeNode("xcomponentId", this.getUIContext());
            this.Vue = true;
          })
          .height("70%")
          .width("100%")
          .id("xcomponent")
      }

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
      .margin({ bottom: '20vp' })
    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}