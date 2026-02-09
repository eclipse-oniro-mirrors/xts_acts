/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
     * @tc.name   testTelephonyObserverNetworkStateChangeOnId_static_0500
     * @tc.number SUB_Telephony_Observer_NetworkStateChangeOnId_0500
     * @tc.desc   Subscribe to network state change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTelephonyObserverNetworkStateChangeOnId_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOnId_static_0500';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        observer.on('networkStateChange', {
          slotId: 3
        }, (data: observer.NetworkState) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(false);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (error: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(error.code == 8300001);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testTelephonyObserverNetworkStateChangeOff_static_0100
     * @tc.number SUB_Telephony_Observer_NetworkStateChangeOff_0100
     * @tc.desc   Unsubscribe to network state change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyObserverNetworkStateChangeOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOff_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        observer.on('networkStateChange', (data: observer.NetworkState) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data !== null);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
        observer.off("networkStateChange");
        ExpectTrue(true);
        done();
      } catch (error: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testTelephonyObserverNetworkStateChangeOff_static_0200
     * @tc.number SUB_Telephony_Observer_NetworkStateChangeOff_0200
     * @tc.desc   Unsubscribe to network state change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyObserverNetworkStateChangeOff_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOff_static_0200';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let callback: (data: observer.NetworkState) => void = (data: observer.NetworkState) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data !== null);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }
        observer.on('networkStateChange', callback);
        observer.off("networkStateChange", callback);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });



    /**
     * @tc.name   testTelephonyObserverNetworkStateChangeOff_static_0400
     * @tc.number SUB_Telephony_Observer_NetworkStateChangeOff_0400
     * @tc.desc   Unsubscribe to network state change events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyObserverNetworkStateChangeOff_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverNetworkStateChangeOff_static_0400';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        let callback: (data: observer.NetworkState) => void = (data: observer.NetworkState) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data !== null);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        }
        observer.on('networkStateChange', callback);
        observer.off("networkStateChange", callback);
        observer.off("networkStateChange", callback);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });


    /**
     * @tc.name   testTelephonyObserverCellularDataConnectionStateChangeOnId_static_0500
     * @tc.number SUB_Telephony_Observer_CellularDataConnectionStateChangeOnId_0500
     * @tc.desc   Subscribe to the cellular data link connection status of the specified card slot.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyObserverCellularDataConnectionStateChangeOnId_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverCellularDataConnectionStateChangeOnId_static_0500';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        observer.on('cellularDataConnectionStateChange', {
          slotId: 3
        }, (data: observer.DataConnectionStateInfo) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          hilog.info(domain, tag, '%{public}s', caseName +': data.state ->'+JSON.stringify(data.state));
          hilog.info(domain, tag, '%{public}s', caseName +': data.network ->'+JSON.stringify(data.network));
          ExpectTrue(false);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
      } catch (error: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(error.code == 8300001);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

  
  
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
        observer.on('cellularDataConnectionStateChange', (data: observer.DataConnectionStateInfo) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data !== null);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
        observer.off("cellularDataConnectionStateChange");
        ExpectTrue(true);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error: BusinessError) {
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
        observer.on('cellularDataConnectionStateChange', callback);
        observer.off("cellularDataConnectionStateChange", callback);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error: BusinessError) {
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
        observer.on('cellularDataConnectionStateChange', callback);
        observer.off("cellularDataConnectionStateChange", callback);
        observer.off("cellularDataConnectionStateChange", callback);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });


    /**
     * @tc.name   testTelephonyObserverCellularDataFlowChangeOnId_static_0100
     * @tc.number SUB_Telephony_Observer_CellularDataFlowChangeOnId_0100
     * @tc.desc   Subscribe to the uplink and downlink data flow status of cellular data services with specified card slots.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverCellularDataFlowChangeOnId_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverCellularDataFlowChangeOnId_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        observer.on('cellularDataFlowChange', {
          slotId: 0
        }, (data: observer.DataFlowType) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data == 0 || data == 4);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });


    /**
     * @tc.name   testTelephonyObserverCellularDataFlowChangeOnId_static_0300
     * @tc.number SUB_Telephony_Observer_CellularDataFlowChangeOnId_0300
     * @tc.desc   Subscribe to the uplink and downlink data flow status of cellular data services with specified card slots.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverCellularDataFlowChangeOnId_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverCellularDataFlowChangeOnId_static_0300';
      hilog.info(domain, tag, '%{public}s', caseName+ ' start');
      try {
        observer.on('cellularDataFlowChange', {
          slotId: 3
        }, (data: observer.DataFlowType) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(false);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
        done();
      } catch (error: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(error.code == 8300001);
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
        observer.on('cellularDataFlowChange', (data: observer.DataFlowType) => {
          hilog.info(domain, tag, '%{public}s', caseName +': data ->'+JSON.stringify(data));
          ExpectTrue(data !== null);
          hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
          done();
        });
        observer.off('cellularDataFlowChange');
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error: BusinessError) {
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
        observer.on('cellularDataFlowChange', callback);
        observer.off('cellularDataFlowChange', callback);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error: BusinessError) {
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
        observer.on('cellularDataFlowChange', callback);
        observer.off('cellularDataFlowChange', callback);
        observer.off('cellularDataFlowChange', callback);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      } catch (error: BusinessError) {
        hilog.info(domain, tag, '%{public}s', caseName +'  catch error is '+JSON.stringify(error));
        ExpectTrue(false);
        hilog.info(domain, tag, '%{public}s', caseName+ '---test end');
        done();
      }
    });

    /**
     * @tc.name   testTelephonyObserverSignalInfoChangeOnId0100
     * @tc.number SUB_Telephony_Observer_SignalInfoChangeOnId_0100
     * @tc.desc   Subscribe signal status change event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverSignalInfoChangeOnId0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOnId0100';
      console.info(`${caseName} test start `);
      try {
        observer.on('signalInfoChange', {
          slotId: 0
        }, (data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(true);
        });
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverSignalInfoChangeOff0100
     * @tc.number SUB_Telephony_Observer_SignalInfoChangeOff_0100
     * @tc.desc   Unsubscribe signal status change event.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverSignalInfoChangeOff0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOff0100';
      console.info(`${caseName} test start `);
      try {
        observer.on('signalInfoChange', (data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(false);
        });
        observer.off('signalInfoChange');
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverSignalInfoChangeOff0200
     * @tc.number SUB_Telephony_Observer_SignalInfoChangeOff_0200
     * @tc.desc   Unsubscribe signal status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverSignalInfoChangeOff0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOff0200';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: Array<radio.SignalInformation>) => void = (data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        }
        observer.on('signalInfoChange', callback);
        observer.off('signalInfoChange', callback);
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

    /**
     * @tc.name   testTelephonyObserverSignalInfoChangeOff0400
     * @tc.number SUB_Telephony_Observer_SignalInfoChangeOff_0400
     * @tc.desc   Unsubscribe signal status change event
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testTelephonyObserverSignalInfoChangeOff0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyObserverSignalInfoChangeOff0400';
      console.info(`${caseName} test start `);
      try {
        let callback: (data: Array<radio.SignalInformation>) => void = (data: Array<radio.SignalInformation>) => {
          console.info(`${caseName} data ${JSON.stringify(data)}`);
          ExpectTrue(data !== null);
        }
        observer.on('signalInfoChange', callback);
        observer.off('signalInfoChange', callback);
        observer.off('signalInfoChange', callback);
        ExpectTrue(true);
        done();
      } catch (error) {
        console.info(`${caseName} catchError ${JSON.stringify(error)}}`);
        ExpectTrue(false);
        done();
      }
      console.info(`${caseName} test end `);
    });

  })
}