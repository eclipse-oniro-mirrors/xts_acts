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

export default function ActsCommonEventManagerTest() {
  describe('SUB_NOTIFICATION_CES_MANAGER_TEST', function () {
    let TAG = 'SUB_NOTIFICATION_CES_MANAGER_TEST ===>'
    console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_TEST START`)
    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms))
    }

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_1800
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_1800
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_1800', Level.LEVEL3, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1800 START`)

      let subscriber
      let count = 0
      let subscribeInfo = {
        events: ["event08"]
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, async (err, commonEventSubscriber) => {
          if (err) {
            console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 success ${commonEventSubscriber}`)
            subscriber = commonEventSubscriber

            await subscriber.setCode(3).then(() => {
              console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 setCode_2 success `)
              count++
              expect(count).assertEqual(1)
            }).catch((err) => {
              console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 setCode_2 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.getCode().then((Code) => {
              console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 getCode_2 success ${Code}`)
              expect(Code).assertEqual(0)
            }).catch((err) => {
              console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 getCode_2 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.setData('data03').then(() => {
              console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 setData_2 success `)
              count++
              expect(count).assertEqual(2)
              subscriber.getData().then((data) => {
                console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 getData_2 success ${data}`)
                expect(data).assertEqual('')
              }).catch((err) => {
                console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 getData_2 err, error code: ${err.code}, message: ${err.message}`)
                expect(false).assertTrue()
                done()
              })
            }).catch((err) => {
              console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 setData_2 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.setCodeAndData(4, 'data04').then(() => {
              console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 setCodeAndData_2 success `)
              count++
              expect(count).assertEqual(3)
            }).catch((err) => {
              console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 setCodeAndData_2 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.getSubscribeInfo().then((CommonEventSubscribeInfo) => {
              console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 getSubscribeInfo_2 success ${JSON.stringify(CommonEventSubscribeInfo)}`)
              expect(JSON.stringify(CommonEventSubscribeInfo)).assertContain("event08")
            }).catch((err) => {
              console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 getSubscribeInfo_2 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.finishCommonEvent().then(() => {
              console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 finishCommonEvent_2 success `)
              count++
              expect(count).assertEqual(4)
            }).catch((err) => {
              console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 finishCommonEvent_2 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            })

          }
        })
      } catch (err) {
        console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1800 failed, catch error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      setTimeout(()=>{
        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1800 END`)
        done()
      },1500)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_4700
     * @tc.number Sub_Notification_Ans_Publish_Publish_4700
     * @tc.desc   verify the callback function of publish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_4700', Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4700 START`)
      let count = 0
      try {
        commonEventManager.publish("EVENT01", (err) => {
          if (err) {
            console.info(`Sub_Notification_Ans_Publish_Publish_4700 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            count++
            sleep(300)
            expect(count).assertEqual(1)
            console.info("Sub_Notification_Ans_Publish_Publish_4700 success")
            done()
          }
        })
      } catch (err) {
        console.info(`Sub_Notification_Ans_Publish_Publish_4700 failed, catch error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4700 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_4800
     * @tc.number Sub_Notification_Ans_Publish_Publish_4800
     * @tc.desc   publish options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_4800', Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4800 START`)
      let options = {
        code: 0,
        data: "initial data",
        isOrdered: true
      }
      let count = 0
      try {
        commonEventManager.publish("EVENT02", options, (err) => {
          if (err) {
            console.info(`Sub_Notification_Ans_Publish_Publish_4800 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            count++
            sleep(300)
            expect(count).assertEqual(1)
            console.info("Sub_Notification_Ans_Publish_Publish_4800 success")
            done()
          }
        })
      } catch (err) {
        console.info(`Sub_Notification_Ans_Publish_Publish_4800 failed, catch error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4800 END`)

    })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_1500
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_1500
     * @tc.desc   createSubscriber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_1500', Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1500 START`)

      let subscriber
      let count = 0
      let subscribeInfo = {
        events: ["event03"]
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, (err, commonEventSubscriber) => {
          if (err) {
            console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1500 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1500 success ${commonEventSubscriber}`)
            subscriber = commonEventSubscriber
            count++
            sleep(300)
            expect(count).assertEqual(1)
            done()
          }
        })
      } catch (err) {
        console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1500 failed, catch error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1500 END`)

    })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_1600
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_1600
     * @tc.desc   createSubscriber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_1600', Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1600 START`)

      let subscriber
      let count  = 0
      let subscribeInfo = {
        events: ["event04"]
      }

      await commonEventManager.createSubscriber(subscribeInfo).then((commonEventSubscriber) => {
        console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1600 success ${commonEventSubscriber}`)
        subscriber = commonEventSubscriber
        count++
        sleep(300)
        expect(count).assertEqual(1)
        done()
      }).catch((err) => {
        console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1600 err, error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1600 END`)

    })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_0400
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_0400
     * @tc.desc   subscribe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_0400', Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_0400 START`)

      let subscriber
      let count = 0
      let subscribeInfo = {
        events: ["event05"]
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, (err, commonEventSubscriber) => {
          if (err) {
            console.info(`Sub_Notification_Ans_Subscriber_Subscribe_0400 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`Sub_Notification_Ans_Subscriber_Subscribe_0400 success ${commonEventSubscriber}`)
            subscriber = commonEventSubscriber
            try {
              commonEventManager.subscribe(subscriber, (err, data) => {
                if (err) {
                  console.info(`subscribe_1 err, code is ${err.code}, message is ${err.message}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  count++
                  sleep(300)
                  expect(count).assertEqual(1)
                  console.info(`subscribe_1 success`)
                  done()
                }
              })
            } catch (err) {
              console.info(`subscribe_1 failed, code is ${err.code}, message is ${err.message}`)
            }
            done()
          }
        })
      } catch (err) {
        console.info(`Sub_Notification_Ans_Subscriber_Subscribe_0400 failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_0400 END`)

    })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401
     * @tc.number Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401
     * @tc.desc   Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401', Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_0400 START`)

      let subscriber
      let count = 0  
      let subscribeInfo = {
        events: ["event05"]
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, (err, commonEventSubscriber) => {
          if (err) {
            console.error(`Sub_Notification_Ans_Subscriber_Subscribe_0400 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`Sub_Notification_Ans_Subscriber_Subscribe_0400 success ${commonEventSubscriber}`)
            subscriber = commonEventSubscriber
            try {
              commonEventManager.subscribeToEvent(subscriber, (data) => {
                console.info(`subscribe_1 OnReceive event success`)
                done()
              }).then(() => {
                console.info(`subscribe_1 success`)
                count++
                expect(count).assertEqual(1)
                done()
              }).catch((err) => {
                console.error(`subscribe_1 err, code is ${err.code}, message is ${err.message}`)
                expect(false).assertTrue()
                done()
              })
            } catch (err) {
              console.error(`subscribe_1 failed, code is ${err.code}, message is ${err.message}`)
            }
            done()
          }
        })
      } catch (err) {
        console.info(`Sub_Notification_Ans_Subscriber_Subscribe_0400 failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_0400 END`)

    })


    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Unsubscribe_0200
     * @tc.number Sub_Notification_Ans_Subscriber_Unsubscribe_0200
     * @tc.desc   unsubscribe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_Unsubscribe_0200', Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Unsubscribe_0200 START`)
      let subscriber
      let count = 0
      let subscribeInfo = {
        events: ["event06"]
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, (err, commonEventSubscriber) => {
          if (err) {
            console.info(`Sub_Notification_Ans_Subscriber_Unsubscribe_0200 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`Sub_Notification_Ans_Subscriber_Unsubscribe_0200 success ${commonEventSubscriber}`)
            subscriber = commonEventSubscriber
            try {
              commonEventManager.subscribe(subscriber, (err, data) => {
                if (err) {
                  console.info(`subscribe_2 err, code is ${err.code}, message is ${err.message}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(`subscribe_2 success`)
                  count++
                  expect(count).assertEqual(1)
                  done()
                }
              })
            } catch (err) {
              console.info(`subscribe_2 failed, code is ${err.code}, message is ${err.message}`)
            }
            setTimeout(() => {
              try {
                commonEventManager.unsubscribe(subscriber, (err) => {
                  count = 0
                  if (err) {
                    console.info(`unsubscribe err, code is ${err.code}, message is ${err.message}`)
                    expect(false).assertTrue()
                    done()
                  } else {
                    console.info(`unsubscribe success`)
                    count++
                    expect(count).assertEqual(1)
                    done()
                  }
                })
              } catch (err) {
                console.info(`unsubscribe failed, code is ${err.code}, message is ${err.message}`)
                expect(false).assertTrue()
                done()
              }
            }, 1000)
            done()
          }
        })
      } catch (err) {
        console.info(`createSubscriber failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, (err, commonEventSubscriber) => {
          if (err) {
            console.info(`Sub_Notification_Ans_Subscriber_Unsubscribe_0200 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`Sub_Notification_Ans_Subscriber_Unsubscribe_0200 success ${commonEventSubscriber}`)
            subscriber = commonEventSubscriber
            try {
              commonEventManager.subscribe(subscriber, (err, data) => {
                count = 0
                if (err) {
                  console.info(`subscribe_2 err, code is ${err.code}, message is ${err.message}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(`subscribe_2 success`)
                  count++
                  expect(count).assertEqual(1)
                  done()
                }
              })
            } catch (err) {
              console.info(`subscribe_2 failed, code is ${err.code}, message is ${err.message}`)
            }
            setTimeout(() => {
              try {
                commonEventManager.unsubscribe(subscriber)
              } catch (err) {
                console.info(`unsubscribe failed, code is ${err.code}, message is ${err.message}`)
                expect(false).assertTrue()
                done()
              }
            }, 1000)
            done()
          }
        })
      } catch (err) {
        console.info(`createSubscriber failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Unsubscribe_0200 END`)

    })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_1700
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_1700
     * @tc.desc   verify the callback function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_1700', Level.LEVEL3, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1700 START`)

      let subscriber
      let count = 0 
      let subscribeInfo = {
        events: ["event07"]
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, async (err, commonEventSubscriber) => {
          if (err) {
            console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1700 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1700 success ${commonEventSubscriber}`)
            subscriber = commonEventSubscriber
            done()

            await subscriber.setCode(1, (err) => {
              if (err) {
                console.info(`setCode_1 err, error code: ${err.code}, message: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`setCode_1 success `)
                count++
                expect(count).assertEqual(1)
                subscriber.getCode((err, Code) => {
                  if (err) {
                    console.info(`getCode_1 err, error code: ${err.code}, message: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                  } else {
                    console.info(`getCode_1 success ${Code}`)
                    expect(Code).assertEqual(1)
                    done()
                  }
                })
              }
            })

            await subscriber.setData('data01', (err) => {
              count = 0
              if (err) {
                console.info(`setData_1 err, error code: ${err.code}, message: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`setData_1 success `)
                count++
                expect(count).assertEqual(1)
                done()
                subscriber.getData((err, data) => {
                  if (err) {
                    console.info(`getData_1 err, error code: ${err.code}, message: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                  } else {
                    console.info(`getData_1 success ${data}`)
                    expect(data).assertEqual('data01')
                    done()
                  }
                })
              }
            })

            await subscriber.setCodeAndData(2, 'data02', (err) => {
              count = 0
              if (err) {
                console.info(`setCodeAndData_1 err, error code: ${err.code}, message: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`setCodeAndData_1 success `)
                count++
                expect(count).assertEqual(1)
                done()
              }
            })

            await subscriber.getSubscribeInfo((err, CommonEventSubscribeInfo) => {
              if (err) {
                console.info(`getSubscribeInfo_1 err, error code: ${err.code}, message: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`getSubscribeInfo_1 success ${CommonEventSubscribeInfo}`)
                expect(CommonEventSubscribeInfo).assertContain("event07")
                done()
              }
            })

            await subscriber.finishCommonEvent((err) => {
              count = 0
              if (err) {
                console.info(`finishCommonEvent_1 err, error code: ${err.code}, message: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`finishCommonEvent_1 success `)
                count++
                expect(count).assertEqual(1)
                done()
              }
            })

          }
        })
      } catch (err) {
        console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1700 failed, catch error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1700 END`)

    })


    console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_TEST END`)

  })
}