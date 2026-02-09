/**
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterEach } from "../../../hypium/index";
import commonEventManager from '@ohos.commonEventManager'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError, RecordData } from '@ohos.base';
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
import { AppStorage } from '@ohos.arkui.stateManagement'
import wifiMg from '@ohos.wifiManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let testAbilityContext: common.UIAbilityContext | undefined;
let bundleName: string = 'com.example.systemAPI.static'
let count: int = 0;


export default function ActsCommonEventSystemAPITest() {
  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  describe('SUB_NOTIFICATION_CES_SYSTEM_API_TEST', (): void => {
    let TAG :string = 'SUB_NOTIFICATION_CES_SYSTEM_API_TEST ===>'
    hilog.info(domain, TAG, '%{public}s', 'SUB_NOTIFICATION_CES_SYSTEM_API_TEST START')

    beforeAll(():void => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');

      let  isWifiActive : boolean = wifiMg.isWifiActive() as boolean
      if(!isWifiActive){
        console.info(TAG+"======> wifi_test/enable wifi:" );
        wifiMg.enableWifi();
        await Utils.msSleep(5000);
      }

      try {
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info(TAG+"======> Internet WifiLinkedInfo : " + JSON.stringify(data));
        console.info(TAG+"======> Internet speed : " + JSON.stringify(data.linkSpeed));
        console.info(TAG+"======> Internet chload : " + JSON.stringify(data.chload));
        console.info(TAG+"======> Internet rssi : " + JSON.stringify(data.rssi));

        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info(TAG+"======> WLAN connection established ");
        } else {
          expect().message("======> WLAN Network error").assertFail(); //方式一

        }
        if (data.chload >= 900 || data.rssi <= -80) {
          expect().message("======> WLAN Network error").assertFail();//方式一
        } else if (data.chload >= 500) {
          console.info(TAG+"======> The internet connection is poor. ");
        }
      } catch (err) {
        console.info(TAG+"======> getLinkedInfo promise failed, err :" + JSON.stringify(err));
        throw (err as Error);
      }

      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundleName )
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
    })

    afterEach(() =>{
      await Utils.msSleep(500)
    })


    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_5000
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_5000
     * @tc.desc   test function publishAsBundle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Publish_Static_5100
     * @tc.number Sub_Notification_Ans_Publish_Publish_Static_5100
     * @tc.desc   test function publishAsUser
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   Sub_Notification_Ces_StaticEvent_Config_Static_1200
     * @tc.number Sub_Notification_Ces_StaticEvent_Config_Static_1200
     * @tc.desc   test function removeStickyCommonEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ces_StaticEvent_Config_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_Notification_Ces_StaticEvent_Config_Static_1200'
        console.info(`${Tag} Sub_Notification_Ces_StaticEvent_Config_1200 START`);

        commonEventManager.removeStickyCommonEvent("sticky_event", (err: BusinessError | null) => {
          if (err) {
            console.info(`${Tag} remove sticky event AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(err?.code).assertEqual(202);
            done()
          } else {
            console.info(`${Tag} remove sticky event AsyncCallback success`);
            expect(false).assertTrue()
            done()
          }
        })

        console.info(`${Tag} Sub_Notification_Ces_StaticEvent_Config_1200 END`);
      })

    /**
     * @tc.name   Sub_Notification_Ces_StaticEvent_Config_Static_1300
     * @tc.number Sub_Notification_Ces_StaticEvent_Config_Static_1300
     * @tc.desc   test function removeStickyCommonEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ces_StaticEvent_Config_Static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_Notification_Ces_StaticEvent_Config_Static_1300'
        console.info(`${Tag} Sub_Notification_Ces_StaticEvent_Config_1300 START`);

        commonEventManager.removeStickyCommonEvent("sticky_event").then(() => {
          console.info("${TAG} remove sticky event AsyncCallback success");
          expect(false).assertTrue()
          done()
        }).catch((err: Error): void => {
          console.info(`${Tag} remove sticky event AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(err?.code).assertEqual(202);
          done()
        });

        console.info(`${Tag} Sub_Notification_Ces_StaticEvent_Config_1300 END`);
      })


    /**
     * @tc.name   Sub_Notification_Ces_Publish_CommonEvent_Static_7900_279
     * @tc.number Sub_Notification_Ces_Publish_CommonEvent_Static_7900_279
     * @tc.desc   test function publishAsUser
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
        }).catch((err: Error): void => {
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
              } as Record<String, RecordData>
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
          extendInfo: {
            'testKey': 'testValue'
          } as Record<String, RecordData>,
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
        }).catch((err: Error): void => {
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
              } as Record<String, RecordData>,
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
          extendInfo: {
            'testKey': 'testValue'
          } as Record<String, RecordData>
        }
        await Utils.msSleep(500);
        notificationManager.publish(notificationRequest1600014, (err: BusinessError | null) => {
          console.info(Tag + ' notificationRequest1600014 callback fail,result is :', JSON.stringify(err));
          expect(err?.code).assertEqual(1600014);
        });
        await Utils.msSleep(1000);
        await notificationManager.publish(notificationRequest1600014).then(() => {
          console.info(Tag + " publish update success");
          expect(false).assertTrue()
          done();
        }).catch((err: Error): void => {
          console.info(Tag + ' notificationRequest1600014 promiss fail,result is :', JSON.stringify(err));
          expect(err?.code).assertEqual(1600014);
          done()
        });
      })


    /**
     * @tc.name   Sub_Notification_Ces_Publish_CommonEvent_Static_7900_280
     * @tc.number Sub_Notification_Ces_Publish_CommonEvent_Static_7900_280
     * @tc.desc   test function publishAsUser
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_Static_7900_280', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG :string ='Sub_Notification_Ces_Publish_CommonEvent_Static_7900_280'
      let id :int = 1
      let label:string = "label"

      notificationManager.cancel(id, (err: BusinessError | null) => {
        console.info(`${TAG} cancel2 AsyncCallback err: ${err}`)
        expect(err?.code).assertEqual(1600007)
      })
      
      notificationManager.cancel(id, label, (err: BusinessError | null) => {
        console.info(`${TAG} cancel4 AsyncCallback err: ${err}`)
        expect(err?.code).assertEqual(1600007)
      })

      await notificationManager.cancel(id, label).then(() => {
        console.info(`${TAG} cancel Promise success`)
        expect(false).assertTrue()
        done()
      }).catch((err) => {
        let error : BusinessError = err as BusinessError
        console.info(`${TAG} cancel5 Promise error: ${error.code}, errMes: ${error.message}`)
        expect(error?.code).assertEqual(1600007)
        done()
      })

    })
    
    
    /**
     * @tc.name   Sub_Notification_Ces_Publish_CommonEvent_Static_7900_282
     * @tc.number Sub_Notification_Ces_Publish_CommonEvent_Static_7900_282
     * @tc.desc   test function publishAsUser
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_Static_7900_282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_Notification_Ces_Publish_CommonEvent_Static_7900_282'

        notificationManager.requestEnableNotification(testAbilityContext!, (err: BusinessError | null) => {
          console.info(`${Tag} requestEnableNotification2 Promise err: ${err?.code}, errMes: ${err?.message}`)
        })
        await Utils.msSleep(1000)
        notificationManager.requestEnableNotification(testAbilityContext!).then(() => {
          console.info(`${Tag} requestEnableNotification1 Promise success!`)
          expect(false).assertTrue()
          done()
        }).catch((err: Error): void => {
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

        

        for (let index = 0; index <= 10; index++) {
          count = 0;
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
            count++;
            expect(count).assertEqual(1);
          }).catch((err: Error): void => {
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


    /**
     * @tc.name   Sub_Notification_Ces_Publish_CommonEvent_Static_7900_283
     * @tc.number Sub_Notification_Ces_Publish_CommonEvent_Static_7900_283
     * @tc.desc   test function publishAsUser
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_Static_7900_283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_Notification_Ces_Publish_CommonEvent_Static_7900_283'
        notificationManager.openNotificationSettings(testAbilityContext!).then(() => {
          console.info(Tag + "Succeed to openNotificationSettings");
        }).catch((err: Error): void => {
          console.error(Tag + "openNotificationSettings: " + JSON.stringify(err));
          if (err.code == 801) {
            done();
          } else if(err.code == 1600001){
            expect(err?.code).assertEqual(1600001);
            done();
          } else {
            console.error(Tag + "openNotificationSettings:1011 " + JSON.stringify(err));
            expect(err?.code).assertEqual(1011);
            console.error(Tag + "openNotificationSettings:1011 done1" + JSON.stringify(err));
            done();
          }
        })
        await Utils.msSleep(2000)
        await notificationManager.openNotificationSettings(testAbilityContext!).then(() => {
          console.info(Tag + "Succeed to openNotificationSettings");
          expect(false).assertTrue();
          done()
        }).catch((err: Error): void => {
          console.error(Tag + "openNotificationSettings: " + JSON.stringify(err));
          if (err.code == 801) {
            expect(err.code == 801).assertTrue();
          } else if(err.code == 1011){
            expect(err?.code).assertEqual(1011);
          } else {
            expect(err?.code).assertEqual(1600018)
          }
        });
        await Utils.msSleep(2000)
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

        for (let index: int = 11; index <= 21; index++) {
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
          }
          notificationManager.publish(notificationRequest, publishCallback)
          //await Utils.msSleep(60)
        }
      })

    /**
     * @tc.name   Sub_Notification_Ces_Publish_CommonEvent_Static_7900_287
     * @tc.number Sub_Notification_Ces_Publish_CommonEvent_Static_7900_287
     * @tc.desc   test function publishAsUser
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_Static_7900_287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let Tag: string = 'Sub_Notification_Ces_Publish_CommonEvent_Static_7900_287'
        let BundleOption: notificationManager.BundleOption = {
          bundle: bundleName,
          uid: 20020189
        }
        console.info(`${Tag} BundleOption bundle:uid = ${BundleOption.bundle},${BundleOption.uid}`);
        expect(typeof BundleOption.bundle == 'string').assertTrue()
        expect(typeof BundleOption.uid == 'int').assertTrue()
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

    /**
     * @tc.name   Sub_Notification_Ces_Publish_CommonEvent_Static_7900_288
     * @tc.number Sub_Notification_Ces_Publish_CommonEvent_Static_7900_288
     * @tc.desc   test function publish
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ces_Publish_CommonEvent_Static_7900_288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
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
          requestCode: 0,
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
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s',
            JSON.stringify(err));
          expect(err?.code).assertEqual(401);
          hilog.info(0x000, `${TAG}`, `${TEST_SUITE_NAME}#${TEST_CASE_NAME} test case end`);
          done();
        }
      })

  })
}