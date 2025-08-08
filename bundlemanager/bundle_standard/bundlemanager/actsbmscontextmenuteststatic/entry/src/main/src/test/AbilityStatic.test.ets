import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import bundle from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import { AppCloneIdentity } from 'bundleManager.BundleInfo';

let uid = 101010101;

export default function abilityTest() {
  describe('ActsAbilityTest', (): void => {

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo2_Static_2400
     * @tc.name: getBundleNameByUidSyncUnPermissionApi14
     * @tc.desc: Test getBundleNameByUidSync unPermission for api14.
     */
    it('getBundleNameByUidSyncUnPermissionApi14', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        bundle.getBundleNameByUidSync(uid)
        expect().assertFail();
        done();
      } catch (err: BusinessError) {
        console.info("getBundleNameByUidSyncUnPermissionApi14 1 catch " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo2_Static_2500
     * @tc.name: getBundleNameByUidUnPermissionApi14
     * @tc.desc: Test getBundleNameByUid unPermission for api14.
     */
    it('getBundleNameByUidUnPermissionApi14', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        await bundle.getBundleNameByUid(uid).then((data: string) => {
          console.info("getBundleNameByUidUnPermissionApi14 promise success " + data);
          expect().assertFail();
        }).catch((err: BusinessError): void => {
          console.info("getBundleNameByUidUnPermissionApi14 promise error " + JSON.stringify(err));
          expect(err.code).assertEqual(201);
        })
      } catch (err: BusinessError) {
        console.info("getBundleNameByUidUnPermissionApi14 1 catch " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      try {
        bundle.getBundleNameByUid(uid, (err: BusinessError | null, data: string | undefined) => {
          console.info("getBundleNameByUidUnPermissionApi14 callback2 success " + data);
          console.info("getBundleNameByUidUnPermissionApi14 callback2 error " + JSON.stringify(err));
          expect(data).assertUndefined();
          expect(err?.code).assertEqual(201);
          done();
        });
      } catch (err: BusinessError) {
        console.info("getBundleNameByUidUnPermissionApi14 callback2 catch " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Query_AppInfo2_Static_2600
     * @tc.name: getAppCloneIdentityUnPermissionApi14
     * @tc.desc: Test getAppCloneIdentity unPermission for api14.
     */
    it('getAppCloneIdentityUnPermissionApi14', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        bundle.getAppCloneIdentity(uid).then((data: AppCloneIdentity) => {
          console.info("getAppCloneIdentityUnPermissionApi14 success " + data);
          expect().assertFail();
          done();
        }).catch((err: BusinessError): void => {
          console.info("getAppCloneIdentityUnPermissionApi14 promise " + JSON.stringify(err));
          expect(err.code).assertEqual(201);
          done();
        })
      } catch (err: BusinessError) {
        console.info("getAppCloneIdentityUnPermissionApi14 1 catch " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}