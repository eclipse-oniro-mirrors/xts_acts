/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import notificationManager from '@ohos.notificationManager'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ActsNotificationManagerDistributedTest() {
  describe('SUB_NOTIFICATION_ANS_MANAGER_IS_DISTRIBUTED_ENABLED_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_ANS_MANAGER_IS_DISTRIBUTED_ENABLED_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_IS_DISTRIBUTED_ENABLED_TEST START')

    /*
    * @tc.number    : Sub_Notification_Ans_Distributed_Enable_4100
    * @tc.name      : function isDistributedEnabled(callback: AsyncCallback<boolean>): void
    * @tc.desc      : Obtains whether the device supports distributed notification
    */
    it('Sub_Notification_Ans_Distributed_Enable_4100', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_4100 START`)
      try {
        notificationManager.isDistributedEnabled((err, data) => {
          if (err) {
            console.info(`${TAG} isDistributedEnabled AsyncCallback err: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} isDistributedEnabled AsyncCallback success: ${data}`)
            expect(data).assertFalse()
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} isDistributedEnabled AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_4100 END`)
    })

    /*
    * @tc.number    : Sub_Notification_Ans_Distributed_Enable_4200
    * @tc.name      : function isDistributedEnabled(): Promise<boolean>
    * @tc.desc      : Obtains whether the device supports distributed notification
    */
    it('Sub_Notification_Ans_Distributed_Enable_4200', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_4200 START`)
      notificationManager.isDistributedEnabled().then((data) => {
        console.info(`${TAG} isDistributedEnabled Promise success: ${data}`)
        expect(data).assertFalse()
        done()
      }).catch((err) => {
        console.info(`${TAG} isDistributedEnabled Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_4200 END`)
    })

    /*
    * @tc.number    : SUB_NOTIFICATION_ANS_MANAGER_IS_DISTRIBUTED_ENABLED_TEST_0300
    * @tc.name      : function isDistributedEnabled(undefined): Promise<boolean>
    * @tc.desc      : Obtains whether the device supports distributed notification
    */
    it('SUB_NOTIFICATION_ANS_MANAGER_IS_DISTRIBUTED_ENABLED_TEST_0300', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_IS_DISTRIBUTED_ENABLED_TEST_0300 START`)
      notificationManager.isDistributedEnabled(undefined).then((data) => {
        console.info(`${TAG} isDistributedEnabled Promise success: ${data}`)
        expect(data).assertFalse()
        done()
      }).catch((err) => {
        console.info(`${TAG} isDistributedEnabled Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} SUB_NOTIFICATION_ANS_MANAGER_IS_DISTRIBUTED_ENABLED_TEST_0300 END`)
    })

    console.info(TAG + 'SUB_NOTIFICATION_IS_DISTRIBUTED_ENABLED_TEST END')
  })

}