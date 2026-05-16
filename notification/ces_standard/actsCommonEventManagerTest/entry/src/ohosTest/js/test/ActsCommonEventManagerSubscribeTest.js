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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import commonEventManager from '@ohos.commonEventManager'

export default function ActsCommonEventManagerSubscribeTest() {
  describe('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST ===>'
    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST START`)

    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms))
    }

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_1900
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_1900
     * @tc.desc   verify the callback function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_1900', Level.LEVEL3, async function (done) {
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

            subscriber.isStickyCommonEvent((err, isSticky) => {
              if (err) {
                console.info(`isStickyCommonEvent_9 err ${err}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`isStickyCommonEvent_9 success ${isSticky}`)
                expect(isSticky).assertFalse()
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
                    }
                  })
                }
                else {
                  expect(isOrdered).assertFalse()
                }
              }
            })

            subscriber.getAbortCommonEvent((err, abortEvent) => {
              if (err) {
                console.info(`getAbortCommonEvent_9 err ${err}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`getAbortCommonEvent_9 success ${abortEvent}`)
                expect(abortEvent).assertFalse()
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
              }
            })

            subscriber.finishCommonEvent((err) => {
              if (err) {
                console.info(`finishCommonEvent_1 err, error code: ${err.code}, message: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`finishCommonEvent_1 success `)
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

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_2000
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_2000
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_2000', Level.LEVEL3, async function (done) {
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

            await subscriber.isStickyCommonEvent().then((isSticky) => {
              console.info(`isStickyCommonEvent_10 success ${isSticky}`)
              expect(isSticky).assertFalse()
            }).catch((err) => {
              console.info(`isStickyCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            let isSticky = subscriber.isStickyCommonEventSync();
            expect(isSticky).assertFalse()

            await subscriber.isOrderedCommonEvent().then((isOrdered) => {
              console.info(`isOrderedCommonEvent_10 success ${isOrdered}`)
              expect(isOrdered).assertFalse()
            }).catch((err) => {
              console.info(`isOrderedCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            let isorder = subscriber.isOrderedCommonEventSync();
            expect(isorder).assertFalse()
            console.info(`isOrderedCommonEventSync, isorder is ${isorder}`)

            await subscriber.abortCommonEvent().then(() => {
              console.info(`abortCommonEvent_10 success`)
              expect(true).assertTrue()
            }).catch((err) => {
              console.info(`abortCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.getAbortCommonEvent().then((abortEvent) => {
              console.info(`getAbortCommonEvent_10 success ${abortEvent}`)
              expect(abortEvent).assertFalse()
            }).catch((err) => {
              console.info(`getAbortCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            let isaborted = subscriber.getAbortCommonEventSync();
            expect(isaborted).assertFalse()

            await subscriber.clearAbortCommonEvent().then(() => {
              console.info(`clearAbortCommonEvent_10 success`)
            }).catch((err) => {
              console.info(`clearAbortCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })


            await subscriber.finishCommonEvent().then(() => {
              console.info(`finishCommonEvent_10 success `)
              expect(true).assertTrue()
              done()
            }).catch((err) => {
              console.info(`finishCommonEvent_10 err, error code: ${err.code}, message: ${err.message}`)
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

        /**
         * @tc.name   SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1200
         * @tc.number SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1200
         * @tc.desc   verify the promise function
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1200', Level.LEVEL2, async function (done) {
          console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1200 START`)
    
          let options = {
            code: 0,
            data: "initial data",
            isOrdered: true,
            isSticky: false,
          }
    
          let subscribeInfo = {
            events: ["eventname2"],
            priority: 100
          };
    
    
          let subscriber = commonEventManager.createSubscriberSync(subscribeInfo)
          commonEventManager.subscribe(subscriber, async (err, data) => {
            if (err) {
              console.error(`subscribe failed, code is ${err.code}, message is ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              await subscriber.isOrderedCommonEvent().then((isOrdered) => {
                console.info(`isOrderedCommonEvent_12 success ${isOrdered}`)
                expect(isOrdered).assertTrue()
              }).catch((err) => {
                console.info(`isOrderedCommonEvent_12 err ${err}`)
                expect(false).assertTrue()
                done()
              })
    
              await subscriber.isStickyCommonEvent().then((isSticky) => {
                console.info(`isStickyCommonEvent_12 success ${isSticky}`)
                expect(isSticky).assertFalse()
              }).catch((err) => {
                console.info(`isStickyCommonEvent_12 err ${err}`)
                expect(false).assertTrue()
                done()
              })
    
              await subscriber.abortCommonEventSync();
              await subscriber.getAbortCommonEvent().then((abortEvent) => {
                console.info(`getAbortCommonEvent_12 success ${abortEvent}`)
                expect(abortEvent).assertTrue()
              }).catch((err) => {
                console.info(`getAbortCommonEvent_12 err ${err}`)
                expect(false).assertTrue()
                done()
              })
              await subscriber.clearAbortCommonEventSync()
    
              let info = subscriber.getSubscribeInfoSync();
              expect(info.priority).assertEqual(100)
              expect(info.userId).assertEqual(-3)

              await subscriber.finishCommonEvent().then(() => {
                console.info(`finishCommonEvent_12 success `)
                expect(true).assertTrue()
                done()
              }).catch((err) => {
                console.info(`finishCommonEvent_12 err, error code: ${err.code}, message: ${err.message}`)
                expect(false).assertTrue()
                done()
              })
            }
          })
    
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
            setTimeout(() => {
              commonEventManager.publish("eventname2", options, publishCB);
            }, 1000);
          } catch (err) {
            console.error(`publish failed, code is ${err.code}, message is ${err.message}`)
            expect(false).assertTrue()
            done()
          }
    
          console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1200 END`)
        })


    /**
     * @tc.name   SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1100
     * @tc.number SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1100
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1100', Level.LEVEL2, async function (done) {
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_1100 START`)

      let options = {
        code: 0,
        data: "initial data",
        isOrdered: true,
        isSticky: false,
      }

      let subscribeInfo = {
        events: ["eventname"],
        priority: 100
      };

      let subscriber = commonEventManager.createSubscriberSync(subscribeInfo)
      commonEventManager.subscribe(subscriber, async (err, data) =>  {
        if (err) {
          expect(false).assertTrue()
          done()
        } else {
          subscriber.isOrderedCommonEvent((err, isOrdered) => {
            if (err) {
              console.info(`isOrderedCommonEvent_11 err ${err}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`isOrderedCommonEvent_11 success ${isOrdered}`)
              expect(isOrdered).assertTrue()
            }
          })

          subscriber.isStickyCommonEvent((err, isSticky) => {
            if (err) {
              console.info(`isStickyCommonEvent_11 err ${err}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`isStickyCommonEvent_11 success ${isSticky}`)
              expect(isSticky).assertFalse()
            }
          })


          let code1 = subscriber.getCodeSync();
          expect(code1).assertEqual(0);
          console.info(`getCodeSync before setCodeSync_11, code is ${code1}`)

          subscriber.setCodeSync(1);
          let code2 = subscriber.getCodeSync();
          console.info(`getCodeSync after setCodeSync_11, code is ${code2}`)
          expect(code2).assertEqual(1);

          let data = subscriber.getDataSync();
          expect(data).assertEqual("initial data");
          console.info(`getDataSync before setDataSync_11, data is ${data}`)

          subscriber.setDataSync("data change");
          let data2 = subscriber.getDataSync();
          expect(data2).assertEqual("data change");
          console.info(`getDataSync after setDataSync_11, data is ${data2}`)

          subscriber.setCodeAndDataSync(2, "setCodeAndDataSync")
          let code3 = subscriber.getCodeSync()
          expect(code3).assertEqual(2);
          console.info(`getCodeSync after setCodeAndDataSync_11, code is ${code3}`)

          let data3 = subscriber.getDataSync();
          expect(data3).assertEqual("setCodeAndDataSync");
          console.info(`getDataSync after setCodeAndDataSync_11, data is ${data3}`)

          let isorder = subscriber.isOrderedCommonEventSync();
          expect(isorder).assertTrue()
          console.info(`isOrderedCommonEventSync_11, isorder is ${isorder}`)


          let isSticky = subscriber.isStickyCommonEventSync();
          expect(isSticky).assertFalse()
          console.info(`isStickyCommonEventSync_11, isStickyCommonEventSync is ${isSticky}`)

          subscriber.abortCommonEventSync();
          let isaborted = subscriber.getAbortCommonEventSync();
          expect(isaborted).assertEqual(true)

          subscriber.getAbortCommonEvent((err, abortEvent) => {
            if (err) {
              console.info(`getAbortCommonEvent_11 err ${err}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`getAbortCommonEvent_11 success ${abortEvent}`)
              expect(abortEvent).assertTrue()
            }
          })
          await sleep(1000)

          console.info(`getAbortCommonEventSync_11 isaborted ${isaborted}`)
          subscriber.clearAbortCommonEventSync()
          subscriber.finishCommonEvent((err) => {
            if (err) {
              console.info(`finishCommonEvent_11 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`finishCommonEvent_11 success `)
              expect(true).assertTrue()
              done()
            }
          })
        }
      })

      function publishCB(err) {
        if (err) {
          console.error(`publish failed, code is ${err.code}, message is ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`publish success_11`)
        }
      }

      try {
        setTimeout(() => {
          commonEventManager.publish("eventname", options, publishCB);
        }, 1000);
      } catch (err) {
        console.error(`publish_11 failed, code is ${err.code}, message is ${err.message}`)
      }
    })

    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST END`)
  })
}

