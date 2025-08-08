import hilog from '@ohos.hilog';
import { window } from '@kit.ArkUI';
import DemoActionManager from './model/DemoActionManager';
import XComponentContext from "./interface/XComponentContext"
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';
import { Want } from '@kit.AbilityKit';

const TAG = '[EmbeddedComponentInstanceTest]';

let params = LocalStorage.getShared();

@Entry(params)
@Component
struct EmbeddedComponentInstanceTest {
  @State FillColor: string = '#FF000000';
  @State name: string = 'EmbeddedComponentInstanceTest';
  @State StepTips: string = '测试目的：验证EmbeddedComponentInstance。\n' +
    '\n' +    '操作步骤：将当前窗口最小化\n' +
    '\n' +	'预期结果：若为PC环境，则页面依次输出"Termination: code = 0, want = undefined"、"EmbeddedUIExtAbility"、"Error: code = 100018";若不为PC环境，则页面输出"Error: code = 100018"、"Error: code = 100018"。';;
  @State Vue: boolean = true;
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
  @State currentStatus: string = "init";
  @State text: string = ''
  @State message01: string = 'Message: '
  @State message02: string = 'Message: '
  private want: Want = {
    bundleName: "com.example.actsvalidator",
    abilityName: "EntryEmbeddedUIExtAbility",
  }
  private want1: Want = {
    bundleName: "com.example.actsvalidatortest",
    abilityName: "EntryEmbeddedUIExtAbility",
  }
  private xComponentContext: XComponentContext | undefined = undefined;
  controller: TextInputController = new TextInputController()
  @LocalStorageLink('mainWindow') private mainWindow: window.Window | undefined = undefined

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
      if (this.text1 === 'HOVER_ENTER' && this.text2 === 'HOVER_MOVE' && this.text3 === 'HOVER_EXIT' &&
        this.text4 === 'HOVER_CANCEL') {
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

      Column({ space: 12 }) {
        // 业务代码
        Row() {
          Column() {
            Text(this.message01).fontSize(30)
            EmbeddedComponent(this.want, EmbeddedType.EMBEDDED_UI_EXTENSION)
              .width('90%')
              .height('40%')
              .onTerminated((info) => {
                this.message01 = 'Termination: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
              })
              .onError((error) => {
                this.message01 = 'Error: code = ' + error.code;
              })

            Text("————————————————————————————————————————————————————————")
            Text(this.message02).fontSize(30)
            EmbeddedComponent(this.want1, EmbeddedType.EMBEDDED_UI_EXTENSION)
              .width('90%')
              .height('40%')
              .onTerminated((info) => {
                this.message02 = 'Termination: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
              })
              .onError((error) => {
                this.message02 = 'Error: code = ' + error.code;
              })
          }
          .width('100%')
        }
        .height('100%')
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

    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}