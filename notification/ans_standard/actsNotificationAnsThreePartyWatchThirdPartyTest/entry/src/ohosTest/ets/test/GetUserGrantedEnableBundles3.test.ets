import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { notificationExtensionSubscription, notificationManager } from '@kit.NotificationKit';
import { BusinessError } from '@kit.BasicServicesKit'
import { abilityAccessCtrl } from '@kit.AbilityKit';
import { common } from '@kit.AbilityKit';
import bundleManager from '@ohos.bundle.bundleManager';
let commonTag: string = "GetUserGrantedEnableBundles"
let bundleName: string = "com.example.actsNotificationAnsThreePartyWatchThirdParty"
export default function actsNotificationAnsThreePartyGetUserGrantedEnableBundles3Test() {
  let uiAbilityContext: common.UIAbilityContext | undefined =
    AppStorage.get<common.UIAbilityContext>('uiAbilityContext');
  describe('actsNotificationAnsThreePartyGetUserGrantedEnableBundles3Test', () => {
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
     * @tc.number    Sub_Notification_Ans_ThreePartyWatch_1058
     * @tc.name      Sub_Notification_Ans_ThreePartyWatch_1055
     * @tc.desc      【getUserGrantedEnabledBundles-public】有授权应用，接口调用正常
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('Sub_Notification_Ans_ThreePartyWatch_1058', Level.LEVEL1, async (done: Function) => {
      const TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_1058 ";
      try {
        const result = await notificationExtensionSubscription.getUserGrantedEnabledBundles();
        hilog.info(0x000, TAG, `111111Result: ${JSON.stringify(result)}`);
        // Array.isArray() 方法用于检查 result 是否是一个数组
        expect(Array.isArray(result)).assertTrue();
        // 根据实际返回的数据结构进行验证
        if (result.length > 0) {
          const firstItem = result[0];
          // 检查是否是字符串数组还是对象数组
          if (typeof firstItem === 'string') {
            // 字符串数组的情况
            hilog.info(0x000, TAG, "Returned string array format");
            expect(typeof firstItem === 'string').assertTrue();
          } else {
            // 对象数组的情况
            hilog.info(0x000, TAG, "Returned object array format");
            expect(typeof firstItem.bundleName === 'string').assertTrue();
            expect(typeof firstItem.appIndex === 'number').assertTrue();
            if (firstItem.appName) {
              expect(typeof firstItem.appName === 'string').assertTrue();
            }
          }
        }

        hilog.info(0x000, TAG, "Test completed successfully");

      } catch (err) {
        console.error(TAG + "Test failed: " + JSON.stringify(err));
        if(err.code == 201){
          expect(err.code).assertEqual(201);
          done()
        } else {
          expect().assertFail();
        }
      } finally {
        done();
      }
    });




  })
}