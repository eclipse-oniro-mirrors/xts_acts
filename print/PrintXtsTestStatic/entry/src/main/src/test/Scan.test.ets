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
import { describe, it, expect, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import scan from '@ohos.scan';
import { BusinessError } from '@ohos.base';

const domain: int = 0x0000;
const tag: string = 'testTag';

export default function scanTest() {
  describe("scanTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   scan_function_0100
     * @tc.number scan_function_0100
     * @tc.desc   check the ScanErrorCode enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_0100', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_0100 start');
      try {
        let scanErrorCode = [
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
          scan.ScanErrorCode.SCAN_ERROR_NO_MEMORY,
        ];
        hilog.info(domain, tag, 'scanErrorCode:%{public}s', JSON.stringify(scanErrorCode));
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_0100 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_0200
     * @tc.number scan_function_0200
     * @tc.desc   check the ConstraintType enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_0200', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_0200 start');
      try {
        let constraintType = [
          scan.ConstraintType.SCAN_CONSTRAINT_NONE,
          scan.ConstraintType.SCAN_CONSTRAINT_RANGE,
          scan.ConstraintType.SCAN_CONSTRAINT_WORD_LIST,
          scan.ConstraintType.SCAN_CONSTRAINT_STRING_LIST,
        ];
        hilog.info(domain, tag, 'constraintType:%{public}s', JSON.stringify(constraintType));
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_0200 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_0300
     * @tc.number scan_function_0300
     * @tc.desc   check the PhysicalUnit enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_0300', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_0300 start');
      try {
        let physicalUnit = [
          scan.PhysicalUnit.SCAN_UNIT_NONE,
          scan.PhysicalUnit.SCAN_UNIT_PIXEL,
          scan.PhysicalUnit.SCAN_UNIT_BIT,
          scan.PhysicalUnit.SCAN_UNIT_MM,
          scan.PhysicalUnit.SCAN_UNIT_DPI,
          scan.PhysicalUnit.SCAN_UNIT_PERCENT,
          scan.PhysicalUnit.SCAN_UNIT_MICROSECOND,
        ];
        hilog.info(domain, tag, 'physicalUnit:%{public}s', JSON.stringify(physicalUnit));
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_0300 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_0400
     * @tc.number scan_function_0400
     * @tc.desc   check the OptionValueType enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_0400', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_0400 start');
      try {
        let optionValueType = [
          scan.OptionValueType.SCAN_TYPE_BOOL,
          scan.OptionValueType.SCAN_TYPE_INT,
          scan.OptionValueType.SCAN_TYPE_FIXED,
          scan.OptionValueType.SCAN_TYPE_STRING,
        ];
        hilog.info(domain, tag, 'optionValueType:%{public}s', JSON.stringify(optionValueType));
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_0400 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_0500
     * @tc.number scan_function_0500
     * @tc.desc   check the ScannerSyncMode enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_0500', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_0500 start');
      try {
        let scannerSyncMode = [
          scan.ScannerSyncMode.UPDATE_STR,
          scan.ScannerSyncMode.DELETE_STR,
        ];
        hilog.info(domain, tag, 'scannerSyncMode:%{public}s', JSON.stringify(scannerSyncMode));
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_0500 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_0600
     * @tc.number scan_function_0600
     * @tc.desc   check the ScannerDiscoveryMode enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_0600', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_0600 start');
      try {
        let scannerDiscoveryMode = [
          scan.ScannerDiscoveryMode.TCP_STR,
          scan.ScannerDiscoveryMode.USB_STR,
        ];
        hilog.info(domain, tag, 'scannerDiscoveryMode:%{public}s', JSON.stringify(scannerDiscoveryMode));
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_0600 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_0700
     * @tc.number scan_function_0700
     * @tc.desc   check the init function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_0700 start');
      try {
        scan.init().then(() => {
          hilog.info(domain, tag, 'scan_function_0700 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_0700 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_0700 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_0800
     * @tc.number scan_function_0800
     * @tc.desc   check the exit function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_0800 start');
      try {
        scan.exit().then(() => {
          hilog.info(domain, tag, 'scan_function_0800 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_0800 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_0800 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_0900
     * @tc.number scan_function_0900
     * @tc.desc   check the startScannerDiscovery function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_0900 start');
      try {
        scan.startScannerDiscovery().then(() => {
          hilog.info(domain, tag, 'scan_function_0900 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_0900 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_0900 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_1000
     * @tc.number scan_function_1000
     * @tc.desc   check the openScanner function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_1000 start');
      try {
        let scannerId: string = 'testScannerId';
        scan.openScanner(scannerId).then(() => {
          hilog.info(domain, tag, 'scan_function_1000 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_1000 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_1000 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_1001
     * @tc.number scan_function_1001
     * @tc.desc   check the openScanner function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_1001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_1001 start');
      try {
        let scannerId: string = '';
        scan.openScanner(scannerId).then(() => {
          hilog.info(domain, tag, 'scan_function_1001 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_6100 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_1001 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_1100
     * @tc.number scan_function_1100
     * @tc.desc   check the closeScanner function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_1100 start');
      try {
        let scannerId: string = 'testScannerId';
        scan.closeScanner(scannerId).then(() => {
          hilog.info(domain, tag, 'scan_function_1100 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_1100 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_1100 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_1101
     * @tc.number scan_function_1101
     * @tc.desc   check the closeScanner function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_1101', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_1101 start');
      try {
        let scannerId: string = '';
        scan.closeScanner(scannerId).then(() => {
          hilog.info(domain, tag, 'scan_function_1101 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'scan_function_1101 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_1101 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_1200
     * @tc.number scan_function_1200
     * @tc.desc   check the getScannerParameter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_1200 start');
      try {
        let scannerId: string = 'testScannerId';
        scan.getScannerParameter(scannerId).then((params: scan.ScannerParameter[]) => {
          hilog.info(domain, tag, 'scan_function_1200 success, %{public}s', JSON.stringify(params));
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_1200 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_1200 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_1300
     * @tc.number scan_function_1300
     * @tc.desc   check the setScannerParameter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_1300 start');
      try {
        let scannerId: string = 'testScannerId';
        let optionIndex: int = 1;
        let value: scan.ScannerOptionValue = {
          valueType: scan.OptionValueType.SCAN_TYPE_INT,
          numValue: 100
        };
        scan.setScannerParameter(scannerId, optionIndex, value).then(() => {
          hilog.info(domain, tag, 'scan_function_1300 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_1300 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_1300 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_1400
     * @tc.number scan_function_1400
     * @tc.desc   check the setScanAutoOption function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_1400 start');
      try {
        let scannerId: string = 'testScannerId';
        let optionIndex: int = 1;
        scan.setScanAutoOption(scannerId, optionIndex).then(() => {
          hilog.info(domain, tag, 'scan_function_1400 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_1400 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_1400 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_1500
     * @tc.number scan_function_1500
     * @tc.desc   check the getScannerCurrentSetting function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_1500 start');
      try {
        let scannerId: string = 'testScannerId';
        let optionIndex: int = 1;
        scan.getScannerCurrentSetting(scannerId, optionIndex).then((value: scan.ScannerOptionValue) => {
          hilog.info(domain, tag, 'scan_function_1500 success, %{public}s', JSON.stringify(value));
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_1500 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_1500 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_1600
     * @tc.number scan_function_1600
     * @tc.desc   check the startScan function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_1600 start');
      try {
        let scannerId: string = 'testScannerId';
        let batchMode: boolean = false;
        scan.startScan(scannerId, batchMode).then(() => {
          hilog.info(domain, tag, 'scan_function_1600 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_1600 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_1600 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_1700
     * @tc.number scan_function_1700
     * @tc.desc   check the cancelScan function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_1700 start');
      try {
        let scannerId: string = 'testScannerId';
        scan.cancelScan(scannerId).then(() => {
          hilog.info(domain, tag, 'scan_function_1700 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_1700 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_1700 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_1800
     * @tc.number scan_function_1800
     * @tc.desc   check the getPictureScanProgress function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_1800 start');
      try {
        let scannerId: string = 'testScannerId';
        scan.getPictureScanProgress(scannerId).then((progress: scan.PictureScanProgress) => {
          hilog.info(domain, tag, 'scan_function_1800 success, %{public}s', JSON.stringify(progress));
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_1800 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_1800 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_2200
     * @tc.number scan_function_2200
     * @tc.desc   check the onScanDeviceFound
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_2200', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_2200 start');
      try {
        let deviceFoundCallback = (device: scan.ScannerDevice) => {
          hilog.info(domain, tag, 'scan device found: %{public}s', JSON.stringify(device));
        };
        scan.onScanDeviceFound(deviceFoundCallback);
        scan.offScanDeviceFound(deviceFoundCallback);
        hilog.info(domain, tag, 'scan_function_2200 success');
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_2200 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_3000
     * @tc.number scan_function_3000
     * @tc.desc   check the ScanDocumentFormat enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_3000', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_3000 start');
      try {
        let range: scan.Range = {
          minValue: 0,
          maxValue: 100,
          quantValue: 1
        };
        hilog.info(domain, tag, 'range: %{public}s', JSON.stringify(range));
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_3000 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_3100
     * @tc.number scan_function_3100
     * @tc.desc   check the scannerParameter enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_3100', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_3100 start');
      try {
        let scannerParameter: scan.ScannerParameter = {
          optionName: 'testOption',
          optionIndex: 1,
          optionTitle: 'Test Option',
          optionDesc: 'Test Description',
          optionType: scan.OptionValueType.SCAN_TYPE_INT,
          optionUnit: scan.PhysicalUnit.SCAN_UNIT_DPI,
          optionConstraintType: scan.ConstraintType.SCAN_CONSTRAINT_RANGE,
          optionConstraintRange: {
            minValue: 0,
            maxValue: 100,
            quantValue: 1
          }
        };
        hilog.info(domain, tag, 'scannerParameter: %{public}s', JSON.stringify(scannerParameter));
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_3100 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_3101
     * @tc.number scan_function_3101
     * @tc.desc   check the scannerParameter enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_3101', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_3101 start');
      try {
        let scannerParameter: scan.ScannerParameter = {
          optionName: 'testStringOption',
          optionIndex: 2,
          optionTitle: 'Test String Option',
          optionDesc: 'Test String Description',
          optionType: scan.OptionValueType.SCAN_TYPE_STRING,
          optionUnit: scan.PhysicalUnit.SCAN_UNIT_NONE,
          optionConstraintType: scan.ConstraintType.SCAN_CONSTRAINT_STRING_LIST,
          optionConstraintString: ['Option1', 'Option2', 'Option3']
        };
        hilog.info(domain, tag, 'scannerParameter with string constraint: %{public}s', JSON.stringify(scannerParameter));
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_3101 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_3102
     * @tc.number scan_function_3102
     * @tc.desc   check the scannerParameter enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_3102', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_3102 start');
      try {
        let scannerParameter: scan.ScannerParameter = {
          optionName: 'testIntOption',
          optionIndex: 3,
          optionTitle: 'Test Int Option',
          optionDesc: 'Test Int Description',
          optionType: scan.OptionValueType.SCAN_TYPE_INT,
          optionUnit: scan.PhysicalUnit.SCAN_UNIT_DPI,
          optionConstraintType: scan.ConstraintType.SCAN_CONSTRAINT_WORD_LIST,
          optionConstraintInt: [75, 150, 300, 600]
        };
        hilog.info(domain, tag, 'scannerParameter with int constraint: %{public}s', JSON.stringify(scannerParameter));
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_3102 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_3200
     * @tc.number scan_function_3200
     * @tc.desc   check the ScanDuplexMode enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_3200', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_3200 start');
      try {
        let scannerOptionValue: scan.ScannerOptionValue = {
          valueType: scan.OptionValueType.SCAN_TYPE_BOOL,
          boolValue: true
        };
        hilog.info(domain, tag, 'scannerOptionValue: %{public}s', JSON.stringify(scannerOptionValue));
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_3200 error');
        expect().assertFail();
      }
    })

    /**
    * @tc.name   scan_function_3201
    * @tc.number scan_function_3201
    * @tc.desc   check the ScannerOptionValue with string value
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('scan_function_3201', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_3201 start');
      try {
        let scannerOptionValue: scan.ScannerOptionValue = {
          valueType: scan.OptionValueType.SCAN_TYPE_STRING,
          strValue: 'Test String Value'
        };
        hilog.info(domain, tag, 'scannerOptionValue with string: %{public}s', JSON.stringify(scannerOptionValue));
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_3201 error');
        expect().assertFail();
      }
    })

    /**
    * @tc.name   scan_function_3202
    * @tc.number scan_function_3202
    * @tc.desc   check the ScannerOptionValue with integer value
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('scan_function_3202', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_3202 start');
      try {
        let scannerOptionValue: scan.ScannerOptionValue = {
          valueType: scan.OptionValueType.SCAN_TYPE_INT,
          numValue: 100
        };
        hilog.info(domain, tag, 'scannerOptionValue with integer: %{public}s', JSON.stringify(scannerOptionValue));
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_3202 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_3300
     * @tc.number scan_function_3300
     * @tc.desc   check the ScanImageFormat enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_3300', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_3300 start');
      try {
        let pictureScanProgress: scan.PictureScanProgress = {
          progress: 50,
          pictureFd: 1,
          isFinal: false
        };
        hilog.info(domain, tag, 'pictureScanProgress: %{public}s', JSON.stringify(pictureScanProgress));
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_3300 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_3400
     * @tc.number scan_function_3400
     * @tc.desc   check the ScanImageCompression enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_3400', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_3400 start');
      try {
        let scannerDevice: scan.ScannerDevice = {
          scannerId: 'testScannerId',
          discoveryMode: scan.ScannerDiscoveryMode.TCP_STR,
          uniqueId: 'testUniqueId',
          manufacturer: 'Test Manufacturer',
          model: 'Test Model',
          deviceName: 'Test Device'
        };
        hilog.info(domain, tag, 'scannerDevice: %{public}s', JSON.stringify(scannerDevice));
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_3400 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_3500
     * @tc.number scan_function_3500
     * @tc.desc   check the ScanImageFilter enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_3500', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_3500 start');
      try {
        let scannerSyncDevice: scan.ScannerSyncDevice = {
          scannerId: 'testScannerId',
          discoveryMode: scan.ScannerDiscoveryMode.TCP_STR,
          uniqueId: 'testUniqueId',
          syncMode: scan.ScannerSyncMode.UPDATE_STR,
          oldScannerId: 'oldScannerId'
        };
        hilog.info(domain, tag, 'scannerSyncDevice: %{public}s', JSON.stringify(scannerSyncDevice));
      } catch (err) {
        hilog.error(domain, tag, 'scan_function_3500 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_3800
     * @tc.number scan_function_3800
     * @tc.desc   check getScannerParameter with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_3800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_3800 start');
      try {
        let scannerId: string = '';
        scan.getScannerParameter(scannerId).then((params: scan.ScannerParameter[]) => {
          hilog.info(domain, tag, 'scan_function_3800 success, %{public}s', JSON.stringify(params));
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'scan_function_3800 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_3800 error');
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   scan_function_3900
     * @tc.number scan_function_3900
     * @tc.desc   check setScannerParameter with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_3900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_3900 start');
      try {
        let scannerId: string = '';
        let optionIndex: int = 1;
        let value: scan.ScannerOptionValue = {
          valueType: scan.OptionValueType.SCAN_TYPE_INT,
          numValue: 100
        };
        scan.setScannerParameter(scannerId, optionIndex, value).then(() => {
          hilog.info(domain, tag, 'scan_function_3900 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'scan_function_3900 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_3900 error');
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   scan_function_4000
     * @tc.number scan_function_4000
     * @tc.desc   check setScanAutoOption with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_4000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_4000 start');
      try {
        let scannerId: string = '';
        let optionIndex: int = 1;
        scan.setScanAutoOption(scannerId, optionIndex).then(() => {
          hilog.info(domain, tag, 'scan_function_4000 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'scan_function_4000 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_4000 error');
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   scan_function_4100
     * @tc.number scan_function_4100
     * @tc.desc   check getScannerCurrentSetting with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_4100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_4100 start');
      try {
        let scannerId: string = '';
        let optionIndex: int = 1;
        scan.getScannerCurrentSetting(scannerId, optionIndex).then((value: scan.ScannerOptionValue) => {
          hilog.info(domain, tag, 'scan_function_4100 success, %{public}s', JSON.stringify(value));
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'scan_function_4100 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_4100 error');
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   scan_function_4200
     * @tc.number scan_function_4200
     * @tc.desc   check startScan with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_4200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_4200 start');
      try {
        let scannerId: string = '';
        let batchMode: boolean = false;
        scan.startScan(scannerId, batchMode).then(() => {
          hilog.info(domain, tag, 'scan_function_4200 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'scan_function_4200 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_4200 error');
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   scan_function_4300
     * @tc.number scan_function_4300
     * @tc.desc   check cancelScan with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_4300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_4300 start');
      try {
        let scannerId: string = '';
        scan.cancelScan(scannerId).then(() => {
          hilog.info(domain, tag, 'scan_function_4300 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'scan_function_4300 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_4300 error');
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   scan_function_4400
     * @tc.number scan_function_4400
     * @tc.desc   check getPictureScanProgress with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_4400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_4400 start');
      try {
        let scannerId: string = '';
        scan.getPictureScanProgress(scannerId).then((progress: scan.PictureScanProgress) => {
          hilog.info(domain, tag, 'scan_function_4400 success, %{public}s', JSON.stringify(progress));
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'scan_function_4400 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_4400 error');
        expect().assertFail();
        done();
      }
    })
  })
}
