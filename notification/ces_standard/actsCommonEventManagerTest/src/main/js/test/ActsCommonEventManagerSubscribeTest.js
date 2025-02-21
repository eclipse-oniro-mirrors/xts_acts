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
     * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_1900
     * @tc.name: isStickyCommonEvent isOrderedCommonEvent abortCommonEvent getAbortCommonEvent clearAbortCommonEvent
     * @tc.desc: verify the callback function
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_1900', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1900 START`)

      let subscriber

      let subscribeInfo = {
        events: ["event09"]
      }

      try {
        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1900 come in `)

        commonEventManager.createSubscriber(subscribeInfo, (err, commonEventSubscriber) => {
          console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1900 createSubscriber come in `)
          if (err) {
            console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1900 createSubscriber err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1900 createSubscriber success ${commonEventSubscriber}`)
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
        console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1900 failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1900 END`)
    })

    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_2000
     * @tc.name: isStickyCommonEvent isOrderedCommonEvent abortCommonEvent getAbortCommonEvent clearAbortCommonEvent
     * @tc.desc: verify the promise function
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_2000', 0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_2000 START`)

      let subscriber

      let subscribeInfo = {
        events: ["event10"]
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, async (err, commonEventSubscriber) => {
          if (err) {
            console.info(`Sub_Notification_Ans_Subscriber_Subscribe_2000 createSubscriber err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`Sub_Notification_Ans_Subscriber_Subscribe_2000 createSubscriber success ${commonEventSubscriber}`)
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
        console.info(`Sub_Notification_Ans_Subscriber_Subscribe_2000 failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_2000 END`)
    })

    it('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1100', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1100 START`)

      let options = {
        code: 0,
        data: "initial data",
        isOrdered: true,
        isSticky: false,
      }

      let subscribeInfo = {
        events: ["eventname"],
        priority:100
      };

      function SubscribeCB(err, data) {
        if (err) {
          expect(false).assertTrue()
          done()
        } else {
          let code1 = subscriber.getCodeSync();
          expect(code1).assertEqual(0);
          console.info(`getCodeSync before setCodeSync, code is ${code1}`)

          subscriber.setCodeSync(1);
          let code2 = subscriber.getCodeSync();
          console.info(`getCodeSync after setCodeSync, code is ${code2}`)
          expect(code2).assertEqual(1);

          let data = subscriber.getDataSync();
          expect(data).assertEqual("initial data");
          console.info(`getDataSync before setDataSync, data is ${data}`)

          subscriber.setDataSync("data change");
          let data2 = subscriber.getDataSync();
          expect(data2).assertEqual("data change");
          console.info(`getDataSync after setDataSync, data is ${data2}`)

          subscriber.setCodeAndDataSync(2, "setCodeAndDataSync")
          let code3 = subscriber.getCodeSync()
          expect(code3).assertEqual(2);
          console.info(`getCodeSync after setCodeAndDataSync, code is ${code3}`)

          let data3 = subscriber.getDataSync();
          expect(data3).assertEqual("setCodeAndDataSync");
          console.info(`getDataSync after setCodeAndDataSync, data is ${data3}`)
  
          let isorder = subscriber.isOrderedCommonEventSync();
          expect(isorder).assertEqual(true)
          console.info(`isOrderedCommonEventSync, isorder is ${isorder}`)
  

          let isSticky = subscriber.isStickyCommonEventSync();
          expect(isSticky).assertEqual(false)
          console.info(`isStickyCommonEventSync, isStickyCommonEventSync is ${isSticky}`)

          subscriber.abortCommonEventSync();
          let isaborted = subscriber.getAbortCommonEventSync();
          expect(isaborted).assertEqual(true)
          console.info(`getAbortCommonEventSync isaborted ${isaborted}`)
          subscriber.clearAbortCommonEventSync()

          done()
        }
      }

      let subscriber = commonEventManager.createSubscriberSync(subscribeInfo)
      commonEventManager.subscribe(subscriber, SubscribeCB)

      function publishCB(err) {
        if (err) {
          console.error(`publish failed, code is ${err.code}, message is ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`publish success`)
        }
      }

      try {
        setTimeout(()=>{
          commonEventManager.publish("eventname", options, publishCB);
        }, 1000);
      } catch (err) {
        console.error(`publish failed, code is ${err.code}, message is ${err.message}`)
      }
    })

    it('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1200', 0, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1200 START`)

      let options = {
        code: 0,
        data: "initial data",
      }

      let subscribeInfo = {
        events: ["eventname2"],
        priority: 100
      };

      function SubscribeCB(err, data) {
        if (err) {
          console.error(`subscribe failed, code is ${err.code}, message is ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          let info = subscriber.getSubscribeInfoSync();
          expect(info.priority).assertEqual(100)
          expect(info.userId).assertEqual(-3)
          done()
        }
      }

      let subscriber = commonEventManager.createSubscriberSync(subscribeInfo)
      commonEventManager.subscribe(subscriber, SubscribeCB)

      function publishCB(err) {
        if (err) {
          console.error(`publish failed, code is ${err.code}, message is ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`publish success`)
        }
      }

      try {
        setTimeout(()=>{
          commonEventManager.publish("eventname2", options, publishCB);
        }, 1000);
      } catch (err) {
        console.error(`publish failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1200 END`)
    })

    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST END`)
  })
}

