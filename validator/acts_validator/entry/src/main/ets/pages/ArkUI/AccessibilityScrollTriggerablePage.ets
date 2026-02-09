import hilog from '@ohos.hilog';
import { window } from '@kit.ArkUI';
import DemoActionManager from './model/DemoActionManager';
import XComponentContext from "./interface/XComponentContext"
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';
import { AttributeUpdater } from '@kit.ArkUI';
class MyAccessibilityModifier extends AttributeUpdater<CommonAttribute> {}

const TAG = '[AccessibilityScrollTriggerablePage]';

let params = LocalStorage.getShared();

@Entry(params)
@Component
struct AccessibilityScrollTriggerablePage {
  @State FillColor: string = '#FF000000';
  @State name: string = 'AccessibilityScrollTriggerablePage';
  @State StepTips: string = '测试目的：验证无障碍接口AccessibilityScrollTriggerable。\n' +
    '\n' +    '操作步骤：开启屏幕朗读。(1)单机按钮"true",使绿框选中按钮"true",双击按钮"true",点击下方数字0,连续单指下滑,直至出现数字9;(2)将滚动条复原至数字0,单击按钮"false",使绿框选中按钮"false",双击按钮"false",点击下方数字0,连续单指下滑。\n' +
    '\n' +	'预期结果：若支持屏幕朗读，则步骤(1)绿框可以滑到滚动条最下方,并出现数字9、步骤(2)绿框滑动到滚动条中间数字会跳出滚动条;若不支持屏幕朗读，直接按照失败处理走豁免。';;
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
  private modifier: MyAccessibilityModifier = new MyAccessibilityModifier();
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  controller: TextInputController = new TextInputController();
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
        Button('true', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(300)
          .height("5%")
          .onClick((event)=>{
            console.log("before modifier change ");
            // this.modifier.attribute?.accessibilityText("modify text2222")
            this.modifier.attribute?.accessibilityScrollTriggerable(true)
          })

        Button('false', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(300)
          .height("5%")
          .onClick((event)=>{
            // this.modifier.attribute?.accessibilityText("modify text2222")
            this.modifier.attribute?.accessibilityScrollTriggerable(false)
          })
        List({ space: 20, initialIndex: 0 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('100%').height(100).fontSize(16)
                .textAlign(TextAlign.Center).borderRadius(10).backgroundColor(0xFFFFFF)
            }
          }, (item: string) => item)
        }
        .attributeModifier(this.modifier)
        .accessibilityScrollTriggerable(false)
        .listDirection(Axis.Vertical) // 排列方向
        .scrollBar(BarState.Off)
        .friction(0.6)
        // .accessibilityText("3333")
        .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 }) // 每行之间的分界线
        .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
        .onScrollIndex((firstIndex: number, lastIndex: number, centerIndex: number) => {
          console.info('first' + firstIndex)
          console.info('last' + lastIndex)
          console.info('center' + centerIndex)
        })
        .onScrollVisibleContentChange((start: VisibleListContentInfo, end: VisibleListContentInfo) => {
          console.log(' start index: ' + start.index +
            ' start item group area: ' + start.itemGroupArea +
            ' start index in group: ' + start.itemIndexInGroup)
          console.log(' end index: ' + end.index +
            ' end item group area: ' + end.itemGroupArea +
            ' end index in group: ' + end.itemIndexInGroup)
        })
        .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
          console.info(`onScroll scrollState = ScrollState` + scrollState + `, scrollOffset = ` + scrollOffset)
        })
        .width('100%')
        .height("85%")
      }
      .height('80%')
      .width('100%')
      .border({ width: 3, color: 0x317AF7, radius: 10, style: BorderStyle.Dotted })


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