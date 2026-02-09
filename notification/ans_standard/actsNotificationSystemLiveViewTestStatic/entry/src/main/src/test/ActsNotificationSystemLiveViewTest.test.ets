/**
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index"
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation } from '@ohos.UiTest'
import notificationManager from '@ohos.notificationManager'
import image from '@ohos.multimedia.image';
import {BusinessError, RecordData} from '@ohos.base';
import hilog from '@ohos.hilog';
import WantAgent, { WantAgent as _WantAgent} from '@ohos.app.ability.wantAgent';
import Want from '@ohos.app.ability.Want';
import { AppStorage } from '@ohos.arkui.stateManagement'
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement'

let bundleName: string = 'com.example.systemliveView.static'
let count: int = 0;
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
const TAG = 'NotificationActs'
const TEST_SUITE_NAME = 'testNotificationLiveNotification'
let bundle :string = 'com.example.systemliveView.static'
let testAbilityContext: common.UIAbilityContext

export default function ActsNotificationSystemLiveViewTest() {
  describe('ActsNotificationSystemLiveViewTest', () => {
    beforeAll((done: () => void) => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');

      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${JSON.stringify(bundle)}`)
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');

      notificationManager.requestEnableNotification(testAbilityContext, (err: BusinessError | null) => {
        console.info(`beforeAll come in requestEnableNotification`);
        if (err) {
          console.info(`beforeAll requestEnableNotification err: ${err.code}`)
          expect(false).assertTrue()
          done()
        }else {
          console.info(`beforeAll requestEnableNotification success`)
          expect(true).assertTrue()
          await Utils.msSleep(1000)
          done()
        }
      })
      await Utils.msSleep(1000)
      let driver = Driver.create()
      await Utils.msSleep(1000)
      console.info(`beforeAll driver is ${JSON.stringify(driver)}`)
      let button = await driver.findComponent(ON.text('允许'));
      console.info(`beforeAll button is ${JSON.stringify(button)}`)
      if (button !== null) {
        await button.click()
        console.info(`beforeAll button is click`)
        await Utils.msSleep(1000)
      } else {
        console.info(`beforeAll null button`)
      }
    })


    /**
     * @tc.name   Sub_Notification_Ans_Live_Publish_Static_2300
     * @tc.number Sub_Notification_Ans_Live_Publish_Static_2300
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Live_Publish_Static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Notification_Ans_Live_Publish_Static_2300'
        const color: ArrayBuffer = new ArrayBuffer(96); //96为需要创建的像素buffer大小，取值为：height * width *4
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        count = 0;

        await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          console.info(`${TAG} Sub_Notification_Ans_Live_Publish_Static_2300 pixelMap: ${pixelMap}`);
          console.log('Succeeded in creating pixelmap.');
        })

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
            systemLiveView: {
              title: 'title',
              text: 'text',
              typeCode: 1,
              capsule: {
                title: undefined,
                backgroundColor: 'back',
                icon: pixelMap
              } as notificationManager.NotificationCapsule,
              button: {
                names: ['name1', 'name2'],
                icons: [pixelMap, pixelMap],
                iconsResource : [{bundleName:'iconsResource1',moduleName:'iconsResource1',id:1},
                  {bundleName:'iconsResource2',moduleName:'iconsResource2',id:2}]
              } as notificationManager.NotificationButton,
              time: {
                initialTime: 100,
                isCountDown: true,
                isPaused: true,
                isInTitle: true,
              } as notificationManager.NotificationTime,
              progress: {
                maxValue: 100,
                currentValue: 200,
                isPercentage: true
              } as notificationManager.NotificationProgress,
            } as notificationManager.NotificationSystemLiveViewContent,
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case start`);
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(err));
              expect(false).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            } else {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
              count++;
              expect(count).assertEqual(1);
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000, `${TAG}`,
            `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(error));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Live_Publish_Static_2700
     * @tc.number Sub_Notification_Ans_Live_Publish_Static_2700
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Live_Publish_Static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'testLiveNotificationCapsuleIconForUndefined'
        count = 0;
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 2700,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
            systemLiveView: {
              title: 'title',
              text: 'text',
              typeCode: 0,
              capsule: {
                title: 'text',
                icon: undefined
              } as notificationManager.NotificationCapsule,
            } as notificationManager.NotificationSystemLiveViewContent,
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case start`)
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(err));
              expect(false).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            } else {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
              count++;
              expect(count).assertEqual(1);
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000, `${TAG}`,
            `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish1 failed,data is %{public}s` + JSON.stringify(error));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      })


    /**
     * @tc.name   Sub_Notification_Ans_Live_Publish_Static_3200
     * @tc.number Sub_Notification_Ans_Live_Publish_Static_3200
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Live_Publish_Static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'testLiveNotificationCapsuleBackgroundColorForUndefined'
        count = 0;
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
            systemLiveView: {
              title: 'title',
              text: 'text',
              typeCode: 0,
              capsule: {
                title: 'text',
                backgroundColor: undefined
              } as notificationManager.NotificationCapsule,
            } as notificationManager.NotificationSystemLiveViewContent,
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}`, `${TEST_CASE_NAME}` + `test case start`)
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(err));
              expect(false).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            } else {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
              count++;
              expect(count).assertEqual(1);
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          done();
        }

      })


    /**
     * @tc.name   Sub_Notification_Ans_Live_Publish_Static_4000
     * @tc.number Sub_Notification_Ans_Live_Publish_Static_4000
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Live_Publish_Static_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'testLiveNotificationCapsuleIconForUndefined'
        count = 0;
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
            systemLiveView: {
              title: 'title',
              text: 'text',
              typeCode: 0,
              capsule: {
                title: 'text',
              } as notificationManager.NotificationCapsule,
              button: {
                names: undefined
              } as notificationManager.NotificationButton,
            } as notificationManager.NotificationSystemLiveViewContent,
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}`, `${TEST_CASE_NAME}` + `test case start`)
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(err));
              expect(false).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            } else {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
              count++;
              expect(count).assertEqual(1);
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000, `${TAG}`,
            `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(error));
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          done();
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Live_Publish_Static_4400
     * @tc.number Sub_Notification_Ans_Live_Publish_Static_4400
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Live_Publish_Static_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'testLiveNotificationButtonIconsForUndefined'
        count = 0;
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
            systemLiveView: {
              title: 'title',
              text: 'text',
              typeCode: 0,
              capsule: {
                title: 'title'
              } as notificationManager.NotificationCapsule,
              button: {
                icons: undefined
              } as notificationManager.NotificationButton,
            } as notificationManager.NotificationSystemLiveViewContent,
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case start`)
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(err));
              expect(false).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            } else {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
              count++;
              expect(count).assertEqual(1);
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`)
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Live_Publish_Static_5100
     * @tc.number Sub_Notification_Ans_Live_Publish_Static_5100
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Live_Publish_Static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'testLiveNotificationTimeinitialTimeForUndefined'
        count = 0;
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
            systemLiveView: {
              title: 'title',
              text: 'text',
              typeCode: 0,
              capsule: {
                title: 'title'
              } as notificationManager.NotificationCapsule,
              button: {
                names: ["button1"]
              } as notificationManager.NotificationButton,
              time: {
                initialTime: undefined
              } as notificationManager.NotificationTime,
            } as notificationManager.NotificationSystemLiveViewContent,
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case start`)
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(err));
              expect(false).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            } else {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
              count++;
              expect(count).assertEqual(1);
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`)
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Live_Publish_Static_5400
     * @tc.number Sub_Notification_Ans_Live_Publish_Static_5400
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Live_Publish_Static_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'testLiveNotificationTimeisCountdownForUndefined'
        count = 0;
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
            systemLiveView: {
              title: 'title',
              text: 'text',
              typeCode: 0,
              capsule: {
                title: 'title'
              } as notificationManager.NotificationCapsule,
              button: {
                names: ["button1"]
              } as notificationManager.NotificationButton,
              time: {
                isCountDown: undefined
              } as notificationManager.NotificationTime,
            } as notificationManager.NotificationSystemLiveViewContent,
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}`, `${TEST_CASE_NAME}` + `test case start`)
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(err));
              expect(false).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            } else {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
              count++;
              expect(count).assertEqual(1);
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`)
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      })


    /**
     * @tc.name   Sub_Notification_Ans_Live_Publish_Static_5700
     * @tc.number Sub_Notification_Ans_Live_Publish_Static_5700
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Live_Publish_Static_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'testLiveNotificationTimeisPausedForUndefined'
        count = 0;
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
            systemLiveView: {
              title: 'title',
              text: 'text',
              typeCode: 0,
              capsule: {
                title: 'title'
              } as notificationManager.NotificationCapsule,
              button: {
                names: ["button1"]
              } as notificationManager.NotificationButton,
              time: {
                isCountDown: true,
                isPaused: undefined
              } as notificationManager.NotificationTime,
            } as notificationManager.NotificationSystemLiveViewContent,
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}`, `${TEST_CASE_NAME}` + `test case start`)
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(err));
              expect(false).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            } else {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish success+data is %{public}s`);
              count++;
              expect(count).assertEqual(1);
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`)
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      })


    /**
     * @tc.name   Sub_Notification_Ans_Live_Publish_Static_6000
     * @tc.number Sub_Notification_Ans_Live_Publish_Static_6000
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Live_Publish_Static_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'testLiveNotificationTimeisInTitleForUndefined'
        count = 0;
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
            systemLiveView: {
              title: 'title',
              text: 'text',
              typeCode: 0,
              capsule: {
                title: 'title'
              } as notificationManager.NotificationCapsule,
              button: {
                names: ["button1"]
              } as notificationManager.NotificationButton,
              time: {
                isCountDown: true,
                isInTitle: undefined
              } as notificationManager.NotificationTime,
            } as notificationManager.NotificationSystemLiveViewContent,
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case start`)
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(err));
              expect(false).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            } else {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish success+data is %{public}s`);
              count++;
              expect(count).assertEqual(1);
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`)
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      })


    /**
     * @tc.name   Sub_Notification_Ans_Live_Publish_Static_6600
     * @tc.number Sub_Notification_Ans_Live_Publish_Static_6600
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Live_Publish_Static_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'testLiveNotificationProgressMaxvalueForUndefined'
        count = 0;
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
            systemLiveView: {
              title: 'title',
              text: 'text',
              typeCode: 0,
              capsule: {
                title: 'title'
              } as notificationManager.NotificationCapsule,
              button: {
                names: ["button1"]
              } as notificationManager.NotificationButton,
              time: {
                isCountDown: true,
                isInTitle: true,
                isPaused: true
              } as notificationManager.NotificationTime,
              progress: {
                maxValue: undefined
              } as notificationManager.NotificationProgress,
            } as notificationManager.NotificationSystemLiveViewContent,
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case start`)
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(err));
              expect(false).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            } else {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish success+data is %{public}s`);
              count++;
              expect(count).assertEqual(1);
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`)
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      })


    /**
     * @tc.name   Sub_Notification_Ans_Live_Publish_Static_7000
     * @tc.number Sub_Notification_Ans_Live_Publish_Static_7000
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Live_Publish_Static_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'testLiveNotificationProgressCurrentValueForUndefined'
        count = 0;
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
            systemLiveView: {
              title: 'title',
              text: 'text',
              typeCode: 0,
              capsule: {
                title: 'title'
              } as notificationManager.NotificationCapsule,
              button: {
                names: ["button1"]
              } as notificationManager.NotificationButton,
              time: {
                isCountDown: true,
                isInTitle: true,
                isPaused: true
              } as notificationManager.NotificationTime,
              progress: {
                maxValue: 50,
                currentValue: undefined
              } as notificationManager.NotificationProgress,
            } as notificationManager.NotificationSystemLiveViewContent,
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case start`)
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(err));
              expect(false).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            } else {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
              count++;
              expect(count).assertEqual(1);
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`)
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      })


    /**
     * @tc.name   Sub_Notification_Ans_Live_Publish_Static_7400
     * @tc.number Sub_Notification_Ans_Live_Publish_Static_7400
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Live_Publish_Static_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'testLiveNotificationProgressisPercentageForUndefined'
        count = 0;
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_SYSTEM_LIVE_VIEW,
            systemLiveView: {
              title: 'title',
              text: 'text',
              typeCode: 0,
              capsule: {
                title: 'title'
              } as notificationManager.NotificationCapsule,
              button: {
                names: ["button1"]
              } as notificationManager.NotificationButton,
              time: {
                isCountDown: true,
                isInTitle: true,
                isPaused: true
              } as notificationManager.NotificationTime,
              progress: {
                maxValue: 50,
                isPercentage: undefined
              } as notificationManager.NotificationProgress,
            } as notificationManager.NotificationSystemLiveViewContent,
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        try {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case start`);
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(err));
              expect(false).assertTrue();
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            } else {
              hilog.info(0x000, `${TAG}`,
                `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish success+data is %{public}s`);
              count++;
              expect(count).assertEqual(1);
              hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`)
              done();
            }
          })
        } catch (error) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          expect(false).assertTrue();
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Live_Publish_Static_7500
     * @tc.number Sub_Notification_Ans_Live_Publish_Static_7500
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Live_Publish_Static_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Notification_Ans_Live_Publish_Static_7500'
        const color: ArrayBuffer = new ArrayBuffer(96); //96为需要创建的像素buffer大小，取值为：height * width *4
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }

        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

        await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          // console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4550 pixelMap: ${pixelMap}`);
          // console.log('Succeeded in creating pixelmap.');
        })

        let parameters1: Record<String, RecordData> = {
          "mykey0": 2222,
          "mykey1": [1, 2, 3],
          "mykey2": "[1, 2, 3]",
          "mykey3": "ssssssssssssssssssssssssss",
          "mykey4": [false, true, false],
          "mykey5": ["qqqqq", "wwwwww", "aaaaaaaaaaaaaaaaa"],
          "mykey6": true,
        }

        //wantAgent对象
        let wantAgent: _WantAgent = {};
        //WantAgentInfo对象
        let wantAgentInfo: WantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: 'deviceId',
              bundleName: bundleName,
              abilityName: 'EntryAbility',
              action: 'action1',
              entities: ['entity1'],
              type: 'MIMETYPE',
              uri: 'key={true,true,false}',
              parameters: parameters1
            }
          ],
          requestCode: 0,
          actionType: WantAgent.OperationType.START_ABILITY,
          actionFlags: [WantAgent.WantAgentFlags.ONE_TIME_FLAG]
        };

        try {
          WantAgent.getWantAgent(wantAgentInfo).then((data:_WantAgent) => {
            wantAgent = data;
          }).catch((err: Error): void => {
            // console.error('getWantAgent failed! ${err.code} ${err.message}');
          });
        } catch (err) {
          // console.error('getWantAgent failed! ${err.code} ${err.message}');
        }

        let capsule: notificationManager.NotificationCapsule = {
          title: 'title',
          backgroundColor: 'back'
        }
        let button: notificationManager.NotificationButton = {
          names: ['name1', 'name2']
        }
        let time: notificationManager.NotificationTime = {
          initialTime: 100,
          isCountDown: undefined
        }
        let progresss: notificationManager.NotificationProgress = {
          isPercentage: true,
          currentValue: 100
        }
        let content: notificationManager.NotificationSystemLiveViewContent = {
          title: 'title',
          text: 'text',
          typeCode: 1,
          capsule: capsule,
          button: button,
          time: time,
          progress: progresss
        }
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 7500,
          notificationSlotType: notificationManager.SlotType.CUSTOMER_SERVICE,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW,
            systemLiveView: content
          } as notificationManager.NotificationContent,
          wantAgent: wantAgent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        try {
          // hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case start`);
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              // hilog.info(0x000, `${TAG}`,
              //   `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(err));
              expect(false).assertTrue();
              // hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}`, `${TEST_CASE_NAME}` + `test case end`);
              done();
            } else {
              // hilog.info(0x000, `${TAG}`,
              //   `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish success+data is %{public}s`);
              expect(false).assertTrue();
              // hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            }
          })
        } catch (error) {
          // hilog.info(0x000, `${TAG}`,
          //   `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(error));
          let err: BusinessError = error as BusinessError
          expect(err.code).assertEqual(401);
          // hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          done();
        }

      })
    /**
     * @tc.name   Sub_Notification_Ans_Live_Publish_Static_7600
     * @tc.number Sub_Notification_Ans_Live_Publish_Static_7600
     * @tc.desc   test publish interface fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Live_Publish_Static_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Notification_Ans_Live_Publish_Static_7600'
        const color: ArrayBuffer = new ArrayBuffer(96); //96为需要创建的像素buffer大小，取值为：height * width *4
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }

        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

        await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          // console.info(`${TAG} Sub_Notification_Ans_Live_Publish_Static_7600 pixelMap: ${pixelMap}`);
          // console.log('Succeeded in creating pixelmap.');
        })

        //wantAgent对象
        let wantAgent: _WantAgent = {};
        let parameters1: Record<String, RecordData> = {
          "mykey0": 2222,
          "mykey1": [1, 2, 3],
          "mykey2": "[1, 2, 3]",
          "mykey3": "ssssssssssssssssssssssssss",
          "mykey4": [false, true, false],
          "mykey5": ["qqqqq", "wwwwww", "aaaaaaaaaaaaaaaaa"],
          "mykey6": true,
        }

        //WantAgentInfo对象
        let wantAgentInfo: WantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: 'deviceId',
              bundleName: bundleName,
              abilityName: 'EntryAbility',
              action: 'action1',
              entities: ['entity1'],
              type: 'MIMETYPE',
              uri: 'key={true,true,false}',
              parameters: parameters1
            }
          ],
          requestCode: 0,
          actionType: WantAgent.OperationType.START_ABILITY,
          actionFlags: [WantAgent.WantAgentFlags.ONE_TIME_FLAG]
        };
        try {
          WantAgent.getWantAgent(wantAgentInfo).then((data:_WantAgent) => {
            wantAgent = data;
          }).catch((err: Error): void => {
            // console.error('getWantAgent failed! ${err.code} ${err.message}');
          });
        } catch (err) {
          // console.error('getWantAgent failed! ${err.code} ${err.message}');
        }
        let capsule: notificationManager.NotificationCapsule = {
          title: 'title',
          backgroundColor: 'back'
        }
        let button: notificationManager.NotificationButton = {
          names: ['name1', 'name2']
        }
        let time: notificationManager.NotificationTime = {
          initialTime: 100,
          isCountDown: undefined
        }
        let progresss: notificationManager.NotificationProgress = {
          isPercentage: true,
          currentValue: 100
        }
        let content: notificationManager.NotificationSystemLiveViewContent = {
          title: 'title',
          text: 'text',
          typeCode: 1,
          capsule: capsule,
          button: button,
          time: time,
          progress: progresss
        }
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 7600,
          notificationSlotType: notificationManager.SlotType.CUSTOMER_SERVICE,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW,
            systemLiveView: content
          } as notificationManager.NotificationContent,
          wantAgent: wantAgent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }

        // 通知slot对象
        let notificationSlot: notificationManager.NotificationSlot = {
          notificationType: notificationManager.SlotType.CUSTOMER_SERVICE,
          enabled: undefined,
          reminderMode: undefined,
          authorizedStatus: undefined
        };
        notificationManager.isNotificationEnabled().then((data: boolean) => {
          // console.info("isNotificationEnabled success, data: " + JSON.stringify(data));
        }).catch((err: Error): void => {
          // console.error(`isNotificationEnabled fail: ${JSON.stringify(err)}`);
        });
        try {
          // hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}`, `${TEST_CASE_NAME}` + `test case start`);
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              // hilog.info(0x000, `${TAG}`,
              //   `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish failed,data is %{public}s` + JSON.stringify(err));
              expect(false).assertTrue();
              // hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}`, `${TEST_CASE_NAME}` + `test case end`);
              done();
            } else {
              // hilog.info(0x000, `${TAG}`,
              //   `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
              expect(false).assertTrue();
              // hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
              done();
            }
          })
        } catch (error) {
          let err: BusinessError = error as BusinessError
          // console.error(`${TAG} `+` ${TEST_SUITE_NAME} ` + ` ${TEST_CASE_NAME} ` + 'publish failed! ${err.code} ${err.message}');
          expect(err.code).assertEqual(401);
          // hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}` + `${TEST_CASE_NAME}` + `test case end`);
          done();
        }
      })


    /**
     * @tc.name   Sub_Notification_Ans_Live_Publish_Static_7700
     * @tc.number Sub_Notification_Ans_Live_Publish_Static_7700
     * @tc.desc   test publish interface success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Live_Publish_Static_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Sub_Notification_Ans_Live_Publish_Static_7700'
        const color: ArrayBuffer = new ArrayBuffer(96); //96为需要创建的像素buffer大小，取值为：height * width *4
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }

        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

        await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          // console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4550 pixelMap: ${pixelMap}`);
          // console.log('Succeeded in creating pixelmap.');
        })

        //wantAgent对象
        let wantAgent: Object = {};
        let parameters1: Record<String, RecordData> = {
          "mykey0": 2222,
          "mykey1": [1, 2, 3],
          "mykey2": "[1, 2, 3]",
          "mykey3": "ssssssssssssssssssssssssss",
          "mykey4": [false, true, false],
          "mykey5": ["qqqqq", "wwwwww", "aaaaaaaaaaaaaaaaa"],
          "mykey6": true,
        }

        //WantAgentInfo对象
        let wantAgentInfo: WantAgent.WantAgentInfo = {
          wants: [
            {
              deviceId: 'deviceId',
              bundleName: bundleName,
              abilityName: 'EntryAbility',
              action: 'action1',
              entities: ['entity1'],
              type: 'MIMETYPE',
              uri: 'key={true,true,false}',
              parameters: parameters1
            }
          ],
          requestCode: 0,
          actionType: WantAgent.OperationType.START_ABILITY,
          actionFlags: [WantAgent.WantAgentFlags.ONE_TIME_FLAG]
        };
        try {
          WantAgent.getWantAgent(wantAgentInfo).then((data) => {
            wantAgent = data;
          }).catch((err: Error): void => {
            // console.error('getWantAgent failed! ${err.code} ${err.message}');
          });
        } catch (err) {
          // console.error('getWantAgent failed! ${err.code} ${err.message}');
        }
        let capsule: notificationManager.NotificationCapsule = {
          title: 'title',
          backgroundColor: 'back'
        }
        let button: notificationManager.NotificationButton = {
          names: ['name1', 'name2']
        }
        let time: notificationManager.NotificationTime = {
          initialTime: 100,
          isCountDown: undefined
        }
        let progresss: notificationManager.NotificationProgress = {
          isPercentage: true,
          currentValue: 100
        }
        let content: notificationManager.NotificationSystemLiveViewContent = {
          title: 'title',
          text: 'text',
          typeCode: 1,
          capsule: capsule,
          button: button,
          time: time,
          progress: progresss
        }
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 7700,
          notificationSlotType: notificationManager.SlotType.CUSTOMER_SERVICE,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW,
            systemLiveView: content
          } as notificationManager.NotificationContent,
          wantAgent: wantAgent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        // addslot回调
        let addSlotCallBack = (err: BusinessError | null) => {
          if (err) {
            // console.info("addSlot failed " + JSON.stringify(err));
          } else {
            // console.info("addSlot success");
          }
        }
        // 通知slot对象
        let notificationSlot: notificationManager.NotificationSlot = {
          notificationType: notificationManager.SlotType.CUSTOMER_SERVICE,
          enabled: undefined,
          reminderMode: undefined,
          authorizedStatus: undefined
        };
        try {
          // hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}`, `${TEST_CASE_NAME}` + `test case start`);
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            if (err) {
              // hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}`,
              //   `${TEST_CASE_NAME}` + `publish failed,data is %{public}s`, JSON.stringify(err));
              expect(false).assertTrue();
              // hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}`, `${TEST_CASE_NAME}` + `test case end`);
              done();
            } else {
              // hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}`,
              //   `${TEST_CASE_NAME}` + `publish success,data is %{public}s`);
              expect(false).assertTrue();
              // hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}`, `${TEST_CASE_NAME}` + `test case end`);
              done();
            }
          })
        } catch (error) {
          // hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}`, `${TEST_CASE_NAME}` + `publish failed,data is %{public}s`,
          //   JSON.stringify(error));
          let err: BusinessError = error as BusinessError
          expect(err.code).assertEqual(401);
          // hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}`, `${TEST_CASE_NAME}` + `test case end`);
          done();
        }

      })

  })
}
