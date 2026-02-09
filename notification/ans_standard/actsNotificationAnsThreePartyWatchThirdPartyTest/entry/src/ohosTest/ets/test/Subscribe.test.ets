import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { notificationExtensionSubscription, notificationManager } from '@kit.NotificationKit';
import { BusinessError } from '@kit.BasicServicesKit'
import { abilityAccessCtrl } from '@kit.AbilityKit';
import { common } from '@kit.AbilityKit';
let commonTag: string = "Subscribe"
let bundleName:string = "com.example.actsNotificationAnsThreePartyWatchThirdParty"
export default function actsNotificationAnsThreePartySubscribeTest() {
  let uiAbilityContext: common.UIAbilityContext | undefined =
    AppStorage.get<common.UIAbilityContext>('uiAbilityContext');
  describe('actsNotificationAnsThreePartySubscribeTest', () => {
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
      * @tc.number    Sub_Notification_Ans_ThreePartyWatch_1011
      * @tc.name      Sub_Notification_Ans_ThreePartyWatch_1011
      * @tc.desc      【subscribe】参数传入正确，接口调用成功
      * @tc.size      LargeTest
      * @tc.type      Function
      * @tc.level     Level 0
    */
    it('Sub_Notification_Ans_ThreePartyWatch_1011', Level.LEVEL0, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1011 ";
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
        console.error(`subscribe fail: ${JSON.stringify(err)}`);
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
        expect(data.length).assertEqual(1);  // 先确认数组长度正确
        expect(data[0].addr).assertEqual("01:23:45:67:89:AB");  // 校验addr
        expect(data[0].type).assertEqual(0);  // 校验type
        done();
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
    })



    })
  }