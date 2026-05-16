/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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
import Utils from './Util.test';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError, Callback } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { notificationManager } from '@kit.NotificationKit';
import { emitter } from '@kit.BasicServicesKit';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from '../../../hypium/index'
import { abilityAccessCtrl, bundleManager, bundleResourceManager, installer } from '@kit.AbilityKit';
import { Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'
import commonEventManager from '@ohos.commonEventManager'
import router from '@ohos.router'
import { Router } from '@ohos.arkui.UIContext';
import { UIContext } from '@ohos.arkui.UIContext'
import image from '@ohos.multimedia.image';
import { BusinessError, RecordData } from '@ohos.base';
import hilog from '@ohos.hilog';
import WantAgent from '@ohos.app.ability.wantAgent';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager'
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';
import { notificationSubscribe } from '@kit.NotificationKit';
import { wantAgent } from '@kit.AbilityKit';
const TAG = 'NotificationActs';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationansgetnotificationparameterstest.static"
let context: common.UIAbilityContext;
let domain: int = 0x0000;
let tag: string = 'testTag';

class Sample {
  constructor() {
    this.count = 100;
  }

  printCount() {
    console.info('Print count : ' + this.count);
  }

  count: number;
}

export default function ActsNotificationAnsGetNotificationParametersStaticTest() {
  const TEST_Project_NAME = 'ActsNotificationAnsGetNotificationParametersStaticTest';
  describe('ActsNotificationAnsGetNotificationParametersStaticTest', () => {
    beforeAll(async () => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility({
        abilityName: "EntryAbility",
        bundleName: "com.example.actsnotificationansgetnotificationparameterstest.static"
      }).then(async (): Promise<void> => {
        hilog.info(domain, tag, 'startAbility success');
        await Utils.msSleep(2000);
        context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'beforeAll end');
      }).catch(() => {
        hilog.info(domain, tag, 'startAbility fail');
      })
    });
    beforeEach(() => {
      notificationManager.cancel(1)
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_static_0100
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_static_0100
     * @tc.desc   [Notification does not exist] When the getNotificationParameters interface is called and an ID of a notification that does not exist is passed, error 1600007 is reported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'SUB_Notification_Ans_GetNotificationParameters_static_0100';
        let num: int = 0
        let id: int = 0;
        let label: string = "";
        try {
          notificationManager.getNotificationParameters(id, label)
            .then((data: notificationManager.NotificationParameters | null) => {
              num++
              console.info(`${testNum}${num}Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
              expect(false).assertTrue();
              done();
            })
            .catch((error: Error) => {
              let err = error as BusinessError
              console.error(`${testNum}${num}Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
              if (err?.code === 801) {
                expect(err.code).assertEqual(801);
                done();
              } else {
                expect(err.code).assertEqual(1600007);
                done();
              }
            });
        } catch (err) {
          hilog.error(0x0000, 'testTag', `${testNum}restart failed: ${err.code}, ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_static_0200
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_static_0200
     * @tc.desc   [Notification does not exist] When the getNotificationParameters interface is called and an existing notification is passed as the label, error 1600007 is reported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_static_0200';
      let notificationRequest: notificationManager.NotificationRequest = {
        id: 1,
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test_title",
            text: "test_text",
            additionalText: "test_additionalText"
          }
        },
      }
      let num = 0
      let id: int = 0;
      let label: string = "";
      let testAbilityContext: common.UIAbilityContext =
        AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      try {
        await Utils.msSleep(1000)
        notificationManager.requestEnableNotification(testAbilityContext).then(() => {
          num++
          console.info(`requestEnableNotification Promise success!`)
          expect(num).assertEqual(1)
        }).catch((error: Error) => {
          let err = error as BusinessError
          console.info(`requestEnableNotification Promise err: ${err.code}, errMes: ${err.message}`)
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
            done()
          }
        })
        await Utils.msSleep(1000)
        let driver = Driver.create();
        let button = await driver.findComponent(ON.text('允许'));
        console.info(`${TAG} button is ${JSON.stringify(button)}`);
        if (button !== null) {
          await Utils.msSleep(1000)
          await button.click();
          await Utils.msSleep(1000)
        } else {
          console.info(`${TAG} null button`);
          expect(button).assertContain('允许')
        }
        notificationManager.publish(notificationRequest).then(() => {
          num++
          console.info(testNum+num+"publish success");
          expect(num).assertEqual(2)
        }).catch((error: Error) => {
          let err = error as BusinessError
          console.error(`${testNum}publish failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
          } else {
            expect().assertFail();
            done()
          }
        });
        await Utils.msSleep(1000)
        notificationManager.getNotificationParameters(id, label)
          .then((data: notificationManager.NotificationParameters | null) => {
            num++
            console.info(`${testNum}${num}Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
            expect(false).assertTrue();
            done();
          })
          .catch((error: Error) => {
            let err = error as BusinessError
            console.error(`${testNum}${num}Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(err.code).assertEqual(1600007);
              done();
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getNotificationParameters failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_static_0300
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_static_0300
     * @tc.desc   [Parameter verification] The getNotificationParameters interface is successfully invoked when the label parameter is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_static_0300';
      let num = 0
      let id: int = 1;
      let label: string = "";
      try {
        let wantAgentObj: Object;
        let wantAgentInfo: wantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: '',
              bundleName: 'com.example.actsnotificationansgetnotificationparameterstest.static',
              abilityName: 'EntryAbility',
              action: 'actionTest1.2',
              entities: [],
              uri: 'abfdsihcnuaoi1.2',
              parameters: {
                'wh1': 123,
                'wh2': 'B',
                'wh3': 58.89,
                'wh4': true,
                'wh5': [123, 234, 567],
                'wh6': [true, false, true],
                'wh7': "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
                'wh8': [11.11, 22.22, 33.33, 44.44],
                'wh9': 2147483648,
                'wh10': [2147483648, 555, 2147483649]
              }as Record<String,RecordData>,
            }
          ],
          actionType: wantAgent.OperationType.START_ABILITY,
          requestCode: 0,
          actionFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
        }
        // 创建WantAgent
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((data) => {
            wantAgentObj = data;
            // publish回调
            let publishCallback = (err: BusinessError|null): void => {
              if (err) {
                console.error(TAG+`${testNum}Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
                if (err?.code === 801) {
                  expect(err.code).assertEqual(801);
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              } else {
                num++
                console.info(TAG+`${testNum}Succeeded in publishing notification.`);
                expect(num).assertEqual(1);
              }
            }
            // 通知Request对象
            let notificationRequest: notificationManager.NotificationRequest = {
              id: 1,
              wantAgent: wantAgentObj,
              notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
              content: {
                notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                  title: "test_title",
                  text: "test_text",
                  additionalText: "test_additionalText"
                }
              }
            };
            notificationManager.publish(notificationRequest, publishCallback);
          }).catch((error: Error) => {
            let err = error as BusinessError
            console.error(TAG + `${testNum}getWantAgent failed! ${err.code} ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TAG + `${testNum}getWantAgent failed! `);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
        await Utils.msSleep(1000);
        notificationManager.getNotificationParameters(id)
          .then((data: notificationManager.NotificationParameters | null) => {
            num++
            console.info(`${testNum}${num}Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
            expect(JSON.stringify(data?.wantParameters)).assertContain(`"wh1":123`);
            expect(JSON.stringify(data?.wantAction)).assertContain("actionTest1.2");
            expect(JSON.stringify(data?.wantUri)).assertContain("abfdsihcnuaoi1.2");
            done();
          })
          .catch((error: Error) => {
            let err = error as BusinessError
            console.error(`${testNum}Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getNotificationParameters failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_static_0400
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_static_0400
     * @tc.desc   [Parameter verification] The getNotificationParameters interface is successfully invoked when the label parameter is set to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_static_0400';
      let num = 0
      let id: int = 1;
      try {
        let wantAgentObj: Object;
        let wantAgentInfo: wantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: '',
              bundleName: 'com.example.actsnotificationansgetnotificationparameterstest.static',
              abilityName: 'EntryAbility',
              action: 'actionTest1.2',
              entities: [],
              uri: 'abfdsihcnuaoi1.2',
              parameters: {
                'wh1': 123,
                'wh2': 'B',
                'wh3': 58.89,
                'wh4': true,
                'wh5': [123, 234, 567],
                'wh6': [true, false, true],
                'wh7': "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
                'wh8': [11.11, 22.22, 33.33, 44.44],
                'wh9': 2147483648,
                'wh10': [2147483648, 555, 2147483649]
              }as Record<String,RecordData>,
            }
          ],
          actionType: wantAgent.OperationType.START_ABILITY,
          requestCode: 0,
          actionFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
        }
        // 创建WantAgent
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((data) => {
            wantAgentObj = data;
            // publish回调
            let publishCallback = (err: BusinessError|null): void => {
              if (err) {
                console.error(TAG+`${testNum}Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
                if (err?.code === 801) {
                  expect(err.code).assertEqual(801);
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              } else {
                num++
                console.info(TAG+`${testNum}Succeeded in publishing notification.`);
                expect(num).assertEqual(1);
              }
            }
            // 通知Request对象
            let notificationRequest: notificationManager.NotificationRequest = {
              id: 1,
              wantAgent: wantAgentObj,
              notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
              content: {
                notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                  title: "test_title",
                  text: "test_text",
                  additionalText: "test_additionalText"
                }
              }
            };
            notificationManager.publish(notificationRequest, publishCallback);
          }).catch((error: Error) => {
            let err = error as BusinessError
            console.error(TAG + `${testNum}getWantAgent failed! ${err.code} ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TAG + `${testNum}getWantAgent failed! `);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
        await Utils.msSleep(1000);
        notificationManager.getNotificationParameters(id,undefined)
          .then((data: notificationManager.NotificationParameters | null) => {
            num++
            console.info(`${testNum}${num}Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
            expect(JSON.stringify(data?.wantParameters)).assertContain('"wh1":123');
            expect(JSON.stringify(data?.wantAction)).assertContain("actionTest1.2");
            expect(JSON.stringify(data?.wantUri)).assertContain("abfdsihcnuaoi1.2");
            done();
          })
          .catch((error: Error) => {
            let err = error as BusinessError
            console.error(`${testNum}Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getNotificationParameters failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_static_0500
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_static_0500
     * @tc.desc   [Parameter verification] The getNotificationParameters interface is called, and the label parameter is an empty string. The interface is successfully called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_static_0500';
      let num = 0
      let id: int = 1;
      try {
        let wantAgentObj: Object;
        let wantAgentInfo: wantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: '',
              bundleName: 'com.example.actsnotificationansgetnotificationparameterstest.static',
              abilityName: 'EntryAbility',
              action: 'actionTest1.2',
              entities: [],
              uri: 'abfdsihcnuaoi1.2',
              parameters: {
                'wh1': 123,
                'wh2': 'B',
                'wh3': 58.89,
                'wh4': true,
                'wh5': [123, 234, 567],
                'wh6': [true, false, true],
                'wh7': "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
                'wh8': [11.11, 22.22, 33.33, 44.44],
                'wh9': 2147483648,
                'wh10': [2147483648, 555, 2147483649]
              }as Record<String,RecordData>,
            }
          ],
          actionType: wantAgent.OperationType.START_ABILITY,
          requestCode: 0,
          actionFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
        }
        // 创建WantAgent
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((data) => {
            wantAgentObj = data;
            // publish回调
            let publishCallback = (err: BusinessError|null): void => {
              if (err) {
                console.error(TAG+`${testNum}Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
                if (err?.code === 801) {
                  expect(err.code).assertEqual(801);
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              } else {
                num++
                console.info(TAG+`${testNum}Succeeded in publishing notification.`);
                expect(num).assertEqual(1);
              }
            }
            // 通知Request对象
            let notificationRequest: notificationManager.NotificationRequest = {
              id: 1,
              label: "",
              wantAgent: wantAgentObj,
              notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
              content: {
                notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                  title: "test_title",
                  text: "test_text",
                  additionalText: "test_additionalText"
                }
              }
            };
            notificationManager.publish(notificationRequest, publishCallback);
          }).catch((error: Error) => {
            let err = error as BusinessError
            console.error(TAG + `${testNum}getWantAgent failed! ${err.code} ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TAG + `${testNum}getWantAgent failed! `);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
        await Utils.msSleep(1000);
        notificationManager.getNotificationParameters(id,'')
          .then((data: notificationManager.NotificationParameters | null) => {
            num++
            console.info(`${testNum}${num}Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
            expect(JSON.stringify(data?.wantParameters)).assertContain('"wh1":123');
            expect(JSON.stringify(data?.wantAction)).assertContain("actionTest1.2");
            expect(JSON.stringify(data?.wantUri)).assertContain("abfdsihcnuaoi1.2");
            done();
          })
          .catch((error: Error) => {
            let err = error as BusinessError
            console.error(`${testNum}Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getNotificationParameters failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_static_0600
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_static_0600
     * @tc.desc   [Parameter verification] The getNotificationParameters interface is successfully invoked when the label parameter contains special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_static_0600';
      let num = 0
      let id: int = 1;
      try {
        let wantAgentObj: Object;
        let wantAgentInfo: wantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: '',
              bundleName: 'com.example.actsnotificationansgetnotificationparameterstest.static',
              abilityName: 'EntryAbility',
              action: 'actionTest1.2',
              entities: [],
              uri: 'abfdsihcnuaoi1.2',
              parameters: {
                'wh1': 123,
                'wh2': 'B',
                'wh3': 58.89,
                'wh4': true,
                'wh5': [123, 234, 567],
                'wh6': [true, false, true],
                'wh7': "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
                'wh8': [11.11, 22.22, 33.33, 44.44],
                'wh9': 2147483648,
                'wh10': [2147483648, 555, 2147483649]
              }as Record<String,RecordData>,
            }
          ],
          actionType: wantAgent.OperationType.START_ABILITY,
          requestCode: 0,
          actionFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
        }
        // 创建WantAgent
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((data) => {
            wantAgentObj = data;
            // publish回调
            let publishCallback = (err: BusinessError|null): void => {
              if (err) {
                console.error(TAG+`${testNum}Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
                if (err?.code === 801) {
                  expect(err.code).assertEqual(801);
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              } else {
                num++
                console.info(TAG+`${testNum}Succeeded in publishing notification.`);
                expect(num).assertEqual(1);
              }
            }
            // 通知Request对象
            let notificationRequest: notificationManager.NotificationRequest = {
              id: 1,
              label: "(~！@#￥%……&*（）——+{}：“《》？~!@#$%^&*()_+{}\"<>?,./;'[]-=",
              wantAgent: wantAgentObj,
              notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
              content: {
                notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                  title: "test_title",
                  text: "test_text",
                  additionalText: "test_additionalText"
                }
              }
            };
            notificationManager.publish(notificationRequest, publishCallback);
          }).catch((error: Error) => {
            let err = error as BusinessError
            console.error(TAG + `${testNum}getWantAgent failed! ${err.code} ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TAG + `${testNum}getWantAgent failed! `);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
        await Utils.msSleep(1000);
        notificationManager.getNotificationParameters(id,'(~！@#￥%……&*（）——+{}：“《》？~!@#$%^&*()_+{}"<>?,./;\'[]-=')
          .then((data: notificationManager.NotificationParameters | null) => {
            num++
            console.info(`${testNum}${num}Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
            expect(JSON.stringify(data?.wantParameters)).assertContain('"wh1":123');
            expect(JSON.stringify(data?.wantAction)).assertContain("actionTest1.2");
            expect(JSON.stringify(data?.wantUri)).assertContain("abfdsihcnuaoi1.2");
            done();
          })
          .catch((error: Error) => {
            let err = error as BusinessError
            console.error(`${testNum}Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getNotificationParameters failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_static_0700
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_static_0700
     * @tc.desc   [Parameter verification] The getNotificationParameters interface is called, and the id and label parameters have normal values. The interface is successfully called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_static_0700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_static_0700';
      let num = 0
      let id: int = 1;
      try {
        let wantAgentObj: Object;
        let wantAgentInfo: wantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: '',
              bundleName: 'com.example.actsnotificationansgetnotificationparameterstest.static',
              abilityName: 'EntryAbility',
              action: 'actionTest1.2',
              entities: [],
              uri: 'abfdsihcnuaoi1.2',
              parameters: {
                'wh1': 123,
                'wh2': 'B',
                'wh3': 58.89,
                'wh4': true,
                'wh5': [123, 234, 567],
                'wh6': [true, false, true],
                'wh7': "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
                'wh8': [11.11, 22.22, 33.33, 44.44],
                'wh9': 2147483648,
                'wh10': [2147483648, 555, 2147483649]
              }as Record<String,RecordData>,
            }
          ],
          actionType: wantAgent.OperationType.START_ABILITY,
          requestCode: 0,
          actionFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
        }
        // 创建WantAgent
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((data) => {
            wantAgentObj = data;
            // publish回调
            let publishCallback = (err: BusinessError|null): void => {
              if (err) {
                console.error(TAG+`${testNum}Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
                if (err?.code === 801) {
                  expect(err.code).assertEqual(801);
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              } else {
                num++
                console.info(TAG+`${testNum}Succeeded in publishing notification.`);
                expect(num).assertEqual(1);
              }
            }
            // 通知Request对象
            let notificationRequest: notificationManager.NotificationRequest = {
              id: 1,
              label: "test",
              wantAgent: wantAgentObj,
              notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
              content: {
                notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                  title: "test_title",
                  text: "test_text",
                  additionalText: "test_additionalText"
                }
              }
            };
            notificationManager.publish(notificationRequest, publishCallback);
          }).catch((error: Error) => {
            let err = error as BusinessError
            console.error(TAG + `${testNum}getWantAgent failed! ${err.code} ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TAG + `${testNum}getWantAgent failed! `);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
        await Utils.msSleep(1000);
        notificationManager.getNotificationParameters(id,'test')
          .then((data: notificationManager.NotificationParameters | null) => {
            num++
            console.info(`${testNum}${num}Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
            expect(JSON.stringify(data?.wantParameters)).assertContain('"wh1":123');
            expect(JSON.stringify(data?.wantAction)).assertContain("actionTest1.2");
            expect(JSON.stringify(data?.wantUri)).assertContain("abfdsihcnuaoi1.2");
            done();
          })
          .catch((error: Error) => {
            let err = error as BusinessError
            console.error(`${testNum}Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getNotificationParameters failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_static_0800
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_static_0800
     * @tc.desc   [Local release] The getNotificationParameters interface is called, where the notification ID is an existing one and the label parameter is not passed. The call is successful
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_static_0800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_static_0800';
      let num = 0
      let id: int = 1;
      try {
        let wantAgentObj: Object;
        let wantAgentInfo: wantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: '',
              bundleName: 'com.example.actsnotificationansgetnotificationparameterstest.static',
              abilityName: 'EntryAbility',
              action: 'actionTest1.2',
              entities: [],
              uri: 'abfdsihcnuaoi1.2',
              parameters: {
                'wh1': 123,
                'wh2': 'B',
                'wh3': 58.89,
                'wh4': true,
                'wh5': [123, 234, 567],
                'wh6': [true, false, true],
                'wh7': "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
                'wh8': [11.11, 22.22, 33.33, 44.44],
                'wh9': 2147483648,
                'wh10': [2147483648, 555, 2147483649]
              }as Record<String,RecordData>,
            }
          ],
          actionType: wantAgent.OperationType.START_ABILITY,
          requestCode: 0,
          actionFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
        }
        // 创建WantAgent
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((data) => {
            wantAgentObj = data;
            // publish回调
            let publishCallback = (err: BusinessError|null): void => {
              if (err) {
                console.error(TAG+`${testNum}Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
                if (err?.code === 801) {
                  expect(err.code).assertEqual(801);
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              } else {
                num++
                console.info(TAG+`${testNum}Succeeded in publishing notification.`);
                expect(num).assertEqual(1);
              }
            }
            // 通知Request对象
            let notificationRequest: notificationManager.NotificationRequest = {
              id: 1,
              wantAgent: wantAgentObj,
              notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
              content: {
                notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                  title: "test_title",
                  text: "test_text",
                  additionalText: "test_additionalText"
                }
              }
            };
            notificationManager.publish(notificationRequest, publishCallback);
          }).catch((error: Error) => {
            let err = error as BusinessError
            console.error(TAG + `${testNum}getWantAgent failed! ${err.code} ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TAG + `${testNum}getWantAgent failed! `);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
        await Utils.msSleep(1000);
        notificationManager.getNotificationParameters(id)
          .then((data: notificationManager.NotificationParameters | null) => {
            num++
            console.info(`${testNum}${num}Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
            expect(JSON.stringify(data?.wantParameters)).assertContain('"wh1":123');
            expect(JSON.stringify(data?.wantAction)).assertContain("actionTest1.2");
            expect(JSON.stringify(data?.wantUri)).assertContain("abfdsihcnuaoi1.2");
            done();
          })
          .catch((error: Error) => {
            let err = error as BusinessError
            console.error(`${testNum}Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getNotificationParameters failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_static_0900
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_static_0900
     * @tc.desc   [Local release] When a notification is released, the wantAgent parameter is carried, while wantAction, uri, and Parameters are not carried. The normal NotificationActionButton is passed, and the getNotificationParameters interface is called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_static_0900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_static_0900';
      let num = 0
      let id: int = 1;
      try {
        try {
          let wantAgentObj: Object;
          let wantAgentInfo: wantAgent.WantAgentInfo = {
            wants: [
              {
                deviceId: '',
                bundleName: 'com.example.actsnotificationansgetnotificationparameterstest.static',
                abilityName: 'EntryAbility',
                entities: [],
              }
            ],
            actionType: wantAgent.OperationType.START_ABILITY,
            requestCode: 0,
            actionFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
          }
          // 创建WantAgent
          try {
            wantAgent.getWantAgent(wantAgentInfo).then((data) => {
              wantAgentObj = data;
              // publish回调
              let publishCallback = (err: BusinessError|null): void => {
                if (err) {
                  console.error(TAG+`${testNum}Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
                  if (err?.code === 801) {
                    expect(err.code).assertEqual(801);
                    done();
                  } else {
                    expect(false).assertTrue();
                    done();
                  }
                } else {
                  num++
                  console.info(TAG+`${testNum}${num}Succeeded in publishing notification.`);
                }
              }
              let userInputContent: notificationManager.NotificationUserInput = {
                inputKey: 'test_NotificationUserInput',
              }
              let agentInfo: wantAgent.WantAgentInfo = {
                wants: [
                  {
                    bundleName: bundleName,
                    abilityName: bundleName + '.MainAbility',
                    action: "usual.event.REMOVAL_WANTAGENT",
                    uri: 'key={true,true,false}',
                    parameters: {
                      'wh1': 123,
                      'wh2': 'B',
                      'wh3': 58.89,
                      'wh4': true,
                      'wh5': [123, 234, 567],
                      'wh6': [true, false, true],
                      'wh7': "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
                      'wh8': [11.11, 22.22, 33.33, 44.44],
                      'wh9': 2147483648,
                      'wh10': [2147483648, 555, 2147483649]
                    }as Record<String,RecordData>,
                  }
                ],
                actionType: wantAgent.OperationType.SEND_COMMON_EVENT,
                requestCode: 0,
                actionFlags: [wantAgent.WantAgentFlags.ONE_TIME_FLAG]
              };
              let wantAgentData = wantAgent.getWantAgent(agentInfo);
              let actionButton: notificationManager.NotificationActionButton = {
                title: "buttonA",
                wantAgent: wantAgentData,
                userInput: userInputContent
              }
              // 通知Request对象
              let notificationRequest: notificationManager.NotificationRequest = {
                id: 1,
                label: '',
                actionButtons: [
                  actionButton
                ],
                wantAgent: wantAgentObj,
                notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
                content: {
                  notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                  normal: {
                    title: "SOCIAL_COMMUNICATION_title",
                    text: "test_text",
                    additionalText: "test_additionalText"
                  }
                }
              };
              notificationManager.publish(notificationRequest, publishCallback);
            }).catch((error: Error) => {
              let err = error as BusinessError
              console.error(TAG + `${testNum}getWantAgent failed! ${err.code} ${err.message}`);
            });
          } catch (err) {
            console.error(TAG + `${testNum}getWantAgent failed! `);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          }
        } catch (err) {
          console.error(TAG + `${testNum}getWantAgent failed! `);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
        await Utils.msSleep(1000);
        notificationManager.getNotificationParameters(id)
          .then((data: notificationManager.NotificationParameters | null) => {
            num++
            console.info(`${testNum}${num}Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
            expect(JSON.stringify(data?.wantParameters)).assertContain(`"moduleName":""`);
            expect(JSON.stringify(data?.wantAction)).assertContain("");
            expect(JSON.stringify(data?.wantUri)).assertContain("");
            done();
          })
          .catch((error: Error) => {
            let err = error as BusinessError
            console.error(`${testNum}Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getNotificationParameters failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_static_1000
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_static_1000
     * @tc.desc   [Notification update] After a notification is published with a normal WantAgent, the WantAgent is updated when the notification is updated, and getNotificationParameters is successfully called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_static_1000', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_static_1000';
      let num = 0
      let id: int = 1;
      try {
        let wantAgentObj: Object;
        let wantAgentInfo: wantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: '',
              bundleName: 'com.example.actsnotificationansgetnotificationparameterstest.static',
              abilityName: 'EntryAbility',
              action: 'actionTest1.2',
              entities: [],
              uri: 'abfdsihcnuaoi1.2',
              parameters: {
                'wh1': 123,
                'wh2': 'B',
                'wh3': 58.89,
                'wh4': true,
                'wh5': [123, 234, 567],
                'wh6': [true, false, true],
                'wh7': "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
                'wh8': [11.11, 22.22, 33.33, 44.44],
                'wh9': 2147483648,
                'wh10': [2147483648, 555, 2147483649]
              }as Record<String,RecordData>,
            }
          ],
          actionType: wantAgent.OperationType.START_ABILITY,
          requestCode: 0,
          actionFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
        }
        let wantAgentInfoOther: wantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: '',
              bundleName: 'com.example.actsnotificationansgetnotificationparameterstest.static',
              abilityName: 'EntryAbility',
              action: 'actionTest1.2',
              entities: [],
              uri: 'abfdsihcnuaoi1.2',
              parameters: {
                'wh1': 321,
                'wh2': 'B',
                'wh3': 58.89,
                'wh4': true,
                'wh5': [123, 234, 567],
                'wh6': [true, false, true],
                'wh7': "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
                'wh8': [11.11, 22.22, 33.33, 44.44],
                'wh9': 2147483648,
                'wh10': [2147483648, 555, 2147483649]
              }as Record<String,RecordData>,
            }
          ],
          actionType: wantAgent.OperationType.START_ABILITY,
          requestCode: 0,
          actionFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
        }
        // 创建WantAgent
        try {
          wantAgent.getWantAgent(wantAgentInfo).then((data) => {
            wantAgentObj = data;
            // publish回调
            let publishCallback = (err: BusinessError|null): void => {
              if (err) {
                console.error(TAG+`${testNum}Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
                if (err?.code === 801) {
                  expect(err.code).assertEqual(801);
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              } else {
                num++
                console.info(TAG+`${testNum}${num}Succeeded in publishing notification1.`);
                expect(num).assertEqual(1);
              }
            }
            // 通知Request对象
            let notificationRequest: notificationManager.NotificationRequest = {
              id: 1,
              wantAgent: wantAgentObj,
              notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
              content: {
                notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                  title: "test_title",
                  text: "test_text",
                  additionalText: "test_additionalText"
                }
              }
            };
            notificationManager.publish(notificationRequest, publishCallback);
          }).catch((error: Error) => {
            let err = error as BusinessError
            console.error(TAG + `${testNum}getWantAgent failed! ${err.code} ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
          await Utils.msSleep(1000);
          wantAgent.getWantAgent(wantAgentInfoOther).then((data) => {
            wantAgentObj = data;
            // publish回调
            let publishCallback = (err: BusinessError|null): void => {
              if (err) {
                console.error(TAG+`${testNum}Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
                if (err?.code === 801) {
                  expect(err.code).assertEqual(801);
                  done();
                } else {
                  expect(false).assertTrue();
                  done();
                }
              } else {
                num++
                console.info(TAG+`${testNum}${num}Succeeded in publishing notification2.`);
                expect(num).assertEqual(2);
              }
            }
            // 通知Request对象
            let notificationRequest: notificationManager.NotificationRequest = {
              id: 1,
              wantAgent: wantAgentObj,
              notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
              content: {
                notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                  title: "test_title",
                  text: "test_text",
                  additionalText: "test_additionalText"
                }
              }
            };
            notificationManager.publish(notificationRequest, publishCallback);
          }).catch((error: Error) => {
            let err = error as BusinessError
            console.error(TAG + `${testNum}getWantAgent failed! ${err.code} ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
        } catch (err) {
          console.error(TAG + `${testNum}getWantAgent failed! `);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
        await Utils.msSleep(1000);
        notificationManager.getNotificationParameters(id)
          .then((data: notificationManager.NotificationParameters | null) => {
            num++
            console.info(`${testNum}${num}Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
            expect(JSON.stringify(data?.wantParameters)).assertContain('"wh1":321');
            expect(JSON.stringify(data?.wantAction)).assertContain("actionTest1.2");
            expect(JSON.stringify(data?.wantUri)).assertContain("abfdsihcnuaoi1.2");
            done();
          })
          .catch((error: Error) => {
            let err = error as BusinessError
            console.error(`${testNum}Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getNotificationParameters failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })
  })
}

