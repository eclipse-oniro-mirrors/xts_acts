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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { logGenerator, exitGenerator, sleep, exitSpecialGenerator } from '../common/utils';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import notificationManager from '@ohos.notificationManager';
import hilog from '@ohos.hilog';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';

export default function notificationRequestTest() {
  describe('ActsNotificationRequestTest', () => {

    const TAG = 'ActsNotificationRequestTest ===>';
    let log = logGenerator(TAG);
    log('ActsNotificationRequestTest START');

    class Utils {
      static info(str: string) {
        hilog.info(0, 'bms test', str)
      }

      static sleep(time: number) {
        return new Promise<string>((resolve, reject) => {
          setTimeout((data: string) => {
            resolve(data)
          }, time)
        }).then(() => {
          console.info(`sleep ${time} over...`)
        })
      }
    }


    /**
     * @tc.number: Acts_NotificationRequest_0100
     * @tc.name: Test the notificationSlotType property.
     * @tc.desc: Set notificationSlotType attribute parameters notificationManager.SlotType.SOCIAL_COMMUNICATION.
     */
    it('Acts_NotificationRequest_0100', Level.LEVEL2, async (done: Function) => {
      const TEST_CASE_NAME = 'Acts_NotificationRequest_0100';

      notificationManager.isNotificationEnabled((err, data) => {
        if (err) {
          console.info(`${TAG} isNotificationEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} isNotificationEnabled AsyncCallback success`)
          expect(data).assertFalse();
        }
      });

      await sleep(200);

      await notificationManager.isNotificationEnabled().then((data: boolean) => {
          console.info("isNotificationEnabled success, data: " + JSON.stringify(data));
          expect(data).assertFalse();
        }).catch((err: BusinessError) => {
          console.error(`isNotificationEnabled fail: ${JSON.stringify(err)}`);
          expect(true).assertFalse();
          done()
        });

      notificationManager.requestEnableNotification((err) => {
        if (err) {
          console.error(`requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
        } else {
          console.info("requestEnableNotification success");
        }
      });

      await sleep(1500);
      let driver = Driver.create();
      log(`driver is ${JSON.stringify(driver)}`);
      await driver.assertComponentExist(ON.text('允许'));
      let button = await driver.findComponent(ON.text('允许'));
      log(`button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await button.click();
        await sleep(1500);
      } else {
        log(`button is null`)
      }

      notificationManager.isNotificationEnabled((err, data) => {
        if (err) {
          console.info(`${TAG} isNotificationEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} isNotificationEnabled AsyncCallback success`)
          expect(data).assertTrue();
        }
      });

      await sleep(200);

      let notificationenable = notificationManager.isNotificationEnabledSync();
      expect(notificationenable).assertTrue()

      await sleep(200);

      await notificationManager.isNotificationEnabled().then((data: boolean) => {
          console.info("isNotificationEnabled success, data: " + JSON.stringify(data));
          expect(data).assertTrue();
        }).catch((err: BusinessError) => {
          console.error(`isNotificationEnabled fail: ${JSON.stringify(err)}`);
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
          }
        },
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION
      }
      hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case start`);
      try {
        notificationManager.publish(notificationRequest, (data) => {
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
     * @tc.number: Acts_NotificationRequest_0200
     * @tc.name: Test the notificationSlotType property.
     * @tc.desc: Set notificationSlotType attribute parameters notificationManager.SlotType.SERVICE_INFORMATION.
     */
    it('Acts_NotificationRequest_0200', Level.LEVEL2, async (done: Function) => {
      const TEST_CASE_NAME = 'Acts_NotificationRequest_0200';

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
          }
        },
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION
      }
      hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case start`);
      try {
        notificationManager.publish(notificationRequest, (data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(data));
          expect(data).assertEqual(null);
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /**
     * @tc.number: Acts_NotificationRequest_0300
     * @tc.name: Test the notificationSlotType property.
     * @tc.desc: Set notificationSlotType attribute parameters notificationManager.SlotType.CONTENT_INFORMATION.
     */
    it('Acts_NotificationRequest_0300', Level.LEVEL2, async (done: Function) => {
      const TEST_CASE_NAME = 'Acts_NotificationRequest_0300';

      const color = new ArrayBuffer(60000);
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.byteLength; i++) {
        bufferArr[i++] = 60;
        bufferArr[i++] = 20;
        bufferArr[i++] = 220;
        bufferArr[i] = 100;
      }
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 2, size: {
          height: 100, width: 150
        }
      };
      await image
        .createPixelMap(color, opts)
        .then(async (pixelmap) => {
          await pixelmap.getImageInfo().then(imageInfo => {
            console.log("=====size: ====" + JSON.stringify(imageInfo.size));
          }).catch((err: BusinessError) => {
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
                picture: pixelmap
              }
            },
            notificationSlotType: notificationManager.SlotType.CONTENT_INFORMATION
          }
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case start`);
          try {
            await Utils.sleep(2500);
            notificationManager.publish(notificationRequest, (data) => {
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(data));
              expect(data).assertEqual(null);
              hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
              done();
            })
          } catch (err) {
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
            expect(err.code).assertEqual(401);
            hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
            done();
          }
        })
    })

    /**
     * @tc.number: Acts_NotificationRequest_0400
     * @tc.name: Test the notificationSlotType property.
     * @tc.desc: Set notificationSlotType attribute parameters notificationManager.SlotType.OTHER_TYPES.
     */
    it(" Acts_NotificationRequest_0400", Level.LEVEL2, async (done: Function) => {
      const TEST_CASE_NAME = 'Acts_NotificationRequest_0400';

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
          }
        },
        notificationSlotType: notificationManager.SlotType.OTHER_TYPES
      }
      hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case start`);
      try {
        await Utils.sleep(2500);
        notificationManager.publish(notificationRequest, (data) => {
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(data));
          expect(data).assertEqual(null);
          hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
          done();
        })
      } catch (err) {
        hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
        expect(err.code).assertEqual(401);
        hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case end`);
        done();
      }
    })

    /**
     * @tc.number: Acts_NotificationRequest_0600
     * @tc.name: Test the notificationRequest property.
     * @tc.desc: Construct the notificationRequest.
     */
    it(" Acts_NotificationRequest_0600", Level.LEVEL2, async (done: Function) => {
      const TEST_CASE_NAME = 'Acts_NotificationRequest_0600';

      const color = new ArrayBuffer(60000);
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.byteLength; i++) {
        bufferArr[i++] = 60;
        bufferArr[i++] = 20;
        bufferArr[i++] = 220;
        bufferArr[i] = 100;
      }
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: 2, size: {
          height: 100, width: 150
        }
      };
      await image
        .createPixelMap(color, opts)
        .then(async (pixelmap) => {
          await pixelmap.getImageInfo().then(imageInfo => {
            console.log("=====size: ====" + JSON.stringify(imageInfo.size));
          }).catch((err: BusinessError) => {
            console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
            return;
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
                lockscreenPicture: pixelmap
              }
            },
            notificationSlotType: notificationManager.SlotType.OTHER_TYPES
          }
        })
      hilog.info(0x000, `${TAG}`, `${TEST_CASE_NAME} test case start`);
      done();
    })
  })
}