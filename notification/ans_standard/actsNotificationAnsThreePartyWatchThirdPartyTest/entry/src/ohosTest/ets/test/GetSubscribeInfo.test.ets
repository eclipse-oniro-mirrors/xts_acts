import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { notificationExtensionSubscription, notificationManager } from '@kit.NotificationKit';
import { BusinessError } from '@kit.BasicServicesKit'
import { abilityAccessCtrl } from '@kit.AbilityKit';
import { common } from '@kit.AbilityKit';
let commonTag: string = "GetSubscribeInfo"
let bundleName:string = "com.example.actsNotificationAnsThreePartyWatchThirdParty"
export default function actsNotificationAnsThreePartyGetSubscribeInfoTest() {
  let uiAbilityContext: common.UIAbilityContext | undefined =
    AppStorage.get<common.UIAbilityContext>('uiAbilityContext');
  describe('actsNotificationAnsThreePartyGetSubscribeInfoTest', () => {
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
      * @tc.number    Sub_Notification_Ans_ThreePartyWatch_1017
      * @tc.name      Sub_Notification_Ans_ThreePartyWatch_1017
      * @tc.desc      【getSubscribeInfo】从未订阅过，调用查询接口结果为空
      * @tc.size      LargeTest
      * @tc.type      Function
      * @tc.level     Level 2
     */
    it('Sub_Notification_Ans_ThreePartyWatch_1017', Level.LEVEL2, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1017 ";
      notificationExtensionSubscription.getSubscribeInfo().then((data) => {
        console.info(TAG +`getSubscribeInfo successfully. Data: ${JSON.stringify(data)}`);
        expect(data.length).assertEqual(0)
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