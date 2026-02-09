import { beforeAll, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base'
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Want from '@ohos.app.ability.Want';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import window from '@ohos.window';
import notificationManager from '@ohos.notificationManager'

let context: common.UIAbilityContext;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function ActsNotificationGeofenceLiveViewTest() {

  describe("ActsNotificationGeofenceLiveViewTest", (): void => {

    /**
     * @tc.number  Sub_Notification_Ans_GeofenceLiveView_Static_0006
     * @tc.name    Sub_Notification_Ans_GeofenceLiveView_Static_0006
     * @tc.desc    Third-party app calls setGeofenceEnabled, error 202 returned
     * @tc.size    Large-scaleTest
     * @tc.type    Interface
     * @tc.level   Level 3
     */
    it('Sub_Notification_Ans_GeofenceLiveView_Static_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName = 'Sub_Notification_Ans_GeofenceLiveView_Static_0006'
      console.log(`${caseName}: create`)
      try {
        notificationManager.setGeofenceEnabled(true)
          .then(() => {
            console.info(`${caseName}  setGeoFenceEnabled success`);
            expect(false).assertTrue();
            done()
          })
          .catch((err: Error): void => {
            let error = err as BusinessError;
            console.error(`${caseName} call setGeoFenceEnabled failed(.catch), errCode: ` + error.code + `, errMsg: ` + error.message);
            expect(error.code).assertEqual(202);
          })
        done();
      } catch (err) {
        let e = err as BusinessError;
        console.error(`[${caseName}]: ` + e.code + e.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_GeofenceLiveView_Static_0010
     * @tc.name    Sub_Notification_Ans_GeofenceLiveView_Static_0010
     * @tc.desc    isGeofenceEnabled returns default true after device flash
     * @tc.size    Large-scaleTest
     * @tc.type    Interface
     * @tc.level   Level 3
     */
    it('Sub_Notification_Ans_GeofenceLiveView_Static_0010',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'Sub_Notification_Ans_GeofenceLiveView_Static_0010'
      console.log(`${caseName}: create`)
      try {
        notificationManager.isGeofenceEnabled()
          .then((enabled: boolean) => {
            console.info(`${caseName} isGeoFenceEnabled success`);
            expect(enabled).assertTrue();
            done();
          })
          .catch((err: Error): void => {
            let error = err as BusinessError;
            console.error(`${caseName} call isGeoFenceEnabled failed(.catch), errCode: ` + error.code + `, errMsg: ` + error.message);
            if (error.code == 801) {
              expect(error.code).assertEqual(801);
              done();
            } else {
              console.error(`${caseName} call isGeoFenceEnabled failed(.catch), errCode: ` + error.code + `, errMsg: ` + error.message);
              expect().assertFail();
              done();
            }
          })
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${caseName} call setGeoFenceEnabled failed(try-catch), errCode: ` + error.code + `, errMsg: ` + error.message);
        if (error.code == 801) {
          expect(error.code).assertEqual(801);
          done();
        } else {
          console.error(`[${caseName}]: ` + error.code + error.message);
          expect().assertFail();
          done();
        }
      }
    })
  })

}