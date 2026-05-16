import hilog from '@ohos.hilog';
import { window } from '@kit.ArkUI';
import DemoActionManager from './model/DemoActionManager';
import XComponentContext from "./interface/XComponentContext"
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';

const TAG = '[AccessibilityDefaultFocusPage]';

let params = LocalStorage.getShared();

@Entry(params)
@Component
struct AccessibilityDefaultFocusPage {
  @State FillColor: string = '#FF000000';
  @State name: string = 'AccessibilityDefaultFocusPage';
  @State StepTips: string = '测试目的：验证无障碍接口AccessibilityDefaultFocus。\n' +
    '\n' +
    '操作步骤：开启屏幕朗读。\n' +
    '\n' +	'预期结果：若支持屏幕朗读，则开启屏幕朗读后绿框会绘制在按钮"组件四"上。若不支持屏幕朗读，直接按照失败处理走豁免。';;
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
      .margin({ bottom: '20vp' })
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
        Column() {
          Button("组件一").id("1");
          Button("组件二").id("2");
          Button("组件三").id("3");
          Button("组件四").id("4").accessibilityDefaultFocus(true);
        }
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

    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}