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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { notificationManager } from '@kit.NotificationKit';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@kit.TestKit';
import { wantAgent } from '@kit.AbilityKit';
import type { WantAgent } from '@kit.AbilityKit';

const bundleName = 'com.example.actsnotificationansgetnotificationparameterstest'
let context: common.UIAbilityContext;

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

export default function actsNotificationAnsGetNotificationParametersTest() {
  describe('actsNotificationAnsGetNotificationParametersTest', () => {
    beforeAll(async () => {
      context = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
      notificationManager.requestEnableNotification(context).then(() => {
        console.info(`requestEnableNotification succeeded`);
      }).catch((err: BusinessError) => {
        console.info(`requestEnableNotification err: ` + JSON.stringify(err));
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
        } else {
          expect().assertFail();
        }
      });
      await sleep(1000)
      let driver = Driver.create();
      let button = await driver.findComponent(ON.text('允许'));
      console.info(`button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await sleep(1000);
        await button.click();
        await sleep(1000);
      } else {
        console.info(`null button`);
        expect(button).assertContain('允许')
      }
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_0100
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_0100
     * @tc.desc   [Notification does not exist] When the getNotificationParameters interface is called and an ID of a notification that does not exist is passed, error 1600007 is reported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_0100', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_0100';
      try {
        await notificationManager.getNotificationParameters(99)
          .then((data: notificationManager.NotificationParameters) => {
            console.info(`${testNum} Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${testNum} Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
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
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_0200
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_0200
     * @tc.desc   [Notification does not exist] When the getNotificationParameters interface is called and an existing notification is passed as the label, error 1600007 is reported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_0200', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_0200';
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
      try {
        await notificationManager.publish(notificationRequest).then(() => {
          num = 0
          console.info(`${testNum} ${num} publish success`);
          num++
          expect(num).assertEqual(1)
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'testTag', `${testNum} publish failed: ${err.code}, ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
        await notificationManager.getNotificationParameters(1, '111')
          .then((data: notificationManager.NotificationParameters) => {
            console.info(`${testNum} Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${testNum} Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
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
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_0300
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_0300
     * @tc.desc   [Parameter verification] The getNotificationParameters interface is successfully invoked when the label parameter is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_0300', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_0300';
      let num = 0
      let wantAgentObj: WantAgent;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: '',
            bundleName: 'com.example.actsnotificationansgetnotificationparameterstest',
            abilityName: 'EntryAbility',
            action: 'action.system.home',
            entities: ["entity.system.home"],
            uri: 'key={true,true,false}',
            parameters: {
              'test1': 123,
              'test2': 345,
              wh1: 123,
              wh2: 'B',
              wh3: 58.89,
              wh4: true,
              wh5: [123, 234, 567],
              wh6: [true, false, true],
              wh7: "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
              wh8: [11.11, 22.22, 33.33, 44.44],
              wh9: 2147483648,
              wh10: [2147483648, 555, 2147483649]
            }
          }
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
      }
      try {
        await wantAgent.getWantAgent(wantAgentInfo).then(async (data) => {
          num++
          wantAgentObj = data;
          console.info(`${testNum} getWantAgent success,wantAgentObj is: ${JSON.stringify(data)}`);
          expect(num).assertEqual(1);
          let notificationRequest: notificationManager.NotificationRequest = {
            id: 1,
            wantAgent: wantAgentObj,
            notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
              normal: {
                title: "aaa",
                text: "text",
                additionalText: "additionalText"
              }
            },
          };
          await notificationManager.publish(notificationRequest).then(() => {
            num = 0
            console.info(testNum + "publish success");
            num++
            expect(num).assertEqual(1);
          }).catch((err: BusinessError) => {
            console.error(testNum + `publish failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
          await notificationManager.getNotificationParameters(1, null)
            .then((data: notificationManager.NotificationParameters) => {
              console.info(`${testNum} Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
              expect(data.wantAction).assertEqual(wantAgentInfo.wants[0].action);
              expect(data.wantUri).assertEqual(wantAgentInfo.wants[0].uri);
              expect(JSON.stringify(data.wantParameters))
                .assertEqual('{"moduleName":"","test1":123,"test2":345,"wh1":123,"wh10":[2147483648,555,2147483649],"wh2":"B","wh3":58.89,"wh4":true,"wh5":[123,234,567],"wh6":[true,false,true],"wh7":"whwhwhwhwhwhwhwhwhhwwhwhwhwhwh","wh8":[11.11,22.22,33.33,44.44],"wh9":2147483648}')
              done();
            })
            .catch((err: BusinessError) => {
              console.error(`${testNum} Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
              if (err?.code === 801) {
                expect(err.code).assertEqual(801);
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
        }).catch((err: BusinessError) => {
          console.error(testNum +
            `getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
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
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_0400
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_0400
     * @tc.desc   [Parameter verification] The getNotificationParameters interface is successfully invoked when the label parameter is set to undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_0400', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_0400';
      let num = 0
      let wantAgentObj: WantAgent;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: '',
            bundleName: 'com.example.actsnotificationansgetnotificationparameterstest',
            abilityName: 'EntryAbility',
            action: 'action.system.home',
            entities: ["entity.system.home"],
            uri: 'key={true,true,false}',
            parameters: {
              'test1': 123,
              'test2': 345,
              wh1: 123,
              wh2: 'B',
              wh3: 58.89,
              wh4: true,
              wh5: [123, 234, 567],
              wh6: [true, false, true],
              wh7: "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
              wh8: [11.11, 22.22, 33.33, 44.44],
              wh9: 2147483648,
              wh10: [2147483648, 555, 2147483649]
            }
          }
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
      }
      try {
        await wantAgent.getWantAgent(wantAgentInfo).then(async (data) => {
          num++
          wantAgentObj = data;
          console.info(`${testNum} getWantAgent success,wantAgentObj is: ${JSON.stringify(data)}`);
          expect(num).assertEqual(1);
          let notificationRequest: notificationManager.NotificationRequest = {
            id: 1,
            wantAgent: wantAgentObj,
            notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
              normal: {
                title: "aaa",
                text: "text",
                additionalText: "additionalText"
              }
            },
          };
          await notificationManager.publish(notificationRequest).then(() => {
            num = 0
            console.info(testNum + "publish success");
            num++
            expect(num).assertEqual(1);
          }).catch((err: BusinessError) => {
            console.error(testNum + `publish failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
          await notificationManager.getNotificationParameters(1, undefined)
            .then((data: notificationManager.NotificationParameters) => {
              console.info(`${testNum} Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
              expect(data.wantAction).assertEqual(wantAgentInfo.wants[0].action);
              expect(data.wantUri).assertEqual(wantAgentInfo.wants[0].uri);
              expect(JSON.stringify(data.wantParameters))
                .assertEqual('{"moduleName":"","test1":123,"test2":345,"wh1":123,"wh10":[2147483648,555,2147483649],"wh2":"B","wh3":58.89,"wh4":true,"wh5":[123,234,567],"wh6":[true,false,true],"wh7":"whwhwhwhwhwhwhwhwhhwwhwhwhwhwh","wh8":[11.11,22.22,33.33,44.44],"wh9":2147483648}')
              done();
            })
            .catch((err: BusinessError) => {
              console.error(`${testNum} Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
              if (err?.code === 801) {
                expect(err.code).assertEqual(801);
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
        }).catch((err: BusinessError) => {
          console.error(testNum +
            `getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
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
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_0500
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_0500
     * @tc.desc   [Parameter verification] The getNotificationParameters interface is successfully invoked when the label parameter is set to undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_0500', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_0500';
      let num = 0
      let wantAgentObj: WantAgent;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: '',
            bundleName: 'com.example.actsnotificationansgetnotificationparameterstest',
            abilityName: 'EntryAbility',
            action: 'action.system.home',
            entities: ["entity.system.home"],
            uri: 'key={true,true,false}',
            parameters: {
              'test1': 123,
              'test2': 345,
              wh1: 123,
              wh2: 'B',
              wh3: 58.89,
              wh4: true,
              wh5: [123, 234, 567],
              wh6: [true, false, true],
              wh7: "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
              wh8: [11.11, 22.22, 33.33, 44.44],
              wh9: 2147483648,
              wh10: [2147483648, 555, 2147483649]
            }
          }
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
      }
      try {
        await wantAgent.getWantAgent(wantAgentInfo).then(async (data) => {
          num++
          wantAgentObj = data;
          console.info(`${testNum} getWantAgent success,wantAgentObj is: ${JSON.stringify(data)}`);
          expect(num).assertEqual(1);
          let notificationRequest: notificationManager.NotificationRequest = {
            id: 1,
            label: '',
            wantAgent: wantAgentObj,
            notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
              normal: {
                title: "aaa",
                text: "text",
                additionalText: "additionalText"
              }
            },
          };
          await notificationManager.publish(notificationRequest).then(() => {
            num = 0
            console.info(testNum + "publish success");
            num++
            expect(num).assertEqual(1);
          }).catch((err: BusinessError) => {
            console.error(testNum + `publish failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
          await notificationManager.getNotificationParameters(1, '')
            .then((data: notificationManager.NotificationParameters) => {
              console.info(`${testNum} Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
              expect(data.wantAction).assertEqual(wantAgentInfo.wants[0].action);
              expect(data.wantUri).assertEqual(wantAgentInfo.wants[0].uri);
              expect(JSON.stringify(data.wantParameters))
                .assertEqual('{"moduleName":"","test1":123,"test2":345,"wh1":123,"wh10":[2147483648,555,2147483649],"wh2":"B","wh3":58.89,"wh4":true,"wh5":[123,234,567],"wh6":[true,false,true],"wh7":"whwhwhwhwhwhwhwhwhhwwhwhwhwhwh","wh8":[11.11,22.22,33.33,44.44],"wh9":2147483648}')
              done();
            })
            .catch((err: BusinessError) => {
              console.error(`${testNum} Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
              if (err?.code === 801) {
                expect(err.code).assertEqual(801);
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
        }).catch((err: BusinessError) => {
          console.error(testNum +
            `getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
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
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_0600
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_0600
     * @tc.desc   [Parameter verification] The getNotificationParameters interface is successfully invoked when the label parameter contains special characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_0600', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_0600';
      let num = 0
      let wantAgentObj: WantAgent;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: '',
            bundleName: 'com.example.actsnotificationansgetnotificationparameterstest',
            abilityName: 'EntryAbility',
            action: 'action.system.home',
            entities: ["entity.system.home"],
            uri: 'key={true,true,false}',
            parameters: {
              'test1': 123,
              'test2': 345,
              wh1: 123,
              wh2: 'B',
              wh3: 58.89,
              wh4: true,
              wh5: [123, 234, 567],
              wh6: [true, false, true],
              wh7: "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
              wh8: [11.11, 22.22, 33.33, 44.44],
              wh9: 2147483648,
              wh10: [2147483648, 555, 2147483649]
            }
          }
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
      }
      try {
        await wantAgent.getWantAgent(wantAgentInfo).then(async (data) => {
          num++
          wantAgentObj = data;
          console.info(`${testNum} getWantAgent success,wantAgentObj is: ${JSON.stringify(data)}`);
          expect(num).assertEqual(1);
          let notificationRequest: notificationManager.NotificationRequest = {
            id: 1,
            label: '(~！@#￥%……&*（）——+{}：“《》？~!@#$%^&*()_+{}"<>?,./;\'[]-=',
            wantAgent: wantAgentObj,
            notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
              normal: {
                title: "aaa",
                text: "text",
                additionalText: "additionalText"
              }
            },
          };
          await notificationManager.publish(notificationRequest).then(() => {
            num = 0
            console.info(testNum + "publish success");
            num++
            expect(num).assertEqual(1);
          }).catch((err: BusinessError) => {
            console.error(testNum + `publish failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
          await notificationManager.getNotificationParameters(1, '(~！@#￥%……&*（）——+{}：“《》？~!@#$%^&*()_+{}"<>?,./;\'[]-=')
            .then((data: notificationManager.NotificationParameters) => {
              console.info(`${testNum} Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
              expect(data.wantAction).assertEqual(wantAgentInfo.wants[0].action);
              expect(data.wantUri).assertEqual(wantAgentInfo.wants[0].uri);
              expect(JSON.stringify(data.wantParameters))
                .assertEqual('{"moduleName":"","test1":123,"test2":345,"wh1":123,"wh10":[2147483648,555,2147483649],"wh2":"B","wh3":58.89,"wh4":true,"wh5":[123,234,567],"wh6":[true,false,true],"wh7":"whwhwhwhwhwhwhwhwhhwwhwhwhwhwh","wh8":[11.11,22.22,33.33,44.44],"wh9":2147483648}')
              done();
            })
            .catch((err: BusinessError) => {
              console.error(`${testNum} Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
              if (err?.code === 801) {
                expect(err.code).assertEqual(801);
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
        }).catch((err: BusinessError) => {
          console.error(testNum +
            `getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
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
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_0700
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_0700
     * @tc.desc   [Parameter verification] The getNotificationParameters interface is called, and the id and label parameters have normal values. The interface is successfully called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_GetNotificationParameters_0700', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_0700';
      let num = 0
      let wantAgentObj: WantAgent;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: '',
            bundleName: 'com.example.actsnotificationansgetnotificationparameterstest',
            abilityName: 'EntryAbility',
            action: 'action.system.home',
            entities: ["entity.system.home"],
            uri: 'key={true,true,false}',
            parameters: {
              'test1': 123,
              'test2': 345,
              wh1: 123,
              wh2: 'B',
              wh3: 58.89,
              wh4: true,
              wh5: [123, 234, 567],
              wh6: [true, false, true],
              wh7: "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
              wh8: [11.11, 22.22, 33.33, 44.44],
              wh9: 2147483648,
              wh10: [2147483648, 555, 2147483649]
            }
          }
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
      }
      try {
        await wantAgent.getWantAgent(wantAgentInfo).then(async (data) => {
          num++
          wantAgentObj = data;
          console.info(`${testNum} getWantAgent success,wantAgentObj is: ${JSON.stringify(data)}`);
          expect(num).assertEqual(1);
          let notificationRequest: notificationManager.NotificationRequest = {
            id: 1,
            label: 'test',
            wantAgent: wantAgentObj,
            notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
              normal: {
                title: "aaa",
                text: "text",
                additionalText: "additionalText"
              }
            },
          };
          await notificationManager.publish(notificationRequest).then(() => {
            num = 0
            console.info(testNum + "publish success");
            num++
            expect(num).assertEqual(1);
          }).catch((err: BusinessError) => {
            console.error(testNum + `publish failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
          await notificationManager.getNotificationParameters(1, 'test')
            .then((data: notificationManager.NotificationParameters) => {
              console.info(`${testNum} Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
              expect(data.wantAction).assertEqual(wantAgentInfo.wants[0].action);
              expect(data.wantUri).assertEqual(wantAgentInfo.wants[0].uri);
              expect(JSON.stringify(data.wantParameters))
                .assertEqual('{"moduleName":"","test1":123,"test2":345,"wh1":123,"wh10":[2147483648,555,2147483649],"wh2":"B","wh3":58.89,"wh4":true,"wh5":[123,234,567],"wh6":[true,false,true],"wh7":"whwhwhwhwhwhwhwhwhhwwhwhwhwhwh","wh8":[11.11,22.22,33.33,44.44],"wh9":2147483648}')
              done();
            })
            .catch((err: BusinessError) => {
              console.error(`${testNum} Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
              if (err?.code === 801) {
                expect(err.code).assertEqual(801);
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
        }).catch((err: BusinessError) => {
          console.error(testNum +
            `getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
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
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_0800
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_0800
     * @tc.desc   [Local release] The getNotificationParameters interface is called, where the notification ID is an existing one and the label parameter is not passed. The call is successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_GetNotificationParameters_0800', Level.LEVEL0, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_0800';
      let num = 0
      let wantAgentObj: WantAgent;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: '',
            bundleName: 'com.example.actsnotificationansgetnotificationparameterstest',
            abilityName: 'EntryAbility',
            action: 'action.system.home',
            entities: ["entity.system.home"],
            uri: 'key={true,true,false}',
            parameters: {
              'test1': 123,
              'test2': 345,
              wh1: 123,
              wh2: 'B',
              wh3: 58.89,
              wh4: true,
              wh5: [123, 234, 567],
              wh6: [true, false, true],
              wh7: "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
              wh8: [11.11, 22.22, 33.33, 44.44],
              wh9: 2147483648,
              wh10: [2147483648, 555, 2147483649]
            }
          }
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
      }
      try {
        await wantAgent.getWantAgent(wantAgentInfo).then(async (data) => {
          num++
          wantAgentObj = data;
          console.info(`${testNum} getWantAgent success,wantAgentObj is: ${JSON.stringify(data)}`);
          expect(num).assertEqual(1);
          let notificationRequest: notificationManager.NotificationRequest = {
            id: 1,
            wantAgent: wantAgentObj,
            notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
              normal: {
                title: "aaa",
                text: "text",
                additionalText: "additionalText"
              }
            },
          };
          await notificationManager.publish(notificationRequest).then(() => {
            num = 0
            console.info(testNum + "publish success");
            num++
            expect(num).assertEqual(1);
          }).catch((err: BusinessError) => {
            console.error(testNum + `publish failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
          await notificationManager.getNotificationParameters(1)
            .then((data: notificationManager.NotificationParameters) => {
              console.info(`${testNum} Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
              expect(data.wantAction).assertEqual(wantAgentInfo.wants[0].action);
              expect(data.wantUri).assertEqual(wantAgentInfo.wants[0].uri);
              expect(JSON.stringify(data.wantParameters))
                .assertEqual('{"moduleName":"","test1":123,"test2":345,"wh1":123,"wh10":[2147483648,555,2147483649],"wh2":"B","wh3":58.89,"wh4":true,"wh5":[123,234,567],"wh6":[true,false,true],"wh7":"whwhwhwhwhwhwhwhwhhwwhwhwhwhwh","wh8":[11.11,22.22,33.33,44.44],"wh9":2147483648}')
              done();
            })
            .catch((err: BusinessError) => {
              console.error(`${testNum} Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
              if (err?.code === 801) {
                expect(err.code).assertEqual(801);
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
        }).catch((err: BusinessError) => {
          console.error(testNum +
            `getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
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
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_0900
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_0900
     * @tc.desc   [Local release] The getNotificationParameters interface is called, where the notification ID is an existing one and the label parameter is not passed. The call is successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_0900', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_0900';
      let num = 0
      let wantAgentObj: WantAgent;
      let wantAgentInfo: wantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: '',
            bundleName: 'com.example.actsnotificationansgetnotificationparameterstest',
            abilityName: 'EntryAbility',
            action: 'action.system.home',
            entities: ["entity.system.home"],
            uri: 'key={true,true,false}',
            parameters: {
              'test1': 123,
              'test2': 345,
              wh1: 123,
              wh2: 'B',
              wh3: 58.89,
              wh4: true,
              wh5: [123, 234, 567],
              wh6: [true, false, true],
              wh7: "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
              wh8: [11.11, 22.22, 33.33, 44.44],
              wh9: 2147483648,
              wh10: [2147483648, 555, 2147483649]
            }
          }
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
      }
      try {
        await wantAgent.getWantAgent(wantAgentInfo).then(async (data) => {
          num++
          wantAgentObj = data;
          console.info(`${testNum} getWantAgent success,wantAgentObj is: ${JSON.stringify(data)}`);
          expect(num).assertEqual(1);
          let notificationRequest: notificationManager.NotificationRequest = {
            id: 1,
            actionButtons: [{ title: 'test', wantAgent: wantAgentObj }],
            notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
              normal: {
                title: "aaa",
                text: "text",
                additionalText: "additionalText"
              }
            },
          };
          await notificationManager.publish(notificationRequest).then(() => {
            num = 0
            console.info(testNum + "publish success");
            num++
            expect(num).assertEqual(1);
          }).catch((err: BusinessError) => {
            console.error(testNum + `publish failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
          await notificationManager.getNotificationParameters(1)
            .then((data: notificationManager.NotificationParameters) => {
              console.info(`${testNum} Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
              expect(data.wantAction).assertEqual('');
              expect(data.wantUri).assertEqual('');
              expect(data.wantParameters)
                .assertEqual(undefined)
              done();
            })
            .catch((err: BusinessError) => {
              console.error(`${testNum} Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
              if (err?.code === 801) {
                expect(err.code).assertEqual(801);
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
        }).catch((err: BusinessError) => {
          console.error(testNum +
            `getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
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
     * @tc.name   SUB_Notification_Ans_GetNotificationParameters_1000
     * @tc.number SUB_Notification_Ans_GetNotificationParameters_1000
     * @tc.desc   [Notification update] After a notification is published with a normal WantAgent, the WantAgent is updated when the notification is updated, and getNotificationParameters is successfully called.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_GetNotificationParameters_1000', Level.LEVEL2, async (done: Function) => {
      const testNum = 'SUB_Notification_Ans_GetNotificationParameters_1000';
      let num = 0
      let wantAgentInfo1: wantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: '',
            bundleName: 'com.example.actsnotificationansgetnotificationparameterstest',
            abilityName: 'EntryAbility',
            action: 'action.system.home',
            entities: ["entity.system.home"],
            uri: 'key={true,true,false}',
            parameters: {
              'test1': 123,
              'test2': 345,
              wh1: 123,
              wh2: 'B',
              wh3: 58.89,
              wh4: true,
              wh5: [123, 234, 567],
              wh6: [true, false, true],
              wh7: "whwhwhwhwhwhwhwhwhhwwhwhwhwhwh",
              wh8: [11.11, 22.22, 33.33, 44.44],
              wh9: 2147483648,
              wh10: [2147483648, 555, 2147483649]
            }
          }
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
      }
      let wantAgentInfo2: wantAgent.WantAgentInfo = {
        wants: [
          {
            deviceId: '',
            bundleName: 'com.example.actsnotificationansgetnotificationparameterstest',
            abilityName: 'EntryAbility',
            action: 'action.system.home',
            entities: [],
            uri: '',
            parameters: {
              'test1': 0,
              'test2': 0,
              wh1: 0,
              wh2: '',
              wh3: 0,
              wh4: true,
              wh5: [],
              wh6: [],
              wh7: "",
              wh8: [],
              wh9: 0,
              wh10: []
            }
          }
        ],
        actionType: wantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.CONSTANT_FLAG]
      }
      try {
        await wantAgent.getWantAgent(wantAgentInfo1).then(async (data) => {
          num++
          let wantAgentObj1 = data;
          console.info(`${testNum} getWantAgent success,wantAgentObj is: ${JSON.stringify(data)}`);
          expect(num).assertEqual(1);
          let notificationRequest1: notificationManager.NotificationRequest = {
            id: 1,
            wantAgent: wantAgentObj1,
            notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
              normal: {
                title: "aaa",
                text: "text",
                additionalText: "additionalText"
              }
            },
          };
          await notificationManager.publish(notificationRequest1).then(() => {
            num = 0
            console.info(testNum + "publish success");
            num++
            expect(num).assertEqual(1);
          }).catch((err: BusinessError) => {
            console.error(testNum + `publish failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
          await wantAgent.getWantAgent(wantAgentInfo2).then(async (data) => {
            num = 0
            let wantAgentObj2 = data;
            console.info(`${testNum} getWantAgent success,wantAgentObj is: ${JSON.stringify(data)}`);
            num++
            expect(num).assertEqual(1);
            let notificationRequest2: notificationManager.NotificationRequest = {
              id: 1,
              wantAgent: wantAgentObj2,
              notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
              content: {
                notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
                normal: {
                  title: "aaa",
                  text: "text",
                  additionalText: "additionalText"
                }
              },
            };
            await notificationManager.publish(notificationRequest2).then(() => {
              num = 0
              console.info(testNum + "publish success");
              num++
              expect(num).assertEqual(1);
            }).catch((err: BusinessError) => {
              console.error(testNum + `publish failed, code is ${err.code}, message is ${err.message}`);
              if (err?.code === 801) {
                expect(err.code).assertEqual(801);
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
          }).catch((err: BusinessError) => {
            console.error(testNum +
              `getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect().assertFail();
              done();
            }
          });
          await sleep(1500)
          await notificationManager.getNotificationParameters(1)
            .then((data: notificationManager.NotificationParameters) => {
              console.info(`${testNum} Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
              expect(data.wantAction).assertEqual('action.system.home');
              expect(data.wantUri).assertEqual('');
              expect(JSON.stringify(data.wantParameters))
                .assertEqual('{"moduleName":"","test1":0,"test2":0,"wh1":0,"wh2":"","wh3":0,"wh4":true,"wh7":"","wh9":0}')
              done();
            })
            .catch((err: BusinessError) => {
              console.error(`${testNum} Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
              if (err?.code === 801) {
                expect(err.code).assertEqual(801);
                done();
              } else {
                expect().assertFail();
                done();
              }
            });
        }).catch((err: BusinessError) => {
          console.error(testNum +
            `getWantAgent failed, code: ${JSON.stringify(err.code)}, message: ${JSON.stringify(err.message)}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
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
     * @tc.name   Sub_Notification_Ans_GetNotificationParameters_1100
     * @tc.number Sub_Notification_Ans_GetNotificationParameters_1100
     * @tc.desc   [Notification does not exist] When the getNotificationParameters interface of null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_GetNotificationParameters_1100', Level.LEVEL2, async (done: Function) => {
      const testNum = 'Sub_Notification_Ans_GetNotificationParameters_1100';
      try {
        await notificationManager.getNotificationParameters(null,"label")
          .then((data: notificationManager.NotificationParameters) => {
            console.info(`${testNum} Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${testNum} Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(err.code).assertEqual(401);
              done();
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getNotificationParameters failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(err.code).assertEqual(401);
          done();
        }
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_GetNotificationParameters_1200
     * @tc.number Sub_Notification_Ans_GetNotificationParameters_1200
     * @tc.desc   [Notification does not exist] When the getNotificationParameters interface of undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_GetNotificationParameters_1200', Level.LEVEL2, async (done: Function) => {
      const testNum = 'Sub_Notification_Ans_GetNotificationParameters_1200';
      try {
        await notificationManager.getNotificationParameters(undefined,"label")
          .then((data: notificationManager.NotificationParameters) => {
            console.info(`${testNum} Succeeded in getting notification parameters, data is ${JSON.stringify(data)}`);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.error(`${testNum} Failed to get notification parameters. Code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(err.code).assertEqual(401);
              done();
            }
          });
      } catch (err) {
        hilog.error(0x0000, 'testTag', `${testNum} getNotificationParameters failed: ${err.code}, ${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(err.code).assertEqual(401);
          done();
        }
      }
    })
  })
}