import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { notificationExtensionSubscription, notificationManager } from '@kit.NotificationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityAccessCtrl } from '@kit.AbilityKit';
import { common } from '@kit.AbilityKit';
let commonTag: string = "SystemApi";
let bundleName: string = "com.example.actsNotificationAnsThreePartyWatchThirdParty"; // 3方应用包名
// 被查询的穿戴app包名（假设与测试应用包名一致，可根据实际情况修改）
const wearableBundle: notificationExtensionSubscription.BundleOption = {
  bundle: bundleName
  // 不填写uid，符合用例要求
};

export default function actsNotificationAnsThreePartySystemApiTest() {
  let uiAbilityContext: common.UIAbilityContext | undefined =
    AppStorage.get<common.UIAbilityContext>('uiAbilityContext');
  describe('actsNotificationAnsThreePartySystemApiTest', () => {
   
    /**
      * @tc.number     Sub_Notification_Ans_ThreePartyWatch_1019
      * @tc.name       Sub_Notification_Ans_ThreePartyWatch_1019
      * @tc.desc       【getAllSubscriptionBundles】3方应用调用，接口报错202
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 2
    */
    it('Sub_Notification_Ans_ThreePartyWatch_1019', Level.LEVEL2, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1019 ";
      try {
        await notificationExtensionSubscription.getAllSubscriptionBundles()
        .then((data: notificationExtensionSubscription.BundleOption[]) => {
          console.info(TAG + "getAllSubscriptionBundles data:" + JSON.stringify(data));
          expect(false).assertTrue(); // 3方应用调用应失败
          done();
          })
          .catch((e: BusinessError) => {
            console.error(TAG + "getAllSubscriptionBundles catch err:" + e.code + " message:" + e.message);
            if(e.code == 201){
              expect(e.code).assertEqual(201);
              done()
            } else {
              expect(e.code === 202).assertTrue();
              done();
            }
            
          })
      } catch (e) {
        console.error(TAG + "getAllSubscriptionBundles err:" + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })
    /**
      * @tc.number     Sub_Notification_Ans_ThreePartyWatch_1025
      * @tc.name       Sub_Notification_Ans_ThreePartyWatch_1025
      * @tc.desc       【getUserGrantedState】三方应用调用，接口报错202
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 2
    */
    it('Sub_Notification_Ans_ThreePartyWatch_1025', Level.LEVEL2, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1025 ";

      try {
        await notificationExtensionSubscription.getUserGrantedState(wearableBundle)
          .then((state: boolean) => {
            console.info(TAG + "getUserGrantedState state:" + state);
            expect(false).assertTrue(); // 3方应用调用应失败
            done();
          })
          .catch((e: BusinessError) => {
            console.error(TAG + "getUserGrantedState catch err:" + e.code + " message:" + e.message);
            if(e.code == 201){
              expect(e.code).assertEqual(201);
              done()
            } else {
              expect(e.code === 202).assertTrue();
              done();
            }
          })
      } catch (e) {
        console.error(TAG + "getUserGrantedState err:" + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })
    /**
      * @tc.number     Sub_Notification_Ans_ThreePartyWatch_1034
      * @tc.name       Sub_Notification_Ans_ThreePartyWatch_1034
      * @tc.desc       【setUserGrantedState】三方应用调用，接口报错202
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 2
    */
    it('Sub_Notification_Ans_ThreePartyWatch_1034', Level.LEVEL2, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1034 ";
      const enabled: boolean = true;

      try {
        await notificationExtensionSubscription.setUserGrantedState(wearableBundle, enabled)
          .then(() => {
            console.info(TAG + "setUserGrantedState success");
            expect(false).assertTrue(); // 3方应用调用应失败
            done();
          })
          .catch((e: BusinessError) => {
            console.error(TAG + "setUserGrantedState catch err:" + e.code + " message:" + e.message);
            if(e.code == 201){
              expect(e.code).assertEqual(201);
              done()
            } else {
              expect(e.code === 202).assertTrue();
              done();
            }
          })
      } catch (e) {
        console.error(TAG + "setUserGrantedState err:" + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })
    /**
      * @tc.number     Sub_Notification_Ans_ThreePartyWatch_1047
      * @tc.name       Sub_Notification_Ans_ThreePartyWatch_1047
      * @tc.desc       【getUserGrantedEnableBundles】三方应用调用，接口报错202
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 2
     */
    it('Sub_Notification_Ans_ThreePartyWatch_1047', Level.LEVEL2, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1047 ";

      try {
        await notificationExtensionSubscription.getUserGrantedEnabledBundles(wearableBundle)
          .then((bundles: notificationExtensionSubscription.BundleOption[]) => {
            console.info(TAG + "getUserGrantedEnableBundles bundles:" + JSON.stringify(bundles));
            expect(false).assertTrue(); // 3方应用调用应失败
            done();
          })
          .catch((e: BusinessError) => {
            console.error(TAG + "getUserGrantedEnableBundles catch err:" + e.code + " message:" + e.message);
            if(e.code == 201){
              expect(e.code).assertEqual(201);
              done()
            } else {
              expect(e.code === 202).assertTrue();
              done();
            }
          })
      } catch (e) {
        console.error(TAG + "getUserGrantedEnableBundles err:" + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })
    /**
      * @tc.number     Sub_Notification_Ans_ThreePartyWatch_1060
      * @tc.name       Sub_Notification_Ans_ThreePartyWatch_1060
      * @tc.desc       【setUserGrantedBundleState】三方应用调用，接口报错202
      * @tc.size       MediumTest
      * @tc.type       Function
      * @tc.level      Level 2
    */
    it('Sub_Notification_Ans_ThreePartyWatch_1060', Level.LEVEL2, async (done: Function) => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1060 ";
      const enabled: boolean = true;
      // 被设置应用列表（包含当前穿戴app）
      const enabledBundles: notificationExtensionSubscription.BundleOption[] = [wearableBundle];
      try {
        await notificationExtensionSubscription.setUserGrantedBundleState(wearableBundle, enabledBundles, enabled)
          .then(() => {
            console.info(TAG + "setUserGrantedBundleState success");
            expect(false).assertTrue(); // 3方应用调用应失败
            done();
          })
          .catch((e: BusinessError) => {
            console.error(TAG + "setUserGrantedBundleState catch err:" + e.code + " message:" + e.message);
            if(e.code == 201){
              expect(e.code).assertEqual(201);
              done()
            } else {
              expect(e.code === 202).assertTrue();
              done();
            }
          })
      } catch (e) {
        console.error(TAG + "setUserGrantedBundleState err:" + JSON.stringify(e));
        expect().assertFail();
        done();
      }
    })
  })
}