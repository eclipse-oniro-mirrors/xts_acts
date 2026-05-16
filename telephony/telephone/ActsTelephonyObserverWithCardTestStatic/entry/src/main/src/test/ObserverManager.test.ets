/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index'
import observer from '@ohos.telephony.observer';
import data from '@ohos.telephony.data';
import sim from '@ohos.telephony.sim';
import call from '@ohos.telephony.call';
import radio from '@ohos.telephony.radio';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'ObserverTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}
const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, '%{public}s', 'test failed');
  }
}

export default function ObserverManagerTest() {
  describe("ObserverManagerTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
  
    /**
     * @tc.name   testTelephonyObserverCellularDataConnectionStateChangeOff_static_0100
     * @tc.number SUB_Telephony_Observer_CellularDataConnectionStateChangeOff_0100
     * @tc.desc   Remove subscription cellular data link connection status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverCellularDataConnectionStateChangeOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverCellularDataConnectionStateChangeOff_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        observer.onCellularDataConnectionStateChange((data: observer.DataConnectionStateInfo) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data !== null);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
        observer.offCellularDataConnectionStateChange();
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testTelephonyObserverCellularDataConnectionStateChangeOff_static_0200
     * @tc.number SUB_Telephony_Observer_CellularDataConnectionStateChangeOff_0200
     * @tc.desc   Remove subscription cellular data link connection status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyObserverCellularDataConnectionStateChangeOff_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverCellularDataConnectionStateChangeOff_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let callback: (data: observer.DataConnectionStateInfo) => void = (data: observer.DataConnectionStateInfo) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data !== null);
        };
        observer.onCellularDataConnectionStateChange(callback);
        observer.offCellularDataConnectionStateChange(callback);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testTelephonyObserverCellularDataConnectionStateChangeOff_static_0400
     * @tc.number SUB_Telephony_Observer_CellularDataConnectionStateChangeOff_0400
     * @tc.desc   Remove subscription cellular data link connection status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverCellularDataConnectionStateChangeOff_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverCellularDataConnectionStateChangeOff_static_0400';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let callback: (data: observer.DataConnectionStateInfo) => void = (data: observer.DataConnectionStateInfo) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data != null);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        };
        observer.onCellularDataConnectionStateChange(callback);
        observer.offCellularDataConnectionStateChange(callback);
        observer.offCellularDataConnectionStateChange(callback);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testTelephonyObserverCellularDataConnectionStateChangeOff_static_0500
     * @tc.number SUB_Telephony_Observer_CellularDataConnectionStateChangeOff_0500
     * @tc.desc   Remove subscription cellular data link connection status.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverCellularDataConnectionStateChangeOff_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverCellularDataConnectionStateChangeOff_static_0500';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let callback: (data: observer.DataConnectionStateInfo) => void = (data: observer.DataConnectionStateInfo) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data !== null && data !== undefined);
          ExpectTrue(data.state !== null && data.state !== undefined);
          ExpectTrue(data.network !== null && data.network !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        };
        observer.onCellularDataConnectionStateChange(callback);
        observer.offCellularDataConnectionStateChange(callback);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testTelephonyObserverCellularDataConnectionStateChangeOff_static_0600
     * @tc.number SUB_Telephony_Observer_CellularDataConnectionStateChangeOff_0600
     * @tc.desc   test error code 8300001 of onCellularDataConnectionStateChange.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverCellularDataConnectionStateChangeOff_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverCellularDataConnectionStateChangeOff_static_0600';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let options: observer.ObserverOptions = {
          slotId: 3
        };
        observer.onCellularDataConnectionStateChange(options, (data: observer.DataConnectionStateInfo) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(false);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue((error as BusinessError).code === 8300001);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testTelephonyObserverCellularDataFlowChangeOff_static_0100
     * @tc.number SUB_Telephony_Observer_CellularDataFlowChangeOff_0100
     * @tc.desc   Remove the uplink and downlink data flow status of subscribed cellular data services.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverCellularDataFlowChangeOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverCellularDataFlowChangeOff_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        observer.onCellularDataFlowChange((data: observer.DataFlowType) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data !== null);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
        observer.offCellularDataFlowChange();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testTelephonyObserverCellularDataFlowChangeOff_static_0200
     * @tc.number SUB_Telephony_Observer_CellularDataFlowChangeOff_0200
     * @tc.desc   Remove the uplink and downlink data flow status of subscribed cellular data services.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverCellularDataFlowChangeOff_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverCellularDataFlowChangeOff_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let callback: (data: observer.DataFlowType) => void = (data: observer.DataFlowType) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data !== null);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }
        observer.onCellularDataFlowChange(callback);
        observer.offCellularDataFlowChange(callback);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

 
    /**
     * @tc.name   testTelephonyObserverCellularDataFlowChangeOff_static_0400
     * @tc.number SUB_Telephony_Observer_CellularDataFlowChangeOff_0400
     * @tc.desc   Remove the uplink and downlink data flow status of subscribed cellular data services.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverCellularDataFlowChangeOff_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverCellularDataFlowChangeOff_static_0400';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let callback: (data: observer.DataFlowType) => void = (data: observer.DataFlowType) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data !== null);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }
        observer.onCellularDataFlowChange(callback);
        observer.offCellularDataFlowChange(callback);
        observer.offCellularDataFlowChange(callback);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testTelephonyObserverCellularDataFlowChangeOff_static_0500
     * @tc.number SUB_Telephony_Observer_CellularDataFlowChangeOff_0500
     * @tc.desc   Remove the uplink and downlink data flow status of subscribed cellular data services.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverCellularDataFlowChangeOff_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverCellularDataFlowChangeOff_static_0500';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let callback: (data: observer.DataFlowType) => void = (data: observer.DataFlowType) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data !== null && data !== undefined);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }
        observer.onCellularDataFlowChange(callback);
        observer.offCellularDataFlowChange(callback);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testTelephonyObserverCellularDataFlowChangeOff_static_0600
     * @tc.number SUB_Telephony_Observer_CellularDataFlowChangeOff_0600
     * @tc.desc   Remove the uplink and downlink data flow status of subscribed cellular data services.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverCellularDataFlowChangeOff_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverCellularDataFlowChangeOff_static_0600';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let options: observer.ObserverOptions = {
          slotId: 0
        };
        observer.onCellularDataFlowChange(options, (data: observer.DataFlowType) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data === 0 || data === 4);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
        observer.offCellularDataFlowChange();
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testTelephonyObserverCellularDataFlowChangeOff_static_0700
     * @tc.number SUB_Telephony_Observer_CellularDataFlowChangeOff_0700
     * @tc.desc   test error code 8300001 of onCellularDataFlowChange.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverCellularDataFlowChangeOff_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverCellularDataFlowChangeOff_static_0700';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let options: observer.ObserverOptions = {
          slotId: 3
        };
        observer.onCellularDataFlowChange(options, (data: observer.DataFlowType) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(false);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue((error as BusinessError).code === 8300001);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

  })
}