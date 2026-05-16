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
        } catch (e) {
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
        } catch (e) {
          console.error(TAG + `setCloudStrategyTest002 + ${e.code} + ${e.message}`);
          expect(false).assertTrue();
          done();
        }
        console.info(TAG + "************* setCloudStrategyTest002 End *************");
      })

      /**
     * @tc.name   setCloudStrategyTest003
     * @tc.number SUB_CloudData_SDK_setCloudStrategyTest_0300
     * @tc.desc   est setCloudStrategy  second parameter  with cloudData.NetWorkStrategy.WIFI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setCloudStrategyTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    async (done: () => void): Promise<void> => {
      console.info(TAG + "************* setCloudStrategyTest003 start *************");
      try {
        await cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK, [Int.toLong(cloudData.NetWorkStrategy.WIFI)])
          .then(() => {
            console.info(TAG + 'Succeeded in setting the cloud strategy');
            expect(cloudData.NetWorkStrategy.WIFI).assertEqual(1)
            done();
          })
          .catch((err: Error) => {
            console.error(TAG + `Failed to set cloud strategy. Code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(801);
            done();
          });
      } catch (e) {
        console.error(TAG + `setCloudStrategyTest003 + ${e.code} + ${e.message}`);
        expect(false).assertTrue();
        done();
      }
      console.info(TAG + "************* setCloudStrategyTest003 End *************");
    })

    /**
     * @tc.name   setCloudStrategyTest004
     * @tc.number SUB_CloudData_SDK_setCloudStrategyTest_0400
     * @tc.desc   Test setCloudStrategy  second parameter  with cloudData.NetWorkStrategy.CELLULAR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('setCloudStrategyTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
        async (done: () => void): Promise<void> => {
          console.info(TAG + "************* setCloudStrategyTest004 start *************");
          try {
            await cloudData.setCloudStrategy(cloudData.StrategyType.NETWORK, [Int.toLong(cloudData.NetWorkStrategy.CELLULAR)])
              .then(() => {
                console.info(TAG + 'Succeeded in setting the cloud strategy');
                expect(cloudData.NetWorkStrategy.CELLULAR).assertEqual(2)
                done();
              })
              .catch((err: Error) => {
                console.error(TAG + `Failed to set cloud strategy. Code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(801);
                done();
              });
          } catch (e) {
            console.error(TAG + `setCloudStrategyTest004 + ${e.code} + ${e.message}`);
            expect(false).assertTrue();
            done();
          }
          console.info(TAG + "************* setCloudStrategyTest004 End *************");
        })
  })
}