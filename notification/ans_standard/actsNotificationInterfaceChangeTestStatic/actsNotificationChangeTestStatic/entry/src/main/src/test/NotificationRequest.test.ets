/**
 * Copyright (c) 2023-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation } from '@ohos.UiTest'
import notificationManager from '@ohos.notificationManager';
import hilog from '@ohos.hilog';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement'

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext | undefined;
let bundle_name: string = 'com.example.notificationchangetest.static';

export default function ActsNotificationRequestTest() {
  describe('ActsNotificationRequestTest', () => {
    const TAG = 'ActsNotificationRequestTest ===>';
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundle_name)
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    
    /**
     * @tc.name   Acts_NotificationRequest_Static_0100
     * @tc.number Acts_NotificationRequest_Static_0100
     * @tc.desc   Set notificationSlotType attribute parameters notificationManager.SlotType.SOCIAL_COMMUNICATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_NotificationRequest_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME:string = 'Acts_NotificationRequest_Static_0100';
        notificationManager.isNotificationEnabled((err, data) => {
          if (err) {
            console.info(`${TEST_CASE_NAME} isNotificationEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TEST_CASE_NAME} isNotificationEnabled AsyncCallback success`)
            expect(data).assertFalse();
          }
        });

        await Utils.msSleep(200);

        await notificationManager.isNotificationEnabled().then((data: boolean) => {
          console.info(TEST_CASE_NAME + "isNotificationEnabled success, data: " + JSON.stringify(data));
          expect(data).assertFalse();
        }).catch((err: Error) :void  => {
          console.error(TEST_CASE_NAME + `isNotificationEnabled fail: ${JSON.stringify(err)}`);
          expect(true).assertFalse();
          done()
        });

        notificationManager.requestEnableNotification(testAbilityContext!, (err: BusinessError | null) => {
          if (err) {
            console.error(`requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
          } else {
            console.info("requestEnableNotification success");
          }
        });

        await Utils.msSleep(1500);
        let driver = Driver.create();
        hilog.info(0x0000, 'testTag', `${TEST_CASE_NAME} driver is ${JSON.stringify(driver)}`);
        await driver.assertComponentExist(ON.text('允许'));
        let button = await driver.findComponent(ON.text('允许'));
        hilog.info(0x0000, 'testTag',`${TEST_CASE_NAME} button is ${JSON.stringify(button)}`);
        if (button !== null) {
          await button.click();
          await Utils.msSleep(1500);
        } else {
          hilog.info(0x0000, 'testTag',`button is null`)
        }

        notificationManager.isNotificationEnabled((err, data) => {
          if (err) {
            console.info(`${TEST_CASE_NAME} isNotificationEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TEST_CASE_NAME} isNotificationEnabled AsyncCallback success`)
            expect(data).assertTrue();
          }
        });

        await Utils.msSleep(200);

        let notificationenable: boolean = notificationManager.isNotificationEnabledSync();
        expect(notificationenable).assertTrue()

        await Utils.msSleep(200);

        await notificationManager.isNotificationEnabled().then((data: boolean) => {
            console.info(TEST_CASE_NAME + "isNotificationEnabled success, data: " + JSON.stringify(data));
            expect(data).assertTrue();
          }).catch((err: Error) : void => {
            console.error(TEST_CASE_NAME + `isNotificationEnabled fail: ${JSON.stringify(err)}`);
            expect(true).assertFalse();
          });

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: 'text_title',
              text: 'text_text',
              additionalText: ''
            }as notificationManager.NotificationBasicContent
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: "1",
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
          notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION
        }
        hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (data: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(data));
            expect(data).assertEqual(null);
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish22 fail,result_1 is : %{public}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test22 case end`);
          done();
        }
      })


    /**
     * @tc.name   Acts_NotificationRequest_Static_0200
     * @tc.number Acts_NotificationRequest_Static_0200
     * @tc.desc   Set notificationSlotType attribute parameters notificationManager.SlotType.SERVICE_INFORMATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_NotificationRequest_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME:string = 'Acts_NotificationRequest_Static_0200';

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
            longText: {
              title: '',
              text: 'test_text',
              additionalText: 'text_additionalText',
              longText: 'text_longText',
              briefText: 'text_briefText',
              expandedTitle: 'text_exoandTitle'
            } as notificationManager.NotificationLongTextContent
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
          notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION
        }
        hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (data: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(data));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result1 is : %{public}s', JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
          done();
        }
      })
    
    /**
     * @tc.name   Acts_NotificationRequest_Static_0300
     * @tc.number Acts_NotificationRequest_Static_0300
     * @tc.desc   Set notificationSlotType attribute parameters notificationManager.SlotType.CONTENT_INFORMATION.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_NotificationRequest_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME:string = 'Acts_NotificationRequest_Static_0300';

        const color = new ArrayBuffer(60000);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.byteLength; i++) {
          bufferArr[i++] = 60;
          bufferArr[i++] = 20;
          bufferArr[i++] = 220;
          bufferArr[i] = 100;
        }
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: {
            height: 100, width: 150
          }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          console.info(`=====size: ==== + ${JSON.stringify(imageInfo.size)}`);
        }).catch((err: Error): void => {
          console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
          return;
        })
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE,
            picture: {
              title: 'text_title',
              text: 'text_text',
              additionalText: '',
              briefText: 'text_briefText',
              expandedTitle: 'text_expand',
              picture: pixelMap
            }as notificationManager.NotificationPictureContent
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
          notificationSlotType: notificationManager.SlotType.CONTENT_INFORMATION
        }
        hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case start`);
        try {
          await Utils.msSleep(2500);
          notificationManager.publish(notificationRequest, (data: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(data));
            expect(data).assertEqual(null);
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
          done();
        }
      })

    
    /**
     * @tc.name   Acts_NotificationRequest_Static_0400
     * @tc.number Acts_NotificationRequest_Static_0400
     * @tc.desc   Set notificationSlotType attribute parameters notificationManager.SlotType.OTHER_TYPES.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_NotificationRequest_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME:string = 'Acts_NotificationRequest_Static_0400';

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE,
            multiLine: {
              title: 'text_title',
              text: 'text_text',
              additionalText: '',
              briefText: 'text_briefText',
              longTitle: 'text_longtitle',
              lines: ['text_lines'],
            } as notificationManager.NotificationMultiLineContent
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
          notificationSlotType: notificationManager.SlotType.OTHER_TYPES
        }
        hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case start`);
        try {
          await Utils.msSleep(2500);
          notificationManager.publish(notificationRequest, (data: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(data));
            expect(data).assertEqual(null);
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result1 is : %{public}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
          done();
        }
      })

      
    /**
     * @tc.name   Acts_NotificationRequest_Static_0600
     * @tc.number Acts_NotificationRequest_Static_0600
     * @tc.desc   Construct the notificationRequest.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Acts_NotificationRequest_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME:string = 'Acts_NotificationRequest_Static_0600';

        const color = new ArrayBuffer(60000);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.byteLength; i++) {
          bufferArr[i++] = 60;
          bufferArr[i++] = 20;
          bufferArr[i++] = 220;
          bufferArr[i] = 100;
        }
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 100, width: 150 }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) =>{
          console.log("=====size: ====" + JSON.stringify(imageInfo.size));
        }).catch((err:Error):void  => {
          console.error(0x000, `${TAG}`, `${TEST_CASE_NAME}` + "Failed to obtain the image pixel map information.");
        })
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          appMessageId: "appMessageId",
          sound: "sound",
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: 'text_title',
              text: 'text_text',
              additionalText: '',
              lockscreenPicture: pixelMap
            }as notificationManager.NotificationBasicContent
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
          notificationSlotType: notificationManager.SlotType.OTHER_TYPES
        }

        try {
          await Utils.msSleep(1000);
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
            expect(err).assertEqual(null);
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err) {
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result1 is : %{public}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
          done();
        }
      })


  })
}