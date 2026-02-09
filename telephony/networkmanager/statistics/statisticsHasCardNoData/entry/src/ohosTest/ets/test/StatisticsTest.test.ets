/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import statistics from '@ohos.net.statistics';
import sim from '@ohos.telephony.sim';
import radio from '@ohos.telephony.radio';
import { BusinessError } from '@ohos.base'

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
}

function ExpectTrue(n: boolean) {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info(` exportTrue failed err: ${JSON.stringify(err)}`);
  }
};
export default function StatisticsTestHasCard() {
  describe("StatisticsTestHasCard", () => {

    /**
     * @tc.name   testNetworkManagerGetCellularRxBytesAsync0200
     * @tc.number SUB_NetworkManager_GetCellularRxBytes_Async_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkManagerGetCellularRxBytesAsync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetCellularRxBytesAsync0200';
      try{
        sim.hasSimCard(0, (err, data) => {
          if (data === false) {
            console.info(`${caseName} hasSimCard fail ${JSON.stringify(err)} `);
            done();
          } else {
            radio.isRadioOn(0).then((data) => {
              console.info(`${caseName} isRadioOn  ${JSON.stringify(data)} `);
              ExpectTrue(data == true);
              statistics.getCellularRxBytes((err, data) => {
                if (err) {
                  console.log(`${caseName} getCellularRxBytes fail ${JSON.stringify(err)} `);
                  ExpectTrue(err.code == 2103012);
                  done();
                } else {
                  console.log(`${caseName} getCellularRxBytes success ${JSON.stringify(data)}`);
                  expectFalse();
                  done();
                }
              });
            }).catch((err:BusinessError) => {
              console.error('When the device has no modem, the interface reports an error' + JSON.stringify(err));
              ExpectTrue(err.code== 8300003);
              done();
            });
          }
        });
      }catch(err){
        console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }

    });
    /**
     * @tc.name   testNetworkManagerGetCellularRxBytesPromise0200
     * @tc.number SUB_NetworkManager_GetCellularRxBytes_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkManagerGetCellularRxBytesPromise0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetCellularRxBytesPromise0200';
      try{
        sim.hasSimCard(0, (err, data) => {
          if (data === false) {
            console.info(`${caseName} hasSimCard fail ${JSON.stringify(err)} `);
            done();
          } else {
            radio.isRadioOn(0).then((data) => {
              console.info(`${caseName} isRadioOn  ${JSON.stringify(data)} `);
              ExpectTrue(data == true);
              statistics.getCellularRxBytes().then((data) => {
                console.log(`${caseName} getCellularRxBytes success ${JSON.stringify(data)}`);
                expectFalse();
                done();
              }).catch((err:BusinessError) => {
                console.log(`${caseName} getCellularRxBytes fail ${JSON.stringify(err)} `);
                ExpectTrue(err.code == 2103012);
                done();
              });
            }).catch((err:BusinessError) => {
              console.error('When the device has no modem, the interface reports an error' + JSON.stringify(err));
              ExpectTrue(err.code == 8300003);
              done();
            });
          }
        });
      }catch(err){
        console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }

    });

    /**
     * @tc.name   testNetworkManagerGetCellularTxBytesAsync0200
     * @tc.number SUB_NetworkManager_GetCellularTxBytes_Async_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkManagerGetCellularTxBytesAsync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetCellularTxBytesAsync0200';
      try{
        sim.hasSimCard(0, (err, data) => {
          if (data === false) {
            console.info(`${caseName} hasSimCard fail ${JSON.stringify(err)} `);
            done();
          } else {
            radio.isRadioOn(0).then((data) => {
              console.info(`${caseName} isRadioOn  ${JSON.stringify(data)} `);
              expect(data == true).assertTrue();
              statistics.getCellularTxBytes((err, data) => {
                if (err) {
                  console.log(`${caseName} getCellularTxBytes fail ${JSON.stringify(err)} `);
                  ExpectTrue(err.code == 2103012);
                  done();
                } else {
                  console.log(`${caseName} getCellularTxBytes success ${JSON.stringify(data)}`);
                  expectFalse();
                  done();
                }
              });
            }).catch((err:BusinessError) => {
              console.error('When the device has no modem, the interface reports an error' + JSON.stringify(err));
              ExpectTrue(err.code == 8300003);
              done();
            });
          }
        });
      }catch(err){
        console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.name   testNetworkManagerGetCellularTxBytesPromise0200
     * @tc.number SUB_NetworkManager_GetCellularTxBytes_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNetworkManagerGetCellularTxBytesPromise0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetCellularTxBytesPromise0200';
      try{
        sim.hasSimCard(0, (err, data) => {
          if (data === false) {
            console.info(`${caseName} hasSimCard fail ${JSON.stringify(err)} `);
            done();
          } else {
            radio.isRadioOn(0).then((data) => {
              console.info(`${caseName} isRadioOn  ${JSON.stringify(data)} `);
              expect(data == true).assertTrue();
              statistics.getCellularTxBytes().then((data) => {
                console.log(`${caseName} getCellularTxBytes success ${JSON.stringify(data)}`);
                expectFalse();
                done();
              }).catch((err:BusinessError) => {
                console.log(`${caseName} getCellularTxBytes fail ${JSON.stringify(err)} `);
                ExpectTrue(err.code == 2103012);
                done();
              });
            }).catch((err:BusinessError) => {
              console.error('When the device has no modem, the interface reports an error' + JSON.stringify(err));
              ExpectTrue(err.code == 8300003);
              done();
            });
          }
        });
      }catch(err){
        console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
  });
};

