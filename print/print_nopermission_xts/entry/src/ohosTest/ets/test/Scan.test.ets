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
    /**
     * @tc.number scan_function_0100
     * @tc.name scan_function_0100
     * @tc.desc Verify scan initialization fails with no permission
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0100', Level.LEVEL1, async (done: Function) => {
      await scan.init().then(() => {
        hilog.info(DOMAIN, TAG, 'init success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'init failed, code = ' + err.code);
        expect(err.code).assertEqual(201);
        done();
      });
    });

    /**
     * @tc.number scan_function_0200
     * @tc.name scan_function_0200
     * @tc.desc Verify scan exit fails with no permission
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0200', Level.LEVEL1, async (done: Function) => {
      await scan.exit().then(() => {
        hilog.info(DOMAIN, TAG, 'exit success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'exit failed, code = ' + err.code);
        expect(err.code).assertEqual(201);
        done();
      });
    });

    /**
     * @tc.number scan_function_0300
     * @tc.name scan_function_0300
     * @tc.desc Verify scanner discovery fails with no permission
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0300', Level.LEVEL1, async (done: Function) => {
      await scan.startScannerDiscovery().then(() => {
        hilog.info(DOMAIN, TAG, 'startScannerDiscovery success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'startScannerDiscovery failed, code = ' + err.code);
        expect(err.code).assertEqual(201);
        done();
      });
    });

    /**
     * @tc.number scan_function_0400
     * @tc.name scan_function_0400
     * @tc.desc Verify opening a scanner fails with no permission
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0400', Level.LEVEL1, async (done: Function) => {
      await scan.openScanner('test_scanner_id').then(() => {
        hilog.info(DOMAIN, TAG, 'openScanner success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'openScanner failed, code = ' + err.code);
        expect(err.code).assertEqual(201);
        done();
      });
    });

    /**
     * @tc.number scan_function_0500
     * @tc.name scan_function_0500
     * @tc.desc Verify closing a scanner fails with no permission
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0500', Level.LEVEL1, async (done: Function) => {
      await scan.closeScanner('test_scanner_id').then(() => {
        hilog.info(DOMAIN, TAG, 'closeScanner success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'closeScanner failed, code = ' + err.code);
        expect(err.code).assertEqual(201);
        done();
      });
    });

    /**
     * @tc.number scan_function_0600
     * @tc.name scan_function_0600
     * @tc.desc Verify getting scanner parameters fails with no permission
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0600', Level.LEVEL1, async (done: Function) => {
      await scan.getScannerParameter('test_scanner_id').then(() => {
        hilog.info(DOMAIN, TAG, 'getScannerParameter success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'getScannerParameter failed, code = ' + err.code);
        expect(err.code).assertEqual(201);
        done();
      });
    });

    /**
     * @tc.number scan_function_0700
     * @tc.name scan_function_0700
     * @tc.desc Verify setting scanner parameter fails with no permission
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0700', Level.LEVEL1, async (done: Function) => {
      const optionValue: scan.ScannerOptionValue = {
        valueType: scan.OptionValueType.SCAN_TYPE_STRING,
        strValue: 'Gray'
      };

      await scan.setScannerParameter('test_scanner_id', 2, optionValue).then(() => {
        hilog.info(DOMAIN, TAG, 'setScannerParameter success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'setScannerParameter failed, code = ' + err.code);
        expect(err.code).assertEqual(201);
        done();
      });
    });

    /**
     * @tc.number scan_function_0800
     * @tc.name scan_function_0800
     * @tc.desc Verify setting scan auto option fails with no permission
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0800', Level.LEVEL1, async (done: Function) => {
      await scan.setScanAutoOption('test_scanner_id', 0).then(() => {
        hilog.info(DOMAIN, TAG, 'setScanAutoOption success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'setScanAutoOption failed, code = ' + err.code);
        expect(err.code).assertEqual(201);
        done();
      });
    });

    /**
     * @tc.number scan_function_0900
     * @tc.name scan_function_0900
     * @tc.desc Verify getting current scanner setting fails with no permission
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_0900', Level.LEVEL1, async (done: Function) => {
      await scan.getScannerCurrentSetting('test_scanner_id', 0).then(() => {
        hilog.info(DOMAIN, TAG, 'getScannerCurrentSetting success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'getScannerCurrentSetting failed, code = ' + err.code);
        expect(err.code).assertEqual(201);
        done();
      });
    });

    /**
     * @tc.number scan_function_1000
     * @tc.name scan_function_1000
     * @tc.desc Verify starting scan fails with no permission
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_1000', Level.LEVEL1, async (done: Function) => {
      await scan.startScan('test_scanner_id', false).then(() => {
        hilog.info(DOMAIN, TAG, 'startScan success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'startScan failed, code = ' + err.code);
        expect(err.code).assertEqual(201);
        done();
      });
    });

    /**
     * @tc.number scan_function_1100
     * @tc.name scan_function_1100
     * @tc.desc Verify canceling scan fails with no permission
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_1100', Level.LEVEL1, async (done: Function) => {
      await scan.cancelScan('test_scanner_id').then(() => {
        hilog.info(DOMAIN, TAG, 'cancelScan success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'cancelScan failed, code = ' + err.code);
        expect(err.code).assertEqual(201);
        done();
      });
    });

    /**
     * @tc.number scan_function_1200
     * @tc.name scan_function_1200
     * @tc.desc Verify getting picture scan progress fails with no permission
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_1200', Level.LEVEL1, async (done: Function) => {
      await scan.getPictureScanProgress('test_scanner_id').then(() => {
        hilog.info(DOMAIN, TAG, 'getPictureScanProgress success');
        expect().assertFail();
        done();
      }).catch((err: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'getPictureScanProgress failed, code = ' + err.code);
        expect(err.code).assertEqual(201);
        done();
      });
    });

    /**
     * @tc.number scan_function_1300
     * @tc.name scan_function_1300
     * @tc.desc Verify scan device sync event works
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_1300', Level.LEVEL1, async (done: Function) => {
      try {
        scan.on('scanDeviceSync', (device: scan.ScannerSyncDevice) => {
          hilog.info(DOMAIN, TAG, 'scanDeviceSync event: ' + JSON.stringify(device));
        });
        setTimeout(() => {
          scan.off('scanDeviceSync');
          done();
        }, 500);
      } catch (e) {
        expect(e.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.number scan_function_1400
     * @tc.name scan_function_1400
     * @tc.desc Verify scan device found event works
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('scan_function_1400', Level.LEVEL1, async (done: Function) => {
      try {
        scan.on('scanDeviceFound', (device: scan.ScannerDevice) => {
          hilog.info(DOMAIN, TAG, 'scanDeviceFound event: ' + JSON.stringify(device));
        });
        setTimeout(() => {
          scan.off('scanDeviceFound');
          done();
        }, 500);
      } catch (e) {
        expect(e.code).assertEqual(201);
        done();
      }
    });
  });
}
