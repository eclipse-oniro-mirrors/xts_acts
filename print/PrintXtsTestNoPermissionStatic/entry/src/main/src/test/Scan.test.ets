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
     * @tc.desc   check the init function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_0100 start');
      try {
        scan.init().then(() => {
          hilog.info(domain, tag, 'scan_function_0100 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_0100 error, %{public}s', JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_0100 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_0200
     * @tc.number scan_function_0200
     * @tc.desc   check the exit function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_0200 start');
      try {
        scan.exit().then(() => {
          hilog.info(domain, tag, 'scan_function_0200 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_0200 error, %{public}s', JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_0200 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_0300
     * @tc.number scan_function_0300
     * @tc.desc   check the startScannerDiscovery function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_0300 start');
      try {
        scan.startScannerDiscovery().then(() => {
          hilog.info(domain, tag, 'scan_function_0300 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_0300 error, %{public}s', JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_0300 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_0400
     * @tc.number scan_function_0400
     * @tc.desc   check the openScanner function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_0400 start');
      try {
        let scannerId: string = 'testScannerId';
        scan.openScanner(scannerId).then(() => {
          hilog.info(domain, tag, 'scan_function_0400 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_0400 error, %{public}s', JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_0400 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_0500
     * @tc.number scan_function_0500
     * @tc.desc   check the closeScanner function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_0500 start');
      try {
        let scannerId: string = 'testScannerId';
        scan.closeScanner(scannerId).then(() => {
          hilog.info(domain, tag, 'scan_function_0500 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_0500 error, %{public}s', JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_0500 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_0600
     * @tc.number scan_function_0600
     * @tc.desc   check the getScannerParameter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_0600 start');
      try {
        let scannerId: string = 'testScannerId';
        scan.getScannerParameter(scannerId).then((params: scan.ScannerParameter[]) => {
          hilog.info(domain, tag, 'scan_function_0600 success, %{public}s', JSON.stringify(params));
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_0600 error, %{public}s', JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_0600 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_0700
     * @tc.number scan_function_0700
     * @tc.desc   check the disconnectScanner function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_0700 start');
      try {
        let scannerId: string = 'testScannerId';
        let optionIndex: int = 1;
        let value: scan.ScannerOptionValue = {
          valueType: scan.OptionValueType.SCAN_TYPE_INT,
          numValue: 100
        };
        scan.setScannerParameter(scannerId, optionIndex, value).then(() => {
          hilog.info(domain, tag, 'scan_function_0700 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_0700 error, %{public}s', JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_0700 error');
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
          expect(error.code).assertEqual(201);
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
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_1500 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_1601
     * @tc.number scan_function_1601
     * @tc.desc   check the startScan function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_1601', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_1601 start');
      try {
        let scannerId: string = 'testScannerId';
        let batchMode: boolean = false;
        scan.startScan(scannerId, batchMode).then(() => {
          hilog.info(domain, tag, 'scan_function_1601 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'scan_function_1601 error, %{public}s', JSON.stringify(error));
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_1601 error');
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
          expect(error.code).assertEqual(201);
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
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_1800 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   scan_function_2300
     * @tc.number scan_function_2300
     * @tc.desc   check offScanDeviceSync without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scan_function_2300', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'scan_function_2300 start');
      try {
        let deviceFoundCallback = (device: scan.ScannerDevice) => {
          hilog.info(domain, tag, 'scan device found: %{public}s', JSON.stringify(device));
        };
        scan.onScanDeviceFound(deviceFoundCallback);
        scan.offScanDeviceFound(deviceFoundCallback);
        hilog.info(domain, tag, 'scan_function_2300 success');
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'scan_function_2300 error');
        expect(error.code).assertEqual(201);
      }
    })
  })
}
