/*
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

import hilog from '@ohos.hilog';
import { describe, it, expect, Level } from '@ohos/hypium';
import scan from '@ohos.scan';
import { BusinessError } from '@ohos.base';

const DOMAIN: number = 0x0023;
const TAG: string = 'scanTestXTS';

export default function scanTest() {
  describe('scanTest', () => {
    let scannerId: string = '';
    let uniqueId: string = '';
    let optionIndex: number = 0;
    /**
     * @tc.number scan_function_0100
     * @tc.name scan_function_0100
     * @tc.desc Verify scan initialization succeeds
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0100', Level.LEVEL1, async (done: Function) => {
      await scan.init().then(() => {
        hilog.info(DOMAIN, TAG, 'init success');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'init failed, code = ' + err.code);
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.number scan_function_0200
     * @tc.name scan_function_0200
     * @tc.desc Verify scan exit succeeds
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0200', Level.LEVEL1, async (done: Function) => {
      await scan.exit().then(() => {
        hilog.info(DOMAIN, TAG, 'exit success');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'exit failed, code = ' + err.code);
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.number scan_function_0300
     * @tc.name scan_function_0300
     * @tc.desc Verify scanner discovery succeeds and finds devices
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0300', Level.LEVEL1, async (done: Function) => {
      try {
        scan.on('scanDeviceFound', (device: scan.ScannerDevice) => {
          hilog.info(DOMAIN, TAG, 'Found device: ' + JSON.stringify(device));
          scannerId = device.scannerId;
          uniqueId = device.uniqueId;
        });
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'on scanDeviceFound failed');
        expect().assertFail();
      }

      await scan.startScannerDiscovery().then(() => {
        hilog.info(DOMAIN, TAG, 'startScannerDiscovery success');
        setTimeout(() => {
          scan.off('scanDeviceFound');
          done();
        }, 500);
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'startScannerDiscovery failed, code = ' + err.code);
        scan.off('scanDeviceFound');
        expect().assertFail();
        done();
      });
    });

    /**
     * @tc.number scan_function_0400
     * @tc.name scan_function_0400
     * @tc.desc Verify opening a scanner succeeds
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0400', Level.LEVEL1, async (done: Function) => {
      await scan.openScanner(scannerId).then(() => {
        hilog.info(DOMAIN, TAG, 'openScanner success');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'openScanner failed, code = ' + err.code);
        expect(err.code).assertEqual(scan.ScanErrorCode.SCAN_ERROR_INVALID_PARAMETER);
        done();
      });
    });

    /**
     * @tc.number scan_function_0500
     * @tc.name scan_function_0500
     * @tc.desc Verify closing a scanner succeeds
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0500', Level.LEVEL1, async (done: Function) => {
      await scan.closeScanner(scannerId).then(() => {
        hilog.info(DOMAIN, TAG, 'closeScanner success');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'closeScanner failed, code = ' + err.code);
        expect(err.code).assertEqual(scan.ScanErrorCode.SCAN_ERROR_INVALID_PARAMETER);
        done();
      });
    });

    /**
     * @tc.number scan_function_0600
     * @tc.name scan_function_0600
     * @tc.desc Verify getting added scanners succeeds
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0600', Level.LEVEL1, async (done: Function) => {
      await scan.getAddedScanners().then((devices: scan.ScannerDevice[]) => {
        hilog.info(DOMAIN, TAG, 'getAddedScanners success, count: ' + devices.length);
        devices.forEach((device) => {
          hilog.info(DOMAIN, TAG, 'Device: ' + JSON.stringify(device));
        });
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'getAddedScanners failed, code = ' + err.code);
        expect(err.code).assertEqual(202);
        done();
      });
    });

    /**
     * @tc.number scan_function_0700
     * @tc.name scan_function_0700
     * @tc.desc Verify getting scanner parameters succeeds
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0700', Level.LEVEL1, async (done: Function) => {
      await scan.getScannerParameter(scannerId).then((params: scan.ScannerParameter[]) => {
        hilog.info(DOMAIN, TAG, 'getScannerParameter success, count: ' + params.length);
        params.forEach((param) => {
          hilog.info(DOMAIN, TAG, 'Parameter: ' + JSON.stringify(param));
        });
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'getScannerParameter failed, code = ' + err.code);
        expect(err.code).assertEqual(scan.ScanErrorCode.SCAN_ERROR_INVALID_PARAMETER);
        done();
      });
    });

    /**
     * @tc.number scan_function_0800
     * @tc.name scan_function_0800
     * @tc.desc Verify setting scanner parameter succeeds
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0800', Level.LEVEL1, async (done: Function) => {
      const optionValue: scan.ScannerOptionValue = {
        valueType: scan.OptionValueType.SCAN_TYPE_STRING,
        strValue: 'Gray'
      };

      await scan.setScannerParameter(scannerId, 2, optionValue).then(() => {
        hilog.info(DOMAIN, TAG, 'setScannerParameter success');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'setScannerParameter failed, code = ' + err.code);
        expect(err.code).assertEqual(scan.ScanErrorCode.SCAN_ERROR_INVALID_PARAMETER);
        done();
      });
    });

    /**
     * @tc.number scan_function_0900
     * @tc.name scan_function_0900
     * @tc.desc Verify scan enums are accessible
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('scan_function_0900', Level.LEVEL2, () => {
      try {
        // Test ScanErrorCode enum
        const errorCodes: scan.ScanErrorCode[] = [
          scan.ScanErrorCode.SCAN_ERROR_NO_PERMISSION,
          scan.ScanErrorCode.SCAN_ERROR_NOT_SYSTEM_APPLICATION,
          scan.ScanErrorCode.SCAN_ERROR_INVALID_PARAMETER,
          scan.ScanErrorCode.SCAN_ERROR_GENERIC_FAILURE,
          scan.ScanErrorCode.SCAN_ERROR_RPC_FAILURE,
          scan.ScanErrorCode.SCAN_ERROR_SERVER_FAILURE,
          scan.ScanErrorCode.SCAN_ERROR_UNSUPPORTED,
          scan.ScanErrorCode.SCAN_ERROR_CANCELED,
          scan.ScanErrorCode.SCAN_ERROR_DEVICE_BUSY,
          scan.ScanErrorCode.SCAN_ERROR_INVALID,
          scan.ScanErrorCode.SCAN_ERROR_JAMMED,
          scan.ScanErrorCode.SCAN_ERROR_NO_DOCS,
          scan.ScanErrorCode.SCAN_ERROR_COVER_OPEN,
          scan.ScanErrorCode.SCAN_ERROR_IO_ERROR,
          scan.ScanErrorCode.SCAN_ERROR_NO_MEMORY
        ];
        hilog.info(DOMAIN, TAG, 'ScanErrorCode values: ' + JSON.stringify(errorCodes));
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'Test ScanErrorCode enum failed');
        expect().assertFail();
      }

      try {
        // Test ConstraintType enum
        const constraintTypes: scan.ConstraintType[] = [
          scan.ConstraintType.SCAN_CONSTRAINT_NONE,
          scan.ConstraintType.SCAN_CONSTRAINT_RANGE,
          scan.ConstraintType.SCAN_CONSTRAINT_WORD_LIST,
          scan.ConstraintType.SCAN_CONSTRAINT_STRING_LIST
        ];
        hilog.info(DOMAIN, TAG, 'ConstraintType values: ' + JSON.stringify(constraintTypes));
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'Test constraintTypes enum failed');
        expect().assertFail();
      }

      try {
        // Test PhysicalUnit enum
        const physicalUnits: scan.PhysicalUnit[] = [
          scan.PhysicalUnit.SCAN_UNIT_NONE,
          scan.PhysicalUnit.SCAN_UNIT_PIXEL,
          scan.PhysicalUnit.SCAN_UNIT_BIT,
          scan.PhysicalUnit.SCAN_UNIT_MM,
          scan.PhysicalUnit.SCAN_UNIT_DPI,
          scan.PhysicalUnit.SCAN_UNIT_PERCENT,
          scan.PhysicalUnit.SCAN_UNIT_MICROSECOND
        ];
        hilog.info(DOMAIN, TAG, 'PhysicalUnit values: ' + JSON.stringify(physicalUnits));
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'Test PhysicalUnit enum failed');
        expect().assertFail();
      }

      try {
        // Test OptionValueType enum
        const optionValueTypes: scan.OptionValueType[] = [
          scan.OptionValueType.SCAN_TYPE_BOOL,
          scan.OptionValueType.SCAN_TYPE_INT,
          scan.OptionValueType.SCAN_TYPE_FIXED,
          scan.OptionValueType.SCAN_TYPE_STRING
        ];
        hilog.info(DOMAIN, TAG, 'OptionValueType values: ' + JSON.stringify(optionValueTypes));
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'Test OptionValueType enum failed');
        expect().assertFail();
      }

      try {
        // Test ScannerDiscoveryMode enum
        const discoveryModes: scan.ScannerDiscoveryMode[] = [
          scan.ScannerDiscoveryMode.TCP_STR,
          scan.ScannerDiscoveryMode.USB_STR
        ];
        hilog.info(DOMAIN, TAG, 'ScannerDiscoveryMode values: ' + JSON.stringify(discoveryModes));
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'Test ScannerDiscoveryMode enum failed');
        expect().assertFail();
      }

      try {
        const syncMode: scan.ScannerSyncMode[] = [
          scan.ScannerSyncMode.UPDATE_STR,
          scan.ScannerSyncMode.DELETE_STR
        ];
        hilog.info(DOMAIN, TAG, 'ScannerSyncMode values: ' + JSON.stringify(syncMode));
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'Test ScannerSyncMode enum failed');
        expect().assertFail();
      }
    });

    /**
     * @tc.number scan_function_1000
     * @tc.name scan_function_1000
     * @tc.desc Verify adding a scanner succeeds (system API)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_1000', Level.LEVEL1, async (done: Function) => {
      await scan.addScanner(uniqueId, scan.ScannerDiscoveryMode.USB_STR).then(() => {
        hilog.info(DOMAIN, TAG, 'addScanner success');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'addScanner failed, code = ' + err.code);
        expect(err.code).assertEqual(202);
        done();
      });
    });

    /**
     * @tc.number scan_function_1100
     * @tc.name scan_function_1100
     * @tc.desc Verify deleting a scanner succeeds (system API)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_1100', Level.LEVEL1, async (done: Function) => {
      await scan.deleteScanner(uniqueId, scan.ScannerDiscoveryMode.USB_STR).then(() => {
        hilog.info(DOMAIN, TAG, 'deleteScanner success');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'deleteScanner failed, code = ' + err.code);
        expect(err.code).assertEqual(202);
        done();
      });
    });

    /**
     * @tc.number scan_function_1200
     * @tc.name scan_function_1200
     * @tc.desc Verify scan device sync event works
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_1200', Level.LEVEL1, async (done: Function) => {
        try {
          scan.on('scanDeviceSync', (device: scan.ScannerSyncDevice) => {
            hilog.info(DOMAIN, TAG, 'scanDeviceSync event: ' + JSON.stringify(device));
          });
          setTimeout(() => {
            scan.off('scanDeviceSync');
            done();
          }, 500);
        } catch (e) {
          hilog.error(DOMAIN, TAG, 'test scanDeviceSync failed');
          expect().assertFail();
        }
    });

    /**
     * @tc.number scan_function_1300
     * @tc.name scan_function_1300
     * @tc.desc Verify setting scan option to auto succeeds
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_1300', Level.LEVEL1, async (done: Function) => {

      await scan.setScanAutoOption(scannerId, optionIndex).then(() => {
        hilog.info(DOMAIN, TAG, 'setScanAutoOption success');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'setScanAutoOption failed, code = ' + err.code);
        expect(err.code).assertEqual(scan.ScanErrorCode.SCAN_ERROR_INVALID_PARAMETER);
        done();
      });
    });

    /**
     * @tc.number scan_function_1400
     * @tc.name scan_function_1400
     * @tc.desc Verify getting current scanner setting succeeds
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_1400', Level.LEVEL1, async (done: Function) => {
      await scan.getScannerCurrentSetting(scannerId, optionIndex).then((setting: scan.ScannerOptionValue) => {
        hilog.info(DOMAIN, TAG, 'getScannerCurrentSetting success: ' + JSON.stringify(setting));
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'getScannerCurrentSetting failed, code = ' + err.code);
        expect(err.code).assertEqual(scan.ScanErrorCode.SCAN_ERROR_INVALID_PARAMETER);
        done();
      });
    });

    /**
     * @tc.number scan_function_1500
     * @tc.name scan_function_1500
     * @tc.desc Verify starting scan succeeds
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_1500', Level.LEVEL1, async (done: Function) => {
      const batchMode = false;
      await scan.startScan(scannerId, batchMode).then(() => {
        hilog.info(DOMAIN, TAG, 'startScan success');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'startScan failed, code = ' + err.code);
        expect(err.code).assertEqual(scan.ScanErrorCode.SCAN_ERROR_INVALID_PARAMETER);
        done();
      });
    });

    /**
     * @tc.number scan_function_1600
     * @tc.name scan_function_1600
     * @tc.desc Verify canceling scan succeeds
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_1600', Level.LEVEL1, async (done: Function) => {
      await scan.cancelScan(scannerId).then(() => {
        hilog.info(DOMAIN, TAG, 'cancelScan success');
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'cancelScan failed, code = ' + err.code);
        expect(err.code).assertEqual(scan.ScanErrorCode.SCAN_ERROR_INVALID_PARAMETER);
        done();
      });
    });

    /**
     * @tc.number scan_function_1700
     * @tc.name scan_function_1700
     * @tc.desc Verify getting picture scan progress succeeds
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_1700', Level.LEVEL1, async (done: Function) => {
      await scan.getPictureScanProgress(scannerId).then((progress: scan.PictureScanProgress) => {
        hilog.info(DOMAIN, TAG, 'getPictureScanProgress success: ' + JSON.stringify(progress));
        expect(progress).not().assertUndefined();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'getPictureScanProgress failed, code = ' + err.code);
        expect(err.code).assertEqual(scan.ScanErrorCode.SCAN_ERROR_INVALID_PARAMETER);
        done();
      });
    });

    /**
     * @tc.number scan_function_1800
     * @tc.name scan_function_1800
     * @tc.desc Verify scan device add event works (system API)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_1800', Level.LEVEL1, async (done: Function) => {

      try {
        scan.on('scanDeviceAdd', (device: scan.ScannerDevice) => {
          hilog.info(DOMAIN, TAG, 'scanDeviceAdd event: ' + JSON.stringify(device));
        });

        setTimeout(() => {
          scan.off('scanDeviceAdd');
          done();
        }, 500);
      } catch (err) {
        hilog.error(DOMAIN, TAG, 'scanDeviceAdd test failed: ' + JSON.stringify(err));
        expect(err.code).assertEqual(202);
        done();
      }
    });

    /**
     * @tc.number scan_function_1900
     * @tc.name scan_function_1900
     * @tc.desc Verify scan device delete event works (system API)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_1900', Level.LEVEL1, async (done: Function) => {

      try {
        scan.on('scanDeviceDel', (device: scan.ScannerDevice) => {
          hilog.info(DOMAIN, TAG, 'scanDeviceDel event: ' + JSON.stringify(device));
        });
        setTimeout(() => {
          scan.off('scanDeviceDel');
          done();
        }, 500);
      } catch (err) {
        hilog.error(DOMAIN, TAG, 'scanDeviceDel test failed: ' + JSON.stringify(err));
        expect(err.code).assertEqual(202);
        done();
      }
    });

    /**
     * @tc.number scan_function_2000
     * @tc.name scan_function_2000
     * @tc.desc Test ScannerParameter
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_2000', Level.LEVEL1, async (done: Function) => {

      await scan.getScannerParameter(scannerId).then((params: scan.ScannerParameter[]) => {
        hilog.info(DOMAIN, TAG, 'getScannerParameter success, count: ' + params.length);
        params.forEach((param: scan.ScannerParameter) => {
          hilog.info(DOMAIN, TAG, 'optionName: ' + param.optionName);
          hilog.info(DOMAIN, TAG, 'optionIndex: ' + param.optionIndex);
          hilog.info(DOMAIN, TAG, 'optionTitle: ' + param.optionTitle);
          hilog.info(DOMAIN, TAG, 'optionDesc: ' + param.optionDesc);
          hilog.info(DOMAIN, TAG, 'optionType: ' + param.optionType);
          hilog.info(DOMAIN, TAG, 'optionUnit: ' + param.optionUnit);
          hilog.info(DOMAIN, TAG, 'optionConstraintType: ' + param.optionConstraintType);
          let optionConstraintString : string[] | undefined = param.optionConstraintString;
          if (optionConstraintString != undefined) {
            hilog.info(DOMAIN, TAG, 'range.optionConstraintString: ' + JSON.stringify(optionConstraintString));
          }
          let optionConstraintInt : number[] | undefined = param.optionConstraintInt;
          if (optionConstraintInt != undefined) {
            hilog.info(DOMAIN, TAG, 'range.optionConstraintInt: ' + JSON.stringify(optionConstraintInt));
          }
          let range : scan.Range | undefined = param.optionConstraintRange;
          if (range != undefined) {
            hilog.info(DOMAIN, TAG, 'range.minValue: ' + range.minValue);
            hilog.info(DOMAIN, TAG, 'range.maxValue: ' + range.maxValue);
            hilog.info(DOMAIN, TAG, 'range.quantValue: ' + range.quantValue);
          }
        });
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'getScannerParameter failed, code = ' + err.code);
        expect(err.code).assertEqual(scan.ScanErrorCode.SCAN_ERROR_INVALID_PARAMETER);
        done();
      });
    });

    /**
     * @tc.number scan_function_2100
     * @tc.name scan_function_2100
     * @tc.desc Test ScannerOptionValue
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_2100', Level.LEVEL1, async (done: Function) => {

      await scan.getScannerCurrentSetting(scannerId, optionIndex).then((setting: scan.ScannerOptionValue) => {
        let valueType : scan.OptionValueType = setting.valueType;
        hilog.info(DOMAIN, TAG, 'valueType: ' + valueType);
        let numValue : number | undefined = setting.numValue;
        if (numValue != undefined) {
          hilog.info(DOMAIN, TAG, 'numValue: ' + numValue);
        }
        let strValue : string | undefined = setting.strValue;
        if (strValue != undefined) {
          hilog.info(DOMAIN, TAG, 'strValue: ' + strValue);
        }
        let boolValue : boolean | undefined = setting.boolValue;
        if (boolValue != undefined) {
          hilog.info(DOMAIN, TAG, 'boolValue: ' + boolValue);
        }
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'getScannerCurrentSetting failed, code = ' + err.code);
        expect(err.code).assertEqual(scan.ScanErrorCode.SCAN_ERROR_INVALID_PARAMETER);
        done();
      });
    });

    /**
     * @tc.number scan_function_2200
     * @tc.name scan_function_2200
     * @tc.desc Test ScannerOptionValue
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_2200', Level.LEVEL1, async (done: Function) => {
      await scan.getPictureScanProgress(scannerId).then((progress: scan.PictureScanProgress) => {
        let progressNumber : number = progress.progress;
        hilog.info(DOMAIN, TAG, 'progressNumber: ' + progressNumber);
        let pictureFd : number = progress.pictureFd;
        hilog.info(DOMAIN, TAG, 'pictureFd: ' + pictureFd);
        let isFinal : boolean = progress.isFinal;
        hilog.info(DOMAIN, TAG, 'isFinal: ' + isFinal);
        expect(progress).not().assertUndefined();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'getPictureScanProgress failed, code = ' + err.code);
        expect(err.code).assertEqual(scan.ScanErrorCode.SCAN_ERROR_INVALID_PARAMETER);
        done();
      });
    });

    /**
     * @tc.number scan_function_2300
     * @tc.name scan_function_2300
     * @tc.desc Test ScannerDevice
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_2300', Level.LEVEL1, async (done: Function) => {
      try {
        scan.on('scanDeviceFound', (device: scan.ScannerDevice) => {
          hilog.info(DOMAIN, TAG, 'Found device: ' + JSON.stringify(device));
          scannerId = device.scannerId;
          uniqueId = device.uniqueId;
          hilog.info(DOMAIN, TAG, 'discoveryMode: ' + device.discoveryMode);
          hilog.info(DOMAIN, TAG, 'manufacturer: ' + device.manufacturer);
          hilog.info(DOMAIN, TAG, 'model: ' + device.model);
          hilog.info(DOMAIN, TAG, 'deviceName: ' + device.deviceName);
        });
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'on scanDeviceFound failed');
        expect().assertFail();
      }
      try {
        setTimeout(() => {
          scan.off('scanDeviceFound');
          done();
        }, 500);
      } catch (e) {
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number scan_function_2400
     * @tc.name scan_function_2400
     * @tc.desc Test ScannerDevice
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_2400', Level.LEVEL1, async (done: Function) => {
      try {
        scan.on('scanDeviceSync', (device: scan.ScannerSyncDevice) => {
          hilog.info(DOMAIN, TAG, 'scannerId: ' + device.scannerId);
          hilog.info(DOMAIN, TAG, 'discoveryMode: ' + device.discoveryMode);
          let oldScannerId : string | undefined = device.oldScannerId;
          if (oldScannerId != undefined) {
            hilog.info(DOMAIN, TAG, 'oldScannerId: ' + device.oldScannerId);
          }
        });
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'on scanDeviceFound failed');
        expect().assertFail();
      }
      try {
        setTimeout(() => {
          scan.off('scanDeviceSync');
          done();
        }, 500);
      } catch (e) {
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number scan_function_2500
     * @tc.name scan_function_2500
     * @tc.desc Test ScannerSyncDevice
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_2500', Level.LEVEL1, async (done: Function) => {
      try {
        scan.on('scanDeviceSync', (device: scan.ScannerSyncDevice) => {
          hilog.info(DOMAIN, TAG, 'uniqueId: ' + device.uniqueId);
          hilog.info(DOMAIN, TAG, 'syncMode: ' + device.syncMode);
        });
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'on scanDeviceSync failed');
        expect().assertFail();
      }
      try {
        setTimeout(() => {
          scan.off('scanDeviceSync');
          done();
        }, 500);
      } catch (e) {
        expect().assertFail();
        done();
      }
    });
  });
}
