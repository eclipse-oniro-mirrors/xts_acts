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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '../../../hypium/index'
import commonEventManager from '@ohos.commonEventManager'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import {BusinessError} from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Component, Driver, ON } from '@ohos.UiTest'
let bundle_name:string = "com.example.actscommoneventmanagertest.static"
let domain: number = 0x0000;
let testAbilityContext:common.UIAbilityContext;


export default function ActsCommonEventManagerSubscribeTest() {
  describe('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST', () => {
    let TAG:string = 'SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST ===>'
    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST START`)
    beforeAll(() => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate end');

        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          hilog.info(domain, TAG, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, TAG, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundle_name )
      await Utils.msSleep(2000)
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
    })

  
    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_Static_1900
     * @tc.name: Sub_Notification_Ans_Subscriber_Subscribe_Static_1900
     * @tc.desc: verify the callback function
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_1900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_1900'
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_1900 START`)

      let subscriber:commonEventManager.CommonEventSubscriber

      let subscribeInfo:commonEventManager.CommonEventSubscribeInfo = {
        events: ["event09"]
      }

      try {
        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_1900 come in `)

        commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber: commonEventManager.CommonEventSubscriber|undefined) => {
          console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_1900 createSubscriber come in `)
          if (err) {
            console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_1900 createSubscriber err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_1900 createSubscriber success ${commonEventSubscriber}`)
            if(commonEventSubscriber !== undefined){
              subscriber = commonEventSubscriber
            }else{
              expect(false).assertTrue()
              done()
            }
            expect(true).assertTrue()

            subscriber.isStickyCommonEvent((err: BusinessError | null, isSticky:boolean|undefined) => {
              if (err) {
                console.info(TAG+`isStickyCommonEvent_9 err ${err}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(TAG+`isStickyCommonEvent_9 success ${isSticky}`)
                expect(true).assertTrue()
              }
            })

            subscriber.isOrderedCommonEvent((err: BusinessError | null, isOrdered:boolean|undefined) => {
              if (err) {
                console.info(TAG+`isOrderedCommonEvent_9 err ${err}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(TAG+`isOrderedCommonEvent_9 success ${isOrdered}`)
                if (isOrdered == true) {
                  subscriber.abortCommonEvent((err: BusinessError | null) => {
                    if (err) {
                      console.info(TAG+`abortCommonEvent_9 err ${err}`)
                      expect(false).assertTrue()
                      done()
                    } else {
                      console.info(TAG+`abortCommonEvent_9 success`)
                      expect(true).assertTrue()
                    }
                  })
                }
                else {
                  expect(true).assertTrue()
                }
              }
            })

            subscriber.getAbortCommonEvent((err: BusinessError | null, abortEvent:boolean|undefined) => {
              if (err) {
                console.info(TAG+`getAbortCommonEvent_9 err ${err}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(TAG+`getAbortCommonEvent_9 success ${abortEvent}`)
                expect(true).assertTrue()
              }
            })

            subscriber.clearAbortCommonEvent((err: BusinessError | null) => {
              if (err) {
                console.info(TAG+`clearAbortCommonEvent_9 err ${err}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(TAG+`clearAbortCommonEvent_9 success`)
                expect(true).assertTrue()
                done()
              }
            })

          }
        })
      } catch (err: BusinessError) {
        console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_1900 failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_1900 END`)
    })

  
    /*
     * @tc.number: Sub_Notification_Ans_Subscriber_Subscribe_Static_2000
     * @tc.name: Sub_Notification_Ans_Subscriber_Subscribe_Static_2000
     * @tc.desc: verify the promise function
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_2000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_2000'
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_2000 START`)

      let subscriber:commonEventManager.CommonEventSubscriber

      let subscribeInfo:commonEventManager.CommonEventSubscribeInfo = {
        events: ["event10"]
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber: commonEventManager.CommonEventSubscriber|undefined) => {
          if (err) {
            console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_2000 createSubscriber err, error code: ${err.code}, message: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_2000 createSubscriber success ${commonEventSubscriber}`)
            if(commonEventSubscriber !== undefined){
              subscriber = commonEventSubscriber
            }else{
              expect(false).assertTrue()
              done()
            }
            expect(true).assertTrue()

            await subscriber.isStickyCommonEvent().then((isSticky:boolean) => {
              console.info(TAG+`isStickyCommonEvent_10 success ${isSticky}`)
              expect(true).assertTrue()
            }).catch((err: BusinessError):void => {
              console.info(TAG+`isStickyCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.isOrderedCommonEvent().then((isOrdered:boolean) => {
              console.info(TAG+`isOrderedCommonEvent_10 success ${isOrdered}`)
              expect(true).assertTrue()
            }).catch((err: BusinessError):void => {
              console.info(TAG+`isOrderedCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.abortCommonEvent().then(() => {
              console.info(TAG+`abortCommonEvent_10 success`)
              expect(true).assertTrue()
            }).catch((err: BusinessError):void => {
              console.info(TAG+`abortCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.getAbortCommonEvent().then((abortEvent:boolean) => {
              console.info(TAG+`getAbortCommonEvent_10 success ${abortEvent}`)
              expect(true).assertTrue()
            }).catch((err: BusinessError):void => {
              console.info(TAG+`getAbortCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

            await subscriber.clearAbortCommonEvent().then(() => {
              console.info(TAG+`clearAbortCommonEvent_10 success`)
              expect(true).assertTrue()
              done()
            }).catch((err: BusinessError):void => {
              console.info(TAG+`clearAbortCommonEvent_10 err ${err}`)
              expect(false).assertTrue()
              done()
            })

          }
        })
      } catch (err: BusinessError) {
        console.info(TAG+`Sub_Notification_Ans_Subscriber_Subscribe_Static_2000 failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_2000 END`)
    })


    /*
     * @tc.number: SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_Static_1100
     * @tc.name: SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_Static_1100
     * @tc.desc: verify the callback function
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_Static_1100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_Static_1100 START`)

      let options:commonEventManager.CommonEventPublishData = {
        code: 0,
        data: "initial data",
        isOrdered: true,
        isSticky: false,
        subscriberPermissions:new Array<string>('publish_event_subscriberPermissions'),
      }

      let subscribeInfo:commonEventManager.CommonEventSubscribeInfo = {
        events: ["eventname"],
        priority:100
      };

      let subscriber = commonEventManager.createSubscriberSync(subscribeInfo)
      commonEventManager.subscribe(subscriber, (err: BusinessError | null, data: commonEventManager.CommonEventData|undefined)=> {
        if (err) {
          expect(false).assertTrue()
          done()
        } else {
          if (data !== undefined) {
            console.info(TAG+'===============>options=========bundle_name: ' + data?.bundleName);
            console.info(TAG+'===============>options=========code: ' + data?.code);
            console.info(TAG+'===============>options=========data: ' + data?.data);
            expect(data?.bundleName).assertEqual('');
            expect(data?.code).assertEqual(0);
            expect(data?.data).assertEqual('initial data');
          }

          let code1 = subscriber.getCodeSync();
          expect(code1).assertEqual(0);
          console.info(TAG+`getCodeSync before setCodeSync, code is ${code1}`)

          subscriber.setCodeSync(1);
          let code2 = subscriber.getCodeSync();
          console.info(TAG+`getCodeSync after setCodeSync, code is ${code2}`)
          expect(code2).assertEqual(1);

          let data1 = subscriber.getDataSync();
          expect(data1).assertEqual("initial data");
          console.info(TAG+`getDataSync before setDataSync, data1 is ${data1}`)

          subscriber.setDataSync("data change");
          let data2 = subscriber.getDataSync();
          expect(data2).assertEqual("data change");
          console.info(TAG+`getDataSync after setDataSync, data is ${data2}`)

          subscriber.setCodeAndDataSync(2, "setCodeAndDataSync")
          let code3 = subscriber.getCodeSync()
          expect(code3).assertEqual(2);
          console.info(TAG+`getCodeSync after setCodeAndDataSync, code is ${code3}`)

          let data3 = subscriber.getDataSync();
          expect(data3).assertEqual("setCodeAndDataSync");
          console.info(TAG+`getDataSync after setCodeAndDataSync, data is ${data3}`)

          let isorder = subscriber.isOrderedCommonEventSync();
          expect(isorder).assertEqual(true)
          console.info(TAG+`isOrderedCommonEventSync, isorder is ${isorder}`)


          let isSticky = subscriber.isStickyCommonEventSync();
          expect(isSticky).assertEqual(false)
          console.info(TAG+`isStickyCommonEventSync, isStickyCommonEventSync is ${isSticky}`)

          subscriber.abortCommonEventSync();
          let isaborted = subscriber.getAbortCommonEventSync();
          expect(isaborted).assertEqual(true)
          console.info(TAG+`getAbortCommonEventSync isaborted ${isaborted}`)
          subscriber.clearAbortCommonEventSync()

          done()
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
      } catch (err: BusinessError) {
        console.error(TAG+`publish failed, code is ${err.code}, message is ${err.message}`)
      }
    })


    /*
     * @tc.number: SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1200
     * @tc.name: SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1200
     * @tc.desc: verify the callback function
     */

    it('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1200 START`)

      let options:commonEventManager.CommonEventPublishData = {
        code: 0,
        data: "initial data",
      }

      let subscribeInfo:commonEventManager.CommonEventSubscribeInfo = {
        events: ["eventname2"],
        priority: 100
      };

      let subscriber = commonEventManager.createSubscriberSync(subscribeInfo)
      commonEventManager.subscribe(subscriber, (err: BusinessError | null, data: commonEventManager.CommonEventData|undefined)=> {
        if (err) {
          console.error(TAG+`subscribe failed, code is ${err.code}, message is ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          let info = subscriber.getSubscribeInfoSync();
          expect(info.priority).assertEqual(100)
          expect(info.userId).assertEqual(-3)
          done()
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
      } catch (err: BusinessError) {
        console.error(TAG+`publish failed, code is ${err.code}, message is ${err.message}`)
        expect(false).assertTrue()
        done()
      }

      console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1200 END`)
    })

    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST END`)
  })
}

