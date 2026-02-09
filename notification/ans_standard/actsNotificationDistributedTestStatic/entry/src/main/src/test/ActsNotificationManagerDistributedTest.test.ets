/**
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "../../../hypium/index"
import { BusinessError } from '@ohos.base'

export default function ActsNotificationManagerDistributedTest() {
  describe('SUB_NOTIFICATION_ANS_MANAGER_IS_DISTRIBUTED_ENABLED_TEST', () => {
    let TAG:string = 'SUB_NOTIFICATION_ANS_MANAGER_IS_DISTRIBUTED_ENABLED_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_MANAGER_IS_DISTRIBUTED_ENABLED_TEST START')

    /**
     * @tc.name   Sub_Notification_Ans_Distributed_Enable_Static_4100
     * @tc.number Sub_Notification_Ans_Distributed_Enable_Static_4100
     * @tc.desc   Obtains whether the device supports distributed notification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Distributed_Enable_Static_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> =>  {
      let TAG:string = "Sub_Notification_Ans_Distributed_Enable_Static_4100"
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_4100 START`)
      try {
        notificationManager.isDistributedEnabled((err: BusinessError | null, data:boolean | undefined) => {
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

    /**
     * @tc.name   Sub_Notification_Ans_Distributed_Enable_Static_4200
     * @tc.number Sub_Notification_Ans_Distributed_Enable_Static_4200
     * @tc.desc   Obtains whether the device supports distributed notification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Distributed_Enable_Static_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = "Sub_Notification_Ans_Distributed_Enable_Static_4200"
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_4200 START`)
      notificationManager.isDistributedEnabled().then((data: boolean) => {
        console.info(TAG+`isDistributedEnabled Promise success`+ data)
        let data1: boolean = data as boolean
        expect(data1).assertFalse()
        done()
      }).catch((err:Error):void => {
        console.info(`${TAG} isDistributedEnabled Promise err: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Distributed_Enable_4200 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Is_Notification_Enable_Static_0100
     * @tc.number Sub_Notification_Ans_Is_Notification_Enable_Static_0100
     * @tc.desc   test function isNotificationEnabledSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Is_Notification_Enable_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = "Sub_Notification_Ans_Is_Notification_Enable_Static_0100"
      console.info(`${TAG} Sub_Notification_Ans_Is_Notification_Enable_0100 START`);
      try {
        let notificationenable: boolean = notificationManager.isNotificationEnabledSync()
        expect(notificationenable).assertFalse()
        done()
      } catch (err) {
        console.info(`${TAG} publish AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Is_Notification_Enable_0100 END`);
    });

    console.info(TAG + 'SUB_NOTIFICATION_IS_DISTRIBUTED_ENABLED_TEST END')
  })

}
