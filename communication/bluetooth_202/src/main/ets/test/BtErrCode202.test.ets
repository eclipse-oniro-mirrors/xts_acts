/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import btA2dp from '@ohos.bluetooth.a2dp';
import btHfp from '@ohos.bluetooth.hfp';
import btAccess from '@ohos.bluetooth.access';
import btHid from '@ohos.bluetooth.hid';
import btPan from '@ohos.bluetooth.pan';
import btConnection from '@ohos.bluetooth.connection';
import btBaseProfile from '@ohos.bluetooth.baseProfile';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import { UiComponent, UiDriver, BY, Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, UiDirection, MouseButton, WindowMode, PointerMatrix, UIElementInfo, UIEventObserver } from '@ohos.UiTest'

export default function errCode202Test() {
  function sleep(delay) {
    return new Promise(resovle => setTimeout(resovle, delay))
  }

  async function openPhone() {
    try{
      let drivers = Driver.create();
      console.info('[bluetooth_js] bt driver create:'+ drivers);
      await drivers.delayMs(1000);
      await drivers.wakeUpDisplay();
      await drivers.delayMs(5000);
      await drivers.swipe(1500, 1000, 1500, 100);
      await drivers.delayMs(10000);
    } catch (error) {
      console.info('[bluetooth_js] driver error info:'+ error);
    }
  }

  async function tryToEnableBt() {
    let sta = btAccess.getState();
    switch (sta) {
      case 0:
        btAccess.enableBluetooth();
        await clickRequestPermission();
        await sleep(10000);
        let sta1 = btAccess.getState();
        console.info('[bluetooth_js] bt turn off:' + JSON.stringify(sta1));
        break;
      case 1:
        console.info('[bluetooth_js] bt turning on:' + JSON.stringify(sta));
        await sleep(3000);
        break;
      case 2:
        console.info('[bluetooth_js] bt turn on:' + JSON.stringify(sta));
        break;
      case 3:
        btAccess.enableBluetooth();
        await clickRequestPermission();
        await sleep(10000);
        let sta2 = btAccess.getState();
        console.info('[bluetooth_js] bt turning off:' + JSON.stringify(sta2));
        break;
      default:
        console.info('[bluetooth_js] enable success');
    }
  }

  async function clickRequestPermission() {
    try {
        console.info('[bluetooth_js] clickRequestPermission start');
        let driver = Driver.create();
        await driver.delayMs(3000);
        let button = await driver.findComponent(ON.text("允许"));
        await button.click();
        await driver.delayMs(3000);
        console.info('[bluetooth_js] clickRequestPermission end');
    } catch (err) {
        console.info('[bluetooth_js] clickRequestPermission failed');
    }
    }

  let a2dpSrc = null;
  let hfpSrc = null;
  let hidSrc = null;
  let panSrc = null;
  describe('errCode202Test', function() {
    beforeAll(async function (done) {
      await openPhone();
      await clickRequestPermission();
      a2dpSrc = btA2dp.createA2dpSrcProfile();
      hfpSrc = btHfp.createHfpAgProfile();
      hidSrc = btHid.createHidHostProfile();
      panSrc = btPan.createPanProfile();
      console.info('beforeAll called')
      done();
    })
    beforeEach(async function (done) {
      await tryToEnableBt();
      console.info('beforeEach called')
      done();
    })
    afterEach(function () {
      console.info('afterEach called')
    })
    afterAll(function () {
      console.info('afterAll called')
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_A2DP_0100
     * @tc.name test connect
     * @tc.desc Test connect of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_A2DP_0100', 0, async function (done) {
      try {
        console.info("[bluetooth_js] createA2dpSrcProfile result: " + a2dpSrc);
        expect(true).assertEqual(a2dpSrc != null);
        console.info("[bluetooth_js] SUB_COMMUNICATION_BLUETOOTH_A2DP_0100 testcase start.");
        a2dpSrc.connect('00:11:22:33:44:55');
        console.info("[bluetooth_js] SUB_COMMUNICATION_BLUETOOTH_A2DP_0100 testcase end.");
      } catch (error) {
        console.info("[bluetooth_js] error code A2DP 0100 -> " + error.code + "error info A2DP 0100 -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_A2DP_0200
     * @tc.name test disconnect
     * @tc.desc Test disconnect of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_A2DP_0200', 0, async function (done) {
      try {
        console.info("[bluetooth_js] SUB_COMMUNICATION_BLUETOOTH_A2DP_0200 testcase start.");
        a2dpSrc.disconnect('00:11:22:33:44:55');
        console.info("[bluetooth_js] SUB_COMMUNICATION_BLUETOOTH_A2DP_0200 testcase end.");
      } catch (error) {
        console.info("[bluetooth_js] error code A2DP 0200 -> " + error.code + "error info A2DP 0200 -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0100', 0, async function (done) {
      try {
        function pairCredDev() {
          return new Promise<void>((resolve,reject) => {
            btConnection.pairCredibleDevice('22:33:44:55:66:77', btConnection.BluetoothTransport.TRANSPORT_BR_EDR, (err, data)=> {
              if (err) {
                console.info('pairCredDev failed' + err.code);
                reject(err.code);
              } else
              {
                console.info('[bluetooth_js]pairCredDev info:'+JSON.stringify(data));
              }
              resolve();
            });
          });
        }
        await pairCredDev().then((data) => {
          console.info("[bluetooth_js]01 connection done");
          done();
        }).catch(e => {
          console.info("[bluetooth_js]01 connection failed" + e);
          expect(e).assertEqual(202);
          done();
        })
      } catch (error) {
        console.info("[bluetooth_js] error code connection0100 -> " + error.code + "error info connection0100  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0200
     * @tc.name test pairCredibleDevice promise.
     * @tc.desc Test pairCredibleDevice of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0200', 0, async function (done) {
      try {
        await btConnection.pairCredibleDevice('22:33:44:55:66:77', btConnection.BluetoothTransport.TRANSPORT_BR_EDR).then((data) => {
          console.info('[bluetooth_js] pairCredibleDevice result:' + JSON.stringify(data));
        }).catch(err => {
          console.info('[bluetooth_js] bluetooth pairCredibleDevice has error: '+ JSON.stringify(err));
          expect(err.code).assertEqual(202);
          done();
        });
      } catch (error) {
        console.info("[bluetooth_js] error code connection0200 -> " + error.code + "error info connection0200  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0300
     * @tc.name test cancelPairedDevice callback.
     * @tc.desc Test cancelPairedDevice of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0300', 0, async function (done) {
      try {
        function cancelPairDev() {
          return new Promise<void>((resolve,reject) => {
            btConnection.cancelPairedDevice('22:33:44:55:66:77', (err, data)=> {
              if (err) {
                console.info('cancelPairDev failed' + err.code);
                reject(err.code);
              } else
              {
                console.info('[bluetooth_js]cancelPairDev info:'+JSON.stringify(data));
              }
              resolve();
            });
          });
        }
        await cancelPairDev().then((data) => {
          console.info("[bluetooth_js]02 connection done");
          done();
        }).catch(e => {
          console.info("[bluetooth_js]02 connection failed" + e);
          expect(e).assertEqual(202);
          done();
           })
      } catch (error) {
        console.info("[bluetooth_js] error code connection0300 -> " + error.code + "error info connection0300  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0400
     * @tc.name test cancelPairedDevice promise.
     * @tc.desc Test cancelPairedDevice of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0400', 0, async function (done) {
      try {
        await btConnection.cancelPairedDevice('22:33:44:55:66:77').then((data) => {
          console.info('[bluetooth_js] cancelPairedDevice result:' + JSON.stringify(data));
        }).catch(err => {
          console.info('[bluetooth_js] bluetooth cancelPairedDevice has error: '+ JSON.stringify(err.code));
          expect(err.code).assertEqual(202);
          done();
        });
      } catch (error) {
        console.info("[bluetooth_js] error code connection0400 -> " + error.code + "error info connection0400  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0500
     * @tc.name test cancelPairingDevice callback.
     * @tc.desc Test cancelPairingDevice of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0500', 0, async function (done) {
      try {
        function cancelPairingDev() {
          return new Promise<void>((resolve,reject) => {
            btConnection.cancelPairingDevice('33:44:55:66:77:88', (err, data)=> {
              if (err) {
                console.info('cancelPairingDev failed:' + err.code);
                reject(err.code);
              } else
              {
                console.info('[bluetooth_js]cancelPairingDev info:'+JSON.stringify(data));
              }
              resolve();
            });
          });
        }
        await cancelPairingDev().then((data) => {
          console.info("[bluetooth_js]05 connection done -> " + data);
        }).catch(err => {
          console.info('bluetooth cancelPairingDev has error: '+ JSON.stringify(err));
          expect(err).assertEqual(202);
        });
      } catch (error) {
        console.info("[bluetooth_js] error code connection0500 -> " + error.code + "error info connection0500  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0600
     * @tc.name test cancelPairingDevice promise.
     * @tc.desc Test cancelPairingDevice of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0600', 0, async function (done) {
      try {
        await btConnection.cancelPairingDevice('33:44:55:66:77:88').then((data) => {
          console.info('[bluetooth_js] cancelPairingDevice result:' + JSON.stringify(data));
        }).catch(err => {
          console.info('[bluetooth_js] bluetooth cancelPairingDevice has error: '+ JSON.stringify(err));
          expect(err.code).assertEqual(2900099);
          done();
        });
      } catch (error) {
        console.info("[bluetooth_js] error code connection0600 -> " + error.code + "error info connection0600  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0700
     * @tc.name test getLocalProfileUuids callback.
     * @tc.desc Test getLocalProfileUuids of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0700', 0, async function (done) {
      try {
        function getLocProUid() {
          return new Promise<void>((resolve,reject) => {
            btConnection.getLocalProfileUuids((err, data)=> {
              if (err) {
                console.info('getLocProUid failed' + err.code);
                reject(err.code);
              } else
              {
                console.info('[bluetooth_js]getLocProUid info:'+JSON.stringify(data));
              }
              resolve();
            });
          });
        }
        await getLocProUid().then((data) => {
          console.info("[bluetooth_js]07 connection done");
             done();
        }).catch(e => {

          console.info("[bluetooth_js]07 connection failed" + e);
          expect(e).assertEqual(202);
          done();
           })
      } catch (error) {
        console.info("[bluetooth_js] error code connection0700 -> " + error.code + "error info connection0700  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0800
     * @tc.name test getLocalProfileUuids promise.
     * @tc.desc Test getLocalProfileUuids of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0800', 0, async function (done) {
      try {
        await btConnection.getLocalProfileUuids().then((data) => {
          console.info('[bluetooth_js] getLocalProfileUuids result:' + JSON.stringify(data));
        }).catch(err => {
          console.info('[bluetooth_js] bluetooth getLocalProfileUuids has error: '+ JSON.stringify(err.code));
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info("[bluetooth_js] error code connection0800 -> " + error.code + "error info connection0800  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0900
     * @tc.name test getRemoteProfileUuids callback.
     * @tc.desc Test getRemoteProfileUuids of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_0900', 0, async function (done) {
      try {
        function getRemoProUid() {
          return new Promise<void>((resolve,reject) => {
            btConnection.getRemoteProfileUuids('44:55:66:77:88:99', (err, data)=> {
              if (err) {
                console.info('getRemoProUid failed' + err);
                reject(err.code);
              } else
              {
                console.info('[bluetooth_js]getRemoProUid info:'+JSON.stringify(data));
              }
              resolve();
            });
          });
        }
        await getRemoProUid().then((data) => {
          console.info("[bluetooth_js]09 connection done");
             done();
        }).catch(e => {

          console.info("[bluetooth_js]09 connection failed" + e);
          expect(e).assertEqual(202);
          done();
           })
      } catch (error) {
        console.info("[bluetooth_js] error code connection0900 -> " + error.code + "error info connection0900  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_CONNECTION_1000
     * @tc.name test getRemoteProfileUuids promise.
     * @tc.desc Test getRemoteProfileUuids of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_CONNECTION_1000', 0, async function (done) {
      try {
        await btConnection.getRemoteProfileUuids('44:55:66:77:88:99').then((data) => {
          console.info('[bluetooth_js] getRemoteProfileUuids result:' + JSON.stringify(data));
        }).catch(err => {
          console.info('[bluetooth_js] bluetooth getRemoteProfileUuids has error: '+ JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info("[bluetooth_js] error code connection1000 -> " + error.code + "error info connection1000  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_HFP_0100
     * @tc.name test connect
     * @tc.desc Test connect of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_HFP_0100', 0, async function (done) {
      console.info("[bluetooth_js] createHfpAgProfile result: " + hfpSrc);
      expect(true).assertEqual(hfpSrc != null);
      try {
        console.info("[bluetooth_js] hfpSrc connect start");
        hfpSrc.connect('00:11:22:33:44:55');
      } catch (error) {
        console.info("[bluetooth_js] error code HFP 0100 -> " + error.code + "error info HFP 0100 -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_HFP_0200
     * @tc.name test disconnect
     * @tc.desc Test disconnect of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_HFP_0200', 0, async function (done) {
      try {
        console.info("[bluetooth_js] hfpSrc disconnect start");
        hfpSrc.disconnect('00:11:22:33:44:55');
      } catch (error) {
        console.info("[bluetooth_js] error code HFP 0200 -> " + error.code + "error info HFP 0200 -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_HID_0100
     * @tc.name test connect
     * @tc.desc Test connect of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_HID_0100', 0, async function (done) {
      try {
        console.info("[bluetooth_js] createHidHostProfile result: " + hidSrc);
        expect(true).assertEqual(hidSrc != null);
        hidSrc.connect('00:11:22:33:44:55');
      } catch (error) {
        console.info("[bluetooth_js] error code HID 0100 -> " + error.code + "error info HID 0100 -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_HID_0200
     * @tc.name test disconnect
     * @tc.desc Test disconnect of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_HID_0200', 0, async function (done) {
      try {
        hidSrc.disconnect('00:11:22:33:44:55');
      } catch (error) {
        console.info("[bluetooth_js] error code HID 0200 -> " + error.code + "error info HID 0200 -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0100
     * @tc.name test setConnectionStrategy callback.
     * @tc.desc Test setConnectionStrategy of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0100', 0, async function (done) {
        function setConnStr() {
            return new Promise<void>((resolve,reject) => {
            a2dpSrc.setConnectionStrategy('00:11:22:33:44:55', btBaseProfile.ConnectionStrategy.CONNECTION_STRATEGY_ALLOWED, (err, data)=> {
                if (err) {
                console.info('setConnStr failed' + err);
                reject(err.code);
                } else
                {
                console.info('[bluetooth_js]setConnStr info:'+JSON.stringify(data));
                expect(true).assertEqual(data != null);
                }
                resolve();
            });
            });
        }
        try {
            await setConnStr().then((data) => {
            console.info("[bluetooth_js]01 baseProfile done" + data);
            done();
            }).catch(e => {
            console.info("[bluetooth_js]01 baseProfile failed:" + e);
            expect(e).assertEqual(202);
            done();
            })
        } catch (error) {
            console.info("[bluetooth_js] error code baseprofile0100 -> " + error.code + "error info baseprofile0100  -> " + error.message);
            expect(error.code).assertEqual('202');
        }
        done();
        })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0200
     * @tc.name test setConnectionStrategy promise.
     * @tc.desc Test setConnectionStrategy of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0200', 0, async function (done) {
      try {
        await a2dpSrc.setConnectionStrategy("11:22:33:AA:BB:FF", btBaseProfile.ConnectionStrategy.CONNECTION_STRATEGY_ALLOWED).then((data) => {
          console.info('[bluetooth_js] setConnectionStrategy result:' + JSON.stringify(data));
          expect(true).assertEqual(data != null);
          done();
        }).catch(err => {
          console.info('[bluetooth_js] bluetooth setConnectionStrategy has error: '+ JSON.stringify(err));
          expect(err.code).assertEqual(202);
          done();
        });
      } catch (error) {
        console.info("[bluetooth_js] error code baseprofile0200 -> " + error.code + "error info baseprofile0200  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0300
     * @tc.name test getConnectionStrategy callback.
     * @tc.desc Test getConnectionStrategy of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0300', 0, async function (done) {
      try {
        function getConnStr() {
          return new Promise<void>((resolve,reject) => {
            a2dpSrc.getConnectionStrategy('00:11:22:33:44:55', (err, data)=> {
              if (err) {
                console.info('getConnStr failed' + err);
                reject(err.code);
              } else
              {
                console.info('[bluetooth_js]getConnStr info:'+JSON.stringify(data));
                expect(true).assertEqual(data != null);
              }
              resolve();
            });
          });
        }
        await getConnStr().then((data) => {
          console.info("[bluetooth_js]03 baseProfile done");
             done();
        }).catch(e => {
          console.info("[bluetooth_js]03 baseProfile failed" + e);
          expect(e).assertEqual(202);
          done();
        })
      } catch (error) {
        console.info("[bluetooth_js] error code baseprofile0300 -> " + error.code + "error info baseprofile0300  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0400
     * @tc.name test getConnectionStrategy promise.
     * @tc.desc Test getConnectionStrategy of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0400', 0, async function (done) {
      try {
        await a2dpSrc.getConnectionStrategy('00:11:22:33:44:55').then((data) => {
          console.info('[bluetooth_js] getConnectionStrategy result:' + JSON.stringify(data));
          expect(true).assertEqual(data != null);
          done();
        }).catch(err => {
          console.info('[bluetooth_js] bluetooth getConnectionStrategy has error: '+ JSON.stringify(err));
          expect(err.code).assertEqual(202);
          done();
        });
      } catch (error) {
        console.info("[bluetooth_js] error code baseprofile0400 -> " + error.code + "error info baseprofile0400  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0500
     * @tc.name test setConnectionStrategy callback.
     * @tc.desc Test setConnectionStrategy of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0500', 0, async function (done) {
      try {
        function setConnStr() {
          return new Promise<void>((resolve,reject) => {
            hfpSrc.setConnectionStrategy('00:11:22:33:44:55', btBaseProfile.ConnectionStrategy.CONNECTION_STRATEGY_ALLOWED, (err, data)=> {
              if (err) {
                console.info('setConnStr failed' + err);
                reject(err.code);
              } else
              {
                console.info('[bluetooth_js]setConnStr info:'+JSON.stringify(data));
                expect(true).assertEqual(data != null);
              }
              resolve();
            });
          });
        }
        await setConnStr().then((data) => {
          console.info("[bluetooth_js]05 baseProfile done");
             done();
        }).catch(e => {
          console.info("[bluetooth_js]05 baseProfile failed" + e);
          expect(e).assertEqual(202);
          done();
        })
      } catch (error) {
        console.info("[bluetooth_js] error code baseprofile0500 -> " + error.code + "error info baseprofile0500  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0600
     * @tc.name test setConnectionStrategy promise.
     * @tc.desc Test setConnectionStrategy of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0600', 0, async function (done) {
      try {
        await hfpSrc.setConnectionStrategy('00:11:22:33:44:55', btBaseProfile.ConnectionStrategy.CONNECTION_STRATEGY_ALLOWED).then((data) => {
          console.info('[bluetooth_js] setConnectionStrategy result:' + JSON.stringify(data));
          expect(true).assertEqual(data != null);
          done();
        }).catch(err => {
          console.info('[bluetooth_js] bluetooth setConnectionStrategy has error: '+ JSON.stringify(err));
          expect(err.code).assertEqual(202);
          done();
        });
      } catch (error) {
        console.info("[bluetooth_js] error code baseprofile0600 -> " + error.code + "error info baseprofile0600  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0700
     * @tc.name test getConnectionStrategy callback.
     * @tc.desc Test getConnectionStrategy of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0700', 0, async function (done) {
      try {
        function getConnStr() {
          return new Promise<void>((resolve,reject) => {
            hfpSrc.getConnectionStrategy('00:11:22:33:44:55', (err, data)=> {
              if (err) {
                console.info('getConnStr failed' + err);
                reject(err.code);
              } else
              {
                console.info('[bluetooth_js]getConnStr info:'+JSON.stringify(data));
                expect(true).assertEqual(data != null);
              }
              resolve();
            });
          });
        }
        await getConnStr().then((data) => {
          console.info("[bluetooth_js]07 baseProfile done");
          done();
        }).catch(e => {
          console.info("[bluetooth_js]07 baseProfile failed" + e);
          expect(e).assertEqual(202);
          done();
        })
      } catch (error) {
        console.info("[bluetooth_js] error code baseprofile0700 -> " + error.code + "error info baseprofile0700  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0800
     * @tc.name test getConnectionStrategy promise.
     * @tc.desc Test getConnectionStrategy of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0800', 0, async function (done) {
      try {
        await hfpSrc.getConnectionStrategy('00:11:22:33:44:55').then((data) => {
          console.info('[bluetooth_js] getConnectionStrategy result:' + JSON.stringify(data));
          expect(true).assertEqual(data != null);
          done();
        }).catch(err => {
          console.info('[bluetooth_js] bluetooth getConnectionStrategy has error: '+ JSON.stringify(err));
          expect(err.code).assertEqual(202);
          done();
        });
      } catch (error) {
        console.info("[bluetooth_js] error code baseprofile0800 -> " + error.code + "error info baseprofile0800  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0900
     * @tc.name test setConnectionStrategy callback.
     * @tc.desc Test setConnectionStrategy of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_0900', 0, async function (done) {
      try {
        function setConnStr() {
          return new Promise<void>((resolve,reject) => {
            hidSrc.setConnectionStrategy('00:11:22:33:44:55', btBaseProfile.ConnectionStrategy.CONNECTION_STRATEGY_ALLOWED, (err, data)=> {
              if (err) {
                console.info('setConnStr failed' + err);
                reject(err.code);
              } else
              {
                console.info('[bluetooth_js]setConnStr info:'+JSON.stringify(data));
                expect(true).assertEqual(data != null);
              }
              resolve();
            });
          });
        }
        await setConnStr().then((data) => {
          console.info("[bluetooth_js]09 baseProfile done");
          done();
        }).catch(e => {
          console.info("[bluetooth_js]09 baseProfile failed" + e);
          expect(e).assertEqual(202);
          done();
        })
      } catch (error) {
        console.info("[bluetooth_js] error code baseprofile0900 -> " + error.code + "error info baseprofile0900  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1000
     * @tc.name test setConnectionStrategy promise.
     * @tc.desc Test setConnectionStrategy of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1000', 0, async function (done) {
      try {
        await hidSrc.setConnectionStrategy('00:11:22:33:44:55', btBaseProfile.ConnectionStrategy.CONNECTION_STRATEGY_ALLOWED).then((data) => {
          console.info('[bluetooth_js] setConnectionStrategy result:' + JSON.stringify(data));
          expect(true).assertEqual(data != null);
          done();
        }).catch(err => {
          console.info('[bluetooth_js] bluetooth setConnectionStrategy has error: '+ JSON.stringify(err));
          expect(err.code).assertEqual(202);
          done();
        });
      } catch (error) {
        console.info("[bluetooth_js] error code baseprofile1000 -> " + error.code + "error info baseprofile1000  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1100
     * @tc.name test getConnectionStrategy callback.
     * @tc.desc Test getConnectionStrategy of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1100', 0, async function (done) {
      try {
        function getConnStr() {
          return new Promise<void>((resolve,reject) => {
            hidSrc.getConnectionStrategy('00:11:22:33:44:55', (err, data)=> {
              if (err) {
                console.info('getConnStr failed' + err);
                reject(err.code);
              } else
              {
                console.info('[bluetooth_js]getConnStr info:'+JSON.stringify(data));
                expect(true).assertEqual(data != null);
              }
              resolve();
            });
          });
        }
        await getConnStr().then((data) => {
          console.info("[bluetooth_js]11 baseProfile done");
          done();
        }).catch(e => {
          console.info("[bluetooth_js]11 baseProfile failed" + e);
          expect(e).assertEqual(202);
          done();
        })
      } catch (error) {
        console.info("[bluetooth_js] error code baseprofile1100 -> " + error.code + "error info baseprofile1100  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })

    /**
     * @tc.number SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1200
     * @tc.name test getConnectionStrategy promise.
     * @tc.desc Test getConnectionStrategy of use invalided address.
     * @tc.size MEDIUM
     * @ since 8
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_COMMUNICATION_BLUETOOTH_BASEPROFILE_1200', 0, async function (done) {
      try {
        await hidSrc.getConnectionStrategy('00:11:22:33:44:55').then((data) => {
          console.info('[bluetooth_js] getConnectionStrategy result:' + JSON.stringify(data));
          expect(true).assertEqual(data != null);
          done();
        }).catch(err => {
          console.info('[bluetooth_js] bluetooth getConnectionStrategy has error: '+ JSON.stringify(err));
          expect(err.code).assertEqual(202);
          done();
        });
      } catch (error) {
        console.info("[bluetooth_js] error code baseprofile1200 -> " + error.code + "error info baseprofile1200  -> " + error.message);
        expect(error.code).assertEqual('202');
      }
      done();
    })
  })
}