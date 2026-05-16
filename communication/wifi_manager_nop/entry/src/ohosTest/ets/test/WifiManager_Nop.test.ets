/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import wifiManager from '@ohos.wifiManager';
import wifiManagerExt from '@ohos.wifiManagerExt';
import geoLocationManager from '@ohos.geoLocationManager'
import { BusinessError } from '@ohos.base'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';


// no permission.
const NOT_PERMISSION = 201;
//parameter error
const PARAMETER_ERROR = 401
const STA_OPERATION_FAILED = 2501000
const HOTSPOT_OPERATION_FAILED = 2601000
const AP_OPERATION_FAILED = 2701000
const P2P_OPERATION_FAILED = 2801000

export default function wifiManagerTest() {
  describe('wifiManagerTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   SUB_Communication_WiFi_On_P2pDiscoveryChange_Callback_Nop
     * @tc.number SUB_Communication_WiFi_On_P2pDiscoveryChange_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_On_P2pDiscoveryChange_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pDiscoveryChange_Callback_Nop begin');
      try {
        wifiManager.on("p2pDiscoveryChange", () => {
          hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pDiscoveryChange_Callback_Nop callback');
        });
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pDiscoveryChange_Callback_Nop success');
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pDiscoveryChange_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_Off_P2pDiscoveryChange_Callback_Nop
     * @tc.number SUB_Communication_WiFi_Off_P2pDiscoveryChange_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_Off_P2pDiscoveryChange_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_P2pDiscoveryChange_Callback_Nop begin');
      try {
        wifiManager.off("p2pDiscoveryChange", () => {
          hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_P2pDiscoveryChange_Callback_Nop callback');
        })
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_P2pDiscoveryChange_Callback_Nop success');
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_P2pDiscoveryChange_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(P2P_OPERATION_FAILED);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_On_P2pPersistentGroupChange_Callback_Nop
     * @tc.number SUB_Communication_WiFi_On_P2pPersistentGroupChange_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_On_P2pPersistentGroupChange_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pPersistentGroupChange_Callback_Nop begin');
      try {
        wifiManager.on('p2pPersistentGroupChange', () => {
          hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pPersistentGroupChange_Callback_Nop callback');
        });
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pPersistentGroupChange_Callback_Nop success');
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pPersistentGroupChange_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_Off_P2pPersistentGroupChange_Callback_Nop
     * @tc.number SUB_Communication_WiFi_Off_P2pPersistentGroupChange_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_Off_P2pPersistentGroupChange_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_P2pPersistentGroupChange_Callback_Nop begin');

      try {
        wifiManager.off('p2pPersistentGroupChange', () => {
          hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_P2pPersistentGroupChange_Callback_Nop callback');
        });
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_P2pPersistentGroupChange_Callback_Nop success');
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_P2pPersistentGroupChange_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(P2P_OPERATION_FAILED);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_On_P2pPeerDeviceChange_Callback_Nop
     * @tc.number SUB_Communication_WiFi_On_P2pPeerDeviceChange_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_On_P2pPeerDeviceChange_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pPeerDeviceChange_Callback_Nop begin');
      try {
        wifiManager.on('p2pPeerDeviceChange', () => {
          hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pPeerDeviceChange_Callback_Nop callback');
        });
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pPeerDeviceChange_Callback_Nop success');
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pPeerDeviceChange_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });


    /**
     * @tc.name   SUB_Communication_WiFi_On_P2pDeviceChange_Callback_Nop
     * @tc.number SUB_Communication_WiFi_On_P2pDeviceChange_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_On_P2pDeviceChange_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pDeviceChange_Callback_Nop begin');

      try {
        wifiManager.on('p2pDeviceChange', () => {
          hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pDeviceChange_Callback_Nop callback');
        });
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pDeviceChange_Callback_Nop success');
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pDeviceChange_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_On_P2pConnectionChange_Callback_Nop
     * @tc.number SUB_Communication_WiFi_On_P2pConnectionChange_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_On_P2pConnectionChange_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pConnectionChange_Callback_Nop begin');
      try {
        wifiManager.on('p2pConnectionChange', () => {
          hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pConnectionChange_Callback_Nop callback');
        });
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pConnectionChange_Callback_Nop success');
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pConnectionChange_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });


    /**
     * @tc.name   SUB_Communication_WiFi_Off_P2pConnectionChange_Callback_Nop
     * @tc.number SUB_Communication_WiFi_Off_P2pConnectionChange_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_Off_P2pConnectionChange_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_P2pConnectionChange_Callback_Nop begin');
      try {
        wifiManager.off('p2pConnectionChange', () => {
          hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_P2pConnectionChange_Callback_Nop callback');
        });
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_P2pConnectionChange_Callback_Nop success');
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_P2pConnectionChange_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(P2P_OPERATION_FAILED);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_On_P2pStateChange_Callback_Nop
     * @tc.number SUB_Communication_WiFi_On_P2pStateChange_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_On_P2pStateChange_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pStateChange_Callback_Nop begin');
      try {
        wifiManager.on('p2pStateChange', () => {
          hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pStateChange_Callback_Nop success');
        });
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_P2pStateChange_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_Off_P2pStateChange_Callback_Nop
     * @tc.number SUB_Communication_WiFi_Off_P2pStateChange_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_Off_P2pStateChange_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_P2pStateChange_Callback_Nop begin');
      try {
        wifiManager.off('p2pStateChange', () => {
          hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_P2pStateChange_Callback_Nop callback');
        });
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_P2pStateChange_Callback_Nop success');
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_P2pStateChange_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(P2P_OPERATION_FAILED);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_On_HotspotStateChange_Callback_Nop
     * @tc.number SUB_Communication_WiFi_On_HotspotStateChange_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_On_HotspotStateChange_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_HotspotStateChange_Callback_Nop begin');
      try {
        wifiManager.on('hotspotStateChange', () => {
          hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_HotspotStateChange_Callback_Nop callback');
        });
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_HotspotStateChange_Callback_Nop success');
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_HotspotStateChange_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_Off_HotspotStateChange_Callback_Nop
     * @tc.number SUB_Communication_WiFi_Off_HotspotStateChange_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_Off_HotspotStateChange_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_HotspotStateChange_Callback_Nop begin');
      try {
        wifiManager.off('hotspotStateChange', () => {
          hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_HotspotStateChange_Callback_Nop callback');
        });
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_HotspotStateChange_Callback_Nop success');
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_HotspotStateChange_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(HOTSPOT_OPERATION_FAILED);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_On_WifiRssiChange_Callback_Nop
     * @tc.number SUB_Communication_WiFi_On_WifiRssiChange_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_On_WifiRssiChange_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_WifiRssiChange_Callback_Nop begin');
      try {
        wifiManager.on('hotspotStateChange', () => {
          hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_WifiRssiChange_Callback_Nop callback');
        });
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_WifiRssiChange_Callback_Nop success');
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_On_WifiRssiChange_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_Off_WifiRssiChange_Callback_Nop
     * @tc.number SUB_Communication_WiFi_Off_WifiRssiChange_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_Off_WifiRssiChange_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_WifiRssiChange_Callback_Nop begin');
      try {
        wifiManager.off('wifiRssiChange', () => {
          hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_WifiRssiChange_Callback_Nop callback');
        });
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_WifiRssiChange_Callback_Nop success');
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Off_WifiRssiChange_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(STA_OPERATION_FAILED);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_P2P_CreateGroup_Nop
     * @tc.number SUB_Communication_WiFi_P2P_CreateGroup_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_P2P_CreateGroup_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_P2P_CreateGroup_Nop begin');

      try {
        let config: wifiManager.WifiP2PConfig = {
          deviceAddress: "00:00:00:00:00:00",
          netId: -1,
          passphrase: "12345678",
          groupName: "123456",
          goBand: 0
        }
        wifiManager.createGroup(config);
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_P2P_CreateGroup_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_IsMeteredHotspot_Nop
     * @tc.number SUB_Communication_WiFi_IsMeteredHotspot_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_IsMeteredHotspot_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_IsMeteredHotspot_Nop begin');
      try {
        wifiManager.isMeteredHotspot();
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_IsMeteredHotspot_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_IsBandTypeSupported_Nop
     * @tc.number SUB_Communication_WiFi_IsBandTypeSupported_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_IsBandTypeSupported_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_IsBandTypeSupported_Nop begin');
      try {
        let type: wifiManager.WifiBandType = wifiManager.WifiBandType.WIFI_BAND_2G;
        wifiManager.isBandTypeSupported(type);
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_IsBandTypeSupported_Nop failed ' + JSON.stringify(error));
        if (Number(error.code) === NOT_PERMISSION) {
          expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        } else {
          expect(Number(error.code)).assertEqual(PARAMETER_ERROR);
        }
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_GetCountryCode_Nop
     * @tc.number SUB_Communication_WiFi_GetCountryCode_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_GetCountryCode_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetCountryCode_Nop begin');
      try {
        wifiManager.getCountryCode();
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetCountryCode_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_GetIpv6Info_Nop
     * @tc.number SUB_Communication_WiFi_GetIpv6Info_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_GetIpv6Info_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetIpv6Info_Nop begin');
      try {
        wifiManager.getIpv6Info();
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetIpv6Info_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_GetCurrentGroup_Callback_Nop
     * @tc.number SUB_Communication_WiFi_GetCurrentGroup_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_GetCurrentGroup_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetCurrentGroup_Callback_Nop begin');
      try {
        wifiManager.getCurrentGroup((err, data) => {
          if (err) {
            hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetCurrentGroup_Callback_Nop failed ' + JSON.stringify(err));
            expect(Number(err.code)).assertEqual(NOT_PERMISSION);
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetCurrentGroup_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_GetCurrentGroup_Promise_Nop
     * @tc.number SUB_Communication_WiFi_GetCurrentGroup_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_GetCurrentGroup_Promise_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetCurrentGroup_Promise_Nop begin');
      wifiManager.getCurrentGroup().then((WifiP2pGroupInfo: wifiManager.WifiP2pGroupInfo) => {
        hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_WiFi_GetCurrentGroup_Promise_Nop success');
        console.info("[wifi_test]getCurrentGroup result WifiP2pGroupInfo: " + JSON.stringify(WifiP2pGroupInfo));
        console.info("[wifi_test]WifiP2pGroupInfo result isP2pGo: " + JSON.stringify(WifiP2pGroupInfo.isP2pGo));
        console.info("[wifi_test]WifiP2pGroupInfo result ownerInfo: " + JSON.stringify(WifiP2pGroupInfo.ownerInfo));
        console.info("[wifi_test]WifiP2pGroupInfo result passphrase: " + JSON.stringify(WifiP2pGroupInfo.passphrase));
        console.info("[wifi_test]WifiP2pGroupInfo result interface: " + JSON.stringify(WifiP2pGroupInfo.interface));
        console.info("[wifi_test]WifiP2pGroupInfo result groupName: " + JSON.stringify(WifiP2pGroupInfo.groupName));
        console.info("[wifi_test]WifiP2pGroupInfo result networkId: " + JSON.stringify(WifiP2pGroupInfo.networkId));
        console.info("[wifi_test]WifiP2pGroupInfo result frequency: " + JSON.stringify(WifiP2pGroupInfo.frequency));
        console.info("[wifi_test]WifiP2pGroupInfo result clientDevices: " + JSON.stringify(WifiP2pGroupInfo.clientDevices));
        console.info("[wifi_test]WifiP2pGroupInfo result goIpAddress: " + JSON.stringify(WifiP2pGroupInfo.goIpAddress));
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_WiFi_GetCurrentGroup_Promise_Nop fail' + JSON.stringify(err));
        expect(Number(err.code)).assertEqual(NOT_PERMISSION);
        done();
      });
    });

    /**
     * @tc.name   SUB_Communication_WiFi_StartDiscoverDevices_Nop
     * @tc.number SUB_Communication_WiFi_StartDiscoverDevices_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_StartDiscoverDevices_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_StartDiscoverDevices_Nop begin');
      try {
        wifiManager.startDiscoverDevices();
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_StartDiscoverDevices_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_StopDiscoverDevices_Nop
     * @tc.number SUB_Communication_WiFi_StopDiscoverDevices_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_StopDiscoverDevices_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_StopDiscoverDevices_Nop begin');
      try {
        wifiManager.stopDiscoverDevices();
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_StopDiscoverDevices_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_RemoveGroup_Nop
     * @tc.number SUB_Communication_WiFi_RemoveGroup_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_RemoveGroup_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_RemoveGroup_Nop begin');
      try {
        wifiManager.removeGroup();
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_RemoveGroup_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_GetSupportedPowerMode_Callback_Nop
     * @tc.number SUB_Communication_WiFi_GetSupportedPowerMode_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_GetSupportedPowerMode_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetSupportedPowerMode_Callback_Nop begin');
      try {
        if (!wifiManagerExtAvailable()) {
          hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SystemCapability.Communication.wifiMg.AP.Extension not available');
          expect(true).assertTrue();
          done();
        } else {
          wifiManagerExt.getSupportedPowerMode((err: BusinessError, data) => {
            if (err) {
              hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetSupportedPowerMode_Callback_Nop fail ' + JSON.stringify(err));
              expect(Number(err.code)).assertEqual(NOT_PERMISSION);
              done();
            } else {
              hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetSupportedPowerMode_Callback_Nop success ');
              expect().assertFail();
              done();
            }
          });
        }
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetSupportedPowerMode_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_GetSupportedPowerMode_Promise_Nop
     * @tc.number SUB_Communication_WiFi_GetSupportedPowerMode_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_GetSupportedPowerMode_Promise_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetSupportedPowerMode_Promise_Nop begin');
      try {
        if (!wifiManagerExtAvailable()) {
          hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SystemCapability.Communication.wifiMg.AP.Extension not available');
          expect(true).assertTrue();
          done();
        } else {
          wifiManagerExt.getSupportedPowerMode().then(data => {
            expect().assertFail();
            done();
          }).catch((error: BusinessError) => {
            hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetSupportedPowerMode_Promise_Nop failed ' + JSON.stringify(error));
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
            done();
          });
        }
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetSupportedPowerMode_Promise_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_GetPowerMode_Promise_Nop
     * @tc.number SUB_Communication_WiFi_GetPowerMode_Promise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_GetPowerMode_Promise_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetPowerMode_Promise_Nop begin');
      try {
        if (!wifiManagerExtAvailable()) {
          hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SystemCapability.Communication.wifiMg.AP.Extension not available');
          expect(true).assertTrue();
          done();
        } else {
          wifiManagerExt.getPowerMode().then(data => {
            expect().assertFail();
            done();
          }).catch((error: BusinessError) => {
            hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetPowerMode_Promise_Nop failed ' + JSON.stringify(error));
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
            done();
          });
        }
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetPowerMode_Promise_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_GetPowerMode_Callback_Nop
     * @tc.number SUB_Communication_WiFi_GetPowerMode_Callback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_GetPowerMode_Callback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetPowerMode_Callback_Nop begin');
      try {
        if (!wifiManagerExtAvailable()) {
          hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SystemCapability.Communication.wifiMg.AP.Extension not available');
          expect(true).assertTrue();
          done();
        } else {
          wifiManagerExt.getPowerMode((err, data) => {
            if (err) {
              hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetPowerMode_Callback_Nop failed ' + JSON.stringify(err));
              expect(Number(err.code)).assertEqual(NOT_PERMISSION);
              done();
            } else {
              hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetPowerMode_Callback_Nop success ');
              expect().assertFail();
              done();
            }
          });
        }
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetPowerMode_Callback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Communication_WiFi_isHotspotActive_Nop
     * @tc.number SUB_Communication_WiFi_IsHotspotActive_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_isHotspotActive_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_isHotspotActive_Nop begin');
      try {
        wifiManager.isHotspotActive();
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_IsHotspotActive_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_Disconnect_Nop
     * @tc.number SUB_Communication_WiFi_Disconnect_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_Disconnect_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Disconnect_Nop begin');
      try {
        wifiManager.disconnect();
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_Disconnect_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_EnableWifi_Nop
     * @tc.number SUB_Communication_WiFi_EnableWifi_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_EnableWifi_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_EnableWifi_Nop begin');
      try {
        wifiManager.enableWifi();
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_EnableWifi_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_RemoveDevice_Nop
     * @tc.number SUB_Communication_WiFi_RemoveDevice_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_RemoveDevice_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_RemoveDevice_Nop begin');
      try {
        wifiManager.removeDevice(0);
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_RemoveDevice_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_ConnectToNetwork_Nop
     * @tc.number SUB_Communication_WiFi_ConnectToNetwork_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_ConnectToNetwork_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_ConnectToNetwork_Nop begin');
      try {
        wifiManager.connectToNetwork(0);
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_ConnectToNetwork_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_GetDeviceConfigs_Nop
     * @tc.number SUB_Communication_WiFi_GetDeviceConfigs_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_GetDeviceConfigs_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetDeviceConfigs_Nop begin');
      try {
        wifiManager.getDeviceConfigs();
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetDeviceConfigs_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_AddDeviceConfig_Nop
     * @tc.number SUB_Communication_WiFi_AddDeviceConfig_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_AddDeviceConfig_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_AddDeviceConfig_Nop begin');
      let wifiDeviceConfig: wifiManager.WifiDeviceConfig = {
        "ssid": "public201Test",
        "bssid": "00:11:22:33:44:55",
        "bssidType": wifiManager.DeviceAddressType.RANDOM_DEVICE_ADDRESS,
        "preSharedKey": "",
        "isHiddenSsid": false,
        "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
      };
      try {
        await wifiManager.addDeviceConfig(wifiDeviceConfig).then(netWorkId => {
          console.info("[wifi_test]add OPEN DeviceConfig promise result : " + JSON.stringify(netWorkId));
        });
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_AddDeviceConfig_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_GetDeviceMacAddress_Nop
     * @tc.number SUB_Communication_WiFi_GetDeviceMacAddress_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_GetDeviceMacAddress_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetDeviceMacAddress_Nop begin');
      try {
        wifiManager.getDeviceMacAddress();
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetDeviceMacAddress_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_EnableHotspot_Nop
     * @tc.number SUB_Communication_WiFi_EnableHotspot_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_EnableHotspot_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_EnableHotspot_Nop begin');
      try {
        if (!wifiManagerExtAvailable()) {
          hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SystemCapability.Communication.wifiMg.AP.Extension not available');
          expect(true).assertTrue();
        } else {
          wifiManagerExt.enableHotspot();
          expect().assertFail();
          }
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_EnableHotspot_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_DisableHotspot_Nop
     * @tc.number SUB_Communication_WiFi_DisableHotspot_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_DisableHotspot_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_DisableHotspot_Nop begin');
      try {
        if (!wifiManagerExtAvailable()) {
          hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SystemCapability.Communication.wifiMg.AP.Extension not available');
          expect(true).assertTrue();
        } else {
          wifiManagerExt.disableHotspot();
          expect().assertFail();
          }
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_DisableHotspot_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_SetPowerMode_Nop
     * @tc.number SUB_Communication_WiFi_SetPowerMode_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_SetPowerMode_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_SetPowerMode_Nop begin');
      try {
        if (!wifiManagerExtAvailable()) {
          hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SystemCapability.Communication.wifiMg.AP.Extension not available');
          expect(true).assertTrue();
        } else {
          wifiManagerExt.setPowerMode(0);
          expect().assertFail();
          }
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_SetPowerMode_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_GetScanResultsCallback_Nop
     * @tc.number SUB_Communication_WiFi_GetScanResultsCallback_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_GetScanResultsCallback_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetScanResultsCallback_Nop begin');
      let functionGetScanResults = async ()=>{
        return new Promise<void>((resolve,reject)=>{
          wifiManager.getScanResults(error => {
            if (error) {
              reject(error)
            } else {
              resolve();
            }
          });
        })
      }
      try {
        await functionGetScanResults();
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', `callback getScanResults`);
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetScanResultsCallback_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_GetScanResultsPromise_Nop
     * @tc.number SUB_Communication_WiFi_GetScanResultsPromise_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_GetScanResultsPromise_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetScanResultsPromise_Nop begin');
      try {
        await wifiManager.getScanResults();
        hilog.info(0x0000, 'wifiManagerTag', '%{public}s', `promise getScanResults`);
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetScanResultsPromise_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_GetScanResultsSync_Nop
     * @tc.number SUB_Communication_WiFi_GetScanResultsSync_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_GetScanResultsSync_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetScanResultsSync_Nop begin');
      try {
        wifiManager.getScanResultsSync();
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetScanResultsSync_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_GetMultiLinkedInfo_Nop
     * @tc.number SUB_Communication_WiFi_GetMultiLinkedInfo_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_GetMultiLinkedInfo_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetMultiLinkedInfo_Nop begin');
      try {
        wifiManager.getMultiLinkedInfo();
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetMultiLinkedInfo_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_GetLinkedInfoSync_Nop
     * @tc.number SUB_Communication_WiFi_GetLinkedInfoSync_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Communication_WiFi_GetLinkedInfoSync_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetLinkedInfoSync_Nop begin');
      try {
        wifiManager.getLinkedInfoSync();
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetLinkedInfoSync_Nop failed ' + JSON.stringify(error));
        expect(Number(error.code)).assertEqual(NOT_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_ConnectToCandidateConfigWithUserAction_Nop
     * @tc.number SUB_Communication_WiFi_ConnectToCandidateConfigWithUserAction_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_WiFi_ConnectToCandidateConfigWithUserAction_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_ConnectToCandidateConfigWithUserAction_Nop begin');
      try {
        await wifiManager.connectToCandidateConfigWithUserAction(-1).then(() => {
            console.info("[wifi_test]connectToCandidateConfigWithUserAction success");
        });
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_ConnectToCandidateConfigWithUserAction_Nop failed ' + JSON.stringify(error));
        if (Number(error.code) === 801) {
            console.info('[wifi_js]api is not support');
            expect(true).assertTrue();
        } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_DisableWifi_Nop
     * @tc.number SUB_Communication_WiFi_DisableWifi_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_WiFi_DisableWifi_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_DisableWifi_Nop begin');
      try {
        wifiManager.disableWifi();
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_DisableWifi_Nop failed ' + JSON.stringify(error));
        if (Number(error.code) === 801) {
            console.info('[wifi_js]api is not support');
            expect(true).assertTrue();
        } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_Communication_WiFi_StartScan_Nop
     * @tc.number SUB_Communication_WiFi_StartScan_Nop
     * @tc.desc   Using the on method without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Communication_WiFi_StartScan_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_StartScan_Nop begin');
      try {
        wifiManager.startScan();
        expect().assertFail();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_StartScan_Nop failed ' + JSON.stringify(error));
        if (Number(error.code) === 801) {
            console.info('[wifi_js]api is not support');
            expect(true).assertTrue();
        } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        }
      }
      done();
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_Scan_Nop
     * @tc.number Sub_Communication_WiFiManager_Scan_Nop
     * @tc.desc   Test scan API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_Scan_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_Scan_Nop'
        console.info(`${caseName} test start`);
        try {
          wifiManager.scan();
          console.log(`${caseName} get result success`);
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetScanResults_Nop_001
     * @tc.number Sub_Communication_WiFiManager_GetScanResults_Nop_001
     * @tc.desc   Test getScanResults Promise API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetScanResults_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetScanResults_Nop_001'
        console.info(`${caseName} test start`);
        try {
          let result = await wifiManager.getScanResults();
          console.log(`${caseName} get result success `, JSON.stringify(result));
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetScanResults_Nop_002
     * @tc.number Sub_Communication_WiFiManager_GetScanResults_Nop_002
     * @tc.desc   Test getScanResults callback API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetScanResults_Nop_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetScanResults_Nop_002'
        console.info(`${caseName} test start`);
        try {
          wifiManager.getScanResults((err, data) => {
            if (err) {
              console.info(`${caseName} callback error`, JSON.stringify(err));
              expect(Number(err.code)).assertEqual(NOT_PERMISSION);
              done();
              return;
            }
            console.log(`${caseName} callback success `, JSON.stringify(data));
            expect().assertFail();
            done();
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
          done();
        }
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetScanResultsSync_Nop
     * @tc.number Sub_Communication_WiFiManager_GetScanResultsSync_Nop
     * @tc.desc   Test getScanResultsSync API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetScanResultsSync_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetScanResultsSync_Nop'
        console.info(`${caseName} test start`);
        try {
          let result = wifiManager.getScanResultsSync();
          console.log(`${caseName} get result success `, JSON.stringify(result));
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetScanInfoList_Nop
     * @tc.number Sub_Communication_WiFiManager_GetScanInfoList_Nop
     * @tc.desc   Test getScanInfoList API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetScanInfoList_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetScanInfoList_Nop'
        console.info(`${caseName} test start`);
        try {
          let result = wifiManager.getScanInfoList();
          console.log(`${caseName} get result success `, JSON.stringify(result));
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Nop_001
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Nop_001
     * @tc.desc   Test addDeviceConfig Promise API without permission
     * @tc
    .type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_Nop_001'
        console.info(`${caseName} test start`);
        try {
          let config: wifiManager.WifiDeviceConfig = {
            ssid: "test",
            preSharedKey: "12345678",
            securityType: 0
          };
          let result = await wifiManager.addDeviceConfig(config);
          console.log(`${caseName} get result success `, result);
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddDeviceConfig_Nop_002
     * @tc.number Sub_Communication_WiFiManager_AddDeviceConfig_Nop_002
     * @tc.desc   Test addDeviceConfig callback API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddDeviceConfig_Nop_002', TestType.FUNCTION | Size
      .MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = 'Sub_Communication_WiFiManager_AddDeviceConfig_Nop_002'
      console.info(`${caseName} test start`);
      try {
        let config: wifiManager.WifiDeviceConfig = {
          ssid: "test",
          preSharedKey: "12345678",
          securityType: 0
        };
        wifiManager.addDeviceConfig(config, (err, data) => {
          if (err) {
            console.info(`${caseName} callback error`, JSON.stringify(err));
            expect(Number(err.code)).assertEqual(NOT_PERMISSION);
            done();
            return;
          }
          console.log(`${caseName} callback success `, data);
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.info(`${caseName} error`, JSON.stringify(error));
        if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
          expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        }
        done();
      }
    });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Nop_001
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Nop_001
     * @tc.desc   Test addCandidateConfig Promise API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Nop_001'
        console.info(`${caseName} test start`);
        try {
          let config: wifiManager.WifiDeviceConfig = {
            ssid: "test",
            preSharedKey: "12345678",
            securityType: 0
          };
          let result = await wifiManager.addCandidateConfig(config);
          console.log(`${caseName} get result success `, result);
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_AddCandidateConfig_Nop_002
     * @tc.number Sub_Communication_WiFiManager_AddCandidateConfig_Nop_002
     * @tc.desc   Test addCandidateConfig callback API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_AddCandidateConfig_Nop_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_AddCandidateConfig_Nop_002'
        console.info(`${caseName} test start`);
        try {
          let config: wifiManager.WifiDeviceConfig = {
            ssid: "test",
            preSharedKey: "12345678",
            securityType: 0
          };
          wifiManager.addCandidateConfig(config, (err, data) => {
            if (err) {
              console.info(`${caseName} callback error`, JSON.stringify(err));
              expect(Number(err.code)).assertEqual(NOT_PERMISSION);
              done();
              return;
            }
            console.log(`${caseName} callback success `, data);
            expect().assertFail();
            done();
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
          done();
        }
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_RemoveCandidateConfig_Nop_001
     * @tc.number Sub_Communication_WiFiManager_RemoveCandidateConfig_Nop_001
     * @tc.desc   Test removeCandidateConfig Promise API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_RemoveCandidateConfig_Nop_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_RemoveCandidateConfig_Nop_001'
        console.info(`${caseName} test start`);
        try {
          let networkId = 0;
          let result = await wifiManager.removeCandidateConfig(networkId);
          console.log(`${caseName} get result success `, result);
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_RemoveCandidateConfig_Nop_002
     * @tc.number Sub_Communication_WiFiManager_RemoveCandidateConfig_Nop_002
     * @tc.desc   Test removeCandidateConfig callback API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_RemoveCandidateConfig_Nop_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_RemoveCandidateConfig_Nop_002'
        console.info(`${caseName} test start`);
        try {
          let networkId = 0;
          wifiManager.removeCandidateConfig(networkId, (err, data) => {
            if (err) {
              console.info(`${caseName} callback error`, JSON.stringify(err));
              expect(Number(err.code)).assertEqual(NOT_PERMISSION);
              done();
              return;
            }
            console.log(`${caseName} callback success `, data);
            expect().assertFail();
            done();
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
          done();
        }
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetCandidateConfigs_Nop
     * @tc.number Sub_Communication_WiFiManager_GetCandidateConfigs_Nop
     * @tc.desc   Test getCandidateConfigs API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetCandidateConfigs_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetCandidateConfigs_Nop'
        console.info(`${caseName} test start`);
        try {
          let result = wifiManager.getCandidateConfigs();
          console.log(`${caseName} get result success `, JSON.stringify(result));
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_ConnectToCandidateConfig_Nop
     * @tc.number Sub_Communication_WiFiManager_ConnectToCandidateConfig_Nop
     * @tc.desc   Test connectToCandidateConfig API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_ConnectToCandidateConfig_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_ConnectToCandidateConfig_Nop'
        console.info(`${caseName} test start`);
        try {
          let networkId = 0;
          wifiManager.connectToCandidateConfig(networkId);
          console.log(`${caseName} get result success`);
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetSignalLevel_Nop
     * @tc.number Sub_Communication_WiFiManager_GetSignalLevel_Nop
     * @tc.desc   Test getSignalLevel API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetSignalLevel_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetSignalLevel_Nop'
        console.info(`${caseName} test start`);
        try {
          let result = wifiManager.getSignalLevel(-50, 1);
          console.log(`${caseName} get result success `, result);
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetLinkedInfo_Nop_001
     * @tc.number Sub_Communication_WiFiManager_GetLinkedInfo_Nop_001
     * @tc.desc   Test getLinkedInfo Promise API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetLinkedInfo_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetLinkedInfo_Nop_001'
        console.info(`${caseName} test start`);
        try {
          let result = await wifiManager.getLinkedInfo();
          console.log(`${caseName} get result success `, JSON.stringify(result));
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetLinkedInfo_Nop_002
     * @tc.number Sub_Communication_WiFiManager_GetLinkedInfo_Nop_002
     * @tc.desc   Test getLinkedInfo callback API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetLinkedInfo_Nop_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetLinkedInfo_Nop_002'
        console.info(`${caseName} test start`);
        try {
          wifiManager.getLinkedInfo((err, data) => {
            if (err) {
              console.info(`${caseName} callback error`, JSON.stringify(err));
              expect(Number(err.code)).assertEqual(NOT_PERMISSION);
              done();
              return;
            }
            console.log(`${caseName} callback success `, JSON.stringify(data));
            expect().assertFail();
            done();
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
          done();
        }
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_IsConnected_Nop
     * @tc.number Sub_Communication_WiFiManager_IsConnected_Nop
     * @tc.desc   Test isConnected API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_IsConnected_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_IsConnected_Nop'
        console.info(`${caseName} test start`);
        try {
          let result = wifiManager.isConnected();
          console.log(`${caseName} get result success `, result);
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_IsFeatureSupported_Nop
     * @tc.number Sub_Communication_WiFiManager_IsFeatureSupported_Nop
     * @tc.desc   Test isFeatureSupported API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_IsFeatureSupported_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_IsFeatureSupported_Nop'
        console.info(`${caseName} test start`);
        try {
          let result = wifiManager.isFeatureSupported(0);
          console.log(`${caseName} get result success `, result);
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetIpInfo_Nop
     * @tc.number Sub_Communication_WiFiManager_GetIpInfo_Nop
     * @tc.desc   Test getIpInfo API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetIpInfo_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetIpInfo_Nop'
        console.info(`${caseName} test start`);
        try {
          let result = wifiManager.getIpInfo();
          console.log(`${caseName} get result success `, JSON.stringify(result));
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetP2pLinkedInfo_Nop_001
     * @tc.number Sub_Communication_WiFiManager_GetP2pLinkedInfo_Nop_001
     * @tc.desc   Test getP2pLinkedInfo Promise API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetP2pLinkedInfo_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetP2pLinkedInfo_Nop_001'
        console.info(`${caseName} test start`);
        try {
          let result = await wifiManager.getP2pLinkedInfo();
          console.log(`${caseName} get result success `, JSON.stringify(result));
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetP2pLinkedInfo_Nop_002
     * @tc.number Sub_Communication_WiFiManager_GetP2pLinkedInfo_Nop_002
     * @tc.desc   Test getP2pLinkedInfo callback API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetP2pLinkedInfo_Nop_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetP2pLinkedInfo_Nop_002'
        console.info(`${caseName} test start`);
        try {
          wifiManager.getP2pLinkedInfo((err, data) => {
            if (err) {
              console.info(`${caseName} callback error`, JSON.stringify(err));
              expect(Number(err.code)).assertEqual(NOT_PERMISSION);
              done();
              return;
            }
            console.log(`${caseName} callback success `, JSON.stringify(data));
            expect().assertFail();
            done();
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
          done();
        }
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetP2pPeerDevices_Nop_001
     * @tc.number Sub_Communication_WiFiManager_GetP2pPeerDevices_Nop_001
     * @tc.desc   Test getP2pPeerDevices Promise API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetP2pPeerDevices_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetP2pPeerDevices_Nop_001'
        console.info(`${caseName} test start`);
        try {
          let result = await wifiManager.getP2pPeerDevices();
          console.log(`${caseName} get result success `, JSON.stringify(result));
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetP2pPeerDevices_Nop_002
     * @tc.number Sub_Communication_WiFiManager_GetP2pPeerDevices_Nop_002
     * @tc.desc   Test getP2pPeerDevices callback API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetP2pPeerDevices_Nop_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetP2pPeerDevices_Nop_002'
        console.info(`${caseName} test start`);
        try {
          wifiManager.getP2pPeerDevices((err, data) => {
            if (err) {
              console.info(`${caseName} callback error`, JSON.stringify(err));
              expect(Number(err.code)).assertEqual(NOT_PERMISSION);
              done();
              return;
            }
            console.log(`${caseName} callback success `, JSON.stringify(data));
            expect().assertFail();
            done();
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
          done();
        }
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetP2pLocalDevice_Nop_001
     * @tc.number Sub_Communication_WiFiManager_GetP2pLocalDevice_Nop_001
     * @tc.desc   Test getP2pLocalDevice Promise API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetP2pLocalDevice_Nop_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetP2pLocalDevice_Nop_001'
        console.info(`${caseName} test start`);
        try {
          let result = await wifiManager.getP2pLocalDevice();
          console.log(`${caseName} get result success `, JSON.stringify(result));
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_GetP2pLocalDevice_Nop_002
     * @tc.number Sub_Communication_WiFiManager_GetP2pLocalDevice_Nop_002
     * @tc.desc   Test getP2pLocalDevice callback API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_GetP2pLocalDevice_Nop_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_GetP2pLocalDevice_Nop_002'
        console.info(`${caseName} test start`);
        try {
          wifiManager.getP2pLocalDevice((err, data) => {
            if (err) {
              console.info(`${caseName} callback error`, JSON.stringify(err));
              expect(Number(err.code)).assertEqual(NOT_PERMISSION);
              done();
              return;
            }
            console.log(`${caseName} callback success `, JSON.stringify(data));
            expect().assertFail();
            done();
          });
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
          done();
        }
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_P2pConnect_Nop
     * @tc.number Sub_Communication_WiFiManager_P2pConnect_Nop
     * @tc.desc   Test p2pConnect API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_P2pConnect_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_P2pConnect_Nop'
        console.info(`${caseName} test start`);
        try {
          let config: wifiManager.WifiP2PConfig = {
            deviceAddress: "00:11:22:33:44:55",
            netId: -1,
            passphrase: "12345678",
            groupName: "test",
            goBand: 0
          };
          let result = wifiManager.p2pConnect(config);
          console.log(`${caseName} get result success `, result);
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });

    /**
     * @tc.name   Sub_Communication_WiFiManager_P2pCancelConnect_Nop
     * @tc.number Sub_Communication_WiFiManager_P2pCancelConnect_Nop
     * @tc.desc   Test p2pCancelConnect API without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Communication_WiFiManager_P2pCancelConnect_Nop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let caseName = 'Sub_Communication_WiFiManager_P2pCancelConnect_Nop'
        console.info(`${caseName} test start`);
        try {
          let result = wifiManager.p2pCancelConnect();
          console.log(`${caseName} get result success `, result);
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName} error`, JSON.stringify(error));
          if (error.code === 801) {
            console.info('[bluetooth_js]descriptorWrite is not support');
            expect(801).assertEqual(error.code);
          } else {
            expect(Number(error.code)).assertEqual(NOT_PERMISSION);
          }
        }
        console.info(`${caseName} test end`);
        done();
      });
  })
}
function wifiManagerExtAvailable(): boolean {
  const isAvailable = canIUse("SystemCapability.Communication.wifiMg.AP.Extension");
  if (isAvailable) {
    hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SystemCapability.Communication.wifiMg.AP.Extension not available');
    return true;
  } else {
    hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SystemCapability.Communication.wifiMg.AP.Extension not available');
    return false;
  }
}