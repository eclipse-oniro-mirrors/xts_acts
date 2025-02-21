/*
* Copyright (c) 2022 Huawei Device Co., Ltd.
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

import notification from '@ohos.notification'
import {UiComponent,UiDriver,Component,Driver,UiWindow,ON,BY,MatchPattern,DisplayRotation,ResizeDirection,WindowMode,PointerMatrix} from '@ohos.UiTest'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ActsNotificationRequestTest() {
  describe('SUB_NOTIFICATION_ANS_REQUEST_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_ANS_REQUEST_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_REQUEST_TEST START')

    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    async function driveFn() {
      console.info(`${TAG} come in driveFn`)
      let driver = await UiDriver.create()
      console.info(`${TAG} driver is ${JSON.stringify(driver)}`)
      await sleep(2000)
      console.info(`${TAG} UiDriver start`)
      let button = await driver.findComponent(BY.text('允许'))
      console.info(`${TAG} button is ${JSON.stringify(button)}`)
      await sleep(5000)
      await button.click()
    }

    beforeAll(async function (done) {
      console.info(`${TAG} come in beforeAll`)
      notification.requestEnableNotification(async (err) => {
        console.info(`${TAG} come in requestEnableNotification`)
        if (err.code) {
          console.info(`${TAG} requestEnableNotification err: ${err}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} requestEnableNotification success`)
        }
      })
      console.info(`${TAG} requestEnableNotification sleep START`)
      await sleep(2000)
      console.info(`${TAG} requestEnableNotification sleep END`)
      await driveFn()
      done()
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_REQUEST_TEST_0100
     * @tc.name      : function publish(request: NotificationRequest, callback: AsyncCallback<void>): void
     * @tc.desc      : publish a notification after requestEnableNotification
     */
    it('SUB_NOTIFICATION_ANS_REQUEST_TEST_0100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_REQUEST_TEST_0100 START`)
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test_title",
            text: "test_text",
            additionalText: "test_additionalText"
          }
        }
      }
      notification.publish(notificationRequest, (err, data) => {
        if (err.code) {
          console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.log(`${TAG} notification publish AsyncCallback success: ${data}`)
          expect(true).assertTrue()
          done()
        }
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_REQUEST_TEST_0100 END`)
    })

    /*
     * @tc.number    : SUB_NOTIFICATION_ANS_REQUEST_TEST_0200
     * @tc.name      : function publish(request: NotificationRequest): Promise<void>
     * @tc.desc      : publish a notification after requestEnableNotification
     */
    it('SUB_NOTIFICATION_ANS_REQUEST_TEST_0200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_REQUEST_TEST_0200 START`)
      let notificationRequest = {
        id: 1,
        content: {
          contentType: notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test_title",
            text: "test_text",
            additionalText: "test_additionalText"
          }
        }
      }
      notification.publish(notificationRequest).then((data) => {
        console.log(`${TAG} notification publish AsyncCallback success: ${data}`)
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`${TAG} notification publish AsyncCallback err: ${err.code}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_REQUEST_TEST_0200 END`)
    })
    console.info(TAG + 'SUB_NOTIFICATION_ANS_REQUEST_TEST END')
  })

}
