/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "../../../hypium/index"
import { BusinessError } from '@ohos.base'

export default function ActsNotificationDistributedTest() {
  describe('Sub_Notification_Ans_Enable_SetEnable', () => {
    let TAG:string = 'SUB_NOTIFICATION_ANS_IS_DISTRIBUTED_ENABLED_TEST ===>'
    console.info(TAG + 'SUB_NOTIFICATION_ANS_IS_DISTRIBUTED_ENABLED_TEST START')

    /**
     * @tc.name   Sub_Notification_Ans_Enable_SetEnable_Static_5000
     * @tc.number Sub_Notification_Ans_Enable_SetEnable_Static_5000
     * @tc.desc   Obtains whether the device supports distributed notification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Enable_SetEnable_Static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>  {
      let TAG:string = "Sub_Notification_Ans_Enable_SetEnable_Static_5000"
      console.info(`${TAG} Sub_Notification_Ans_Enable_SetEnable_5000 START`)
      notificationManager.isDistributedEnabled((err: BusinessError | null, data:boolean | undefined) => {
        if (err) {
          console.info(`${TAG} isDistributedEnabled AsyncCallback err: ${err.code}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`${TAG} isDistributedEnabled AsyncCallback success: ${data}`)
          expect(data).assertFalse()
          done()
        }
      })
      console.info(`${TAG} Sub_Notification_Ans_Enable_SetEnable_5000 END`)
    })


    /**
     * @tc.name   Sub_Notification_Ans_Enable_SetEnable_Static_5100
     * @tc.number Sub_Notification_Ans_Enable_SetEnable_Static_5100
     * @tc.desc   Obtains whether the device supports distributed notification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Enable_SetEnable_Static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = "Sub_Notification_Ans_Enable_SetEnable_Static_5100"
      console.info(`${TAG} Sub_Notification_Ans_Enable_SetEnable_5100 START`)
      let data : boolean =  false
      notificationManager.isDistributedEnabled().then((data: boolean) => {
        console.info(TAG+"isDistributedEnabled success, data: " + data)
        let data1: boolean = data as boolean
        expect(data1).assertFalse()
        done()
      }).catch((err:Error):void => {
        console.info(`${TAG} isDistributedEnabled Promise err: ${err}`)
        expect(false).assertTrue()
        done()
      })
      console.info(`${TAG} Sub_Notification_Ans_Enable_SetEnable_5100 END`)
    })

    console.info(TAG + 'SUB_NOTIFICATION_IS_DISTRIBUTED_ENABLED_TEST END')
  })

}
