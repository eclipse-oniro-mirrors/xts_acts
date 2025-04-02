import hilog from '@ohos.hilog';
import wifiManager from '@ohos.wifiManager';
import wifiManagerExt from '@ohos.wifiManagerExt';
import geoLocationManager from '@ohos.geoLocationManager'
import { BusinessError } from '@ohos.base'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';


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

    /*
     * @tc.number:SUB_Communication_WiFi_On_P2pDiscoveryChange_Callback_Nop
     * @tc.name: testOn
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_On_P2pDiscoveryChange_Callback_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_Off_P2pDiscoveryChange_Callback_Nop
     * @tc.name: testOff
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_Off_P2pDiscoveryChange_Callback_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_On_P2pPersistentGroupChange_Callback_Nop
     * @tc.name: testOn
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_On_P2pPersistentGroupChange_Callback_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_Off_P2pPersistentGroupChange_Callback_Nop
     * @tc.name: testOff
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_Off_P2pPersistentGroupChange_Callback_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_On_P2pPeerDeviceChange_Callback_Nop
     * @tc.name: testOn
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_On_P2pPeerDeviceChange_Callback_Nop', 0, async (done: Function) => {
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


    /*
     * @tc.number:SUB_Communication_WiFi_On_P2pDeviceChange_Callback_Nop
     * @tc.name: testOff
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_On_P2pDeviceChange_Callback_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_On_P2pConnectionChange_Callback_Nop
     * @tc.name: testOn
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_On_P2pConnectionChange_Callback_Nop', 0, async (done: Function) => {
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


    /*
     * @tc.number:SUB_Communication_WiFi_Off_P2pConnectionChange_Callback_Nop
     * @tc.name: testOff
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_Off_P2pConnectionChange_Callback_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_On_P2pStateChange_Callback_Nop
     * @tc.name: testOn
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_On_P2pStateChange_Callback_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_Off_P2pStateChange_Callback_Nop
     * @tc.name: testOff
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_Off_P2pStateChange_Callback_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number: SUB_Communication_WiFi_On_HotspotStateChange_Callback_Nop
     * @tc.name: testOn
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_On_HotspotStateChange_Callback_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_Off_HotspotStateChange_Callback_Nop
     * @tc.name: testOff
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_Off_HotspotStateChange_Callback_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number: SUB_Communication_WiFi_On_WifiRssiChange_Callback_Nop
     * @tc.name: testOn
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_On_WifiRssiChange_Callback_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_Off_WifiRssiChange_Callback_Nop
     * @tc.name: testOff
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_Off_WifiRssiChange_Callback_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_P2P_CreateGroup_Nop
     * @tc.name: testWifiP2PConfig
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_P2P_CreateGroup_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_IsMeteredHotspot_Nop
     * @tc.name: testisMeteredHotspot
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_IsMeteredHotspot_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_IsBandTypeSupported_Nop
     * @tc.name: testIsBandTypeSupported
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_IsBandTypeSupported_Nop', 0, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_IsBandTypeSupported_Nop begin');
      try {
        let type: wifiManager.WifiBandType = wifiManager.WifiBandType.WIFI_BAND_2G;
        wifiManager.isBandTypeSupported(type);
        expect().assertFail();
        done();
      } catch (error) {
        hilog.error(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_IsBandTypeSupported_Nop failed ' + JSON.stringify(error));
        if (error.code == NOT_PERMISSION) {
          expect(Number(error.code)).assertEqual(NOT_PERMISSION);
        } else {
          expect(Number(error.code)).assertEqual(PARAMETER_ERROR);
        }
        done();
      }
    });

    /*
     * @tc.number:SUB_Communication_WiFi_GetCountryCode_Nop
     * @tc.name: testGetCountryCode
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_GetCountryCode_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_GetIpv6Info_Nop
     * @tc.name: testGetIpv6Info
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_GetIpv6Info_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_GetCurrentGroup_Callback_Nop
     * @tc.name: testGetCurrentGroup
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_GetCurrentGroup_Callback_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_GetCurrentGroup_Promise_Nop
     * @tc.name: testGetCurrentGroup
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_GetCurrentGroup_Promise_Nop', 0, async (done: Function) => {
      hilog.info(0x0000, 'wifiManagerTag', '%{public}s', 'SUB_Communication_WiFi_GetCurrentGroup_Promise_Nop begin');
      wifiManager.getCurrentGroup().then(() => {
        hilog.info(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_WiFi_GetCurrentGroup_Promise_Nop success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(0x0000, 'socketTag', '%{public}s', 'SUB_Communication_WiFi_GetCurrentGroup_Promise_Nop fail' + JSON.stringify(err));
        expect(Number(err.code)).assertEqual(NOT_PERMISSION);
        done();
      });
    });

    /*
     * @tc.number:SUB_Communication_WiFi_StartDiscoverDevices_Nop
     * @tc.name: testStartDiscoverDevices
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_StartDiscoverDevices_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_StopDiscoverDevices_Nop
     * @tc.name: testStopDiscoverDevices
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_StopDiscoverDevices_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_RemoveGroup_Nop
     * @tc.name: testRemoveGroup
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_RemoveGroup_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_GetSupportedPowerMode_Callback_Nop
     * @tc.name: testGetSupportedPowerMode
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_GetSupportedPowerMode_Callback_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_GetSupportedPowerMode_Promise_Nop
     * @tc.name: testGetSupportedPowerMode
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_GetSupportedPowerMode_Promise_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_GetPowerMode_Promise_Nop
     * @tc.name: testGetPowerMode
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_GetPowerMode_Promise_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_GetPowerMode_Callback_Nop
     * @tc.name: testGetPowerMode
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_GetPowerMode_Callback_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_IsHotspotActive_Nop
     * @tc.name: testIsHotspotActive
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_isHotspotActive_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_Disconnect_Nop
     * @tc.name: testDisconnect
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_Disconnect_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_EnableWifi_Nop
     * @tc.name: testEnableWifi
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_EnableWifi_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_RemoveDevice_Nop
     * @tc.name: testRemoveDevice
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_RemoveDevice_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_ConnectToNetwork_Nop
     * @tc.name: testConnectToNetwork
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_ConnectToNetwork_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_GetDeviceConfigs_Nop
     * @tc.name: testGetDeviceConfigs
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_GetDeviceConfigs_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_AddDeviceConfig_Nop
     * @tc.name: testAddDeviceConfig
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_AddDeviceConfig_Nop', 0, async (done: Function) => {
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

    /*
     * @tc.number:SUB_Communication_WiFi_GetDeviceMacAddress_Nop
     * @tc.name: testGetDeviceMacAddress
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_Communication_WiFi_GetDeviceMacAddress_Nop', 0, async (done: Function) => {
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

  });
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