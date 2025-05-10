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
const TAG = '[HoverSpen]';
@Entry
@Component
struct HoverSpenExample {
@State text: string = ''
@State axisValue: string = ''
@State name: string = 'HoverSpen';
@State Vue: boolean = false;
@State intervalNum: number = 0;
@State hoverMoveText: string = '';
@State StepTips: string = '平板设备使用手写笔测试时\n' + '操作步骤:\n' + '1,手写笔悬浮在蓝色按钮上并且移动\n' +
'预期结果：\n' + '1.页面上出现x轴,y轴坐标(手写笔位置相对于当前组件左上角的x轴坐标，y轴坐标)\n' +
'2.页面上出现windowXY(手写笔位置相对于应用窗口左上角的x轴坐标,y轴坐标)\n' +
'3.页面上出现displayXY(手写笔位置相对于屏幕左上角的x轴坐标,y轴坐标)\n'+
'4.随着手写笔的移动,坐标在不断的变化\n' +
'5.不支持手写笔的设备直接按照失败处理走豁免\n'

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
     if(this.hoverMoveText.length > 0) {
        this.Vue = true
     }
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
      Text(`适用手写笔的设备进行该测试`).fontColor(Color.Green).fontSize('18fp').margin({top:15})
    }
    Button('onHoverMove')
      .width(180).height(80)
      .onHoverMove((event: HoverEvent) => {
        this.hoverMoveText = 'onHoverMove:\nXY = (' + event.x + ', ' + event.y + ')' +
          '\nwindowXY = (' + event.windowX + ', ' + event.windowY + ')' +
          '\ndisplayXY = (' + event.displayX + ', ' + event.displayY + ')';
      })

    Text(this.hoverMoveText)

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