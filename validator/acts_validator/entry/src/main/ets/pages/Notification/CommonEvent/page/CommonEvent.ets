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

import router from '@ohos.router';
import fs from '@ohos.file.fs';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../../../model/FirstDialog';
import commonEvent from '@ohos.commonEventManager';
import mainFeature from '../model/MainFeature';
import sysTime from '@ohos.systemDateTime';
import Logger from '../../../model/Logger';
import Base, { BusinessError } from '@ohos.base'
import consts from '../model/Consts';
import commonEventManager from '@ohos.commonEventManager';
import utils from '../model/Utils';
import DateTimeUtil from '../../../model/DateTimeUtil';

@Entry
@Component
struct CommonEvent {
  @State FillColor: string = '#FF000000';
  @State X: number = 0;
  @State name: string = 'CommonEvent';
  @State StepTips: string = '操作步骤：\n1、点击开始监听按钮' + '\n2、将设备灭屏' + '\n3、亮屏后查看当前监听状态是否与记录事件设置的相同' +'\n4、点击停止监听按钮' + '\n5、查看本次监控时长与监控期间干扰次数是否一致' + '\n预期结果：监听状态和实际一致';
  @State Vue: boolean = false;
  @State btnState: boolean = false;
  @State startTime: number = 0;
  @State totalTimeInString: string = '';
  @State totalEvents: number = 0;
  @State totalEventsInString: string = '';
  @State recTimesArray: Array<number> = [0, 0, 0, 0, 0, 0];
  @State recEventsArray: Array<string> = [];
  @State currentEvent: string = '';
  @State detailState: Visibility = Visibility.None;
  @State currentState: Visibility = Visibility.None;
  @State curTime: string = '';
  @State str: string = '';
  @State count: number = 0;
  private validEventsSubscriber: commonEvent.CommonEventSubscriber | null = null; // this subscriber subscribe system defined ordinary events
  private featureMain: mainFeature = new mainFeature();
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  scroller: Scroller = new Scroller();
  tabsController: TabsController = new TabsController();

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
    await this.featureMain.init();
  }

  async onPageHide() {
    Logger.info("enter onPageHide");
    this.featureMain.reset();
  }

  private getMsg(event: string): string {
    switch (event) {
      case commonEvent.Support.COMMON_EVENT_SCREEN_ON:
        return '您进行了亮屏操作';
      case commonEvent.Support.COMMON_EVENT_SCREEN_OFF:
        return '您进行了灭屏操作';
      case commonEvent.Support.COMMON_EVENT_SCREEN_LOCKED:
        return '您进行了锁屏操作';
      case commonEvent.Support.COMMON_EVENT_SCREEN_UNLOCKED:
        return '您进行了解锁屏幕操作';
      default:
        return '无干扰'
    }
  }

  private systemEventCallback = async (error: Base.BusinessError, event: commonEvent.CommonEventData) => {
    try {
      let index = this.featureMain.getCurrentValidEvents().indexOf(event.event);
      this.recTimesArray[index]++;
      this.recEventsArray[index] = event.event + ' : ' + this.recTimesArray[index].toString();
      this.totalEvents++;
      this.currentEvent = event.event;
      let data = new DateTimeUtil()
      this.curTime = data.getHour() + ':' + data.getMinute().toString() + ':' + data.getSecond().toString();
      this.count++;
      this.str = this.str + '\n' + this.curTime + ': ' + this.getMsg(this.currentEvent)
    } catch (err) {
      console.info('systemEventCallback err==' + err.message)
    }
  }
  private handleStart = () => {
    this.btnState = true;
    this.detailState = Visibility.None;
    this.currentState = Visibility.Visible;
    this.totalEventsInString = '';
    this.totalEvents = 0;
    this.totalTimeInString = '';
    sysTime.getCurrentTime().then((curTime) => {
      this.startTime = curTime;
      // start subscribe
      let subscriberInfo: commonEvent.CommonEventSubscribeInfo = {
        events: this.featureMain.getCurrentValidEvents()
      };
      if (subscriberInfo['events'].length === 0) {
        return;
      }
      try {
        commonEvent.createSubscriber(subscriberInfo, (error: BusinessError, subscriber: commonEventManager.CommonEventSubscriber) => {
          this.validEventsSubscriber = subscriber;
          commonEvent.subscribe(subscriber, this.systemEventCallback);
        });
      } catch (err) {
        console.info('handleStart ==commonEvent.createSubscriber' + err.message)
      }
    })
  }
  private handleStop = () => {
    if (this.totalEvents === this.count) {
      this.Vue = true
    }
    this.btnState = false;
    this.detailState = Visibility.Visible;
    this.currentState = Visibility.None;
    this.totalEventsInString = this.totalEvents.toString();
    // refresh time
    sysTime.getCurrentTime().then((curTime) => {
      this.totalTimeInString = utils.convertTimeToFormatString(curTime - this.startTime);
      // unsubscribe
      commonEvent.unsubscribe(this.validEventsSubscriber, () => {
        Logger.info("unsubscribe called");
      })
      let parameters: Record<string, string> = {
        'startTime': utils.getLocaleTime(this.startTime),
        'endTime': utils.getLocaleTime(curTime),
        'totalTime': this.totalTimeInString,
        'totalEvents': this.totalEventsInString,
      }
      let options: commonEvent.CommonEventPublishData = {
        isOrdered: true,
        parameters: parameters
      };
      commonEvent.publish(consts.COMMON_EVENT_FINISH_MEDITATION, options, () => {
        Logger.info("success to publish COMMON_EVENT_FINISH_MEDITATION");
      });
    })
  }
  private executeCallBack = () => {
    if (!this.btnState) {
      this.handleStart();
      this.str = '';
      this.count = 0;
    } else {
      this.handleStop();
    }
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.Vue == false) {
      Button({ stateEffect: this.Vue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .margin({ bottom: '20vp' })
      .width('20%')
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
      }
      .margin({ bottom: '20vp' })
      .width('20%')
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
      Image($r('app.media.ic_public_fail')).width('20vp').height('20vp')
    }.margin({ bottom: '20vp' }).width('20%').height('30vp').backgroundColor(Color.Grey)
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

  build() {
    Column() {
      Column() {
        Scroll(){
          Row({space:20}) {
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
          .height('20%')
          .width('130%')
          .justifyContent(FlexAlign.Center)
        }.scrollable(ScrollDirection.Horizontal).scrollBarColor(Color.Orange)


        Row() {
          Flex({
            direction: FlexDirection.Column,
            alignItems: ItemAlign.Center,
            justifyContent: FlexAlign.SpaceBetween
          }) {
            Scroll(this.scroller) {
              Column() {
                Row() {
                  Column() {
                    Flex({
                      direction: FlexDirection.Column,
                      justifyContent: FlexAlign.Center,
                      alignItems: ItemAlign.Center
                    }) {
                      Button(!this.btnState ? '开始监听' : '停止监听')
                        .onClick(this.executeCallBack)
                        .margin({ bottom: 24, top: 24 })
                      Column() {
                        Text('当前监听状态')
                          .fontSize(20)
                          .fontColor(Color.Black)
                          .visibility(this.currentState)
                        Text(this.str)
                          .fontSize(20)
                          .fontColor(Color.Black)
                          .visibility(this.currentState)
                        Row() {
                          Text('本次监控时长')
                            .size({ width: '50%' })
                            .fontSize(20)
                            .fontColor(Color.Black)
                          Text(this.totalTimeInString)
                            .size({ width: '30%' })
                            .fontSize(20)
                            .fontColor(Color.Black)
                        }.size({ width: '80%' })
                        .visibility(this.detailState)

                        Row() {
                          Text('监控期间干扰次数')
                            .size({ width: '70%' })
                            .fontSize(20)
                            .fontColor(Color.Black)
                          Text(this.totalEventsInString)
                            .size({ width: '10%' })
                            .fontSize(20)
                            .fontColor(Color.Black)
                        }.size({ width: '80%' })
                        .visibility(this.detailState)
                      }
                      .size({ width: '90%' })
                      .backgroundColor(Color.White)
                      .opacity(0.8)
                      .borderRadius(10)
                    }
                    .size({ width: '100%' })
                  }
                  .justifyContent(FlexAlign.Center)
                  .width('100%')
                }
                .width('100%')
              }
              .width('100%')
            }
            .scrollBarWidth('6vp')
            .scrollBarColor('#cccccc')
          }
        }
        .width('100%')
        .height('58%')
        .justifyContent(FlexAlign.SpaceEvenly)

        Scroll(){
          Row({space:12}) {
            this.PassBtn($r('app.string.btn_fullscreen'), true);
            Button() {
              Image($r('app.media.ic_public_help'))
                .width('20vp')
                .height('20vp')
            }
            .margin({ bottom: '20vp' })
            .width('20%')
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
          .height('22%')
          .width('130%')
          .justifyContent(FlexAlign.Center)
          .backgroundColor(Color.Black)
        }.scrollable(ScrollDirection.Horizontal).scrollBarColor(Color.Orange)

      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/Notification/Setting',
      params: {
        'Vue': this.Vue
      }
    })
  }
}