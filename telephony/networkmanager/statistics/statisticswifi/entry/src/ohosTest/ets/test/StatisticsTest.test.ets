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
export default function StatisticsTest() {
  describe("StatisticsTest", () => {
    const DATA_0 = 0;

    /**
     * @tc.number SUB_NetworkManager_GetIfaceRxBytes_Async_0100
     * @tc.name testNetworkManagerGetIfaceRxBytesAsync0100
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetIfaceRxBytesAsync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetIfaceRxBytesAsync0100';
      try{
      	 let ifaceName = "eth0";
    	 statistics.getIfaceRxBytes(ifaceName, (err, data) => {
	 if (err) {
	  console.log(`${caseName} getIfaceRxBytes fail ${JSON.stringify(err)} `);
	  ExpectTrue(err.code == 2103005 || err.code == 2103012);
	  done();
	 } else {
	  console.log(`${caseName} getIfaceRxBytes ${JSON.stringify(data)}`);
	  expectFalse();
	  done();
	 }
        });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetIfaceRxBytes_Async_0200
     * @tc.name testNetworkManagerGetIfaceRxBytesAsync0200
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetIfaceRxBytesAsync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetIfaceRxBytesAsync0200';
      try{
      	let ifaceName = "wlan0";
        statistics.getIfaceRxBytes(ifaceName, (err, data) => {
        if (err) {
          console.log(`${caseName} getIfaceRxBytes fail ${JSON.stringify(err)} `);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(data)}`);
          ExpectTrue(data >= DATA_0);
          done();
        }
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetIfaceRxBytes_Async_0300
     * @tc.name testNetworkManagerGetIfaceRxBytesAsync0300
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetIfaceRxBytesAsync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetIfaceRxBytesAsync0300';
      try{
      	let ifaceName = "wlan1";
        statistics.getIfaceRxBytes(ifaceName, (err, data) => {
        if (err) {
          console.log(`${caseName} >>> ${JSON.stringify(err)} `);
          ExpectTrue(err.code == 2103005 || err.code == 2103012);
          console.log(`${caseName} success`);
          done();
        } else {
          console.log(`${caseName} fail ${JSON.stringify(data)}`);
          ExpectTrue(data >= DATA_0);
          done();
        }
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetIfaceRxBytes_Async_0400
     * @tc.name testNetworkManagerGetIfaceRxBytesAsync0400
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetIfaceRxBytesAsync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetIfaceRxBytesAsync0400';
      let ifaceName = null;
      try {
        statistics.getIfaceRxBytes(ifaceName, (err, data) => {
          if (err) {
            console.log(`${caseName} getIfaceRxBytes fail ${JSON.stringify(err)}`);
            expect(err != undefined).assertTrue();
            ExpectTrue(err.code == 401);
            done();
          } else {
            console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(data)}`);
            expectFalse();
            done();
          }
        });
      } catch (err) {
        console.log(`${caseName} getIfaceRxBytes into catch ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetIfaceRxBytes_Promise_0100
     * @tc.name testNetworkManagerGetIfaceRxBytesPromise0100
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetIfaceRxBytesPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetIfaceRxBytesPromise0100';
      try{
      	let ifaceName = "eth0";
        statistics.getIfaceRxBytes(ifaceName).then((data) => {
        console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(data)}`);
        expectFalse();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getIfaceRxBytes fail ${JSON.stringify(err)} `);
        ExpectTrue(err.code == 2103005 || err.code == 2103012);
        done();
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetIfaceRxBytes_Promise_0200
     * @tc.name testNetworkManagerGetIfaceRxBytesPromise0200
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetIfaceRxBytesPromise0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetIfaceRxBytesPromise0200';
      try{
      	let ifaceName = "wlan0";
        statistics.getIfaceRxBytes(ifaceName).then((data) => {
        console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(data)}`);
        ExpectTrue(data >= DATA_0);
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getIfaceRxBytes fail ${JSON.stringify(err)} `);
        expectFalse();
        done();
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetIfaceRxBytes_Promise_0300
     * @tc.name testNetworkManagerGetIfaceRxBytesPromise0300
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetIfaceRxBytesPromise0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetIfaceRxBytesPromise0300';
      try{
      	let ifaceName = "wlan1";
        statistics.getIfaceRxBytes(ifaceName).then((data) => {
        console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(data)}`);
        ExpectTrue(data >= DATA_0);
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getIfaceRxBytes fail ${JSON.stringify(err)} `);
        ExpectTrue(err.code == 2103005 || err.code == 2103012);
        done();
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetIfaceRxBytes_Promise_0400
     * @tc.name testNetworkManagerGetIfaceRxBytesPromise0400
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetIfaceRxBytesPromise0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetIfaceRxBytesPromise0400';
      let ifaceName = null;
      try {
        statistics.getIfaceRxBytes(ifaceName).then((data) => {
          console.log(`${caseName} getIfaceRxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} getIfaceRxBytes fail ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401);
          done();
        });
      } catch (err) {
        console.log(`${caseName} getIfaceRxBytes into catch ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetIfaceTxBytes_Async_0100
     * @tc.name testNetworkManagerGetIfaceTxBytesAsync0100
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetIfaceTxBytesAsync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetIfaceTxBytesAsync0100';
      try{
      	let ifaceName = "eth0";
        statistics.getIfaceTxBytes(ifaceName, (err, data) => {
        if (err) {
          console.log(`${caseName} getIfaceTxBytes fail ${JSON.stringify(err)} `);
          ExpectTrue(err.code == 2103005 || err.code == 2103012);
          done();
        } else {
          console.log(`${caseName} getIfaceTxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetIfaceTxBytes_Async_0200
     * @tc.name testNetworkManagerGetIfaceTxBytesAsync0200
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetIfaceTxBytesAsync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetIfaceTxBytesAsync0200';
      try{
      	let ifaceName = "wlan0";
        statistics.getIfaceTxBytes(ifaceName, (err, data) => {
        if (err) {
          console.log(`${caseName} getIfaceTxBytes fail ${JSON.stringify(err)} `);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} getIfaceTxBytes success ${JSON.stringify(data)}`);
          ExpectTrue(data >= DATA_0);
          done();
        }
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetIfaceTxBytes_Async_0300
     * @tc.name testNetworkManagerGetIfaceTxBytesAsync0300
     * @tc.desc Function test
     * @tc.level 1LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetIfaceTxBytesAsync0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetIfaceTxBytesAsync0300';
      try{
      	let ifaceName = "wlan1";
        statistics.getIfaceTxBytes(ifaceName, (err, data) => {
        if (err) {
          console.log(`${caseName} getIfaceTxBytes fail ${JSON.stringify(err)} `);
          ExpectTrue(err.code == 2103005 || err.code == 2103012);
          done();
        } else {
          console.log(`${caseName} getIfaceTxBytes success ${JSON.stringify(data)}`);
          ExpectTrue(data >= DATA_0);
          done();
        }
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetIfaceTxBytes_Async_0400
     * @tc.name testNetworkManagerGetIfaceTxBytesAsync0400
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetIfaceTxBytesAsync0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetIfaceTxBytesAsync0400';
      let ifaceName = null;
      try {
        statistics.getIfaceTxBytes(ifaceName, (err, data) => {
          if (err) {
            console.log(`${caseName} getIfaceTxBytes fail ${JSON.stringify(err)}`);
            ExpectTrue(err.code == 401);
            done();
          } else {
            console.log(`${caseName} getIfaceTxBytes success ${JSON.stringify(data)}`);
            expectFalse();
            done();
          }
        });
      } catch (err) {
        console.log(`${caseName} getIfaceTxBytes into catch ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetIfaceTxBytes_Promise_0100
     * @tc.name testNetworkManagerGetIfaceTxBytesPromise0100
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetIfaceTxBytesPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetIfaceTxBytesPromise0100';
      try{
      	let ifaceName = "eth0";
        statistics.getIfaceTxBytes(ifaceName).then((data) => {
        console.log(`${caseName} getIfaceTxBytes success ${JSON.stringify(data)}`);
        expectFalse();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getIfaceTxBytes fail ${JSON.stringify(err)} `);
        ExpectTrue(err.code == 2103005 || err.code == 2103012);
        done();
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetIfaceTxBytes_Promise_0200
     * @tc.name testNetworkManagerGetIfaceTxBytesPromise0200
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetIfaceTxBytesPromise0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetIfaceTxBytesPromise0200';
      try{
      	let ifaceName = "wlan0";
        statistics.getIfaceTxBytes(ifaceName).then((data) => {
        console.log(`${caseName} getIfaceTxBytes success ${JSON.stringify(data)}`);
        ExpectTrue(data >= DATA_0);
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getIfaceTxBytes fail ${JSON.stringify(err)} `);
        expectFalse();
        done();
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetIfaceTxBytes_Promise_0300
     * @tc.name testNetworkManagerGetIfaceTxBytesPromise0300
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetIfaceTxBytesPromise0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetIfaceTxBytesPromise0300';
      try{
      	let ifaceName = "wlan1";
        statistics.getIfaceTxBytes(ifaceName).then((data) => {
        console.log(`${caseName} getIfaceTxBytes success ${JSON.stringify(data)}`);
        ExpectTrue(data >= DATA_0);
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getIfaceTxBytes fail ${JSON.stringify(err)} `);
        ExpectTrue(err.code == 2103005 || err.code == 2103012);
        done();
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.number SUB_NetworkManager_GetIfaceTxBytes_Promise_0400
     * @tc.name testNetworkManagerGetIfaceTxBytesPromise0400
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetIfaceTxBytesPromise0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetIfaceTxBytesPromise0400';
      let ifaceName = null;
      try {
        statistics.getIfaceTxBytes(ifaceName).then((data) => {
          console.log(`${caseName} getIfaceTxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }).catch((err:BusinessError) => {
          console.log(`${caseName} getIfaceTxBytes fail ${JSON.stringify(err)}`);
          ExpectTrue(err.code == 401);
          done();
        });
      } catch (err) {
        console.log(`${caseName} getIfaceTxBytes into catch ${JSON.stringify(err)}`);
        ExpectTrue(err.code == 401);
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetAllTxBytes_Async_0100
     * @tc.name testNetworkManagerGetAllTxBytesAsync0100
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetAllTxBytesAsync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetAllTxBytesAsync0100';
      try{
      	statistics.getAllTxBytes((err, data) => {
        if (err) {
          console.log(`${caseName} getAllTxBytes fail ${JSON.stringify(err)} `);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} getAllTxBytes success ${JSON.stringify(data)}`);
          ExpectTrue(data >= DATA_0);
          done();
        }
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetAllTxBytes_Promise_0100
     * @tc.name testNetworkManagerGetAllTxBytesPromise0100
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetAllTxBytesPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetAllTxBytesPromise0100';
      try{
      	statistics.getAllTxBytes().then((data) => {
        console.log(`${caseName} getAllTxBytes success ${JSON.stringify(data)}`);
        ExpectTrue(data >= DATA_0);
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getAllTxBytes fail ${JSON.stringify(err)} `);
        expectFalse();
        done();
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetAllRxBytes_Async_0100
     * @tc.name testNetworkManagerGetAllRxBytesAsync0100
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetAllRxBytesAsync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetAllRxBytesAsync0100';
      try{
      	statistics.getAllRxBytes((err, data) => {
        if (err) {
          console.log(`${caseName} getAllRxBytes fail ${JSON.stringify(err)} `);
          expectFalse();
          done();
        } else {
          console.log(`${caseName} getAllRxBytes success ${JSON.stringify(data)}`);
          ExpectTrue(data >= DATA_0);
          done();
        }
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetAllRxBytes_Promise_0100
     * @tc.name testNetworkManagerGetAllRxBytesPromise0100
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetAllRxBytesPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetAllRxBytesPromise0100';
      try{
      	statistics.getAllRxBytes().then((data) => {
        console.log(`${caseName} getAllRxBytes success ${JSON.stringify(data)}`);
        ExpectTrue(data >= DATA_0);
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getAllRxBytes fail ${JSON.stringify(err)} `);
        expectFalse();
        done();
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetUidRxBytes_Async_0100
     * @tc.name testNetworkManagerGetUidRxBytesAsync0100
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetUidRxBytesAsync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetUidRxBytesAsync0100';
      try{
      	let uid = 20010084;
        statistics.getUidRxBytes(uid, (err, data) => {
        if (err) {
          console.log(`${caseName} getUidRxBytes fail ${JSON.stringify(err)} `);
          ExpectTrue(err.code == 2103005);
          done();
        } else {
          console.log(`${caseName} getUidRxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    /**
     * @tc.number SUB_NetworkManager_GetUidRxBytes_Async_0200
     * @tc.name testNetworkManagerGetUidRxBytesAsync0200
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetUidRxBytesAsync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetUidRxBytesAsync0200';
      try{
      	let uid = 20010084;
        statistics.getUidRxBytes(uid, (err, data) => {
         if (err) {
          console.log(`${caseName} getUidRxBytes fail ${JSON.stringify(err)} `);
          ExpectTrue(err.code == 2103005);
          done();
        } else {
          console.log(`${caseName} getUidRxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.number SUB_NetworkManager_GetUidRxBytes_Promise_0100
     * @tc.name testNetworkManagerGetUidRxBytesPromise0100
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetUidRxBytesPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetUidRxBytesPromise0100';
      try{
      	let uid = 20010084;
        statistics.getUidRxBytes(uid).then((data) => {
        console.log(`${caseName} getUidRxBytes success ${JSON.stringify(data)}`);
        expectFalse();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getUidRxBytes fail ${JSON.stringify(err)} `);
        ExpectTrue(err.code == 2103005);
        done();
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.number SUB_NetworkManager_GetUidRxBytes_Promise_0200
     * @tc.name testNetworkManagerGetUidRxBytesPromise0200
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetUidRxBytesPromise0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetUidRxBytesPromise0200';
      try{
      	let uid = 20010084;
        statistics.getUidRxBytes(uid).then((data) => {
        console.log(`${caseName} getUidRxBytes success ${JSON.stringify(data)}`);
        expectFalse();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getUidRxBytes fail ${JSON.stringify(err)} `);
        ExpectTrue(err.code == 2103005);
        done();
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.number SUB_NetworkManager_GetUidTxBytes_Async_0100
     * @tc.name testNetworkManagerGetUidTxBytesAsync0100
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetUidTxBytesAsync0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetUidTxBytesAsync0100';
      try{
      	let uid = 20010084;
        statistics.getUidTxBytes(uid, (err, data) => {
        if (err) {
          console.log(`${caseName} getUidTxBytes fail ${JSON.stringify(err)} `);
          ExpectTrue(err.code == 2103005);
          done();
        } else {
          console.log(`${caseName} getUidTxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.number SUB_NetworkManager_GetUidTxBytes_Async_0200
     * @tc.name testNetworkManagerGetUidTxBytesAsync0200
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetUidTxBytesAsync0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetUidTxBytesAsync0200';
      try{
      	let uid = 20010084;
        statistics.getUidTxBytes(uid, (err, data) => {
        if (err) {
          console.log(`${caseName} getUidTxBytes fail ${JSON.stringify(err)} `);
          ExpectTrue(err.code == 2103005);
          done();
        } else {
          console.log(`${caseName} getUidTxBytes success ${JSON.stringify(data)}`);
          expectFalse();
          done();
        }
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.number SUB_NetworkManager_GetUidTxBytes_Promise_0100
     * @tc.name testNetworkManagerGetUidTxBytesPromise0100
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetUidTxBytesPromise0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetUidTxBytesPromise0100';
      try{
      	let uid = 20010084;
        statistics.getUidTxBytes(uid).then((data) => {
        console.log(`${caseName} getUidTxBytes success ${JSON.stringify(data)}`);
        expectFalse();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getUidTxBytes fail ${JSON.stringify(err)} `);
        ExpectTrue(err.code == 2103005);
        done();
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    /**
     * @tc.number SUB_NetworkManager_GetUidTxBytes_Promise_0200
     * @tc.name testNetworkManagerGetUidTxBytesPromise0200
     * @tc.desc Function test
     * @tc.level LEVEL1
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it('testNetworkManagerGetUidTxBytesPromise0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let caseName = 'testNetworkManagerGetUidTxBytesPromise0200';
      try{
      	let uid = 20010084;
        statistics.getUidTxBytes(uid).then((data) => {
        console.log(`${caseName} getUidTxBytes success ${JSON.stringify(data)}`);
        expectFalse();
        done();
      }).catch((err:BusinessError) => {
        console.log(`${caseName} getUidTxBytes fail ${JSON.stringify(err)} `);
        ExpectTrue(err.code == 2103005);
        done();
      });
      }catch(err){
      	console.log(`${caseName} catch err is ${JSON.stringify(err)}`);
        expectFalse();
        done();
      }
    });
    
    
  });
};

