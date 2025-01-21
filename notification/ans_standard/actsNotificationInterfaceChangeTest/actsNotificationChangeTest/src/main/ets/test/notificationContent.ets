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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { logGenerator, exitGenerator, sleep, exitSpecialGenerator } from '../common/utils';
import notificationManager from '@ohos.notificationManager';
import hilog from '@ohos.hilog';
import image from '@ohos.multimedia.image';

export default function notificationContentTest() {
  describe('ActsNotificationContentTest', function () {

    const TAG = 'ActsNotificationContentTest ===>';
    let log = logGenerator(TAG);
    log('ActsNotificationContentTest START');

    class Utils {
      static info(str) {
        hilog.info(0, 'bms test', str)
      }

      static sleep(time) {
        return new Promise((resolve, reject) => {
          setTimeout((data) => {
            resolve(data)
          }, time)
        }).then(() => {
          console.info(`sleep ${time} over...`)
        })
      }
    }


    /**
     * @tc.number: Acts_NotificationContent_0100
     * @tc.name: Test the notificationContentType property.
     * @tc.desc: Set notificationContentType attribute parameters
     *           notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT.
     */
    it('Acts_NotificationContent_0100', 0, async function (done) {
      const TEST_CASE_NAME = 'Acts_NotificationContent_0100';

      function requestEnableNotificationCallback(err) {
        if (err) {
          console.error(`requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
        } else {
          console.info("requestEnableNotification success");
        }
      };

      notificationManager.requestEnableNotification(requestEnableNotificationCallback);

      let notificationRequest = {
        id: 1,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: 'text_title',
            text: 'text_text',
            additionalText: ''
          }
        }
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
     * @tc.number: Acts_NotificationContent_0200
     * @tc.name: Test the notificationContentType property.
     * @tc.desc: Set notificationContentType attribute parameters
     *           notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT.
     */
    it('Acts_NotificationContent_0200', 0, async function (done) {
      const TEST_CASE_NAME = 'Acts_NotificationContent_0200';

      let notificationRequest = {
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
        }
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
     * @tc.number: Acts_NotificationContent_0300
     * @tc.name: Test the notificationContentType property.
     * @tc.desc: Set notificationContentType attribute parameters
     *           notificationManager.ContentType.NOTIFICATION_CONTENT_PICTURE.
     */
    it('Acts_NotificationContent_0300', 0, async function (done) {
      const TEST_CASE_NAME = 'Acts_NotificationContent_0300';

      const color = new ArrayBuffer(60000);
      let bufferArr = new Uint8Array(color);
      for (var i = 0; i < bufferArr.byteLength; i++) {
        bufferArr[i++] = 60;
        bufferArr[i++] = 20;
        bufferArr[i++] = 220;
        bufferArr[i] = 100;
      }
      let opts = {
        editable: true, pixelFormat: 2, size: {
          height: 100, width: 150
        }
      };
      await image
        .createPixelMap(color, opts)
        .then(async (pixelmap) => {
          await pixelmap.getImageInfo().then(imageInfo => {
            console.log("=====size: ====" + JSON.stringify(imageInfo.size));
          }).catch(err => {
            console.error("Failed to obtain the image pixel map information." + JSON.stringify(err));
            return;
          })
          let notificationRequest = {
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
            }
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
     * @tc.number: Acts_NotificationContent_0400
     * @tc.name: Test the notificationContentType property.
     * @tc.desc: Set notificationContentType attribute parameters
     *           notificationManager.ContentType.NOTIFICATION_CONTENT_MULTILINE.
     */
    it(" Acts_NotificationContent_0400", 0, async function (done) {
      const TEST_CASE_NAME = 'Acts_NotificationContent_0400';

      let notificationRequest = {
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
  })
}