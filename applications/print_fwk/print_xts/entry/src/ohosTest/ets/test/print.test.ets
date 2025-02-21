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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
// import print from '@ohos.print'
import print from '@ohos.print';
import { BusinessError } from '@ohos.base';

const DOMAIN: number = 0x0023
const TAG: string = 'printTestXTS';

function registerPrintTask(printTask: print.PrintTask) {
  printTask.on('block', () => {
    hilog.info(DOMAIN, TAG, 'print state is block')
  })
  printTask.on('succeed', () => {
    hilog.info(DOMAIN, TAG, 'print state is succeed')
  })
  printTask.on('fail', () => {
    hilog.info(DOMAIN, TAG, 'print state is fail')
  })
  printTask.on('cancel', () => {
    hilog.info(DOMAIN, TAG, 'print state is cancel')
  })
}

function UnregisterPrintTask(printTask: print.PrintTask) {
  printTask.off('block', () => {
    hilog.info(DOMAIN, TAG, 'unregister print state is blocked')
  })
  printTask.off('succeed', () => {
    hilog.info(DOMAIN, TAG, 'unregister print state is succeed')
  })
  printTask.off('fail', () => {
    hilog.info(DOMAIN, TAG, 'unregister print state is fail')
  })
  printTask.off('cancel', () => {
    hilog.info(DOMAIN, TAG, 'unregister print state is cancel')
  })
}

