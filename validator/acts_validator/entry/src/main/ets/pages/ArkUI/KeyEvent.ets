/**

 Copyright (c) 2025 Huawei Device Co., Ltd.
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 http://www.apache.org/licenses/LICENSE-2.0
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';
import { unifiedDataChannel, uniformTypeDescriptor } from '@kit.ArkData';

const TAG = '[keyEvent]';

@Entry
@Component
struct keyEventExample {
  @State text: string = ''
  @State axisValue: string = ''
  @State name: string = 'keyEvent';
  @State keyEventVue: boolean = false;
  @State intervalNum: number = 0;
  @State hoverMoveText: string = '';
  @State StepTips: string = '操作步骤：使用键盘分别点击CapsLock、NumLock键' + '\n' + '预期结果：指示灯亮起，结果为True'
  @State uri: string = ""
  @State AblockArr: string[] = []
  @State BblockArr: string[] = []
  @State AVisible: Visibility = Visibility.Visible
  @State dragSuccess: Boolean = false

  aboutToAppear(): void {

    FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  aboutToDisappear(): void {

    clearInterval(this.intervalNum)
  }

  onPageHide() {
    clearInterval(this.intervalNum)
  }

  onPageShow() {

    this.intervalNum = setInterval(() => {
      if (this.dragSuccess) {
        this.keyEventVue = true
      }
    }, 500)
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.keyEventVue == false) {
      Button({ stateEffect: this.keyEventVue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .margin({ bottom: '20vp' })
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .opacity(0.4)
      .onClick(() => {

      })
    } else {
      Button({ stateEffect: this.keyEventVue }) {
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
        Text(this.text).padding(15).margin(10).key('keyInfo')
        Button('KeyEvent')
          .onKeyEvent((event?: KeyEvent) => {
            if (event) {
              this.text = '\nkeyCode:' + event.keyCode + '\nkeyText:' + event.keyText +
                '\nisNumLockOn: ' + event.isNumLockOn + '\nisCapsLockOn: ' + event.isCapsLockOn
              if(event.isNumLockOn==true&&event.isCapsLockOn==true){
                this.dragSuccess = true
              }
            }
          })
          .focusable(true)
          .defaultFocus(true)
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