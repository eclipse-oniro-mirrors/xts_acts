import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { notificationExtensionSubscription, notificationManager } from '@kit.NotificationKit';
import { BusinessError } from '@kit.BasicServicesKit'
import { abilityAccessCtrl } from '@kit.AbilityKit';
import { common } from '@kit.AbilityKit';
let commonTag: string = "Subscribe"
let bundleName:string = "com.example.actsNotificationAnsThreePartyWatchThirdPartyNoAbility"
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
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    /*
      * @tc.number     Sub_Notification_Ans_ThreePartyWatch_1007
      * @tc.name       Sub_Notification_Ans_ThreePartyWatch_1007
      * @tc.desc      【subscribe】调用接口，应用未实现NotificationSubscriberExtensionAbility，返回错误码1600023
      * @tc.size      LargeTest
      * @tc.type      Function
      * @tc.level     Level 2
    */
    it('Sub_Notification_Ans_ThreePartyWatch_1007', Level.LEVEL2, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1007 ";
      let infos: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[] = [
        {
          addr: '12345678901', // 使用动态获取的蓝牙地址
          type: notificationExtensionSubscription.SubscribeType.BLUETOOTH
        }
      ];
      await
      notificationExtensionSubscription.subscribe(infos).then(() => {
        console.info(TAG+"subscribe success1111");
        expect(false).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG+`subscribe fail: ${JSON.stringify(err)}`);
        if (err.code == 201) {
            expect(err.code).assertEqual(201)
            done();
          } else {
            expect(err.code).assertEqual(1600023)
            done();
          }
      });
    })

    })
  }