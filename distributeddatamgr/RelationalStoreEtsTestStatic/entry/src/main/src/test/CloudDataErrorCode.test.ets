import { describe, it, expect, Level, Size, TestType } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import cloudData from '@ohos.data.cloudData';

const domain: int = 0x0000;
const TAG: string = 'CloudDataErrorCode-->';

export default function CloudDataErrorCode() {

  describe("CloudDataErrorCode", (): void => {

    /**
     * @tc.name   setCloudStrategyTest001
     * @tc.number SUB_CloudData_SDK_setCloudStrategyTest_0100
     * @tc.desc   Test setCloudStrategy with empty string array as the second parameter, expect 401 error code returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setCloudStrategyTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* setCloudStrategyTest001 start *************");
        try {
          await cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK, [""])
            .then(() => {
              console.info(TAG + 'Succeeded in setting the cloud strategy');
              expect(false).assertTrue();
              done();
            })
            .catch((err: Error) => {
              console.error(TAG + `Failed to set cloud strategy. Code: ${err.code}, message: ${err.message}`);
              expect(401).assertEqual(err.code);
              done();
            });
        } catch (e: Error) {
          console.error(TAG + `setCloudStrategyTest001 + ${e.code} + ${e.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(TAG + "************* setCloudStrategyTest001 End *************");
      })

    /**
     * @tc.name   setCloudStrategyTest002
     * @tc.number SUB_CloudData_SDK_setCloudStrategyTest_0200
     * @tc.desc   Test setCloudStrategy with negative integer array as the second parameter, expect 401 error code returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setCloudStrategyTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info(TAG + "************* setCloudStrategyTest002 start *************");
        try {
          await cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK, [-1 as Long])
            .then(() => {
              console.info(TAG + 'Succeeded in setting the cloud strategy');
              expect(false).assertTrue();
              done();
            })
            .catch((err: Error) => {
              console.error(TAG + `Failed to set cloud strategy. Code: ${err.code}, message: ${err.message}`);
              expect(401).assertEqual(err.code);
              done();
            });
        } catch (e: Error) {
          console.error(TAG + `setCloudStrategyTest002 + ${e.code} + ${e.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(TAG + "************* setCloudStrategyTest002 End *************");
      })
  })
}