/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import NotificationOperations from '../CustomNotification/model/NotificationOperations';
import { notificationManagement } from '../CustomNotification/notificationUtil/NotificationManagementUtil';
import { NotificationUtil } from '../CustomNotification/notificationUtil/NotificationUtil';
import FirstDialog from '../../model/FirstDialog';
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import Logger from '../../model/Logger';
import fs from '@ohos.file.fs';
import emitter from '@ohos.events.emitter';
import { BusinessError } from '@ohos.base';

export interface ButtonMsg {
  text: string,
  icon: Resource,
  flag: boolean,
  callback?: () => void
}

let innerEvent: emitter.InnerEvent = {
  eventId: 1
};

let innerEvent2: emitter.InnerEvent = {
  eventId: 2
};

let innerEvent3: emitter.InnerEvent = {
  eventId: 3
};

let innerEvent4: emitter.InnerEvent = {
  eventId: 4
};

let innerEvent5: emitter.InnerEvent = {
  eventId: 5
};

let innerEvent6: emitter.InnerEvent = {
  eventId: 6
};

@Entry
@Component
struct Index {
  private notificationOperations: NotificationOperations = new NotificationOperations(getContext(this));
  private notificationUtil = new NotificationUtil();
  @State isPromptTone: boolean = false;
  @State name: string = 'CustomNotification';
  @State StepTips: string = '操作步骤：\n分别点击6个小卡片，发送不同类型的通知' + '\n' + '预期结果：通知卡片变为绿色，上方状态栏下滑能收到不同类型的通知，则通过';
  @State Vue: boolean = false;
  @State isVibrationEffect: boolean = false;
  @State count: number = 0;
  @State flagOne: boolean = false;
  @State flagTwo: boolean = false;
  @State flagThree: boolean = false;
  @State flagFour: boolean = false;
  @State flagFive: boolean = false;
  @State flagSix: boolean = false;

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
    }
    else {
      Button({ stateEffect: this.Vue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }.width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .onClick(() => {
        router.back({
          url: 'pages/Notification/Notification_index',
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
        url: 'pages/Notification/Notification_index',
        params: {
          result: 'false', title: this.name,
        }
      })
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  @Styles
  viewStyle(){
    .width('48%')
    .height(100)
    .borderRadius(20)
    .margin({ top: 18 })
    .backgroundColor('#FFFFFF')
  }

  @Styles
  toggleStyle(){
    .width(52)
    .height(26)
    .margin({ right: 24 })
  }

  @Styles
  rowStyle(){
    .backgroundColor('#FFFFFF')
    .borderRadius(20)
    .margin({ top: 18 })
    .height(80)
    .width('90%')
  }

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
    this.isVibrationEffect = this.notificationUtil.vibrationEffect();
  }

  async onPageShow() {
    // 收到eventId为1的事件后执行回调函数
    emitter.on(innerEvent, (res) => {
      if(res.data !== undefined) {
        this.count = res.data.content
        this.flagOne = res.data.flag
        console.info('emitter.on =11= ' + this.count);
        console.info('emitter.on =11flagOne= ' + this.flagOne);
        if (this.count === 6) {
          this.Vue = true;
        }
      }
    });

    emitter.on(innerEvent2, (res) => {
      if(res.data !== undefined) {
        this.count = res.data.content
        this.flagTwo = res.data.flag
        console.info('emitter.on =22= ' + this.count);
        console.info('emitter.on =22flagTwo= ' + this.flagOne);
        if (this.count === 6) {
          this.Vue = true;
        }
      }
    });

    emitter.on(innerEvent3, (res) => {
      if(res.data !== undefined) {
        this.count = res.data.content
        this.flagThree = res.data.flag
        console.info('emitter.on =33= ' + this.count);
        if (this.count === 6) {
          this.Vue = true;
        }
      }
    });

    emitter.on(innerEvent4, (res) => {
      if(res.data !== undefined) {
        this.count = res.data.content
        this.flagFour = res.data.flag
        console.info('emitter.on =44= ' + this.count);
        if (this.count === 6) {
          this.Vue = true;
        }
      }
    });

    emitter.on(innerEvent5, (res) => {
      if(res.data !== undefined) {
        this.count = res.data.content
        this.flagFive = res.data.flag
        console.info('emitter.on =55= ' + this.count);
        if (this.count === 6) {
          this.Vue = true;
        }
      }
    });

    emitter.on(innerEvent6, (res) => {
      if(res.data !== undefined) {
        this.count = res.data.content
        this.flagSix = res.data.flag
        console.info('emitter.on =66= ' + this.count);
        if (this.count === 6) {
          this.Vue = true;
        }
      }
    });
  }

  build() {
    Column() {
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
              url: 'pages/Notification/Notification_index',
              params: { result: 'None', }
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
          Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceBetween, alignContent: FlexAlign.SpaceEvenly }) {
            Column() {
              Image($r('app.media.ic_notice_jiben'))
                .width(40)
                .height(28)
                .objectFit(ImageFit.Contain)
                .margin({ bottom: 10 })
              Text('基本型通知')
                .fontSize(16)
                .onClick(this.notificationOperations.publishBasicNotification)
            }
            .borderColor(this.flagOne ? Color.Green : Color.White)
            .borderWidth(10)
            .viewStyle()
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .onClick(this.notificationOperations.publishBasicNotification)

            Column() {
              Image($r('app.media.ic_notice_changwenben'))
                .width(40)
                .height(28)
                .objectFit(ImageFit.Contain)
                .margin({ bottom: 10 })
              Text('长文本型通知')
                .fontSize(16)
                .onClick(this.notificationOperations.publishLongTextNotification)
            }
            .borderColor(this.flagTwo ? Color.Green : Color.White)
            .borderWidth(10)
            .viewStyle()
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .onClick(this.notificationOperations.publishLongTextNotification)

            Column() {
              Image($r('app.media.ic_notice_duohang'))
                .width(40)
                .height(28)
                .objectFit(ImageFit.Contain)
                .margin({ bottom: 10 })
              Text('多行文本型通知')
                .fontSize(16)
                .onClick(this.notificationOperations.publishMultiLineNotification)
            }
            .borderColor(this.flagThree ? Color.Green : Color.White)
            .borderWidth(10)
            .viewStyle()
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .onClick(this.notificationOperations.publishMultiLineNotification)

            Column() {
              Image($r('app.media.ic_notice_tupian'))
                .width(40)
                .height(28)
                .objectFit(ImageFit.Contain)
                .margin({ bottom: 10 })
              Text('图片型通知')
                .fontSize(16)
                .onClick(this.notificationOperations.publishPictureNotification)
            }
            .borderColor(this.flagFour ? Color.Green : Color.White)
            .borderWidth(10)
            .viewStyle()
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .onClick(this.notificationOperations.publishPictureNotification)

            Column() {
              Image($r('app.media.ic_notice_anniu'))
                .width(40)
                .height(28)
                .objectFit(ImageFit.Contain)
                .margin({ bottom: 10 })
              Text('带按钮的通知')
                .fontSize(16)
                .onClick(this.notificationOperations.publishNotificationWithButtons)
            }
            .borderColor(this.flagFive ? Color.Green : Color.White)
            .borderWidth(10)
            .viewStyle()
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .onClick(this.notificationOperations.publishNotificationWithButtons)

            Column() {
              Image($r('app.media.ic_notice_tiaozhuan'))
                .width(40)
                .height(28)
                .objectFit(ImageFit.Contain)
                .margin({ bottom: 10 })
              Text('点击可跳转的通知')
                .fontSize(16)
                .onClick(this.notificationOperations.publishNotificationWithWantAgent)
            }
            .borderColor(this.flagSix ? Color.Green : Color.White)
            .borderWidth(10)
            .viewStyle()
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
            .onClick(this.notificationOperations.publishNotificationWithWantAgent)
          }
          .width('90%')

          Button('清空所有通知')
            .backgroundColor(Color.White)
            .width(230)
            .height(40)
            .margin(10)
            .fontSize(16)
            .margin({ top: 50 })
            .fontColor(Color.Black)
            .onClick(() => {
              this.notificationUtil.cancelAllNotifications();
              notificationManagement.resetTypeNotificationState();
            })
        }
        .width('100%')
        .height('80%')

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
      }
    }
    .backgroundColor(Color.Black)
    .width('100%')
    .height('100%')
  }
}