export default function printTest() {
  describe('printTest', () => {


    /**
     * @tc.number print_function_0100
     * @tc.name Test print
     * @tc.desc check the print function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0100', 0, () => {
      let file = ['file://data/print/a.png', 'file://data/print/b.png'];
      // Permissions required: ohos.permission.PRINT
      print.print(file).then((printTask: print.PrintTask) => {
        expect(typeof (printTask)).assertEqual('object');
        expect(!!printTask).assertTrue();
        registerPrintTask(printTask);
        UnregisterPrintTask(printTask);
      }).catch((error: BusinessError) => {
        expect(false).assertTrue();
      })
    })

    /**
     * @tc.number print_function_0200
     * @tc.name Test print
     * @tc.desc check the print function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0200', 0, () => {
      let file = ['file://data/print/a.png', 'file://data/print/b.png'];
      try {
        // Permissions required: ohos.permission.PRINT
        print.print(file, (err, printTask: print.PrintTask) => {
          if (err) {
            expect(false).assertTrue();
          } else {
            expect(typeof (printTask)).assertEqual('object');
            expect(!!printTask).assertTrue();
            registerPrintTask(printTask);
            UnregisterPrintTask(printTask);
          }
        })
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.number print_function_0300
     * @tc.name Test print
     * @tc.desc check the print function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0300', 0, () => {
      let file = ['file://data/print/a.png', 'file://data/print/b.png'];
      let context = getContext();
      try {
        // Permissions required: ohos.permission.PRINT
        print.print(file, (err: BusinessError, printTask: print.PrintTask) => {
          if (err) {
            expect(false).assertTrue();
          } else {
            expect(typeof (printTask)).assertEqual('object');
            expect(!!printTask).assertTrue();
            registerPrintTask(printTask);
            UnregisterPrintTask(printTask);
          }
        })
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.number print_function_0400
     * @tc.name Test print
     * @tc.desc check the print function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0400', 0, () => {
      let file = ['file://data/print/a.png', 'file://data/print/b.png'];
      let context = getContext();
      // Permissions required: ohos.permission.PRINT
      print.print(file, context).then((printTask: print.PrintTask) => {
        expect(typeof (printTask)).assertEqual('object');
        expect(!!printTask).assertTrue();
        registerPrintTask(printTask);
        UnregisterPrintTask(printTask);
      }).catch((error: BusinessError) => {
        expect(false).assertTrue();
      })
    })

    class MyPrintDocumentAdapter implements print.PrintDocumentAdapter {
      onStartLayoutWrite(jobId: string, oldAttrs: print.PrintAttributes, newAttrs: print.PrintAttributes, fd: number,
                         writeResultCallback: (jobId: string, writeResult: print.PrintFileCreationState) => void) {
        writeResultCallback(jobId, print.PrintFileCreationState.PRINT_FILE_CREATED);
        writeResultCallback(jobId, print.PrintFileCreationState.PRINT_FILE_CREATION_FAILED);
        writeResultCallback(jobId, print.PrintFileCreationState.PRINT_FILE_CREATED_UNRENDERED);
      };

      onJobStateChanged(jobId: string, state: print.PrintDocumentAdapterState) {
        if (state == print.PrintDocumentAdapterState.PREVIEW_DESTROY) {
          console.log('PREVIEW_DESTROY');
        } else if (state == print.PrintDocumentAdapterState.PRINT_TASK_SUCCEED) {
          console.log('PRINT_TASK_SUCCEED');
        } else if (state == print.PrintDocumentAdapterState.PRINT_TASK_FAIL) {
          console.log('PRINT_TASK_FAIL');
        } else if (state == print.PrintDocumentAdapterState.PRINT_TASK_CANCEL) {
          console.log('PRINT_TASK_CANCEL');
        } else if (state == print.PrintDocumentAdapterState.PRINT_TASK_BLOCK) {
          console.log('PRINT_TASK_BLOCK');
        }
      };
    }

    class MyPrintAttributes implements print.PrintAttributes {
      copyNumber?: number;
      pageRange?: print.PrinterRange;
      pageSize?: print.PrintPageSize | print.PrintPageType;
      directionMode?: print.PrintDirectionMode;
      colorMode?: print.PrintColorMode;
      duplexMode?: print.PrintDuplexMode;
    }

    class MyPrinterRange implements print.PrinterRange {
      startPage?: number;
      endPage?: number;
      pages?: Array<number>;
    }

    class MyPrintPageSize implements print.PrintPageSize {
      id: string = '0';
      name: string = '0';
      width: number = 210;
      height: number = 297;
    }

    /**
     * @tc.number print_function_0500
     * @tc.name Test print
     * @tc.desc check the print function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0500', 0, () => {
      let jobName: string = 'jobName';
      let printAdapter = new MyPrintDocumentAdapter();
      let printAttributes = new MyPrintAttributes();
      printAttributes.copyNumber = 2;
      printAttributes.pageRange = new MyPrinterRange();
      printAttributes.pageRange.startPage = 0;
      printAttributes.pageRange.endPage = 5;
      printAttributes.pageRange.pages = [1, 3];
      printAttributes.pageSize = print.PrintPageType.PAGE_ISO_A3;
      printAttributes.pageSize = print.PrintPageType.PAGE_ISO_A4;
      printAttributes.pageSize = print.PrintPageType.PAGE_ISO_A5;
      printAttributes.pageSize = print.PrintPageType.PAGE_JIS_B5;
      printAttributes.pageSize = print.PrintPageType.PAGE_ISO_C5;
      printAttributes.pageSize = print.PrintPageType.PAGE_ISO_DL;
      printAttributes.pageSize = print.PrintPageType.PAGE_LETTER;
      printAttributes.pageSize = print.PrintPageType.PAGE_LEGAL;
      printAttributes.pageSize = print.PrintPageType.PAGE_PHOTO_4X6;
      printAttributes.pageSize = print.PrintPageType.PAGE_PHOTO_5X7;
      printAttributes.pageSize = print.PrintPageType.PAGE_INT_DL_ENVELOPE;
      printAttributes.pageSize = print.PrintPageType.PAGE_B_TABLOID;
      printAttributes.pageSize = new MyPrintPageSize();
      printAttributes.pageSize.id = '0'; // PAGE_ISO_A3
      printAttributes.pageSize.name = '0';
      printAttributes.pageSize.width = 210;
      printAttributes.pageSize.height = 297;
      printAttributes.directionMode = print.PrintDirectionMode.DIRECTION_MODE_AUTO;
      printAttributes.directionMode = print.PrintDirectionMode.DIRECTION_MODE_PORTRAIT;
      printAttributes.directionMode = print.PrintDirectionMode.DIRECTION_MODE_LANDSCAPE;
      printAttributes.colorMode = print.PrintColorMode.COLOR_MODE_MONOCHROME;
      printAttributes.colorMode = print.PrintColorMode.COLOR_MODE_COLOR;
      printAttributes.duplexMode = print.PrintDuplexMode.DUPLEX_MODE_NONE;
      printAttributes.duplexMode = print.PrintDuplexMode.DUPLEX_MODE_LONG_EDGE;
      printAttributes.duplexMode = print.PrintDuplexMode.DUPLEX_MODE_SHORT_EDGE;
      let context = getContext();
      // Permissions required: ohos.permission.PRINT
      print.print(jobName, printAdapter, printAttributes, context).then((printTask: print.PrintTask) => {
        expect(typeof (printTask)).assertEqual('object');
        expect(!!printTask).assertTrue();
        registerPrintTask(printTask);
        UnregisterPrintTask(printTask);
      }).catch((error: BusinessError) => {
        expect(false).assertTrue();
      })
    })
  })
}
