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

@Entry
@Component
struct AccessibilityRoleTypeTest {
  @State FillColor: string = '#FF000000';
  @State name: string = 'AccessibilityRoleTypeTest';
  @State StepTips: string = '测试目的：验证accessibilityRole接口每个枚举值是否都能设置成功\n' +
    '\n' +
    '操作步骤：安装hdc，使用命令：hdc shell "hidumper -s WindowManagerService -a \'-w $\{winId} -inspector $\{elementId}\'"，$\{winId}替换为当前页面winId，$\{elementId}替换为AccessibilityRole:0~124 Text组件的id值。\n' +
    '观察dump内容中accessibilityCustomRole的值\n' +
    '注意：1、利用DevEvoTesting中的UIViewer工具点击当前页面，查询右下角组件信息可获取到$\{winId}和$\{elementId}的值，$\{winId}值为hostWindowId，$\{elementId}值为ID；同页面$\{winId}为唯一值无需重复查询。\n' +
    '\n' +
    '预期结果：\n' +
    'AccessibilityRole:0~124依次dump出的内容为：[0]actionsheet,[1]alertdialog,[2]indexercomponent,[3]badgecomponent,[4]blank,[5]button,[6]backbutton,[7]sheetdragbar,[8]calendarpicker,[9]calendar,[10]canvas,[11]canvasgradient,[12]canvaspattern,[13]checkbox,[14]checkboxgroup,[15]circle,[16]columnsplit,[17]column,[18]canvasrenderingcontext2d,[19]chart,[20]counter,[21]containermodal,[22]datapanel,[23]datepicker,[24]dialog,[25]divider,[26]dragbar,[27]effectcomponent,[28]ellipse,[29]flex,[30]flowitem,[31]formcomponent,[32]formlink,[33]gauge,[34]grid,[35]gridcol,[36]gridcontainer,[37]griditem,[38]gridrow,[39]hyperlink,[40]image,[41]imageanimator,[42]imagebitmap,[43]imagedata,[44]imagespan,[45]label,[46]line,[47]list,[48]listitem,[49]listitemgroup,[50]loadingprogress,[51]marquee,[52]matrix2d,[53]menu,[54]menuitem,[55]menuitemgroup,[56]navdestination,[57]navrouter,[58]navigation,[59]navigationbar,[60]navigationmenu,[61]navigator,[62]offscreencanvas,[63]offscreencanvasrenderingcontext2d,[64]option,[65]panel,[66]paperpage,[67]path,[68]path2d,[69]patternlock,[70]picker,[71]pickerview,[72]plugincomponent,[73]polygon,[74]polyline,[75]popup,[76]progress,[77]qrcode,[78]radio,[79]rating,[80]rect,[81]refresh,[82]relativecontainer,[83]remotewindow,[84]richeditor,[85]richtext,[86]rolepager,[87]row,[88]rowsplit,[89]scroll,[90]scrollbar,[91]search,[92]searchfield,[93]select,[94]shape,[95]sidebarcontainer,[96]slider,[97]span,[98]stack,[99]stepper,[100]stepperitem,[101]swiper,[102]swiperindicator,[103]switch,[104]symbolglyph,[105]tabcontent,[106]tabbar,[107]tabs,[108]text,[109]textclock,[110]textentry,[111]textinput,[112]textpicker,[113]texttimer,[114]textarea,[115]textfield,[116]timepicker,[117]titlebar,[118]toggler,[119]uiextensioncomponent,[120]video,[121]waterflow,[122]web,[123]xcomponent,[124]NULL.';
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
  private array: number[] = new Array(125).fill(0);
  private temp: number = 0;
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
        Column() {
          List() {
            ForEach(this.array, () => {
              ListItem() {
                Text("AccessibilityRole:"+this.temp).accessibilityRole(this.temp++);
              }
            })
          }.padding(20)
          .scrollBar(BarState.Off)
          .backgroundColor(0xF1F3F5)
        }
        .focusable(true)
        .defaultFocus(true)
        .height("90%")
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