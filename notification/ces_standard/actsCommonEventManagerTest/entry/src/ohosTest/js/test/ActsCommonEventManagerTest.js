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

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_4700
     * @tc.name: publish(event: string, callback: AsyncCallback<void>): void
     * @tc.desc: verify the callback function of publish
     */
    it('Sub_Notification_Ans_Publish_Publish_4700', Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4700 START`)
      try {
        commonEventManager.publish("EVENT01", (err) => {
          if (err) {
            console.info(`Sub_Notification_Ans_Publish_Publish_4700 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info("Sub_Notification_Ans_Publish_Publish_4700 success")
            expect(true).assertTrue()
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

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_4800
     * @tc.name: publish(event: string, options: CommonEventPublishData, callback: AsyncCallback<void>): void
     * @tc.desc: publish options
     */
    it('Sub_Notification_Ans_Publish_Publish_4800', Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Publish_Publish_4800 START`)
      let options = {
        code: 0,
        data: "initial data",
        isOrdered: true
      }

      try {
        commonEventManager.publish("EVENT02", options, (err) => {
          if (err) {
            console.info(`Sub_Notification_Ans_Publish_Publish_4800 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info("Sub_Notification_Ans_Publish_Publish_4800 success")
            expect(true).assertTrue()
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

    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_1500
     * @tc.name: createSubscriber(subscribeInfo: CommonEventSubscribeInfo, callback: AsyncCallback<CommonEventSubscriber>): void
     * @tc.desc: createSubscriber
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_1500', Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1500 START`)

      let subscriber

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
            expect(true).assertTrue()
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

    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_1600
     * @tc.name: createSubscriber(subscribeInfo: CommonEventSubscribeInfo): Promise<CommonEventSubscriber>
     * @tc.desc: createSubscriber
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_1600', Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1600 START`)

      let subscriber

      let subscribeInfo = {
        events: ["event04"]
      }

      await commonEventManager.createSubscriber(subscribeInfo).then((commonEventSubscriber) => {
        console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1600 success ${commonEventSubscriber}`)
        subscriber = commonEventSubscriber
        expect(true).assertTrue()
        done()
      }).catch((err) => {
        console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1600 err, error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1600 END`)

    })

    /*
    * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_0400
    * @tc.name: subscribe(subscriber: CommonEventSubscriber, callback: AsyncCallback<CommonEventData>): void
    * @tc.desc: subscribe
    */
    it('Sub_Notification_Ans_Subscriber_Subscribe_0400', Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_0400 START`)

      let subscriber

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
                  console.info(`subscribe_1 success`)
                  expect(true).assertTrue()
                  done()
                }
              })
            } catch (err) {
              console.info(`subscribe_1 failed, code is ${err.code}, message is ${err.message}`)
            }
            expect(true).assertTrue()
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

    it('Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401', Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_0400 START`)

      let subscriber

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
                expect(true).assertTrue()
                done()
              }).then(() => {
                console.info(`subscribe_1 success`)
                expect(true).assertTrue()
                done()
              }).catch((err) => {
                console.error(`subscribe_1 err, code is ${err.code}, message is ${err.message}`)
                expect(false).assertTrue()
                done()
              })
            } catch (err) {
              console.error(`subscribe_1 failed, code is ${err.code}, message is ${err.message}`)
            }
            expect(true).assertTrue()
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


    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Unsubscribe_0200
     * @tc.name: unsubscribe(subscriber: CommonEventSubscriber, callback?: AsyncCallback<void>): void
     * @tc.desc: unsubscribe
     */
    it('Sub_Notification_Ans_Subscriber_Unsubscribe_0200', Level.LEVEL0, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Unsubscribe_0200 START`)
      let subscriber

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
                  expect(true).assertTrue()
                  done()
                }
              })
            } catch (err) {
              console.info(`subscribe_2 failed, code is ${err.code}, message is ${err.message}`)
            }
            setTimeout(() => {
              try {
                commonEventManager.unsubscribe(subscriber, (err) => {
                  if (err) {
                    console.info(`unsubscribe err, code is ${err.code}, message is ${err.message}`)
                    expect(false).assertTrue()
                    done()
                  } else {
                    console.info(`unsubscribe success`)
                    expect(true).assertTrue()
                    done()
                  }
                })
              } catch (err) {
                console.info(`unsubscribe failed, code is ${err.code}, message is ${err.message}`)
                expect(false).assertTrue()
                done()
              }
            }, 1000)
            expect(true).assertTrue()
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
                if (err) {
                  console.info(`subscribe_2 err, code is ${err.code}, message is ${err.message}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(`subscribe_2 success`)
                  expect(true).assertTrue()
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
            expect(true).assertTrue()
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

    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_1700
     * @tc.name: getCode setCode setData getData setCodeAndData getSubscribeInfo finishCommonEvent
     * @tc.desc: verify the callback function
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_1700', Level.LEVEL3, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1700 START`)

      let subscriber

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
            expect(true).assertTrue()
            done()

            await subscriber.setCode(1, (err) => {
              if (err) {
                console.info(`setCode_1 err, error code: ${err.code}, message: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`setCode_1 success `)
                expect(true).assertTrue()
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
              if (err) {
                console.info(`setData_1 err, error code: ${err.code}, message: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`setData_1 success `)
                expect(true).assertTrue()
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
              if (err) {
                console.info(`setCodeAndData_1 err, error code: ${err.code}, message: ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(`setCodeAndData_1 success `)
                expect(true).assertTrue()
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
                expect(true).assertTrue()
                done()
              }
            })

            await subscriber.finishCommonEvent((err) => {
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
        console.info(`Sub_Notification_Ans_Subscriber_Subscribe_1700 failed, catch error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1700 END`)

    })

    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_1800
     * @tc.name: getCode setCode setData getData setCodeAndData getSubscribeInfo finishCommonEvent
     * @tc.desc: verify the promise function
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_1800', Level.LEVEL3, async function (done) {
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1800 START`)

      let subscriber

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
            expect(true).assertTrue()
            done()

            await subscriber.setCode(3).then(() => {
              console.info(`setCode_2 success `)
              expect(true).assertTrue()
              done()
            }).catch((err) => {
              console.info(`setCode_2 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.getCode().then((Code) => {
              console.info(`getCode_2 success ${Code}`)
              expect(Code).assertEqual(3)
              done()
            }).catch((err) => {
              console.info(`getCode_2 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.setData('data03').then(() => {
              console.info(`setData_2 success `)
              expect(true).assertTrue()
              done()
              subscriber.getData().then((data) => {
                console.info(`getData_2 success ${data}`)
                expect(data).assertEqual('data03')
                done()
              }).catch((err) => {
                console.info(`getData_2 err, error code: ${err.code}, message: ${err.message}`)
                expect(false).assertTrue()
                done()
              })
            }).catch((err) => {
              console.info(`setData_2 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.setCodeAndData(4, 'data04').then(() => {
              console.info(`setCodeAndData_2 success `)
              expect(true).assertTrue()
              done()
            }).catch((err) => {
              console.info(`setCodeAndData_2 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.getSubscribeInfo().then((CommonEventSubscribeInfo) => {
              console.info(`getSubscribeInfo_2 success ${CommonEventSubscribeInfo}`)
              expect(true).assertTrue()
              done()
            }).catch((err) => {
              console.info(`getSubscribeInfo_2 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.finishCommonEvent().then(() => {
              console.info(`finishCommonEvent_2 success `)
              expect(true).assertTrue()
              done()
            }).catch((err) => {
              console.info(`finishCommonEvent_2 err, error code: ${err.code}, message: ${err.message}`)
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
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_1800 END`)
    })

    console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_TEST END`)

  })
}