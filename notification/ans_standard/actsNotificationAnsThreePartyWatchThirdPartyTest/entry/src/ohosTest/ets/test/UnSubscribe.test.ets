import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { notificationExtensionSubscription, notificationManager } from '@kit.NotificationKit';
import { BusinessError } from '@kit.BasicServicesKit'
import { abilityAccessCtrl } from '@kit.AbilityKit';
import { common } from '@kit.AbilityKit';
let commonTag: string = "UnSubscribe"
let bundleName:string = "com.example.actsNotificationAnsThreePartyWatchThirdParty"
export default function actsNotificationAnsThreePartyUnSubscribeTest() {
  let uiAbilityContext: common.UIAbilityContext | undefined =
    AppStorage.get<common.UIAbilityContext>('uiAbilityContext');
  describe('actsNotificationAnsThreePartyUnSubscribeTest', () => {
    beforeAll(() => {
      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      try {
        atManager.requestPermissionsFromUser(uiAbilityContext, ['ohos.permission.ACCESS_BLUETOOTH'],
          (err, data) => {
          });
      } catch (err) {
      }
    })
    
    /**
      * @tc.number   Sub_Notification_Ans_ThreePartyWatch_1015
      * @tc.name     Sub_Notification_Ans_ThreePartyWatch_1015
      * @tc.desc     【unsubscribe】参数正确，三方应用取消订阅成功
      * @tc.size     LargeTest
      * @tc.type     Function
      * @tc.level    Level 0
    */
    it('Sub_Notification_Ans_ThreePartyWatch_1015', Level.LEVEL0, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1015 ";
      let infos: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[] = [
        {
          addr: '01:23:45:67:89:AB', // 使用动态获取的蓝牙地址
          type: notificationExtensionSubscription.SubscribeType.BLUETOOTH
        }
      ];
      // 1、调用subscribe(info: NotificationExtensionSubscriptionInfo[]): Promise<void>接口订阅成功，其中addr按照备注方法获取，type填写BLUETOOTH
      await notificationExtensionSubscription.subscribe(infos).then(() => {
        console.info(TAG+"subscribe success1111");
      }).catch((err: BusinessError) => {
        console.error(TAG+`subscribe fail: ${JSON.stringify(err)}`);
         if(err.code == 201){
          expect(err.code).assertEqual(201);
          done()
        } else {
          expect().assertFail();
          done();
        }
      });
      // 2、调用接口getSubscribeInfo(): Promise<NotificationExtensionSubscriptionInfo[]>查询订阅信息
      await notificationExtensionSubscription.getSubscribeInfo().then((data) => {
        console.info(TAG +`getSubscribeInfo successfully. Data: ${JSON.stringify(data)}`);
        expect(data.length).assertEqual(1)
      }).catch((err: BusinessError) => {
        console.error(TAG+`getSubscribeInfo fail: ${JSON.stringify(err)}`);
         if(err.code == 201){
          expect(err.code).assertEqual(201);
          done()
        } else {
          expect().assertFail();
          done();
        }
      });
      // 3、调用接口unsubscribe(): Promise<void>
      await notificationExtensionSubscription.unsubscribe().then(() => {
        console.info(TAG+"unsubscribe success1111");
      }).catch((err: BusinessError) => {
        console.error(TAG+`unubscribe fail11111111: ${JSON.stringify(err)}`);
        if(err.code == 201){
          expect(err.code).assertEqual(201);
          done()
        } else {
          expect().assertFail();
          done();
        }
      });
      // 4、调用接口getSubscribeInfo(): Promise<NotificationExtensionSubscriptionInfo[]>查询订阅信息
      await notificationExtensionSubscription.getSubscribeInfo().then((data) => {
        console.info(TAG +`getSubscribeInfo successfully1111111. Data: ${JSON.stringify(data)}`);
        expect(data.length).assertEqual(0)
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG+`getSubscribeInfo fail1111: ${JSON.stringify(err)}`);
         if(err.code == 201){
          expect(err.code).assertEqual(201);
          done()
        } else {
          expect().assertFail();
          done();
        }
      });
    })
    /**
      * @tc.number    Sub_Notification_Ans_ThreePartyWatch_1014
      * @tc.name      Sub_Notification_Ans_ThreePartyWatch_1014
      * @tc.desc      【unsubscribe】多次调用取消订阅接口
      * @tc.size      LargeTest
      * @tc.type      Function
      * @tc.level     Level 1
     */
    it('Sub_Notification_Ans_ThreePartyWatch_1014', Level.LEVEL1, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1014 ";
      let count : number = 0
      let infos: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[] = [
        {
          addr: '01:23:45:67:89:AB', // 使用动态获取的蓝牙地址
          type: notificationExtensionSubscription.SubscribeType.BLUETOOTH
        }
      ];
      // 1、调用subscribe(info: NotificationExtensionSubscriptionInfo[]): Promise<void>接口订阅成功，其中addr按照备注方法获取，type填写BLUETOOTH
      await notificationExtensionSubscription.subscribe(infos).then(() => {
        console.info(TAG+"subscribe success1111");
      }).catch((err: BusinessError) => {
        console.error(TAG+`subscribe fail: ${JSON.stringify(err)}`);
         if(err.code == 201){
          expect(err.code).assertEqual(201);
          done()
        } else {
          expect().assertFail();
          done();
        }
      });
      // 2、调用接口getSubscribeInfo(): Promise<NotificationExtensionSubscriptionInfo[]>查询订阅信息
      await notificationExtensionSubscription.getSubscribeInfo().then((data) => {
        console.info(TAG +`getSubscribeInfo successfully. Data: ${JSON.stringify(data)}`);
        expect(data.length).assertEqual(1)
      }).catch((err: BusinessError) => {
        console.error(TAG+`getSubscribeInfo fail: ${JSON.stringify(err)}`);
         if(err.code == 201){
          expect(err.code).assertEqual(201);
          done()
        } else {
          expect().assertFail();
          done();
        }
      });
      // 3、调用接口unsubscribe(): Promise<void>
      await notificationExtensionSubscription.unsubscribe().then(() => {
        console.info(TAG+"unsubscribe success1111");
      }).catch((err: BusinessError) => {
        console.error(TAG+`unubscribe fail11111111: ${JSON.stringify(err)}`);
         if(err.code == 201){
          expect(err.code).assertEqual(201);
          done()
        } else {
          expect().assertFail();
          done();
        }
      });
      // 4、再次调用取消订阅接口unsubscribe(): Promise<void>
      await notificationExtensionSubscription.unsubscribe().then(() => {
        console.info(TAG+"unsubscribe successtttttttt1111");
        count++
        expect(count).assertEqual(1)
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG+`unubscribe fail11111111: ${JSON.stringify(err)}`);
         if(err.code == 201){
          expect(err.code).assertEqual(201);
          done()
        } else {
          expect().assertFail();
          done();
        }
      });
    })

  })
}