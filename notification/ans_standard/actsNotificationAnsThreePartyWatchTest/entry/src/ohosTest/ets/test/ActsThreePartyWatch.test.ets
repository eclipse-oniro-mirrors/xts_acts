import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { notificationExtensionSubscription, notificationManager } from '@kit.NotificationKit';
import { BusinessError } from '@kit.BasicServicesKit'
import { abilityAccessCtrl } from '@kit.AbilityKit';
import { common } from '@kit.AbilityKit';

let commonTag: string = "notificationAnsThreePartyWatch1AbilityTest"
let bundleName: string = "com.example.actsnotificationansthreepartywatchtest"

export default function actsThreePartyWatchAbilityTest() {
  let uiAbilityContext: common.UIAbilityContext | undefined =
    AppStorage.get<common.UIAbilityContext>('uiAbilityContext');
  describe('actsThreePartyWatchAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
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
      * @tc.number     Sub_Notification_Ans_ThreePartyWatch_1006
      * @tc.name       Sub_Notification_Ans_ThreePartyWatch_1006
      * @tc.desc       【subscribe】未申请权限调用接口，报错201
      * @tc.size       Medium-sized Test
      * @tc.type       Function test
      * @tc.level      Level 2
    */
    it('Sub_Notification_Ans_ThreePartyWatch_1006', Level.LEVEL2, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1006 ";
      let info: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[] = [
        {
          type: notificationExtensionSubscription.SubscribeType.BLUETOOTH,
          addr: "11:22:33:44:55"
        }
      ]

      await notificationExtensionSubscription.subscribe(info).then(() => {
          console.info(TAG + " subscribe success")
          expect(false).assertTrue();
          done();
        }).catch((e: BusinessError) => {
          console.error(TAG + " subscribe catch err:" + JSON.stringify(e))
          expect(e.code == 201).assertTrue();
          done();
        })
    })


    /**
      * @tc.number     Sub_Notification_Ans_ThreePartyWatch_1013
      * @tc.name       Sub_Notification_Ans_ThreePartyWatch_1013
      * @tc.desc       【unsubscribe】未申请权限调用接口，报错201
      * @tc.size       Medium-sized Test
      * @tc.type       Function test
      * @tc.level      Level 2
    */
    it('Sub_Notification_Ans_ThreePartyWatch_1013', Level.LEVEL2, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1013 ";
      let info: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[] = [
        {
          type: notificationExtensionSubscription.SubscribeType.BLUETOOTH,
          addr: "11:22:33:44:55"
        }
      ]

      await notificationExtensionSubscription.unsubscribe()
        .then(() => {
          console.info(TAG + " unsubscribe success")
          expect(false).assertTrue();
          done();
        })
        .catch((e: BusinessError) => {
          console.error(TAG + " unsubscribe catch err:" + JSON.stringify(e))
          expect(e.code == 201).assertTrue();
          done();
        })
    })

    /**
      * @tc.number     Sub_Notification_Ans_ThreePartyWatch_1016
      * @tc.name       Sub_Notification_Ans_ThreePartyWatch_1016
      * @tc.desc       【getSubscribeInfo】未申请权限调用，接口报错201
      * @tc.size       Medium-sized Test
      * @tc.type       Function test
      * @tc.level      Level 2
    */
    it('Sub_Notification_Ans_ThreePartyWatch_1016', Level.LEVEL2, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1016 ";
      await notificationExtensionSubscription.getSubscribeInfo()
        .then((data: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[]) => {
          console.info(TAG + " getSubscribeInfo data:" + JSON.stringify(data))
          expect(false).assertTrue();
          done();
        })
        .catch((e: BusinessError) => {
          console.error(TAG + " getSubscribeInfo catch err:" + JSON.stringify(e))
          expect(e.code == 201).assertTrue();
          done();
        })
    })
    /**
      * @tc.number     Sub_Notification_Ans_ThreePartyWatch_1022
      * @tc.name       Sub_Notification_Ans_ThreePartyWatch_1022
      * @tc.desc       【isUserGranted】未申请权限调用，接口报错201
      * @tc.size       Medium-sized Test
      * @tc.type       Function test
      * @tc.level      Level 2
    */
    it('Sub_Notification_Ans_ThreePartyWatch_1022', Level.LEVEL2, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1022 ";
      await notificationExtensionSubscription.isUserGranted()
        .then((data: boolean) => {
          console.info(TAG + " isUserGranted data:" + JSON.stringify(data))
          expect(false).assertTrue();
          done();
        })
        .catch((e: BusinessError) => {
          console.error(TAG + " isUserGranted catch err:" + JSON.stringify(e))
          expect(e.code == 201).assertTrue();
          done();
        })
    })
    /**
      * @tc.number     Sub_Notification_Ans_ThreePartyWatch_1056
      * @tc.name       Sub_Notification_Ans_ThreePartyWatch_1056
      * @tc.desc       【getUserGrantedEnableBundles】未申请权限，接口报错201
      * @tc.size       Medium-sized Test
      * @tc.type       Function test
      * @tc.level      Level 2
    */
    it('Sub_Notification_Ans_ThreePartyWatch_1056', Level.LEVEL2, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1056 ";
      await notificationExtensionSubscription.getUserGrantedEnabledBundles()
        .then((data: notificationExtensionSubscription.GrantedBundleInfo[]) => {
          console.info(TAG + " getUserGrantedEnabledBundles data:" + JSON.stringify(data))
          expect(false).assertTrue();
          done();
        })
        .catch((e: BusinessError) => {
          console.error(TAG + " getUserGrantedEnabledBundles catch err:" + JSON.stringify(e))
          expect(e.code == 201).assertTrue();
          done();
        })
    })
  })
}