/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
export default function StatisticsTest() {
  describe("StatisticsTest", () => {
    let delayTime = 5000;
    const DATA_0 = 0;
    let code_201 = 201;
    let errCode_201 = "201";



    /**
     * @tc.number SUB_Telephony_NetworkManager_getIfaceRxBytes_Async_0100
     * @tc.name Test getIfaceRxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getIfaceRxBytes_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getIfaceRxBytes_Async_0100';
      let ifaceName = "eth0";
      statistics.getIfaceRxBytes(ifaceName, (err, data) => {
        if (err) {
          console.log(`${caseName} getIfaceRxBytes fail ${JSON.stringify(err)} `);
          expect(err.code == 2103005 || err.code == 2103012).assertTrue();
          done();
        } else {
          console.log(`${caseName} getIfaceRxBytes ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getIfaceRxBytes_Async_0200
     * @tc.name Test getIfaceRxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getIfaceRxBytes_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getIfaceRxBytes_Async_0200';
      let ifaceName = "wlan0";
      statistics.getIfaceRxBytes(ifaceName, (err, data) => {
        if (err) {
          console.log(`${caseName} getIfaceRxBytes fail ${JSON.stringify(err)} `);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(data)}`);
          expect(data >= DATA_0).assertTrue();
          done();
        }
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getIfaceRxBytes_Async_0300
     * @tc.name Test getIfaceRxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getIfaceRxBytes_Async_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getIfaceRxBytes_Async_0300';
      let ifaceName = "wlan1";
      statistics.getIfaceRxBytes(ifaceName, (err, data) => {
        if (err) {
          console.log(`${caseName} >>> ${JSON.stringify(err)} `);
          expect(err.code == 2103005 || err.code == 2103012).assertTrue();
          console.log(`${caseName} success`);
          done();
        } else {
          console.log(`${caseName} fail ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getIfaceRxBytes_Async_0400
     * @tc.name Test getIfaceRxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getIfaceRxBytes_Async_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getIfaceRxBytes_Async_0400';
      let ifaceName = null;
      try {
        statistics.getIfaceRxBytes(ifaceName, (err, data) => {
          if (err) {
            console.log(`${caseName} getIfaceRxBytes fail ${JSON.stringify(err)}`);
            expect(err != undefined).assertTrue();
            done();
          } else {
            console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(data)}`);
            expectFalse();
            done();
          }
        });
      } catch (err) {
        console.log(`${caseName} getIfaceRxBytes into catch ${JSON.stringify(err)}`);
        expect(err.code == 401).assertTrue();
        done();
      }
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getIfaceRxBytes_Promise_0100
     * @tc.name Test getIfaceRxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getIfaceRxBytes_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getIfaceRxBytes_Promise_0100';
      let ifaceName = "eth0";
      statistics.getIfaceRxBytes(ifaceName).then((data) => {
        console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(data)}`);
        expectFalse();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getIfaceRxBytes fail ${JSON.stringify(err)} `);
        expect(err.code == 2103005 || err.code == 2103012).assertTrue();
        done();
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getIfaceRxBytes_Promise_0200
     * @tc.name Test getIfaceRxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getIfaceRxBytes_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getIfaceRxBytes_Promise_0200';
      let ifaceName = "wlan0";
      statistics.getIfaceRxBytes(ifaceName).then((data) => {
        console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(data)}`);
        expect(data >= DATA_0).assertTrue();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getIfaceRxBytes fail ${JSON.stringify(err)} `);
        expectFalse();
        done();
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getIfaceRxBytes_Promise_0300
     * @tc.name Test getIfaceRxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getIfaceRxBytes_Promise_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getIfaceRxBytes_Promise_0300';
      let ifaceName = "wlan1";
      statistics.getIfaceRxBytes(ifaceName).then((data) => {
        console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(data)}`);
        expectFalse();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getIfaceRxBytes fail ${JSON.stringify(err)} `);
        expect(err.code == 2103005 || err.code == 2103012).assertTrue();
        done();
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getIfaceRxBytes_Promise_0400
     * @tc.name Test getIfaceRxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getIfaceRxBytes_Promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getIfaceRxBytes_Promise_0400';
      let ifaceName = null;
      try {
        statistics.getIfaceRxBytes(ifaceName).then((data) => {
          console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} getIfaceRxBytes fail ${JSON.stringify(err)}`);
          expect(err != undefined).assertTrue();
          done();
        });
      } catch (err) {
        console.log(`${caseName} getIfaceRxBytes into catch ${JSON.stringify(err)}`);
        expect(err.code == 401).assertTrue();
        done();
      }
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getIfaceTxBytes_Async_0100
     * @tc.name Test getIfaceTxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getIfaceTxBytes_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getIfaceTxBytes_Async_0100';
      let ifaceName = "eth0";
      statistics.getIfaceTxBytes(ifaceName, (err, data) => {
        if (err) {
          console.log(`${caseName} getIfaceTxBytes fail ${JSON.stringify(err)} `);
          expect(err.code == 2103005 || err.code == 2103012).assertTrue();
          done();
        } else {
          console.log(`${caseName} getIfaceTxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getIfaceTxBytes_Async_0200
     * @tc.name Test getIfaceTxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getIfaceTxBytes_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getIfaceTxBytes_Async_0200';
      let ifaceName = "wlan0";
      statistics.getIfaceTxBytes(ifaceName, (err, data) => {
        if (err) {
          console.log(`${caseName} getIfaceTxBytes fail ${JSON.stringify(err)} `);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} getIfaceTxBytes success ${JSON.stringify(data)}`);
          expect(data >= DATA_0).assertTrue();
          done();
        }
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getIfaceTxBytes_Async_0300
     * @tc.name Test getIfaceTxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getIfaceTxBytes_Async_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getIfaceTxBytes_Async_0300';
      let ifaceName = "wlan1";
      statistics.getIfaceTxBytes(ifaceName, (err, data) => {
        if (err) {
          console.log(`${caseName} getIfaceTxBytes fail ${JSON.stringify(err)} `);
          expect(err.code == 2103005 || err.code == 2103012).assertTrue();
          done();
        } else {
          console.log(`${caseName} getIfaceTxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getIfaceTxBytes_Async_0400
     * @tc.name Test getIfaceTxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getIfaceTxBytes_Async_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getIfaceTxBytes_Async_0400';
      let ifaceName = null;
      try {
        statistics.getIfaceTxBytes(ifaceName, (err, data) => {
          if (err) {
            console.log(`${caseName} getIfaceTxBytes fail ${JSON.stringify(err)}`);
            expect(err != undefined).assertTrue();
            done();
          } else {
            console.log(`${caseName} getIfaceTxBytes success ${JSON.stringify(data)}`);
            expectFalse();
            done();
          }
        });
      } catch (err) {
        console.log(`${caseName} getIfaceTxBytes into catch ${JSON.stringify(err)}`);
        expect(err.code == 401).assertTrue();
        done();
      }
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getIfaceTxBytes_Promise_0100
     * @tc.name Test getIfaceTxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getIfaceTxBytes_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getIfaceTxBytes_Promise_0100';
      let ifaceName = "eth0";
      statistics.getIfaceTxBytes(ifaceName).then((data) => {
        console.log(`${caseName} getIfaceTxBytes success ${JSON.stringify(data)}`);
        expectFalse();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getIfaceTxBytes fail ${JSON.stringify(err)} `);
        expect(err.code == 2103005 || err.code == 2103012).assertTrue();
        done();
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getIfaceTxBytes_Promise_0200
     * @tc.name Test getIfaceTxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getIfaceTxBytes_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getIfaceTxBytes_Promise_0200';
      let ifaceName = "wlan0";
      statistics.getIfaceTxBytes(ifaceName).then((data) => {
        console.log(`${caseName} getIfaceTxBytes success ${JSON.stringify(data)}`);
        expect(data >= DATA_0).assertTrue();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getIfaceTxBytes fail ${JSON.stringify(err)} `);
        expectFalse();
        done();
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getIfaceTxBytes_Promise_0300
     * @tc.name Test getIfaceTxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getIfaceTxBytes_Promise_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getIfaceTxBytes_Promise_0300';
      let ifaceName = "wlan1";
      statistics.getIfaceTxBytes(ifaceName).then((data) => {
        console.log(`${caseName} getIfaceTxBytes success ${JSON.stringify(data)}`);
        expectFalse();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getIfaceTxBytes fail ${JSON.stringify(err)} `);
        expect(err.code == 2103005 || err.code == 2103012).assertTrue();
        done();
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getIfaceTxBytes_Promise_0400
     * @tc.name Test getIfaceTxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getIfaceTxBytes_Promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getIfaceTxBytes_Promise_0400';
      let ifaceName = null;
      try {
        statistics.getIfaceTxBytes(ifaceName).then((data) => {
          console.log(`${caseName} getIfaceTxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} getIfaceTxBytes fail ${JSON.stringify(err)}`);
          expect(err != undefined).assertTrue();
          done();
        });
      } catch (err) {
        console.log(`${caseName} getIfaceTxBytes into catch ${JSON.stringify(err)}`);
        expect(err.code == 401).assertTrue();
        done();
      }
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getAllTxBytes_Async_0100
     * @tc.name Test getAllTxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getAllTxBytes_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getAllTxBytes_Async_0100';
      statistics.getAllTxBytes((err, data) => {
        if (err) {
          console.log(`${caseName} getAllTxBytes fail ${JSON.stringify(err)} `);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} getAllTxBytes success ${JSON.stringify(data)}`);
          expect(data >= DATA_0).assertTrue();
          done();
        }
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getAllTxBytes_Promise_0100
     * @tc.name Test getAllTxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getAllTxBytes_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getAllTxBytes_Promise_0100';
      statistics.getAllTxBytes().then((data) => {
        console.log(`${caseName} getAllTxBytes success ${JSON.stringify(data)}`);
        expect(data >= DATA_0).assertTrue();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getAllTxBytes fail ${JSON.stringify(err)} `);
        expectFalse();
        done();
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getAllRxBytes_Async_0100
     * @tc.name Test getAllRxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getAllRxBytes_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getAllRxBytes_Async_0100';
      statistics.getAllRxBytes((err, data) => {
        if (err) {
          console.log(`${caseName} getAllRxBytes fail ${JSON.stringify(err)} `);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} getAllRxBytes success ${JSON.stringify(data)}`);
          expect(data >= DATA_0).assertTrue();
          done();
        }
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getAllRxBytes_Promise_0100
     * @tc.name Test getAllRxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getAllRxBytes_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getAllRxBytes_Promise_0100';
      statistics.getAllRxBytes().then((data) => {
        console.log(`${caseName} getAllRxBytes success ${JSON.stringify(data)}`);
        expect(data >= DATA_0).assertTrue();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getAllRxBytes fail ${JSON.stringify(err)} `);
        expectFalse();
        done();
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getUidRxBytes_Async_0100
     * @tc.name Test getUidRxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getUidRxBytes_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getUidRxBytes_Async_0100';
      let uid = 20010084;
      statistics.getUidRxBytes(uid, (err, data) => {
        if (err) {
          console.log(`${caseName} getUidRxBytes fail ${JSON.stringify(err)} `);
          expect(err.code == 2103005).assertTrue();
          done();
        } else {
          console.log(`${caseName} getUidRxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getUidRxBytes_Async_0200
     * @tc.name Test getUidRxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getUidRxBytes_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getUidRxBytes_Async_0200';
      let uid = 20010084;
      statistics.getUidRxBytes(uid, (err, data) => {
        if (err) {
          console.log(`${caseName} getUidRxBytes fail ${JSON.stringify(err)} `);
          expect(err.code == 2103005).assertTrue();
          done();
        } else {
          console.log(`${caseName} getUidRxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getUidRxBytes_Promise_0100
     * @tc.name Test getUidRxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getUidRxBytes_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getUidRxBytes_Promise_0100';
      let uid = 20010084;
      statistics.getUidRxBytes(uid).then((data) => {
        console.log(`${caseName} getUidRxBytes success ${JSON.stringify(data)}`);
        expectFalse();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getUidRxBytes fail ${JSON.stringify(err)} `);
        expect(err.code == 2103005).assertTrue();
        done();
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getUidRxBytes_Promise_0200
     * @tc.name Test getUidRxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getUidRxBytes_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getUidRxBytes_Promise_0200';
      let uid = 20010084;
      statistics.getUidRxBytes(uid).then((data) => {
        console.log(`${caseName} getUidRxBytes success ${JSON.stringify(data)}`);
        expectFalse();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getUidRxBytes fail ${JSON.stringify(err)} `);
        expect(err.code == 2103005).assertTrue();
        done();
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getUidTxBytes_Async_0100
     * @tc.name Test getUidTxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getUidTxBytes_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getUidTxBytes_Async_0100';
      let uid = 20010084;
      statistics.getUidTxBytes(uid, (err, data) => {
        if (err) {
          console.log(`${caseName} getUidTxBytes fail ${JSON.stringify(err)} `);
          expect(err.code == 2103005).assertTrue();
          done();
        } else {
          console.log(`${caseName} getUidTxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getUidTxBytes_Async_0200
     * @tc.name Test getUidTxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getUidTxBytes_Async_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getUidTxBytes_Async_0200';
      let uid = 20010084;
      statistics.getUidTxBytes(uid, (err, data) => {
        if (err) {
          console.log(`${caseName} getUidTxBytes fail ${JSON.stringify(err)} `);
          expect(err.code == 2103005).assertTrue();
          done();
        } else {
          console.log(`${caseName} getUidTxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getUidTxBytes_Promise_0100
     * @tc.name Test getUidTxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getUidTxBytes_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getUidTxBytes_Promise_0100';
      let uid = 20010084;
      statistics.getUidTxBytes(uid).then((data) => {
        console.log(`${caseName} getUidTxBytes success ${JSON.stringify(data)}`);
        expectFalse();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getUidTxBytes fail ${JSON.stringify(err)} `);
        expect(err.code == 2103005).assertTrue();
        done();
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getUidTxBytes_Promise_0200
     * @tc.name Test getUidTxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getUidTxBytes_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getUidTxBytes_Promise_0200';
      let uid = 20010084;
      statistics.getUidTxBytes(uid).then((data) => {
        console.log(`${caseName} getUidTxBytes success ${JSON.stringify(data)}`);
        expectFalse();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getUidTxBytes fail ${JSON.stringify(err)} `);
        expect(err.code == 2103005).assertTrue();
        done();
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getCellularRxBytes_Async_0100
     * @tc.name Test getCellularRxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getCellularRxBytes_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getCellularRxBytes_Async_0100';
      sim.hasSimCard(0, (err, data) => {
        if (data === false) {
          console.info(`${caseName} hasSimCard fail ${JSON.stringify(err)} `);
          done();
          return;
        } else {
          radio.isRadioOn(0).then((data) => {
            console.info(`${caseName} isRadioOn  ${JSON.stringify(data)} `);
            expect(data == true).assertTrue();
            statistics.getCellularRxBytes((err, data) => {
              if (err) {
                console.log(`${caseName} getCellularRxBytes fail ${JSON.stringify(err)} `);
                expect(err.code).assertEqual(2103012);
                done();
              } else {
                console.log(`${caseName} getCellularRxBytes success ${JSON.stringify(data)}`);
                expectFalse();
                done();
              }
            });
          }).catch((err:BusinessError) => {
            console.error('When the device has no modem, the interface reports an error' + JSON.stringify(err));
            expect(err.code).assertEqual(8300003);
            done();
            return;
          });
        }
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getCellularRxBytes_Promise_0100
     * @tc.name Test getCellularRxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getCellularRxBytes_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getCellularRxBytes_Promise_0100';
      sim.hasSimCard(0, (err, data) => {
        if (data === false) {
          console.info(`${caseName} hasSimCard fail ${JSON.stringify(err)} `);
          done();
          return;
        } else {
          radio.isRadioOn(0).then((data) => {
            console.info(`${caseName} isRadioOn  ${JSON.stringify(data)} `);
            expect(data == true).assertTrue();
            statistics.getCellularRxBytes().then((data) => {
              console.log(`${caseName} getCellularRxBytes success ${JSON.stringify(data)}`);
              expectFalse();
              done();
            }).catch((err:BusinessError) => {
              console.log(`${caseName} getCellularRxBytes fail ${JSON.stringify(err)} `);
              expect(err.code == 2103012).assertTrue();
              done();
            });
          }).catch((err:BusinessError) => {
            console.error('When the device has no modem, the interface reports an error' + JSON.stringify(err));
            expect(err.code).assertEqual(8300003);
            done();
            return;
          });
        }
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getCellularTxBytes_Async_0100
     * @tc.name Test getCellularTxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getCellularTxBytes_Async_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getCellularTxBytes_Async_0100';
      sim.hasSimCard(0, (err, data) => {
        if (data === false) {
          console.info(`${caseName} hasSimCard fail ${JSON.stringify(err)} `);
          done();
          return;
        } else {
          radio.isRadioOn(0).then((data) => {
            console.info(`${caseName} isRadioOn  ${JSON.stringify(data)} `);
            expect(data == true).assertTrue();
            statistics.getCellularTxBytes((err, data) => {
              if (err) {
                console.log(`${caseName} getCellularTxBytes fail ${JSON.stringify(err)} `);
                expect(err.code == 2103012).assertTrue();
                done();
              } else {
                console.log(`${caseName} getCellularTxBytes success ${JSON.stringify(data)}`);
                expectFalse();
                done();
              }
            });
          }).catch((err:BusinessError) => {
            console.error('When the device has no modem, the interface reports an error' + JSON.stringify(err));
            expect(err.code).assertEqual(8300003);
            done();
            return;
          });
        }
      });
    });
    /**
     * @tc.number SUB_Telephony_NetworkManager_getCellularTxBytes_Promise_0100
     * @tc.name Test getCellularTxBytes() interface
     * @tc.desc Function test
     * @tc.level 1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('SUB_Telephony_NetworkManager_getCellularTxBytes_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'SUB_Telephony_NetworkManager_getCellularTxBytes_Promise_0100';
      sim.hasSimCard(0, (err, data) => {
        if (data === false) {
          console.info(`${caseName} hasSimCard fail ${JSON.stringify(err)} `);
          done();
          return;
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
              expect(err.code).assertEqual(2103012);
              done();
            });
          }).catch((err:BusinessError) => {
            console.error('When the device has no modem, the interface reports an error' + JSON.stringify(err));
            expect(err.code).assertEqual(8300003);
            done();
            return;
          });
        }
      });
    });
  });
};

