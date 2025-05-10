/**
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
import gamecrontroller from "libnativegamecrontroller.so";
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';
const TAG = '[FocusAxisEventCTest]';

@Entry
@Component
struct FocusAxisEventExampleC {
  @State text: string = ''
  @State axisValue: string = ''
  @State name: string = 'GameCtronllerCTest';
  @State Vue: boolean = false;
  @State intervalNum: number = 0;

  @State StepTips: string = '设备使用游戏手柄操作时\n' + '操作步骤:\n' + '1、使用游戏手柄走焦在按钮上(十字键,左右遥感,LT,RT),查看返回的数据\n' +
    '预期结果：\n' + '1.使用十字键时,上键时absHat0Y的值为-1,下键时absHat0Y的值为1,左键时absHat0X的值为-1,右键时absHat0X的值为1\n' +
    '2.使用左摇杆时,上操作的absY的值范围在[-1,0]区间, 下操作的absY的值范围在[0,1]区间, 左操作的absX的值范围在[-1,0]区间, 右操作的absX的值范围在[0,1]区间\n' +
    '3.使用右摇杆时,上操作的absRz的值范围在[-1,0]区间, 下操作的absRz的值范围在[0,1]区间, 左操作的absZ的值范围在[-1,0]区间, 右操作的absRz的值范围在[0,1]区间\n' +
    '4.使用LT操作时, absBrake的值范围在[0,1]区间,使用RT操作时absGas的值范围在[0,1]区间';
  aboutToAppear(): void {
    //this.getUIContext().getFocusController().requestFocus().activate(true).
    // this.getUIContext().getFocusController().requestFocus("focesss")
    FirstDialog.ChooseDialog(this.StepTips, this.name);
  }


  aboutToDisappear(): void {
    //this.getUIContext().getFocusController().activate(false)
    this.getUIContext().getFocusController().activate(false)
    clearInterval(this.intervalNum)
  }

  onPageHide() {
    clearInterval(this.intervalNum)
  }

  onPageShow() {
    //this.getUIContext().getFocusController().requestFocus("focesss")
    this.intervalNum = setInterval(() => {
        this.Vue = true;
    }, 500)
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


      Column() {
        Row() {
          Text(`当前只支持游戏手柄测试`).fontColor(Color.Green).fontSize('18fp').margin({top:15})
        }

        Column() {
          XComponent({
            id: 'xcomponentId',
            type: "node",
            libraryname: 'nativegamecrontroller'
          }).backgroundColor(Color.White)
            .onAppear(() => {
              gamecrontroller.createNativeNode("xcomponentId", this.getUIContext());
            }).width("100%")
            .id("xcomponent")
        }



        Text(this.axisValue).padding(15)
        Text(this.text).padding(15)


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

    }.height('100%').width('100%')
    .backgroundColor('#F1F3F5')


  }
}