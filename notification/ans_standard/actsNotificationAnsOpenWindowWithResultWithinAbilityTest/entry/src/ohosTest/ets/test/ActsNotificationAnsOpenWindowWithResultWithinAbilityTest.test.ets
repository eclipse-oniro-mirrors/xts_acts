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
import { describe, afterEach, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { notificationExtensionSubscription } from '@kit.NotificationKit';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@kit.TestKit';

let ctx = getContext(this) as common.UIAbilityContext;

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

let tag = 'ActsNotificationAnsOpenWindowWithResultWithinAbilityTest'

export default function ActsNotificationAnsOpenWindowWithResultWithinAbilityTest() {
  describe('ActsNotificationAnsOpenWindowWithResultWithinAbilityTest', () => {
    afterEach(async () => {
      await sleep(2000)
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_0800
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_0800
     * @tc.desc   [openSubscriptionSettingsWithResult] After the openSubscriptionSettingsWithResult API is called to display a semi-modal dialog box and the user clicks OK, the callback is correctly executed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_0800', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_0800'
      let driver: Driver = Driver.create();
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        notificationExtensionSubscription.openSubscriptionSettingsWithResult(context).then((data) => {
          hilog.info(0x0000, 'testTag',
            `${testNum} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data.userGrantEnabled).assertEqual(false)
          if (data.grantedBundleInfos !== undefined) {
            expect(JSON.stringify(data.grantedBundleInfos)).assertEqual('[]')
          }
          done()
        }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          hilog.error(0x0000, 'testTag',
            `${testNum} openSubscriptionSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 201) {
            expect(err?.code).assertEqual(201)
            done()
          } else {
            expect(false).assertTrue();
            done()
          }
        });
        await driver.assertComponentExist(ON.text('应用获取本机通知'));
        let button2 = await driver.findComponent(ON.text('确定'));
        console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
          await sleep(1000);
          await button2.click()
          await sleep(100)
        }
      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_0500
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_0500
     * @tc.desc   [openSubscriptionSettingsWithResult] After the openSubscriptionSettingsWithResult API is called to display a semi-modal dialog, the switch for allowing the app to obtain local notifications is turned on, and the obtained local notifications remain unchanged. After the user clicks OK, the callback is correctly executed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_openWindow_WithResult_0500', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_0500'
      let driver: Driver = Driver.create();
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        notificationExtensionSubscription.openSubscriptionSettingsWithResult(context).then((data) => {
          hilog.info(0x0000, 'testTag',
            `${testNum} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data.userGrantEnabled).assertEqual(true)
          if (data.grantedBundleInfos !== undefined) {
            for (let index = 0; index < data.grantedBundleInfos?.length; index++) {
              expect(data.grantedBundleInfos[index].appIndex).assertEqual(0)
            }
          }
          done()
        }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          hilog.error(0x0000, 'testTag',
            `${testNum} openSubscriptionSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 201) {
            expect(err?.code).assertEqual(201)
            done()
          } else {
            expect(false).assertTrue();
            done()
          }
        });
        await sleep(1000)
        let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许获取本机通知')));
        console.info(testNum + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          console.info(testNum + `button is ${JSON.stringify(button)}`);
          await sleep(1000);
          await button.click()
          await sleep(500)
        }
        let button1 = await driver.findComponent(ON.text('允许'));
        console.info(testNum + `button1 is ${JSON.stringify(button1)}`);
        if (button1 !== null) {
          console.info(testNum + `button1 is ${JSON.stringify(button1)}`);
          await sleep(1000);
          await button1.click()
          await sleep(100)
        }
        await sleep(500)
        let button8 = await driver.findComponent(ON.text('确定'));
        console.info(testNum + `button8 is ${JSON.stringify(button8)}`);
        if (button8 !== null) {
          console.info(testNum + `button8 is ${JSON.stringify(button8)}`);
          await sleep(1000);
          await button8.click()
          await sleep(100)
        }
      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_0600
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_0600
     * @tc.desc   [openSubscriptionSettingsWithResult] After the openSubscriptionSettingsWithResult API is called to display a semi-modal dialog, the switch for allowing the app to obtain local notifications is turned on, and the obtained local notifications remain unchanged. After the user clicks OK, the callback is correctly executed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_openWindow_WithResult_0600', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_0600'
      let driver: Driver = Driver.create();
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        notificationExtensionSubscription.openSubscriptionSettingsWithResult(context).then((data) => {
          hilog.info(0x0000, 'testTag',
            `${testNum} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data.userGrantEnabled).assertEqual(false)
          if (data.grantedBundleInfos !== undefined) {
            expect(JSON.stringify(data.grantedBundleInfos)).assertEqual('[]')
          }
          done()
        }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          hilog.error(0x0000, 'testTag',
            `${testNum} openSubscriptionSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 201) {
            expect(err?.code).assertEqual(201)
            done()
          } else {
            expect(false).assertTrue();
            done()
          }
        });
        await sleep(1000)
        let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许获取本机通知')));
        console.info(testNum + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          console.info(testNum + `button is ${JSON.stringify(button)}`);
          await sleep(1000);
          await button.click()
          await sleep(500)
        }
        await sleep(500)
        let button2 = await driver.findComponent(ON.text('确定'));
        console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
          await sleep(1000);
          await button2.click()
          await sleep(100)
        }
      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_1000
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_1000
     * @tc.desc   [openSubscriptionSettingsWithResult] After the call to openSubscriptionSettingsWithResult is used to modify the setting of whether to allow the app to obtain local notifications and the setting is confirmed, the app is closed. Then, the openSubscriptionSettingsWithResult call is used again to directly close the app.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_1000', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_1000'
      let driver: Driver = Driver.create();
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        notificationExtensionSubscription.openSubscriptionSettingsWithResult(context).then((data) => {
          hilog.info(0x0000, 'testTag',
            `${testNum} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data.userGrantEnabled).assertEqual(true)
          if (data.grantedBundleInfos !== undefined) {
            expect(JSON.stringify(data.grantedBundleInfos[0])).assertEqual('{"bundleName":"com.example.actsnotificationansopenwindowwithresultwithinabilitytest","appName":"ZZZopenWindow","appIndex":0}')
          }
        }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          hilog.error(0x0000, 'testTag',
            `${testNum} openSubscriptionSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 201) {
            expect(err?.code).assertEqual(201)
            done()
          } else {
            expect(false).assertTrue();
            done()
          }
        });
        await sleep(1000)
        let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('应用获取本机通知')));
        console.info(testNum + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          console.info(testNum + `button is ${JSON.stringify(button)}`);
          await sleep(1000);
          await button.click()
          await sleep(500)
        }
        await sleep(500)
        let button1 = await driver.findComponent(ON.text('允许'));
        console.info(testNum + `button1 is ${JSON.stringify(button1)}`);
        if (button1 !== null) {
          console.info(testNum + `button1 is ${JSON.stringify(button1)}`);
          await sleep(1000);
          await button1.click()
          await sleep(100)
        }
        await sleep(500)
        let scrollBar = await driver.findComponent(ON.type('List').isAfter(ON.text('应用获取本机通知')));
        console.info(testNum + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        await scrollBar.scrollToBottom()
        await sleep(10000)
        let button2 = await driver.findComponent(ON.type('Toggle').isAfter(ON.originalText('ZZZopenWindow')));
        console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
          await sleep(1000);
          await button2.click()
          await sleep(100)
        }
        await sleep(1000)
        let button3 = await driver.findComponent(ON.text('确定'));
        console.info(testNum + `button3 is ${JSON.stringify(button3)}`);
        if (button3 !== null) {
          console.info(testNum + `button3 is ${JSON.stringify(button3)}`);
          await sleep(1000);
          await button3.click()
          await sleep(100)
        }
        await sleep(1000)
        notificationExtensionSubscription.openSubscriptionSettingsWithResult(context).then((data) => {
          hilog.info(0x0000, 'testTag',
            `${testNum} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data.userGrantEnabled).assertEqual(true)
          if (data.grantedBundleInfos !== undefined) {
            expect(JSON.stringify(data.grantedBundleInfos[0])).assertEqual('{"bundleName":"com.example.actsnotificationansopenwindowwithresultwithinabilitytest","appName":"ZZZopenWindow","appIndex":0}')
          }
          done()
        }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          hilog.error(0x0000, 'testTag',
            `${testNum} openSubscriptionSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 201) {
            expect(err?.code).assertEqual(201)
            done()
          } else {
            expect(false).assertTrue();
            done()
          }
        });
        await sleep(1000)
        let button4 = await driver.findComponent(ON.type("SymbolGlyph"));
        console.info(testNum + `button4 is ${JSON.stringify(button4)}`);
        if (button4 !== null) {
          console.info(testNum + `button4 is ${JSON.stringify(button4)}`);
          await sleep(1000);
          await button4.click()
          await sleep(100)
        }
      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_1300
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_1300
     * @tc.desc   [Stability] The openSubscriptionSettingsWithResult API is called 500 times in a loop, and no crash, freeze, or black screen occurs on the device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_1300', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_1300'
      let driver: Driver = Driver.create();
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        for (let index = 0; index < 500; index++) {
          notificationExtensionSubscription.openSubscriptionSettingsWithResult(context).then((data) => {
            hilog.info(0x0000, 'testTag',
              `${testNum} ${index} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
            expect(index).assertEqual(0)
            done();
          }).catch(async (e: Error) => {
            let err: BusinessError = e as BusinessError
            hilog.error(0x0000, 'testTag',
              `${testNum} ${index} openSubscriptionSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 201) {
              expect(err.code).assertEqual(201);
              done();
            } else if (index === 499) {
              expect(err.code).assertEqual(1600018);
              await sleep(1000)
              let button6 = await driver.findComponent(ON.text('确定'));
              console.info(testNum + `button6 is ${JSON.stringify(button6)}`);
              if (button6 !== null) {
                console.info(testNum + `button6 is ${JSON.stringify(button6)}`);
                sleep(1000);
                (await button6).click()
                sleep(100)
              }
            } else {
              expect(err.code).assertEqual(1600018);
            }
          });
          if (index === 0) {
            await sleep(1000)
          }
        }
      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        if (err?.code === 201) {
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect(false).assertTrue();
          done()
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_1400
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_1400
     * @tc.desc   [Stability] The openSubscriptionSettingsWithResult API is called 500 times in a loop, and no crash, freeze, or black screen occurs on the device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_1400', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_1400'
      let driver: Driver = Driver.create();
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
          notificationExtensionSubscription.openSubscriptionSettingsWithResult(null).then((data) => {
            hilog.info(0x0000, 'testTag',
              `${testNum}  openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
            expect(false).assertTrue();
            done();
          }).catch(async (e: Error) => {
            let err: BusinessError = e as BusinessError
            hilog.error(0x0000, 'testTag',
              `${testNum} openSubscriptionSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 201) {
              expect(err.code).assertEqual(201);
              done();
            } else {
              expect(err.code).assertEqual(401);
            }
          });
      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        if (err?.code === 201) {
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect(err.code).assertEqual(401);
          done()
        }
      }
    })

     /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_1500
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_1500
     * @tc.desc   [Stability] The openSubscriptionSettingsWithResult API is called 500 times in a loop, and no crash, freeze, or black screen occurs on the device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_1500', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_1500'
      let driver: Driver = Driver.create();
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
          notificationExtensionSubscription.openSubscriptionSettingsWithResult(undefined).then((data) => {
            hilog.info(0x0000, 'testTag',
              `${testNum} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
            expect(false).assertTrue();
            done();
          }).catch(async (e: Error) => {
            let err: BusinessError = e as BusinessError
            hilog.error(0x0000, 'testTag',
              `${testNum} openSubscriptionSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 201) {
              expect(err.code).assertEqual(201);
              done();
            } else {
              expect(err.code).assertEqual(401);
            }
          });
      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        if (err?.code === 201) {
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect(err.code).assertEqual(401);
          done()
        }
      }
    })
  })
}