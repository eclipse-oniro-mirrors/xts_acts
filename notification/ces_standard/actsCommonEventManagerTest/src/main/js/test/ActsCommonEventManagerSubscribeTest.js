/*
* Copyright (c) 2023 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License")
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import commonEventManager from '@ohos.commonEventManager'

export default function ActsCommonEventManagerSubscribeTest() {
  describe('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST ===>'
    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST START`)

    /*
     * @tc.number: SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_0900
     * @tc.name: isStickyCommonEvent isOrderedCommonEvent abortCommonEvent getAbortCommonEvent clearAbortCommonEvent
     * @tc.desc: verify the callback function
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_0900', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_0900 START`)

      let subscriber

      let subscribeInfo = {
        events: ["event09"]
      }

      try {
        console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_0900 come in `)

        commonEventManager.createSubscriber(subscribeInfo, (err, commonEventSubscriber) => {
          console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_0900 createSubscriber come in `)
          if (err) {
            console.info(`SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_0900 createSubscriber err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_0900 createSubscriber success ${commonEventSubscriber}`)
            subscriber = commonEventSubscriber
            expect(true).assertTrue()
            done()

            subscriber.isStickyCommonEvent((err, isSticky) => {
              if (err) {
                console.info(`isStickyCommonEvent_9 err ${err}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`isStickyCommonEvent_9 success ${isSticky}`)
                expect(true).assertTrue()
                done()
              }
            })

            subscriber.isOrderedCommonEvent((err, isOrdered) => {
              if (err) {
                console.info(`isOrderedCommonEvent_9 err ${err}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`isOrderedCommonEvent_9 success ${isOrdered}`)
                if (isOrdered == true) {
                  subscriber.abortCommonEvent((err) => {
                    if (err) {
                      console.info(`abortCommonEvent_9 err ${err}`)
                      expect(false).assertTrue()
                      done()
                    } else {
                      console.info(`abortCommonEvent_9 success`)
                      expect(true).assertTrue()
                      done()
                    }
                  })
                }
                else {
                  expect(true).assertTrue()
                }
                done()
              }
            })

            subscriber.getAbortCommonEvent((err, abortEvent) => {
              if (err) {
                console.info(`getAbortCommonEvent_9 err ${err}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`getAbortCommonEvent_9 success ${abortEvent}`)
                expect(true).assertTrue()
                done()
              }
            })

            subscriber.clearAbortCommonEvent((err) => {
              if (err) {
                console.info(`clearAbortCommonEvent_9 err ${err}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`clearAbortCommonEvent_9 success`)
                expect(true).assertTrue()
                done()
              }
            })

          }
        })
      } catch (err) {
        console.info(`SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_0900 failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_0900 END`)
    })

    /*
     * @tc.number: SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1000
     * @tc.name: isStickyCommonEvent isOrderedCommonEvent abortCommonEvent getAbortCommonEvent clearAbortCommonEvent
     * @tc.desc: verify the promise function
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1000', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1000 START`)

      let subscriber

      let subscribeInfo = {
        events: ["event10"]
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, async (err, commonEventSubscriber) => {
          if (err) {
            console.info(`SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1000 createSubscriber err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1000 createSubscriber success ${commonEventSubscriber}`)
            subscriber = commonEventSubscriber
            expect(true).assertTrue()
            done()

            await subscriber.isStickyCommonEvent().then((isSticky) => {
              console.info(`isStickyCommonEvent_10 success ${isSticky}`)
              expect(true).assertTrue()
              done()
            }).catch((err) => {
              console.info(`isStickyCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.isOrderedCommonEvent().then((isOrdered) => {
              console.info(`isOrderedCommonEvent_10 success ${isOrdered}`)
              expect(true).assertTrue()
              done()
            }).catch((err) => {
              console.info(`isOrderedCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.abortCommonEvent().then(() => {
              console.info(`abortCommonEvent_10 success`)
              expect(true).assertTrue()
              done()
            }).catch((err) => {
              console.info(`abortCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.getAbortCommonEvent().then((abortEvent) => {
              console.info(`getAbortCommonEvent_10 success ${abortEvent}`)
              expect(true).assertTrue()
              done()
            }).catch((err) => {
              console.info(`getAbortCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.clearAbortCommonEvent().then(() => {
              console.info(`clearAbortCommonEvent_10 success`)
              expect(true).assertTrue()
              done()
            }).catch((err) => {
              console.info(`clearAbortCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

          }
        })
      } catch (err) {
        console.info(`SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1000 failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1000 END`)
    })

    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST END`)
  })
}

