/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { BusinessError } from '@ohos.base';
import notificationManager from '@ohos.notificationManager'
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import image from '@ohos.multimedia.image';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';

export default function ActsNotificationContentTest() {
  describe('ActsNotificationContentTest', () => {

    const TAG = 'ActsNotificationContentTest ===>';
    let ctx: common.UIAbilityContext;

    //问题单号：DTS2025060627133
    /**
     * @tc.number: Acts_NotificationContent_Static_0100
     * @tc.name: Acts_NotificationContent_Static_0100
     * @tc.desc: Set notificationContentType attribute parameters
     *           notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT.
     */
    it('Acts_NotificationContent_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Acts_NotificationContent_Static_0100';

        notificationManager.requestEnableNotification(ctx, (err: BusinessError | null) => {
          if (err) {
            console.error(`Acts_NotificationContent_Static_0100 requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
          } else {
            console.info("Acts_NotificationContent_Static_0100 requestEnableNotification success");
          }
        });

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: 'text_title',
              text: 'text_text',
              additionalText: ''
            } as notificationManager.NotificationBasicContent
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
        hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
            expect(err).assertEqual(null);
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish22 fail,result is : %{public}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test22 case end`);
          done();
        }
      })

    /**
     * @tc.number: Acts_NotificationContent_Static_0200
     * @tc.name: Acts_NotificationContent_Static_0200
     * @tc.desc: Set notificationContentType attribute parameters
     *           notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT.
     */
    it('Acts_NotificationContent_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Acts_NotificationContent_Static_0200';

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content:
          {
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
        }
        hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case start`);
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
            expect(err).assertEqual(null);
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result1 is : %{public}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
          done();
        }
      })

    /**
     * @tc.number: Acts_NotificationContent_Static_0300
     * @tc.name: Acts_NotificationContent_Static_0300
     * @tc.desc: Set notificationContentType attribute parameters
     *           notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE.
     */
    it('Acts_NotificationContent_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Acts_NotificationContent_Static_0300';

        const color = new ArrayBuffer(60000);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.byteLength; i++) {
          bufferArr[i++] = 60;
          bufferArr[i++] = 20;
          bufferArr[i++] = 220;
          bufferArr[i] = 100;
        }
        let opts: image.InitializationOptions = {
          editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {
            height: 100, width: 150
          }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} =====size: ====  ${imageInfo.size}`);
        }).catch((err: BusinessError): void => {
          console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
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
            } as notificationManager.NotificationPictureContent
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
        hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case start`);
        try {
          await Utils.msSleep(2500);
          notificationManager.publish(notificationRequest, (data: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
              JSON.stringify(data));
            expect(data).assertEqual(null);
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
            JSON.stringify(err));
          expect(err.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
          done();
        }
      })

    //问题单号：DTS2025060627133
    /**
     * @tc.number: Acts_NotificationContent_Static_0400
     * @tc.name: Acts_NotificationContent_Static_0400
     * @tc.desc: Set notificationContentType attribute parameters
     *           notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE.
     */
    
    it('Acts_NotificationContent_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const TEST_CASE_NAME = 'Acts_NotificationContent_Static_0400';

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
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
              JSON.stringify(data));
            expect(data).assertEqual(null);
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result1 is : %{public}s',
            JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
          done();
        }
      })


  })
}