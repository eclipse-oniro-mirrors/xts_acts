import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import { AppCloneIdentity } from 'bundleManager.BundleInfo';

const TAG = "ActsBmsgetAppCloneIdentityTest"

export default function getAppCloneIdentity() {
  describe('ActsBmsgetAppCloneIdentityTest', (): void => {

    /**
     * @tc.number GetAppCloneIdentity_0100
     * @tc.name getAppCloneIdentity_0100
     * @tc.desc Test GetAppCloneIdentity interfaces with other hap.
     */
    it('getAppCloneIdentity_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      let dataInfo = bundleManager.getBundleInfoForSelfSync(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
        try {
          await bundleManager.getAppCloneIdentity(dataInfo.appInfo.uid).then((data: AppCloneIdentity) => {
            console.info(TAG + 'getAppCloneIdentity_0100 successfully: ' + JSON.stringify(data));
            expect(data.bundleName).assertEqual(dataInfo.appInfo.name);
            expect(data.appIndex).assertEqual(0);
            done();
          }).catch((err: BusinessError): void => {
            let message = (err as BusinessError).message;
            console.info(TAG +'getAppCloneIdentity_0100 getBundleInfo catch failed: ' + message);
            expect(err).assertFail();
            done();
          });
        } catch (err: BusinessError) {
          let message = (err as BusinessError).message;
          console.info(TAG +'getAppCloneIdentity_0100 catch failed: ' + message);
          expect().assertFail();
          done();
        }
    });

  });
}