/**
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
import commonEventManager from '@ohos.commonEventManager'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import common from '@ohos.app.ability.common';
import {BusinessError, RecordData} from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Component, Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'

let bundle_name:string = "com.example.actscommoneventmanagertest.static"
let domain: int = 0x0000;
let testAbilityContext:common.UIAbilityContext;
let count: int = 0;

let subscriber: commonEventManager.CommonEventSubscriber

export default function ActsCommonEventManagerTest() {
  describe('SUB_NOTIFICATION_CES_MANAGER_TEST', () => {
    let TAG:string = 'SUB_NOTIFICATION_CES_MANAGER_TEST ===>'
    console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_TEST START`)
    beforeAll(() => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_4700
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_4700
     * @tc.desc   verify the callback function of publish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_4700'
      count = 0;
      try{
        hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_Static_4700 START`)
        hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_Static_4700 setTimeout come in `);
        commonEventManager.publish('EVENT01', (err: BusinessError | null) => {
          if (err) {
            hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_Static_4700 err, %{public}s`, JSON.stringify(err));
            expect(false).assertTrue()
            done()
          } else {
            hilog.info(domain, TAG, 'Sub_Notification_Ans_Publish_Publish_Static_4700 success');
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
        await Utils.msSleep(2000);
      } catch (err) {
        hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_Static_4700 failed, %{public}s`, JSON.stringify(err));
        expect(false).assertTrue()
        done()
      }
      hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_Static_4700 END`);
    })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_4800
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_4800
     * @tc.desc   publish options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_4800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Publish_Publish_Static_4800'
      count = 0;
      hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_Static_4800 START`)
      let options: commonEventManager.CommonEventPublishData = {
        code: 0,
        data: "initial data",
        isOrdered: true,
        parameters: {
          "mykey":"event"
        }as Record<string, RecordData>
      }
      try {
        commonEventManager.publish("EVENT02", options, (err: BusinessError | null) => {
          if (err) {
            hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_Static_4800 err, %{public}s`, JSON.stringify(err));
            expect(false).assertTrue()
            done()
          } else {
            hilog.info(domain, TAG, "Sub_Notification_Ans_Publish_Publish_Static_4800 success");
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
        await Utils.msSleep(2000)
      } catch (err) {
        hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_Static_4800 failed,  %{public}s`, JSON.stringify(err));
        expect(false).assertTrue()
        done()
      }
      hilog.info(domain, TAG, `Sub_Notification_Ans_Publish_Publish_Static_4800 END`);
    })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_Static_1500
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_Static_1500
     * @tc.desc   createSubscriber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_1500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_1500'
      await Utils.msSleep(1000);
      count = 0;
      hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_Static_1500 START`)
      let subscriber: commonEventManager.CommonEventSubscriber
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: new Array<string>('event03')
      }
      try {
        commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber) => {
          if (err) {
            hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_Static_1500 err,`)
            expect(false).assertTrue()
            done()
          } else {
            hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_Static_1500 success `)
            if(commonEventSubscriber !== undefined && commonEventSubscriber !== null){
              subscriber = commonEventSubscriber
            }else{
              expect(false).assertTrue()
              done()
            }
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_Static_1500 failed, `, JSON.stringify(err))
        expect(false).assertTrue()
        done()
      }
      hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_Static_1500 END`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_Static_1600
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_Static_1600
     * @tc.desc   createSubscriber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_1600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_1600'
      await Utils.msSleep(1000);
      count = 0;
      hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_Static_1600 START`)
      let subscriber: commonEventManager.CommonEventSubscriber|undefined
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: new Array<string>('event04')
      }
      await commonEventManager.createSubscriber(subscribeInfo).then((subscriber): void => {
        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_Static_1600 success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err) => {
        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_Static_1600 err, `)
        expect(false).assertTrue()
        done()
      })
      hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Subscribe_Static_1600 END`)
    })

    /**	 
      * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_Static_0400	 
      * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_Static_0400	 
      * @tc.desc   subscribe	 
      * @tc.type   FUNCTION	 
      * @tc.size   MEDIUMTEST 
      * @tc.level  LEVEL0 
      */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_0400'
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_0400 START`)
      await Utils.msSleep(1000);
      count = 0;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["event05"]
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber) => {
          if (err) {
            console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_0400 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_0400 success `+commonEventSubscriber)
            if(commonEventSubscriber !== undefined && commonEventSubscriber !== null){
              subscriber = commonEventSubscriber
            }else{
              expect(false).assertTrue()
              done()
            }

            try {
              console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_0400 subscribe comein`)
              commonEventManager.subscribe(subscriber, (err: BusinessError | null,data:commonEventManager.CommonEventData|undefined) => {
                if (err) {
                  console.info(TAG+`subscribe_1 err, code is ${err.code}, message is ${err.message}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(TAG+`subscribe_1 success`)
                  expect(count).assertEqual(0);
                  done()
                }
              })
            } catch (err:BusinessError) {
              console.info(TAG+`subscribe_1 failed, code is ${err.code}, message is ${err.message}`)
              expect(false).assertTrue()
            }
            done()
          }
        })
      } catch (err:BusinessError) {
        console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_0400 failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_0400 END`)

    })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401
     * @tc.number Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401
     * @tc.desc   subscribe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401'
      await Utils.msSleep(1000);
      count = 0;
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401 START`)

      let subscriber: commonEventManager.CommonEventSubscriber

      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: new Array<string>('event05')
      }

      try {
          commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber) => {
          if (err) {
            console.error(`Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401 success ${commonEventSubscriber}`)
            if(commonEventSubscriber !== undefined && commonEventSubscriber !== null){
              subscriber = commonEventSubscriber;
              try {
                commonEventManager.subscribeToEvent(subscriber, (data:commonEventManager.CommonEventData) => {
                  console.info(`Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401 subscribe_1 OnReceive event success`)
                  expect(data !== null).assertTrue()
                  done()
                }).then(() => {
                  console.info(`Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401 subscribe_1 success`)
                  done()
                }).catch((err) => {
                  console.error(`Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401 subscribe_1 err, code is ${err.code}, message is ${err.message}`)
                  expect(false).assertTrue()
                  done()
                })
              } catch (error) {
                let err: BusinessError = error as BusinessError;
                hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401 unsubscribe failed, code is ${err.code}, message is ${err.message}`)
                expect(false).assertTrue()
                done()
              }
            }else{
              expect(false).assertTrue()
              done()
            }
          }
        })
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401 unsubscribe failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_SubscribeToEvent_0401 END`)

    })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200
     * @tc.number Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200
     * @tc.desc   unsubscribe
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200'
      await Utils.msSleep(1000);
      count = 0;
      hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 START`)
      let options:commonEventManager.CommonEventPublishData = {
        code: 0,
        data: "initial data",
        isOrdered: true,
        isSticky: false,
      }

      let subscriber: commonEventManager.CommonEventSubscriber

      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: new Array<string>('event06')
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber) => {
          if (err) {
            hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 success1`)
            if(commonEventSubscriber !== undefined  && commonEventSubscriber !== null){
              subscriber = commonEventSubscriber
            }else{
              expect(false).assertTrue()
              done()
            }
            await Utils.msSleep(2000);
            try {
              commonEventManager.subscribe(subscriber, (err: BusinessError | null,data:commonEventManager.CommonEventData|undefined) => {
                if (err) {
                  hilog.info(domain, TAG,`Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 subscribe err, code is ${err.code}, message is ${err.message}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  hilog.info(domain, TAG,`Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 subscribe success`)
                  count++;
                  expect(count).assertEqual(1);
                  done()
                }
              })
            } catch (error) {
              let err: BusinessError = error as BusinessError;
              hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 subscribe failed, code is ${err.code}, message is ${err.message}`)
            }

            count = 0;
            try {
              commonEventManager.unsubscribe(subscriber, (err: BusinessError | null) => {
                if (err) {
                  hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 unsubscribe err, code is ${err.code}, message is ${err.message}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 unsubscribe success`)
                  count++;
                  expect(count).assertEqual(1);
                  done()
                }
              })
            } catch (error) {
              let err: BusinessError = error as BusinessError;
              hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 unsubscribe failed, code is ${err.code}, message is ${err.message}`)
              expect(false).assertTrue()
              done()
            }
          }
        })
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 createSubscriber failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      count = 0;
      try {
        commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber) => {
          if (err) {
            hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 success2 ${commonEventSubscriber}`)
            if(commonEventSubscriber !== undefined  && commonEventSubscriber !== null){
              subscriber = commonEventSubscriber
            }else{
              expect(false).assertTrue()
              done()
            }
            await Utils.msSleep(1000);
            try {
              commonEventManager.subscribe(subscriber, (err: BusinessError | null,CommonEventData:commonEventManager.CommonEventData|undefined) => {
                if (err) {
                  hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 subscribe_2 err, `+JSON.stringify(err))
                  expect(false).assertTrue()
                  done()
                } else {
                  hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 subscribe_2 success`)
                  count++;
                  expect(count).assertEqual(1);

                  try {
                    commonEventManager.unsubscribe(subscriber,(err: BusinessError | null) => {
                      if (err) {
                        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 unsubscribe_2 err, code is ${err.code}, message is ${err.message}`)
                        expect(false).assertTrue()
                        done()
                      } else {
                        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 unsubscribe_2 success`)
                        count++;
                        expect(count).assertEqual(2);
                        await Utils.msSleep(1000);
                        done()
                      }
                    })
                  } catch (error) {
                    let err: BusinessError = error as BusinessError;
                    hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 unsubscribe failed, code is ${err.code}, message is ${err.message}`)
                    expect(false).assertTrue()
                    done()
                  }
                }
              })
            } catch (error) {
              let err: BusinessError = error as BusinessError;
              hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_0200 subscribe_2 failed, code is ${err.code}, message is ${err.message}`)
            }
          }
        })

        setTimeout(()=>{
          commonEventManager.publish("event06", options, (err: BusinessError | null)=> {
            if (err) {
              console.error(TAG+`publish failed, code is ${err.code}, message is ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(TAG+`publish success`)
            }
          });
        }, 1000);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 createSubscriber failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      hilog.info(domain, TAG, `Sub_Notification_Ans_Subscriber_Unsubscribe_Static_0200 END`)

    })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_Static_1700
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_Static_1700
     * @tc.desc   verify the callback function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_1700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_1700'
      await Utils.msSleep(1000)
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_1700 START`)
      let options:commonEventManager.CommonEventPublishData = {
        code: 0,
        data: "initial data",
        isOrdered: true,
        isSticky: false,
      }

      let subscriber: commonEventManager.CommonEventSubscriber

      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["event07"]
      }
      try {
        commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber) => {
          if (err) {
            console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_1700 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_1700 success`)
            if(commonEventSubscriber !== undefined && commonEventSubscriber !== null){
              subscriber = commonEventSubscriber
            }else{
              expect(false).assertTrue()
              done()
            }

            commonEventManager.subscribe(subscriber, (err: BusinessError | null, data: commonEventManager.CommonEventData|undefined)=> {
              if (err) {
                expect(false).assertTrue()
                done()
              } else {
                await Utils.msSleep(500)
                console.info(TAG+`666: ` + count)
                subscriber.setCode(1, (err: BusinessError | null) => {
                  if (err) {
                    console.info(TAG+`setCode_1 err, error code: ${err.code}, message: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                  } else {
                    console.info(TAG+`setCode_1 success: `)
                    subscriber.getCode((err: BusinessError | null, Code:int|undefined) => {
                      if (err) {
                        console.info(TAG+`getCode_1 err, error code: ${err.code}, message: ${err.message}`)
                        expect(false).assertTrue()
                        done()
                      } else {
                        console.info(TAG+`getCode_1 success ${Code}`)
                        expect(Code).assertEqual(1)
                      }
                    })
                  }
                })
                await Utils.msSleep(1000)
                subscriber.setData('data01', (err: BusinessError | null) => {
                  if (err) {
                    console.info(TAG+`setData_1 err, error code: ${err.code}, message: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                  } else {
                    console.info(TAG+`setData_1 success `)
                    subscriber.getData((err: BusinessError | null, data:string|undefined) => {
                      if (err) {
                        console.info(TAG+`getData_1 err, error code: ${err.code}, message: ${err.message}`)
                        expect(false).assertTrue()
                        done()
                      } else {
                        console.info(TAG+`getData_1 success ${data}`)
                        expect(data).assertEqual('data01')
                      }
                    })
                  }
                })
                await Utils.msSleep(500)
                count = 0;
                subscriber.setCodeAndData(1, 'data01', (err: BusinessError | null) => {
                  if (err) {
                    console.info(TAG+`setCodeAndData_1 err, error code: ${err.code}, message: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                  } else {
                    console.info(TAG+`setCodeAndData_1 success `)
                    count++;
                    expect(count).assertEqual(1);
                  }
                })
                await Utils.msSleep(500)
                count = 0;
                subscriber.getSubscribeInfo((err: BusinessError | null, CommonEventSubscribeInfo) => {
                  if (err) {
                    console.info(TAG+`getSubscribeInfo_1 err, error code: ${err.code}, message: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                  } else {
                    console.info(TAG+`getSubscribeInfo_1 success`)
                    count++;
                    expect(count).assertEqual(1);
                  }
                })

                await Utils.msSleep(500)
                count = 0;
                subscriber.clearAbortCommonEvent((err: BusinessError | null) => {
                  if (err) {
                    console.info(TAG+`clearAbortCommonEvent_1 err ${err}`)
                    expect(false).assertTrue()
                    done()
                  } else {
                    console.info(TAG+`clearAbortCommonEvent_1 success`)
                    count++;
                    expect(count).assertEqual(1);
                  }
                })
                await Utils.msSleep(500)
                count = 0;
                subscriber.finishCommonEvent((err: BusinessError | null) => {
                  if (err) {
                    console.info(TAG+`finishCommonEvent_1 err, error code: ${err.code}, message: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                  } else {
                    console.info(TAG+`finishCommonEvent_1 success `)
                    count++;
                    expect(count).assertEqual(1);
                    await Utils.msSleep(200)
                    done()
                  }
                })
              }
            })
          }
        })

        setTimeout(()=>{
          commonEventManager.publish("event07", options, (err: BusinessError | null)=> {
            if (err) {
              console.error(TAG+`publish failed, code is ${err.code}, message is ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(TAG+`publish success`)
            }
          });
        }, 1000);

      } catch (err:BusinessError) {
        console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_1700 failed, catch error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_1700 END`)

    })

    
    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_Static_1800
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_Static_1800
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_1800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_1800'
      await Utils.msSleep(3000)
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_1800 START`)
      let options:commonEventManager.CommonEventPublishData = {
        code: 0,
        data: "initial data",
        isOrdered: true,
        isSticky: false,
      }

      let subscriber: commonEventManager.CommonEventSubscriber

      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ["event08"]
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber) => {
          if (err) {
            console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_1800 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_1800 success ${commonEventSubscriber}`)
            if(commonEventSubscriber !== undefined  && commonEventSubscriber !== null){
              subscriber = commonEventSubscriber
            }else{
              expect(false).assertTrue()
              done()
            }
            count = 0;
            commonEventManager.subscribe(subscriber, (err: BusinessError | null, data: commonEventManager.CommonEventData|undefined)=> {
              if (err) {
                expect(false).assertTrue()
                done()
              } else {
                await subscriber.setCode(3).then(() => {
                  console.info(TAG+`setCode_2 success `)
                  count++;
                  expect(count).assertEqual(1);
                }).catch((err:Error):void => {
                  console.info(TAG+`setCode_2 err, error code: ${err.code}, message: ${err.message}`)
                  expect(false).assertTrue()
                  done()
                })

                await subscriber.getCode().then((Code:int) => {
                  console.info(TAG+`getCode_2 success ${Code}`)
                  expect(Code).assertEqual(3)
                }).catch((err:Error):void => {
                  console.info(TAG+`getCode_2 err, error code: ${err.code}, message: ${err.message}`)
                  expect(false).assertTrue()
                  done()
                })
                count = 0;

                await subscriber.setData('data03').then(() => {
                  console.info(TAG+`setData_2 success `)
                  count++;
                  expect(count).assertEqual(1);
                  subscriber.getData().then((data:string) => {
                    console.info(TAG+`getData_2 success ${data}`)
                    expect(data).assertEqual('data03')
                  }).catch((err:Error):void => {
                    console.info(TAG+`getData_2 err, error code: ${err.code}, message: ${err.message}`)
                    expect(false).assertTrue()
                    done()
                  })
                }).catch((err:Error):void => {
                  console.info(TAG+`setData_2 err, error code: ${err.code}, message: ${err.message}`)
                  expect(false).assertTrue()
                  done()
                })
                count = 0;

                await subscriber.setCodeAndData(4, 'data04').then(() => {
                  console.info(TAG+`setCodeAndData_2 success `)
                  count++;
                  expect(count).assertEqual(1);
                }).catch((err:Error):void => {
                  console.info(TAG+`setCodeAndData_2 err, error code: ${err.code}, message: ${err.message}`)
                  expect(false).assertTrue()
                  done()
                })
                count = 0;

                await subscriber.getSubscribeInfo().then((CommonEventSubscribeInfo) => {
                  console.info(TAG+`getSubscribeInfo_2 success `)
                  count++;
                  expect(count).assertEqual(1);
                }).catch((err:Error):void => {
                  console.info(TAG+`getSubscribeInfo_2 err, error code: ${err.code}, message: ${err.message}`)
                  expect(false).assertTrue()
                  done()
                })
                count = 0;

                await subscriber.finishCommonEvent().then(() => {
                  console.info(TAG+`finishCommonEvent_2 success `)
                  count++;
                  expect(count).assertEqual(1);
                  done()
                }).catch((err:Error):void => {
                  console.info(TAG+`finishCommonEvent_2 err, error code: ${err.code}, message: ${err.message}`)
                  expect(false).assertTrue()
                  done()
                })
              }
            })
          }
        })

        setTimeout(()=>{
          commonEventManager.publish("event08", options, (err: BusinessError | null)=> {
            if (err) {
              console.error(TAG+`publish failed, code is ${err.code}, message is ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(TAG+`publish success`)
            }
          });
        }, 1000);
      } catch (err:BusinessError) {
        console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_1800 failed, catch error code: ${err.code}, message: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_1800 END`)
    })


    console.info(`${TAG} SUB_NOTIFICATION_CES_MANAGER_TEST END`)

  })
}