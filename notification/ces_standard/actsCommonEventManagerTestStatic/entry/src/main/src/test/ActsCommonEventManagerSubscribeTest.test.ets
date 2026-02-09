/**
* Copyright (c) 2023-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '../../../hypium/index'
import commonEventManager from '@ohos.commonEventManager'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import {BusinessError} from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Component, Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'

let bundle_name:string = "com.example.actscommoneventmanagertest.static"
let domain: int = 0x0000;
let testAbilityContext:common.UIAbilityContext;
let count: int = 0;


export default function ActsCommonEventManagerSubscribeTest() {
  describe('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST', () => {
    let TAG:string = 'SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST ===>'
    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST START`)
    beforeAll(() => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundle_name )
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_Static_1900
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_Static_1900
     * @tc.desc   verify the callback function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_1900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_1900'
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_1900 START`)

      let subscriber:commonEventManager.CommonEventSubscriber | undefined;

      let subscribeInfo:commonEventManager.CommonEventSubscribeInfo = {
        events: ["event09"]
      }

      try {
        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_1900 come in `)

        commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber) => {
          console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_1900 createSubscriber come in `)
          if (err) {
            console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_1900 createSubscriber err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_1900 createSubscriber success ${commonEventSubscriber}`)
            if(commonEventSubscriber !== undefined && commonEventSubscriber !== null){
              subscriber = commonEventSubscriber
            }else{
              expect(false).assertTrue()
              done()
            }

            subscriber!.isStickyCommonEvent((err: BusinessError | null, isSticky:boolean|undefined) => {
              if (err) {
                console.info(TAG+`isStickyCommonEvent_9 err ${err}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(TAG+`isStickyCommonEvent_9 success ${isSticky}`)
                if(isSticky !== undefined){
                  expect(isSticky).assertFalse()
                }else{
                  expect(false).assertTrue()
                  done()
                }
              }
            })

            count = 0;
            subscriber!.isOrderedCommonEvent((err: BusinessError | null, isOrdered:boolean|undefined) => {
              if (err) {
                console.info(TAG+`isOrderedCommonEvent_9 err ${err}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(TAG+`isOrderedCommonEvent_9 success ${isOrdered}`)
                if(isOrdered !== undefined){
                  if (isOrdered == true) {
                    subscriber!.abortCommonEvent((err: BusinessError | null) => {
                      if (err) {
                        console.info(TAG+`abortCommonEvent_9 err ${err}`)
                        expect(false).assertTrue()
                        done()
                      } else {
                        console.info(TAG+`abortCommonEvent_9 success`)
                        expect(count).assertEqual(0);
                      }
                    })
                  }else {
                    expect(isOrdered).assertFalse()
                  }
                }else {
                    expect(false).assertTrue()
                    done()
                }
              }
            })

            subscriber!.getAbortCommonEvent((err: BusinessError | null, abortEvent:boolean|undefined) => {
              if (err) {
                console.info(TAG+`getAbortCommonEvent_9 err ${err}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(TAG+`getAbortCommonEvent_9 success ${abortEvent}`)
                expect(abortEvent).assertFalse()
              }
            })

            subscriber!.clearAbortCommonEvent((err: BusinessError | null) => {
              if (err) {
                console.info(TAG+`clearAbortCommonEvent_9 err ${err}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(TAG+`clearAbortCommonEvent_9 success`)
                expect(count).assertEqual(0);
              }
            })


            await subscriber!.finishCommonEvent().then(() => {
              console.info(TAG+`finishCommonEvent_2 success `)
              expect(count).assertEqual(0);
              done()
            }).catch((err:Error):void => {
              console.info(TAG+`finishCommonEvent_2 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            })
          }
        })
      } catch (err) {
        console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_1900 failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_1900 END`)
    })


    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_Static_2000
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_Static_2000
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_2000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_2000'
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_2000 START`)

      let subscriber:commonEventManager.CommonEventSubscriber | undefined;

      let subscribeInfo:commonEventManager.CommonEventSubscribeInfo = {
        events: ["event10"]
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber) => {
          if (err) {
            console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_2000 createSubscriber err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_2000 createSubscriber success ${commonEventSubscriber}`)
            if(commonEventSubscriber !== undefined && commonEventSubscriber !== null){
              subscriber = commonEventSubscriber
            }else{
              expect(false).assertTrue()
              done()
            }

            await subscriber!.isStickyCommonEvent().then((isSticky:boolean) => {
              console.info(TAG+`isStickyCommonEvent_10 success ${isSticky}`)
              expect(isSticky).assertFalse()
            }).catch((err: Error):void => {
              console.info(TAG+`isStickyCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            let isSticky = subscriber!.isStickyCommonEventSync();
            expect(isSticky).assertFalse()

            await subscriber!.isOrderedCommonEvent().then((isOrdered:boolean) => {
              console.info(TAG+`isOrderedCommonEvent_10 success ${isOrdered}`)
              expect(isOrdered).assertFalse()
            }).catch((err: Error):void => {
              console.info(TAG+`isOrderedCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            let isorder = subscriber!.isOrderedCommonEventSync();
            expect(isorder).assertFalse()
            console.info(`isOrderedCommonEventSync, isorder is ${isorder}`)

            await subscriber!.abortCommonEvent().then(() => {
              console.info(TAG+`abortCommonEvent_10 success`)
            }).catch((err: Error):void => {
              console.info(TAG+`abortCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber!.getAbortCommonEvent().then((abortEvent:boolean) => {
              console.info(TAG+`getAbortCommonEvent_10 success ${abortEvent}`)
              expect(abortEvent).assertFalse()
            }).catch((err: Error):void => {
              console.info(TAG+`getAbortCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            let isaborted = subscriber!.getAbortCommonEventSync();
            expect(isaborted).assertFalse()

            count = 0;
            await subscriber!.clearAbortCommonEvent().then(() => {
              console.info(TAG+`clearAbortCommonEvent_10 success`)
              count++;
              expect(count).assertEqual(1);
            }).catch((err: Error):void => {
              console.info(TAG+`clearAbortCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            count = 0;
            await subscriber!.finishCommonEvent().then(() => {
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
      } catch (err) {
        console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_2000 failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_2000 END`)
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1100
     * @tc.number SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1100
     * @tc.desc   verify the callback function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1100'
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_Static_1100 START`)

      let options:commonEventManager.CommonEventPublishData = {
        code: 0,
        data: "initial data",
        isOrdered: true,
        isSticky: false,
      }

      let subscribeInfo:commonEventManager.CommonEventSubscribeInfo = {
        events: ["eventname"],
        priority:100
      };

      let subscriber:commonEventManager.CommonEventSubscriber | undefined;
      let tmpsubscriber = commonEventManager.createSubscriberSync(subscribeInfo)
      if (tmpsubscriber !== null){
        subscriber = tmpsubscriber
      }else{
        console.info(TAG+`tmpsubscriber is null`)
        expect(false).assertTrue()
        done()
      }
      commonEventManager.subscribe(subscriber!, (err: BusinessError | null, data: commonEventManager.CommonEventData|undefined)=> {
        if (err) {
          expect(false).assertTrue()
          done()
        } else {
          subscriber!.isOrderedCommonEvent((err: BusinessError | null, isOrdered:boolean|undefined) => {
            if (err) {
              console.info(TAG+`isOrderedCommonEvent_11 err ${err}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(TAG+`isOrderedCommonEvent_11 success ${isOrdered}`)
              if(isOrdered !== undefined){
                expect(isOrdered).assertTrue()
              }else {
                expect(false).assertTrue()
                done()
              }
            }
          })

          subscriber!.isStickyCommonEvent((err: BusinessError | null, isSticky:boolean|undefined) => {
              if (err) {
                console.info(TAG+`isStickyCommonEvent_9 err ${err}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(TAG+`isStickyCommonEvent_9 success ${isSticky}`)
                if(isSticky !== undefined){
                  expect(isSticky).assertFalse()
                }else{
                  expect(false).assertTrue()
                  done()
                }
              }
            })


          let code1 = subscriber!.getCodeSync();
          expect(code1).assertEqual(0);
          console.info(TAG+`getCodeSync before setCodeSync, code is ${code1}`)

          subscriber!.setCodeSync(1);
          let code2 = subscriber!.getCodeSync();
          console.info(TAG+`getCodeSync after setCodeSync, code is ${code2}`)
          expect(code2).assertEqual(1);

          let data = subscriber!.getDataSync();
          expect(data).assertEqual("initial data");
          console.info(TAG+`getDataSync before setDataSync, data is ${data}`)

          subscriber!.setDataSync("data change");
          let data2 = subscriber!.getDataSync();
          expect(data2).assertEqual("data change");
          console.info(TAG+`getDataSync after setDataSync, data is ${data2}`)

          subscriber!.setCodeAndDataSync(2, "setCodeAndDataSync")
          let code3 = subscriber!.getCodeSync()
          expect(code3).assertEqual(2);
          console.info(TAG+`getCodeSync after setCodeAndDataSync, code is ${code3}`)

          let data3 = subscriber!.getDataSync();
          expect(data3).assertEqual("setCodeAndDataSync");
          console.info(TAG+`getDataSync after setCodeAndDataSync, data is ${data3}`)

          let isorder = subscriber!.isOrderedCommonEventSync();
          expect(isorder).assertEqual(true)
          console.info(TAG+`isOrderedCommonEventSync, isorder is ${isorder}`)


          let isSticky = subscriber!.isStickyCommonEventSync();
          expect(isSticky).assertEqual(false)
          console.info(TAG+`isStickyCommonEventSync, isStickyCommonEventSync is ${isSticky}`)

          subscriber!.abortCommonEventSync();
          let isaborted = subscriber!.getAbortCommonEventSync();
          expect(isaborted).assertEqual(true)

          subscriber!.getAbortCommonEvent((err: BusinessError | null, abortEvent:boolean|undefined) => {
            if (err) {
              console.info(TAG+`getAbortCommonEvent_11 err ${err}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(TAG+`getAbortCommonEvent_11 success ${abortEvent}`)
              expect(abortEvent).assertTrue()
            }
          })

          await Utils.msSleep(1000)
          count = 0;
          console.info(TAG+`getAbortCommonEventSync isaborted ${isaborted}`)
          subscriber!.clearAbortCommonEventSync()
          subscriber!.finishCommonEvent((err: BusinessError | null) => {
            if (err) {
              console.info(TAG+`finishCommonEvent_11 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(TAG+`finishCommonEvent_11 success `)
              count++;
              expect(count).assertEqual(1);
              done()
            }
          })
        }
      })

      try {
        setTimeout(()=>{
          commonEventManager.publish("eventname", options, (err: BusinessError | null)=> {
            if (err) {
              console.error(TAG+`publish failed, code is ${err.code}, message is ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(TAG+`publish success`)
            }
          });
        }, 1000);
      } catch (err) {
        console.error(TAG+`publish failed, code is ${err.code}, message is ${err.message}`)
      }
    })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1200
     * @tc.number SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1200
     * @tc.desc   verify the callback function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1200'
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1200 START`)

      let options:commonEventManager.CommonEventPublishData = {
        code: 0,
        data: "initial data",
        isOrdered: true,
        isSticky: false
      }

      let subscribeInfo:commonEventManager.CommonEventSubscribeInfo = {
        events: ["eventname2"],
        priority: 100
      };

      let subscriber:commonEventManager.CommonEventSubscriber | undefined;
      let tmpsubscriber = commonEventManager.createSubscriberSync(subscribeInfo)
      if (tmpsubscriber !== null){
        subscriber = tmpsubscriber
      }else{
        console.info(TAG+`tmpsubscriber is null`)
        expect(false).assertTrue()
        done()
      }
      commonEventManager.subscribe(subscriber!, (err: BusinessError | null, data: commonEventManager.CommonEventData|undefined)=> {
        if (err) {
          console.error(TAG+`subscribe failed, code is ${err.code}, message is ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          await subscriber!.isOrderedCommonEvent().then((isOrdered) => {
            console.info(TAG+`isOrderedCommonEvent_12 success ${isOrdered}`)
            expect(isOrdered).assertTrue()
          }).catch((err) => {
            console.info(TAG+`isOrderedCommonEvent_12 err ${err}`)
            expect(false).assertTrue()
            done()
          })

          await subscriber!.isStickyCommonEvent().then((isSticky) => {
            console.info(TAG+`isStickyCommonEvent_12 success ${isSticky}`)
            expect(isSticky).assertFalse()
          }).catch((err) => {
            console.info(TAG+`isStickyCommonEvent_12 err ${err}`)
            expect(false).assertTrue()
            done()
          })

          subscriber!.abortCommonEventSync();
          await subscriber!.getAbortCommonEvent().then((abortEvent) => {
            console.info(TAG+`getAbortCommonEvent_12 success ${abortEvent}`)
            expect(abortEvent).assertTrue()
          }).catch((err) => {
            console.info(TAG+`getAbortCommonEvent_12 err ${err}`)
            expect(false).assertTrue()
            done()
          })
          subscriber!.clearAbortCommonEventSync()

          let info = subscriber!.getSubscribeInfoSync();
          if(info !== null){
            let msubscribeInfo:commonEventManager.CommonEventSubscribeInfo = info
            expect(msubscribeInfo.priority).assertEqual(100)
            expect(msubscribeInfo.userId).assertEqual(-3)
            done()
          }else {
            console.info(TAG+`msubscribeInfo is null`)
            expect(false).assertTrue()
            done()
          }

          count = 0;
          await subscriber!.finishCommonEvent().then(() => {
            console.info(TAG+`finishCommonEvent_12 success `)
              count++;
              expect(count).assertEqual(1);
            done()
          }).catch((err: Error) => {
            console.info(TAG+ `finishCommonEvent_12 err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          })
        }
      })

      let publishCB=(err: BusinessError|null)=> {
        if (err) {
          console.error(TAG+`publish failed, code is ${err.code}, message is ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG+`publish success`)
        }
      }

      try {
        setTimeout(()=>{
          commonEventManager.publish("eventname2", options, publishCB);
        }, 1000);
      } catch (err) {
        console.error(TAG+`publish failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1200 END`)
    })

    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST END`)
  })
}

