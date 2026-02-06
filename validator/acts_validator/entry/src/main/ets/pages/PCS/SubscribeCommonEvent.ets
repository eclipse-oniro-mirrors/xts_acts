/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import { CustomContainer } from '../common/PCSCustomContainer';
import FirstDialog from '../model/FirstDialog';
import context from '@ohos.app.ability.common';
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
import power from '@ohos.power';
import CommonEventManager from '@ohos.commonEventManager';

/*
* @tc.number: STD-SOFTWARE-0302
* @tc.name: SubscribeCommonEvent
* @tc.desc: 【STD-SOFTWARE-0302】ohos 设备必须发送公共事件 want 以响应适当的系统事件来通知三方应用硬件或软件环境的改变。
* @tc.size: MediumTest
* @tc.type: Function
* @tc.level: Level 0
*/
@Entry
@Component
struct SubscribeCommonEvent {
  @State name: string = 'SubscribeCommonEvent';
  @State stepTips: string = '预期结果：获取系统公共事件通知';
  @State testResult: boolean = false;
  @State startEnable: boolean = true;
  @State result: string = "FLASE";
  scroller: Scroller = new Scroller();
  subscriber: CommonEventManager.CommonEventSubscriber | null = null;
  @State hasReboot: boolean = false

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.stepTips, this.name);
    this.testResult = false;
    this.startEnable = true;
    this.result = "FLASE";
  }

  @Builder
  specificNoParam() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
        Scroll(this.scroller) {
          Column() {
            Row() {
              Text('\n' + '\n' + `根据以下操作步骤完成测试` + '\n' + '\n')
                .fontColor(Color.White)
                .fontSize('24fp')
            }

            Row() {
              Text(`测试步骤:` + '\n' + '\n' + `1.点击订阅屏幕关闭公共事件按钮` + '\n' + '\n' +
                `2.点击息屏按钮关闭屏幕并等待5s` + '\n' + '\n' + '3.开启屏幕进入应用' + '\n' + '\n' +
                '4.观察测试结果是否为TRUE' + '\n' + '\n')
                .width('90%')
                .fontColor(Color.White)
                .fontSize('20fp')
            }

            Row() {
              Column() {
                Button(`订阅屏幕关闭公共事件`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('50%')
                  .margin('10vp')
                  .enabled(this.startEnable)
                  .opacity(this.startEnable ? 1 : 0.4)
                  .onClick(async () => {
                    let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
                      events: ["usual.event.SCREEN_OFF"]
                    };
                    try {
                      this.subscriber = CommonEventManager.createSubscriberSync(subscribeInfo);
                      CommonEventManager.subscribe(this.subscriber, (err: BusinessError, data: CommonEventManager.CommonEventData) => {
                        if (err) {
                          console.error(`subscribe failed, code is ${err.code}, message is ${err.message}`);
                        } else {
                          this.result = "TRUE";
                          this.testResult = true
                          console.info(`subscribe event: ${data.event}`);
                        }
                      });
                      this.startEnable = !this.startEnable;
                    } catch (error) {
                      let err: BusinessError = error as BusinessError;
                      console.error(`Subscriber common event failed, code is ${err.code}, message is ${err.message}`);
                    }
                  })

                Blank('10%')

                Button(`息屏`)
                  .borderRadius(8)
                  .backgroundColor(0x317aff)
                  .width('50%')
                  .enabled(!this.startEnable)
                  .opacity(!this.startEnable ? 1 : 0.4)
                  .onClick(() => {
                    try {
                      power.suspend();
                    } catch (err) {
                      console.error('suspend failed, err: ' + err);
                    }
                    this.startEnable = !this.startEnable;
                  })
              }
            }

            Row() {
              Text('\n' + '\n' + `订阅公共事件结果：` + this.result)
                .fontColor(Color.White)
                .fontSize('24fp')
            }
          }
          .width('100%')
        }
        .scrollBarColor(Color.White) // 滚动条颜色
        .scrollBarWidth(10)
      }
    }
    .width('100%')
    .height('65%')
    .backgroundColor(Color.Black)
    .justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column() {
      CustomContainer({
        title: this.name,
        url: 'pages/PCS/PCS_index',
        stepTips: this.stepTips,
        content: this.specificNoParam,
        name: $name,
        testResult: $testResult,
        startEnable: $startEnable,
        result: $result,
        hasReboot: $hasReboot,
      }).margin({ bottom: '20vp' })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/PCS/PCS_index',
    })
  }
}