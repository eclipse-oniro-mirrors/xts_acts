import hilog from '@ohos.hilog';
import { window } from '@kit.ArkUI';
import DemoActionManager from './model/DemoActionManager';
import XComponentContext from "./interface/XComponentContext"
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';

const TAG = '[AccessibilityProperty]';

let params = LocalStorage.getShared();

@Entry(params)
@Component
struct AccessibilityThirdFramework {
  @State FillColor: string = '#FF000000';
  @State name: string = 'AccessibilityProperty';
  @State StepTips: string = '设备安装且开启辅助应用时（1、从compatibility仓对应acts-validator目录下载setting.zip，' +
    '解压后运行send_hap.bat；2、从compatibility仓对应acts-validator目录下载MyApplication.hap并安装；' +
    '3、开启手机，点击设置-辅助功能-扩展服务-已安装的服务-打开label）'+
    '操作步骤：\n'+
    '1、点击findNextFocusAccessibilityNode\n'+
    '2、点击findElementById1\n'+
    '3、点击findFocusedAccessibilityNode\n'+
    '4、点击getPosition\n'+
    '5、点击executeAccessibilityActionClick\n'+
    '6、点击findElementByText\n'+
    '预期结果：\n'+
    '1、日志输出 FindNextFocusAccessibilityNode elementId\n'+
    '2、日志输出 FindAccessibilityNodeInfosById start,elementId\n'+
    '3、日志输出 FindFocusedAccessibilityNode start,elementId\n'+
    '4、日志输出 GetAccessibilityNodeCursorPosition\n'+
    '5、日志输出 ExecuteAccessibilityAction elementId\n'+
    '6、日志输出 FindAccessibilityNodeInfosByText start,elementId'
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
        Row() {
          Text(`是否设备支持屏幕朗读`).fontColor(Color.Green).fontSize('18fp').margin({ top: 20 })
        }

        Row() {
          Column() {
            Button(`不支持`)
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .width('30%')
              .enabled(!this.yesEnable)
              .opacity(!this.yesEnable ? 1 : 0.4)
              .onClick(async () => {
                this.Vue = true
              })
          }

          Column() {
            Button(`支持`)
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .width('30%')
              .onClick(async () => {
                this.yesEnable = true
                this.onAccessibilityHoverEnable = true
                this.Vue = true
              })
          }
        }

        // 业务代码
        Column() {
          XComponent({
            id: 'xcomponentId',
            type: XComponentType.SURFACE,
            libraryname: 'nativerender'
          })
            .onLoad((xComponentContext) => {
              this.xComponentContext = xComponentContext as XComponentContext;
              this.currentStatus = "index";
            })
            .onDestroy(() => {
              console.log('onDestroy');
            })
            .focusable(true)
            .accessibilityLevel("yes")
            .id("xcomponent")
            .width('100%')
            .height('30%')

          Row() {
            Button("findElementById1").onClick(() => {
              DemoActionManager.getInstance().sendEvent("findElementById1");
            })
            Button("findElementById2").onClick(() => {
              DemoActionManager.getInstance().sendEvent("findElementById2");
            })
          }
          .width('100%')
          .alignItems(VerticalAlign.Bottom)

          Row() {
            Button("findElementByText").onClick(() => {
              DemoActionManager.getInstance().sendEvent("findElementByText");
            })
            Button("findFocusedAccessibilityNode ").onClick(() => {
              DemoActionManager.getInstance().sendEvent("findFocusElement");
            })
          }
          .width('100%')
          .alignItems(VerticalAlign.Bottom)

          Row() {
            Button("findNextFocusAccessibilityNode ").onClick(() => {
              DemoActionManager.getInstance().sendEvent("findFocusDirectionElement");
            })
            Button("executeAccessibilityActionClick").onClick(() => {
              DemoActionManager.getInstance().sendEvent("executeAccessibilityActionClick");
            })
          }
          .width('100%')
          .alignItems(VerticalAlign.Bottom)

          Row() {
            Button("ClearFocus").onClick(() => {
              DemoActionManager.getInstance().sendEvent("executeAccessibilityActionClear");
            })
            Button("getPosition").onClick(() => {
              DemoActionManager.getInstance().sendEvent("getCursorPosition");
            })
          }
          .width('100%')
          .alignItems(VerticalAlign.Bottom)
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