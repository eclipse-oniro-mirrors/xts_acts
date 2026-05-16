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

import wifi from '@ohos.wifi';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

export default function wifiReturnValue() {
  describe('wifiReturnValue', () => {
    beforeAll(async (done) => {
      console.info('beforeAll case');
      done();
    })
    beforeEach(() => {
      console.info('AfterAll case');
    })
    afterEach(() => {
      console.info('AfterAll case');
    })
    afterAll(async (done) => {
      console.info('AfterAll case');
      done();
    })

    /**
     * @tc.name   Sub_Communication_WiFi_GetLinkedInfo_Promise_Return_001
     * @tc.number Sub_Communication_WiFi_GetLinkedInfo_Promise_Return_001
     * @tc.desc   Test getLinkedInfo API Promise - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_GetLinkedInfo_Promise_Return_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done) => {
        let caseName = 'Sub_Communication_WiFi_GetLinkedInfo_Promise_Return_001';
        console.info(`${caseName} test start`);
        try {
          let result = await wifi.getLinkedInfo();
          console.log(`${caseName} get result success `, result);
          if (result) {
            expect(typeof result.ssid === 'string').assertTrue();
            expect(typeof result.bssid === 'string').assertTrue();
            expect(typeof result.networkId === 'number').assertTrue();
            expect(typeof result.rssi === 'number').assertTrue();
            expect(typeof result.band === 'number').assertTrue();
            expect(typeof result.linkSpeed === 'number').assertTrue();
            expect(typeof result.frequency === 'number').assertTrue();
            expect(typeof result.isHidden === 'boolean').assertTrue();
            expect(typeof result.isRestricted === 'boolean').assertTrue();
            expect(typeof result.chload === 'number').assertTrue();
            expect(typeof result.snr === 'number').assertTrue();
            expect(typeof result.macAddress === 'string').assertTrue();
            expect(typeof result.ipAddress === 'number').assertTrue();
            expect(typeof result.suppState === 'number').assertTrue();
            expect(typeof result.connState === 'number').assertTrue();
          }
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFi_GetLinkedInfo_Callback_Return_001
     * @tc.number Sub_Communication_WiFi_GetLinkedInfo_Callback_Return_001
     * @tc.desc   Test getLinkedInfo API Callback - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_GetLinkedInfo_Callback_Return_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done) => {
        let caseName = 'Sub_Communication_WiFi_GetLinkedInfo_Callback_Return_001';
        console.info(`${caseName} test start`);
        try {
          wifi.getLinkedInfo((err, data) => {
            if (err) {
              console.info(`${caseName} error`, JSON.stringify(err));
              expect().assertFail();
            } else {
              console.log(`${caseName} get result success `, data);
              if (data) {
                expect(typeof data.ssid === 'string').assertTrue();
                expect(typeof data.bssid === 'string').assertTrue();
                expect(typeof data.networkId === 'number').assertTrue();
                expect(typeof data.rssi === 'number').assertTrue();
                expect(typeof data.band === 'number').assertTrue();
                expect(typeof data.linkSpeed === 'number').assertTrue();
                expect(typeof data.frequency === 'number').assertTrue();
                expect(typeof data.isHidden === 'boolean').assertTrue();
                expect(typeof data.isRestricted === 'boolean').assertTrue();
                expect(typeof data.chload === 'number').assertTrue();
                expect(typeof data.snr === 'number').assertTrue();
                expect(typeof data.macAddress === 'string').assertTrue();
                expect(typeof data.ipAddress === 'number').assertTrue();
                expect(typeof data.suppState === 'number').assertTrue();
                expect(typeof data.connState === 'number').assertTrue();
              }
            }
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFi_GetIpInfo_Return_001
     * @tc.number Sub_Communication_WiFi_GetIpInfo_Return_001
     * @tc.desc   Test getIpInfo API - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_GetIpInfo_Return_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done) => {
        let caseName = 'Sub_Communication_WiFi_GetIpInfo_Return_001';
        console.info(`${caseName} test start`);
        try {
          let result = wifi.getIpInfo();
          console.log(`${caseName} get result success `, result);
          expect(typeof result.ipAddress === 'number').assertTrue();
          expect(typeof result.gateway === 'number').assertTrue();
          expect(typeof result.netmask === 'number').assertTrue();
          expect(typeof result.primaryDns === 'number').assertTrue();
          expect(typeof result.secondDns === 'number').assertTrue();
          expect(typeof result.serverIp === 'number').assertTrue();
          expect(typeof result.leaseDuration === 'number').assertTrue();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFi_GetP2pLinkedInfo_Promise_Return_001
     * @tc.number Sub_Communication_WiFi_GetP2pLinkedInfo_Promise_Return_001
     * @tc.desc   Test getP2pLinkedInfo API Promise - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_GetP2pLinkedInfo_Promise_Return_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done) => {
        let caseName = 'Sub_Communication_WiFi_GetP2pLinkedInfo_Promise_Return_001';
        console.info(`${caseName} test start`);
        try {
          let result = await wifi.getP2pLinkedInfo();
          console.log(`${caseName} get result success `, result);
          if (result) {
            expect(typeof result.connectState === 'number').assertTrue();
            expect(typeof result.isGroupOwner === 'boolean').assertTrue();
            expect(typeof result.groupOwnerAddr === 'string').assertTrue();
          }
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFi_GetP2pLinkedInfo_Callback_Return_001
     * @tc.number Sub_Communication_WiFi_GetP2pLinkedInfo_Callback_Return_001
     * @tc.desc   Test getP2pLinkedInfo API Callback - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_GetP2pLinkedInfo_Callback_Return_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
        let caseName = 'Sub_Communication_WiFi_GetP2pLinkedInfo_Callback_Return_001';
        console.info(`${caseName} test start`);
        try {
          wifi.getP2pLinkedInfo((err, data) => {
            if (err) {
              console.info(`${caseName} error`, JSON.stringify(err));
              expect().assertFail();
            } else {
              console.log(`${caseName} get result success `, data);
              if (data) {
                expect(typeof data.connectState === 'number').assertTrue();
                expect(typeof data.isGroupOwner === 'boolean').assertTrue();
                expect(typeof data.groupOwnerAddr === 'string').assertTrue();
              }
            }
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });
    /**
     * @tc.name   Sub_Communication_WiFi_GetCurrentGroup_Callback_Return_001
     * @tc.number Sub_Communication_WiFi_GetCurrentGroup_Callback_Return_001
     * @tc.desc   Test getCurrentGroup API Callback - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_GetCurrentGroup_Callback_Return_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done) => {
        let caseName = 'Sub_Communication_WiFi_GetCurrentGroup_Callback_Return_001';
        console.info(`${caseName} test start`);
        try {
          wifi.getCurrentGroup((err, data) => {
            if (err) {
              console.info(`${caseName} error`, JSON.stringify(err));
              expect().assertFail();
            } else {
              console.log(`${caseName} get result success `, data);
              if (data) {
                expect(typeof data.isP2pGo === 'boolean').assertTrue();
                expect(data.ownerInfo !== null && typeof data.ownerInfo === 'object').assertTrue();
                expect(typeof data.passphrase === 'string').assertTrue();
                expect(typeof data.interface === 'string').assertTrue();
                expect(typeof data.groupName === 'string').assertTrue();
                expect(typeof data.networkId === 'number').assertTrue();
                expect(typeof data.frequency === 'number').assertTrue();
                expect(Array.isArray(data.clientDevices)).assertTrue();
                expect(typeof data.goIpAddress === 'string').assertTrue();
              }
            }
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFi_On_P2pConnectionChange_Callback_Return_001
     * @tc.number Sub_Communication_WiFi_On_P2pConnectionChange_Callback_Return_001
     * @tc.desc   Test on_p2pConnectionChange API Callback - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_On_P2pConnectionChange_Callback_Return_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
        let caseName = 'Sub_Communication_WiFi_On_P2pConnectionChange_Callback_Return_001';
        console.info(`${caseName} test start`);
        try {
          wifi.on('p2pConnectionChange', (data) => {
            console.log(`${caseName} get result success `, data);
            if (data) {
              expect(typeof data.connectState === 'number').assertTrue();
              expect(typeof data.isGroupOwner === 'boolean').assertTrue();
              expect(typeof data.groupOwnerAddr === 'string').assertTrue();
            }
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFi_On_P2pDeviceChange_Callback_Return_001
     * @tc.number Sub_Communication_WiFi_On_P2pDeviceChange_Callback_Return_001
     * @tc.desc   Test on_p2pDeviceChange API Callback - verify Return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFi_On_P2pDeviceChange_Callback_Return_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
        let caseName = 'Sub_Communication_WiFi_On_P2pDeviceChange_Callback_Return_001';
        console.info(`${caseName} test start`);
        try {
          wifi.on('p2pDeviceChange', (data) => {
            console.log(`${caseName} get result success `, data);
            if (data) {
              expect(typeof data.deviceName === 'string').assertTrue();
              expect(typeof data.deviceAddress === 'string').assertTrue();
              expect(typeof data.primaryDeviceType === 'string').assertTrue();
              expect(typeof data.deviceStatus === 'number').assertTrue();
              expect(typeof data.groupCapabilitys === 'number').assertTrue();
            }
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          expect().assertFail();
        }
        console.info(`${caseName} test end`);
        done();
      });
  })
}
