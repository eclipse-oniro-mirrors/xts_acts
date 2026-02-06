import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import commonEventManager from '@ohos.commonEventManager'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import notificationManager from '@ohos.notificationManager'
import notificationSubscribe from '@ohos.notificationSubscribe'
import wantAgent from '@ohos.app.ability.wantAgent'
import image from '@ohos.multimedia.image'
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog';
import wantagent from '@ohos.app.ability.wantAgent';
import {
  Component,
  Driver,
  ON,
  On,
  MatchPattern,
  MouseButton,
  WindowMode,
  UIElementInfo,
  UiDirection,
  PointerMatrix,
  DisplayRotation
} from '@ohos.UiTest'
import Utils from './Util.test';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let testAbilityContext: common.UIAbilityContext;
let bundleName: string = 'com.example.systemAPI.static'


export default function ActsCommonEventSystemAPITest() {
  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe('SUB_NOTIFICATION_CES_SYSTEM_API_TEST', (): void => {
    let TAG :string = 'SUB_NOTIFICATION_CES_SYSTEM_API_TEST ===>'
    hilog.info(domain, TAG, '%{public}s', 'SUB_NOTIFICATION_CES_SYSTEM_API_TEST START')

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
      }, (err : BusinessError| null) : void => {
        if (err != null ) {
          hilog.info(domain, TAG, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, TAG, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundleName )
      await Utils.msSleep(2000)
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
    })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_5000
     * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_5000
     * @tc.desc: test function publishAsBundle
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_Notification_Ans_Publish_Publish_Static_5000'
        console.info(Tag +`Sub_Notification_Ans_Publish_Publish_Static_5000 START`);

        commonEventManager.publishAsUser("event.test", 0, (err: BusinessError | null) => {
          if (err) {
            console.info(Tag +`Sub_Notification_Ans_Publish_Publish_Static_5000 publishAsUser AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(Tag +`Sub_Notification_Ans_Publish_Publish_Static_5000 publishAsUser AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(Tag +`Sub_Notification_Ans_Publish_Publish_Static_5000 END`);
      })

    /*
     * @tc.number: Sub_Notification_Ans_Publish_Publish_Static_5100
     * @tc.name: Sub_Notification_Ans_Publish_Publish_Static_5100
     * @tc.desc: test function publishAsUser
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_Notification_Ans_Publish_Publish_Static_5100'
        console.info(`Sub_Notification_Ans_Publish_Publish_Static_5100 START`);

        let publishData: commonEventManager.CommonEventPublishData = {
          bundleName: "example.bundleName",
          code: 1
        }

        commonEventManager.publishAsUser("event.test", 0, publishData, (err: BusinessError | null) => {
          if (err) {
            console.info(Tag +`publishAsUser AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(Tag +`publishAsUser AsyncCallback success`)
            expect(false).assertTrue()
            done()
          }
        });

        console.info(Tag +`Sub_Notification_Ans_Publish_Publish_5100 END`);
      })



    //问题单号：DTS2025060627133
    /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_Static_7900_278
     * @tc.name: Sub_Notification_Ces_Publish_CommonEvent_Static_7900_278
     * @tc.desc: test function publishAsUser
     */
    // it('Sub_Notification_Ces_Publish_CommonEvent_Static_7900_278', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> =>  {
    //   let Tag :string ='Sub_Notification_Ces_StaticEvent_Config_Static_1300'
    //   //构造commonEventManager.publish401错误码
    //   try {
    //     commonEventManager.publish("EVENT01", null);
    //     expect(false).assertTrue()
    //     done()
    //   } catch (err) {
    //     hilog.info(0x0000, 'testTag', `publish1 err: ${JSON.stringify(err)}`);
    //     expect(err?.code).assertEqual(401)
    //     done()
    //   }
    //
    //   let options: commonEventManager.CommonEventPublishData = {
    //     code: 0,
    //     data: "initial data",
    //     isOrdered: true
    //   }
    //   try {
    //     commonEventManager.publish("EVENT01", options, null);
    //     expect(false).assertTrue()
    //     done()
    //   } catch (err) {
    //     hilog.info(0x0000, 'testTag', `publish2 err: ${JSON.stringify(err)}`);
    //     expect(err?.code).assertEqual(401)
    //     done()
    //   }
    //   ;
    //
    //   //构造commonEventManager.createSubscriberSync401错误码
    //   try {
    //     commonEventManager.createSubscriberSync(null);
    //     expect(false).assertTrue()
    //     done()
    //   } catch (err) {
    //     hilog.info(0x0000, 'testTag', `createSubscriberSync err: ${JSON.stringify(err)}`);
    //     expect(err?.code).assertEqual(401)
    //     done()
    //   }
    //
    //   //构造commonEventManager.subscribe 401错误码
    //   let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
    //     events: ["event05"]
    //   }
    //   let subscriber = commonEventManager.createSubscriberSync(subscribeInfo)
    //   try {
    //     commonEventManager.subscribe(subscriber, null);
    //     expect(false).assertTrue()
    //     done()
    //   } catch (err) {
    //     hilog.info(0x0000, 'testTag', `createSubscriberSync err: ${JSON.stringify(err)}`);
    //     expect(err?.code).assertEqual(401)
    //     done()
    //   }
    //
    //   //构造commonEventManager.subscribe 401错误码
    //   try {
    //     commonEventManager.unsubscribe(null, null);
    //     expect(false).assertTrue()
    //     done()
    //   } catch (err) {
    //     hilog.info(0x0000, 'testTag', `createSubscriberSync err: ${JSON.stringify(err)}`);
    //     expect(err?.code).assertEqual(401)
    //     done()
    //   }
    // })

     /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_Static_7900_279
     * @tc.name: Sub_Notification_Ces_Publish_CommonEvent_Static_7900_279
     * @tc.desc: test function publishAsUser
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_Static_7900_279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_Notification_Ces_Publish_CommonEvent_Static_7900_279'
        //构造notificationManager.publish 1600004错误码
        let notificationRequest: notificationManager.NotificationRequest = {
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "test_title",
              text: "test_text",
              additionalText: "test_Publish"
            } as notificationManager.NotificationBasicContent,
          } as notificationManager.NotificationContent,
          id: 1,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
          console.info(Tag + ' publish1 fail,result is :', JSON.stringify(err));
          expect(err?.code).assertEqual(1600004);
        })
        await notificationManager.publish(notificationRequest).then(() => {
          console.info(Tag + " publish update success");
          expect(false).assertTrue()
          done();
        }).catch((err: BusinessError): void => {
          console.info(Tag + ' publish2 fail,result is :', JSON.stringify(err));
          expect(err?.code).assertEqual(1600004);
        });
        // 构造notificationManager.publish 1600007错误码
        let notificationRequest1600007: notificationManager.NotificationRequest = {
          id: 5,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW,
            liveView: {
              title: "wh",
              text: "content",
              status: notificationManager.LiveViewStatus.LIVE_VIEW_INCREMENTAL_UPDATE,
              version: 2,
              extraInfo: {
                "event": "TAXI",
                "isMute": false,
                "PrimaryData.title": "title更新",
                "PrimaryData.content": '[{"text":"您的滴滴快车还有2分钟到达","textColor":"#FFFF0000"}]',
                "PrimaryData.keepTime": 60,
                "PrimaryData.extend.text": "extendData text",
                "PrimaryData.extend.type": 1,
                "LayoutData.layoutType": 4,
                "PickupLayout.title": "layout title更新",
                "PickupLayout.content": "layout content更新后",
                "PickupLayout.underlineColor": "#FFFFFFFF",
                "CapsuleData.status": 1,
                "CapsuleData.type": 1,
                "CapsuleData.backgroundColor": "#FFFFFFFF",
                "CapsuleData.title": "capsule title",
                "CapsuleData.content": "capsule content",
                "TimerCapsule.content": "capsule title",
                "TimerCapsule.initialtime": 7349485944,
                "TimerCapsule.isCountdown": false,
                "TimerCapsule.isPause": true
              } as Record<String, Object>
            } as notificationManager.NotificationLiveViewContent,
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
          notificationSlotType: notificationManager.SlotType.LIVE_VIEW,
          isOngoing: true,
          isUnremovable: false,
          extraInfo: {
            'testKey': 'testValue'
          } as Record<String, Object>,
        }
        notificationManager.publish(notificationRequest1600007, (err: BusinessError | null) => {
          console.info(Tag + ' publish3 fail,result is :', JSON.stringify(err));
          expect(err?.code).assertEqual(1600007);
          console.info(Tag + ' Succeeded in publishing notification.');
        });
        await notificationManager.publish(notificationRequest1600007).then(() => {
          console.info(Tag + " publish update success");
          expect(false).assertTrue()
          done();
        }).catch((err: BusinessError): void => {
          console.info(Tag + ' publish4 fail,result is :', JSON.stringify(err));
          expect(err?.code).assertEqual(1600007);
        });
        let notificationRequest1600014: notificationManager.NotificationRequest = {
          id: 1600014,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LIVE_VIEW,
            liveView: {
              title: "wh",
              text: "content",
              status: notificationManager.LiveViewStatus.LIVE_VIEW_CREATE,
              version: 2,
              extraInfo: {
                "event": "TAXI",
                "isMute": false,
                "PrimaryData.title": "title更新",
                "PrimaryData.content": '[{"text":"您的滴滴快车还有2分钟到达","textColor":"#FFFF0000"}]',
                "PrimaryData.keepTime": 60,
                "PrimaryData.extend.text": "extendData text",
                "PrimaryData.extend.type": 1,
                "LayoutData.layoutType": 4,
                "PickupLayout.title": "layout title更新",
                "PickupLayout.content": "layout content更新后",
                "PickupLayout.underlineColor": "#FFFFFFFF",
                "CapsuleData.status": 1,
                "CapsuleData.type": 1,
                "CapsuleData.backgroundColor": "#FFFFFFFF",
                "CapsuleData.title": "capsule title",
                "CapsuleData.content": "capsule content",
                "TimerCapsule.content": "capsule title",
                "TimerCapsule.initialtime": 7349485944,
                "TimerCapsule.isCountdown": false,
                "TimerCapsule.isPause": true
              } as Record<String, Object>,
            } as notificationManager.NotificationLiveViewContent,
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
          notificationSlotType: notificationManager.SlotType.LIVE_VIEW,
          isOngoing: true,
          isUnremovable: false,
          extraInfo: {
            'testKey': 'testValue'
          } as Record<String, Object>
        }
        await Utils.msSleep(500);
        notificationManager.publish(notificationRequest1600014, (err: BusinessError | null) => {
          console.info(Tag + ' notificationRequest1600014 callback fail,result is :', JSON.stringify(err));
          expect(err?.code).assertEqual(1600014);
        });
        await notificationManager.publish(notificationRequest1600014).then(() => {
          console.info(Tag + " publish update success");
          expect(false).assertTrue()
          done();
        }).catch((err: BusinessError): void => {
          console.info(Tag + ' notificationRequest1600014 promiss fail,result is :', JSON.stringify(err));
          expect(err?.code).assertEqual(1600014);
          done()
        });
      })

   //问题单号：DTS2025060627133
    /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_Static_7900_280
     * @tc.name: Sub_Notification_Ces_Publish_CommonEvent_Static_7900_280
     * @tc.desc: test function publishAsUser
     */
    // it('Sub_Notification_Ces_Publish_CommonEvent_Static_7900_280', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
    //   let TAG :string ='Sub_Notification_Ces_Publish_CommonEvent_Static_7900_280'
    //   let id :number = 1
    //   let label:string = "label"
    //   try {
    //     notificationManager.cancel(null, (err: BusinessError | null) => {
    //       if (err) {
    //         console.info(`${TAG} cancel id err: ${err.code}, errMes: ${err.message}`)
    //         expect(true).assertTrue()
    //         done()
    //       } else {
    //         console.info(`${TAG} cancel id success`)
    //         expect(false).assertTrue()
    //         done()
    //       }
    //     })
    //   } catch (err) {
    //     console.info(`${TAG} cancel1 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
    //     expect(err?.code).assertEqual(401)
    //   }
    //
    //   notificationManager.cancel(id, (err: BusinessError | null) => {
    //     console.info(`${TAG} cancel2 AsyncCallback err: ${err.code}, errMes: ${err.message}`)
    //     expect(err?.code).assertEqual(1600007)
    //   })
    //
    //   try {
    //     notificationManager.cancel(null, label, (err: BusinessError | null) => {
    //       console.info(`${TAG} cancel id success`)
    //       expect(false).assertTrue()
    //       done()
    //     })
    //   } catch (err) {
    //     console.info(`${TAG} cancel3 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
    //     expect(err?.code).assertEqual(401)
    //   }
    //
    //   notificationManager.cancel(id, label, (err: BusinessError | null) => {
    //     console.info(`${TAG} cancel4 AsyncCallback err: ${err.code}, errMes: ${err.message}`)
    //     expect(err?.code).assertEqual(1600007)
    //   })
    //
    //   await notificationManager.cancel(id, label).then(() => {
    //     console.info(`${TAG} cancel Promise success`)
    //     expect(false).assertTrue()
    //     done()
    //   }).catch((err: BusinessError) => {
    //     console.info(`${TAG} cancel5 Promise err: ${err.code}, errMes: ${err.message}`)
    //     expect(err?.code).assertEqual(1600007)
    //     done()
    //   })
    //
    // })

    //问题单号：DTS2025060627133
    /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_Static_7900_281
     * @tc.name: Sub_Notification_Ces_Publish_CommonEvent_Static_7900_281
     * @tc.desc: test function publishAsUser
     */
    // it('Sub_Notification_Ces_Publish_CommonEvent_Static_7900_281', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> =>{
    // let TAG :string ='Sub_Notification_Ces_Publish_CommonEvent_Static_7900_281'
    //   try {
    //     notificationManager.addSlot(null, (err: BusinessError | null) => {
    //       console.info(`addSlot SOCIAL_COMMUNICATION success`);
    //       expect(false).assertTrue();
    //       done();
    //     })
    //   } catch (err) {
    //     console.info(`${TAG} addSlot1 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
    //     expect(err?.code).assertEqual(401)
    //   }
    //
    //   try {
    //     await notificationManager.addSlot(15).then(() => {
    //       console.info(`${TAG} addSlot Promise success`)
    //       expect(false).assertTrue()
    //       done()
    //     }).catch((err: BusinessError) => {
    //       console.info(`${TAG} addSlot Promise errCode: ${err.code}, errMes: ${err.message}`)
    //       expect(err?.code).assertEqual(401)
    //       done()
    //     })
    //   } catch (err) {
    //     console.info(`${TAG} addSlot2 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
    //     expect(err?.code).assertEqual(401)
    //   }
    //
    //   try {
    //     notificationManager.getSlot(null, (err: BusinessError | null, NotificationSlot) => {
    //       console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`);
    //       expect(false).assertTrue();
    //       done();
    //     })
    //   }catch (err) {
    //     console.info(`${TAG} getSlot1 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
    //     expect(err?.code).assertEqual(401)
    //   }
    //
    //   try {
    //     notificationManager.removeSlot(null, (err: BusinessError | null) => {
    //       console.info(`${TAG} removeSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
    //       expect(false).assertTrue()
    //       done()
    //     })
    //   } catch (err) {
    //     console.info(`${TAG} removeSlot_1 errCode: ${err.code}, errMes: ${err.message}`)
    //     expect(err?.code).assertEqual(401)
    //   }
    //
    //   try {
    //     notificationManager.cancelGroup(null, (err: BusinessError | null) => {
    //       console.info(`${TAG} cancelGroup AsyncCallback err: ${err.code}, errMes: ${err.message}`)
    //       expect(false).assertTrue()
    //       done()
    //     })
    //   } catch (err) {
    //     console.info(`${TAG} cancelGroup AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
    //     expect(err?.code).assertEqual(401)
    //
    //   }
    //
    //   try {
    //     notificationManager.isSupportTemplate(null, (err: BusinessError | null) => {
    //       console.info(`${TAG} isSupportTemplate AsyncCallback err: ${err.code}, errMes: ${err.message}`)
    //       expect(false).assertTrue()
    //       done()
    //     })
    //   } catch (err) {
    //     console.info(`${TAG} isSupportTemplate AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
    //     expect(err?.code).assertEqual(401)
    //     done()
    //   }
    //
    // })

    //问题单号：DTS2025060627133
    /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_Static_7900_284
     * @tc.name: Sub_Notification_Ces_Publish_CommonEvent_Static_7900_284
     * @tc.desc: test function publishAsUser
     */
    // it('Sub_Notification_Ces_Publish_CommonEvent_Static_7900_284',  TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> =>{
    //   let Tag :string ='Sub_Notification_Ces_Publish_CommonEvent_Static_7900_284'
    //   try {
    //     notificationManager.setBadgeNumber(null, (err: BusinessError | null) => {
    //       console.log(Tag+`setBadgeNumber failed, error code: ${err.code}, message: ${err.message}`)
    //       if (err.code == 801) {
    //         expect(true).assertTrue()
    //         done()
    //       } else {
    //         expect(false).assertTrue()
    //         done()
    //       }
    //     })
    //   } catch (err) {
    //     console.log(Tag+`setBadgeNumber failed, catch error code: ${err.code}, message: ${err.message}`)
    //     if (err.code == 801) {
    //       expect(true).assertTrue()
    //       done()
    //     } else {
    //       expect(err?.code).assertEqual(401)
    //       done()
    //     }
    //   }
    //
    //
    //   // 定义订阅者，用于保存创建成功的订阅者对象，后续使用其完成订阅及退订的动作
    //   let subscriber: commonEventManager.CommonEventSubscriber|undefined;
    //   // 订阅者信息
    //   let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
    //     events: ["event284"],
    //     publisherBundleName: 'com.example.myapplication'
    //   };
    //
    //   commonEventManager.createSubscriber(subscribeInfo, async (err: BusinessError | null, commonEventSubscriber: commonEventManager.CommonEventSubscriber|undefined) => {
    //     if (err) {
    //       console.info(`Sub_Notification_Ces_Publish_CommonEvent_7900_284 err, error code: ${err.code}, message: ${err.message}`)
    //       expect(false).assertTrue()
    //       done()
    //     } else {
    //       console.info(`Sub_Notification_Ces_Publish_CommonEvent_7900_284 success ${commonEventSubscriber}`)
    //       subscriber = commonEventSubscriber
    //
    //       try {
    //         subscriber.getCode(null)
    //       }catch (err) {
    //         console.info(`${TAG} getCode err: ${err.code}, errMes: ${err.message}`)
    //         expect(err?.code).assertEqual(401)
    //         done()
    //       }
    //
    //       try {
    //         subscriber.setCode(null, (err: BusinessError | null) => {
    //           console.info(`${TAG} setCode id success`)
    //           expect(false).assertTrue()
    //           done()
    //         })
    //       } catch (err) {
    //         console.info(`${TAG} setCode err: ${err.code}, errMes: ${err.message}`)
    //         expect(err?.code).assertEqual(401)
    //         done()
    //       }
    //
    //       try {
    //         subscriber.getData(null)
    //       }catch (err) {
    //         console.info(`${TAG} getData err: ${err.code}, errMes: ${err.message}`)
    //         expect(err?.code).assertEqual(401)
    //         done()
    //       }
    //
    //       try {
    //         subscriber.setData(null, (err: BusinessError | null) => {
    //           console.info(`setData_1 err, error code: ${err.code}, message: ${err.message}`)
    //           expect(false).assertTrue()
    //           done()
    //         })
    //       } catch (err) {
    //         console.info(`${TAG} setData err: ${err.code}, errMes: ${err.message}`)
    //         expect(err?.code).assertEqual(401)
    //         done()
    //       }
    //
    //       try {
    //         subscriber.clearAbortCommonEvent(null)
    //       }catch (err) {
    //         console.info(`${TAG} clearAbortCommonEvent err: ${err.code}, errMes: ${err.message}`)
    //         expect(err?.code).assertEqual(401)
    //         done()
    //       }
    //
    //
    //       try {
    //         subscriber.setCodeAndData(null, 'data02', (err: BusinessError | null) => {
    //           console.info(`${TAG} setCodeAndData id success`)
    //           expect(false).assertTrue()
    //           done()
    //         })
    //       } catch (err) {
    //         console.info(`${TAG} setCodeAndData err: ${err.code}, errMes: ${err.message}`)
    //         expect(err?.code).assertEqual(401)
    //         done()
    //       }
    //
    //       try {
    //         subscriber.isOrderedCommonEvent(null)
    //       }catch (err) {
    //         console.info(`${TAG} isOrderedCommonEvent err: ${err.code}, errMes: ${err.message}`)
    //         expect(err?.code).assertEqual(401)
    //         done()
    //       }
    //
    //       try {
    //         subscriber.isStickyCommonEvent(null)
    //       }catch (err) {
    //         console.info(`${TAG} isStickyCommonEvent err: ${err.code}, errMes: ${err.message}`)
    //         expect(err?.code).assertEqual(401)
    //         done()
    //       }
    //
    //       try {
    //         subscriber.abortCommonEvent(null)
    //       }catch (err) {
    //         console.info(`${TAG} abortCommonEvent err: ${err.code}, errMes: ${err.message}`)
    //         expect(err?.code).assertEqual(401)
    //         done()
    //       }
    //
    //       try {
    //         subscriber.clearAbortCommonEvent(null)
    //       }catch (err) {
    //         console.info(`${TAG} clearAbortCommonEvent err: ${err.code}, errMes: ${err.message}`)
    //         expect(err?.code).assertEqual(401)
    //         done()
    //       }
    //
    //       try {
    //         subscriber.getAbortCommonEvent(null)
    //       }catch (err) {
    //         console.info(`${TAG} getAbortCommonEvent err: ${err.code}, errMes: ${err.message}`)
    //         expect(err?.code).assertEqual(401)
    //         done()
    //       }
    //
    //       try {
    //         subscriber.getSubscribeInfo(null)
    //       }catch (err) {
    //         console.info(`${TAG} getSubscribeInfo err: ${err.code}, errMes: ${err.message}`)
    //         expect(err?.code).assertEqual(401)
    //         done()
    //       }
    //
    //       try {
    //         subscriber.finishCommonEvent(null)
    //       }catch (err) {
    //         console.info(`${TAG} finishCommonEvent err: ${err.code}, errMes: ${err.message}`)
    //         expect(err?.code).assertEqual(401)
    //         done()
    //       }
    //
    //     }
    //   })
    // })


    /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_Static_7900_282
     * @tc.name: Sub_Notification_Ces_Publish_CommonEvent_Static_7900_282
     * @tc.desc: test function publishAsUser
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_Static_7900_282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_Notification_Ces_Publish_CommonEvent_Static_7900_282'

        notificationManager.requestEnableNotification(testAbilityContext, (err: BusinessError | null) => {
          console.info(`${Tag} requestEnableNotification2 Promise err: ${err?.code}, errMes: ${err?.message}`)
        })
        await Utils.msSleep(1000)
        notificationManager.requestEnableNotification(testAbilityContext).then(() => {
          console.info(`${Tag} requestEnableNotification1 Promise success!`)
          expect(false).assertTrue()
          done()
        }).catch((err: BusinessError): void => {
          console.info(`${Tag} requestEnableNotification1 Promise err: ${err.code}, errMes: ${err.message}`)
          expect(err?.code).assertEqual(1600013)
        })


        await Utils.msSleep(1000)
        let driver = Driver.create();
        await Utils.msSleep(1500)
        let button = await driver.findComponent(ON.text("允许"));
        console.info(`${Tag} button is ${JSON.stringify(button)}`);
        await Utils.msSleep(2500);
        if (button !== null) {
          console.log(`${Tag} button not is null`)
          await button.click();
          console.log(`${Tag} button not click`)
          await Utils.msSleep(1500);
        } else {
          console.log(`${Tag} button is null`)
        }
        console.info(`${Tag} button is success`)

        let index1: number = 0;
        let publishCallback = (err: BusinessError|null) => {
          index1 += 1
          console.info(`index1:` + index1)
          if (index1 == 11) {
            console.info(`${Tag} fail in publishing notification:` + err?.code)
            expect(err?.code).assertEqual(1600009);
            done()
          } else {
            console.info(`${Tag} publishing notification:` + JSON.stringify(err))
            expect(err).assertEqual(null);
          }
        }

        for (let index: number = 0; index <= 10; index++) {
          let notificationRequest: notificationManager.NotificationRequest = {
            id: index,
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
              normal: {
                title: 'text_title',
                text: 'text_text',
                additionalText: 'test_Publish'
              } as notificationManager.NotificationBasicContent,
            } as notificationManager.NotificationContent,
            creatorBundleName: "123",
            creatorUid: 123,
            creatorPid: 123,
            creatorUserId: 123,
            hashCode: "123",
            source: 0,
            deviceId: undefined,
            notificationFlags: undefined,
            agentBundle: undefined,
            appInstanceKey: undefined,
          }
          notificationManager.publish(notificationRequest, publishCallback)
          await Utils.msSleep(60)
        }

        for (let index = 0; index <= 10; index++) {
          let notificationRequest: notificationManager.NotificationRequest = {
            id: index,
            content: {
              notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
              normal: {
                title: 'text_title',
                text: 'text_text',
                additionalText: 'test_Publish'
              } as notificationManager.NotificationBasicContent,
            } as notificationManager.NotificationContent,
            creatorBundleName: "123",
            creatorUid: 123,
            creatorPid: 123,
            creatorUserId: 123,
            hashCode: "123",
            source: 0,
            deviceId: undefined,
            notificationFlags: undefined,
            agentBundle: undefined,
            appInstanceKey: undefined,
          }
          await notificationManager.publish(notificationRequest).then(() => {
            console.info(`${Tag} publish_${index} Promise success`)
            expect(true).assertTrue()
          }).catch((err: BusinessError): void => {
            console.info(`${Tag} publish_${index} Promise err: ${err.code}, errMes: ${err.message}`)
            if (index == 10) {
              expect(err?.code).assertEqual(1600009)
              done()
            } else {
              expect(false).assertTrue()
              done()
            }
          });
        }

      })


   
    /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_Static_7900_287
     * @tc.name: Sub_Notification_Ces_Publish_CommonEvent_Static_7900_287
     * @tc.desc: test function publishAsUser
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_Static_7900_287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_Notification_Ces_Publish_CommonEvent_Static_7900_287'
        let BundleOption: notificationManager.BundleOption = {
          bundle: bundleName,
          uid: 20020189
        }
        console.info(`${Tag} BundleOption bundle:uid = ${BundleOption.bundle},${BundleOption.uid}`);
        expect(typeof BundleOption.bundle == 'string').assertTrue()
        expect(typeof BundleOption.uid == 'number').assertTrue()
        expect(BundleOption.bundle).assertEqual(bundleName)
        expect(BundleOption.uid).assertEqual(20020189)
        console.info(`${Tag} Sub_Notification_Ces_Publish_CommonEvent_7900_287 END`);
        let removeCallback = (err: BusinessError | null) => {
          if (err) {
            console.info(Tag+ "remove failed " + JSON.stringify(err));
            expect(err?.code).assertEqual(202)
            done()
          } else {
            console.info(Tag+ "whwhwhremove success");
            expect(false).assertEqual(true)
            done()
          }
        }
        let bundle: notificationManager.BundleOption = {
          bundle: bundleName,
        };
        let notificationKey: notificationSubscribe.NotificationKey = {
          id: 0,
          label: "label",
        };
        let reason: notificationSubscribe.RemoveReason = notificationSubscribe.RemoveReason.CLICK_REASON_REMOVE;
        notificationSubscribe.remove(bundle, notificationKey, reason, removeCallback);
      });


   /*
     * @tc.number: Sub_Notification_Ces_Publish_CommonEvent_Static_7900_288
     * @tc.name: Sub_Notification_Ces_Publish_CommonEvent_Static_7900_288
     * @tc.desc: test function publish
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_Static_7900_288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TEST_SUITE_NAME = 'Sub_Notification'
        const TEST_CASE_NAME = 'Sub_Notification_Ces_Publish_CommonEvent_Static_7900_288'
        const color: ArrayBuffer = new ArrayBuffer(96); //96为需要创建的像素buffer大小，取值为：height * width *4
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } }

        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        await pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          console.info(`${TAG} Sub_Notification_Ces_Publish_CommonEvent_7900_288 pixelMap: ${pixelMap}`);
          console.log('Succeeded in creating pixelmap.');
        })
        let wantagent :wantagent.WantAgentInfo={
          wants: [
            {
              bundleName: bundleName,
              action: "usual.event.REMOVAL_WANTAGENT"
            }
          ],
          actionType: wantAgent.OperationType.START_ABILITY,
          actionFlags: [wantAgent.WantAgentFlags.ONE_TIME_FLAG]
        }
        let wantAgentData = wantAgent.getWantAgent(wantagent);
        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_LONG_TEXT,
            longText: {
              title: '',
              text: 'test_text',
              additionalText: 'text_additionalText',
              longText: 'text_longText',
              briefText: 'text_briefText',
              expandedTitle: 'text_exoandTitle'
            } as notificationManager.NotificationLongTextContent
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
          smallIcon: pixelMap,
          largeIcon: pixelMap,
          groupName: "123",
          removalWantAgent: wantAgentData,
          badgeNumber: 99,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            reminderFlags:undefined
          } as notificationManager.NotificationFlags
        }
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is :%{public}s',
              JSON.stringify(err));
            expect().assertFail();
            hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err: BusinessError) {
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
            JSON.stringify(err));
          expect(err?.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })

  })
}