import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { notificationExtensionSubscription, notificationManager } from '@kit.NotificationKit';
import { abilityAccessCtrl, UIAbility } from '@kit.AbilityKit';
import { common } from '@kit.AbilityKit';
import Base, { BusinessError } from '@ohos.base';

import { abilityDelegatorRegistry } from '@kit.TestKit';
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()

let commonTag: string = "OpenSubscriptionSettings"
let bundleName:string = "com.example.actsNotificationAnsThreePartyWatchThirdPartyNoAbility"
export default function actsNotificationAnsThreePartyOpenSubscriptionSettingsTest() {
  let uiAbilityContext: common.UIAbilityContext | undefined =
    AppStorage.get<common.UIAbilityContext>('uiAbilityContext');
  describe('actsNotificationAnsThreePartyOpenSubscriptionSettingsTest', () => {
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
      * @tc.number    Sub_Notification_Ans_ThreePartyWatch_1002
      * @tc.name      Sub_Notification_Ans_ThreePartyWatch_1002
      * @tc.desc      【openSubscriptionSeetings】应用未实现NotificationSubscriberExtensionAbility，返回错误码1600023
      * @tc.size      LargeTest
      * @tc.type      Function
      * @tc.level     Level 2
      */
    it('Sub_Notification_Ans_ThreePartyWatch_1002', Level.LEVEL2, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1002 ";
        const ability: UIAbility = await delegator.getCurrentTopAbility();
        let context :common.UIAbilityContext= ability.context;
        await notificationExtensionSubscription.openSubscriptionSettings(context).then(()=>{
          console.info(TAG+"openSubscriptionSettings success ");
          expect(false).assertTrue()
          done();
        }).catch((err: Base.BusinessError) => {
          console.error(TAG+"openSubscriptionSettingseeeeeeeeee: " + JSON.stringify(err));
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

function sleep(ms: number) {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}
