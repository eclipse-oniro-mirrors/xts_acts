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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
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
     * @tc.desc check the 201 error code of print function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0100', Level.LEVEL2, async (done: Function) => {
      let file = ['file://data/print/a.png', 'file://data/print/b.png'];
      // Permissions required: ohos.permission.PRINT
      try {
        await print.print(file);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.log('print_function_0100 expect failed, err: ' + JSON.stringify(error));
        expect(error).assertEqual(201);
        done();
      }
    })

     /**
     * @tc.number print_function_0101
     * @tc.name Test print
     * @tc.desc check the 401 error code of print function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0101', Level.LEVEL2, async (done: Function) => {
      let file = [];
      // Permissions required: ohos.permission.PRINT
      try {
        await print.print(file);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.log('print_function_0101 expect failed, err: ' + JSON.stringify(error));
        expect(error).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number print_function_0200
     * @tc.name Test print
     * @tc.desc check the 201 error code of print function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0200', Level.LEVEL2, (done: Function) => {
      let file = ['file://data/print/a.png', 'file://data/print/b.png'];
      // Permissions required: ohos.permission.PRINT
      print.print(file, (err: BusinessError, printTask: print.PrintTask) => {
        try {
          if (err) {  
            console.log('print_function_0200 expect failed, err: ' + JSON.stringify(err));
            expect(err).assertEqual(201);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })
    })

    /**
     * @tc.number print_function_0201
     * @tc.name Test print
     * @tc.desc check the 401 error code of print function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0201', Level.LEVEL2, (done: Function) => {
      let file = [];
      // Permissions required: ohos.permission.PRINT
      print.print(file, (err: BusinessError, printTask: print.PrintTask) => {
        try {
          if (err) {  
            console.log('print_function_0201 expect failed, err: ' + JSON.stringify(err));
            expect(err).assertEqual(401);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })
    })

    /**
     * @tc.number print_function_0300
     * @tc.name Test print
     * @tc.desc check the 201 error code of print function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0300', Level.LEVEL2, (done: Function) => {
      let file = ['file://data/print/a.png', 'file://data/print/b.png'];
      let context = getContext();
      // Permissions required: ohos.permission.PRINT
      print.print(file, context, (err: BusinessError, printTask: print.PrintTask) => {
        try {
          if (err) {  
            console.log('print_function_0300 expect failed, err: ' + JSON.stringify(err));
            expect(err).assertEqual(201);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })
    })

    /**
     * @tc.number print_function_0301
     * @tc.name Test print
     * @tc.desc check the 401 error code of print function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0301', Level.LEVEL2, (done: Function) => {
      let file = [];
      let context = getContext();
      // Permissions required: ohos.permission.PRINT
      print.print(file, context, (err: BusinessError, printTask: print.PrintTask) => {
        try {
          if (err) {  
            console.log('print_function_0301 expect failed, err: ' + JSON.stringify(err));
            expect(err).assertEqual(401);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })
    })

    /**
     * @tc.number print_function_0400
     * @tc.name Test print
     * @tc.desc check the 201 error code of print function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0400', Level.LEVEL2, async (done: Function) => {
      let file = ['file://data/print/a.png', 'file://data/print/b.png'];
      let context = getContext();
      // Permissions required: ohos.permission.PRINT
      try {
        await print.print(file, context);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.log('print_function_0400 expect failed, err: ' + JSON.stringify(error));
        expect(error).assertEqual(201);
        done();
      }
    })

    /**
     * @tc.number print_function_0401
     * @tc.name Test print
     * @tc.desc check the 401 error code of print function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0401', Level.LEVEL2, async (done: Function) => {
      let file = [];
      let context = getContext();
      // Permissions required: ohos.permission.PRINT
      try {
        await print.print(file, context);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.log('print_function_0401 expect failed, err: ' + JSON.stringify(error));
        expect(error).assertEqual(401);
        done();
      }
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
     * @tc.desc check the 201 error code of print function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0500', Level.LEVEL2, async (done: Function) => {
      let jobName: string = 'jobName';
      let printAdapter: print.PrintDocumentAdapter = new MyPrintDocumentAdapter();
      let printAttributes: print.PrintAttributes = new MyPrintAttributes();
      printAttributes.copyNumber = 2;
      printAttributes.pageRange = new MyPrinterRange();
      printAttributes.pageRange.startPage = 0;
      printAttributes.pageRange.endPage = 5;
      printAttributes.pageRange.pages = [1, 3];
      printAttributes.pageSize = new MyPrintPageSize();
      printAttributes.pageSize.id = '0'; // PAGE_ISO_A3
      printAttributes.pageSize.name = '0';
      printAttributes.pageSize.width = 210;
      printAttributes.pageSize.height = 297;
      printAttributes.directionMode = print.PrintDirectionMode.DIRECTION_MODE_AUTO;
      printAttributes.colorMode = print.PrintColorMode.COLOR_MODE_MONOCHROME;
      printAttributes.duplexMode = print.PrintDuplexMode.DUPLEX_MODE_NONE;
      let context = getContext();
      // Permissions required: ohos.permission.PRINT
      try {
        await print.print(jobName, printAdapter, printAttributes, context);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.log('print_function_0500 expect failed, err: ' + JSON.stringify(error));
        expect(error).assertEqual(201);
        done();
      }
    });

    class MyPrinterCapabilities implements print.PrinterCapabilities {
      supportedPageSizes: Array<print.PrintPageSize> = [];
      supportedColorModes: Array<print.PrintColorMode> = [];
      supportedDuplexModes: Array<print.PrintDuplexMode> = [];
      supportedMediaTypes?: Array<string> = [];
      supportedQualities?: Array<print.PrintQuality> = [];
      supportedOrientations?: Array<print.PrintOrientationMode> = [];
      options?: string;
    }

    class MyPrinterInformation implements print.PrinterInformation {
      printerId: string = '';
      printerName: string = '';
      printerStatus: print.PrinterStatus = print.PrinterStatus.PRINTER_UNAVAILABLE;
      description?: string;
      capability?: print.PrinterCapabilities;
      uri?: string;
      printerMake?: string;
      options?: string;
    }

    /**
     * @tc.number print_function_0600
     * @tc.name Test print
     * @tc.desc check the 201 error code of addPrinterToDiscovery function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0600', Level.LEVEL2, async (done: Function) => {
      let printerInformation: print.PrinterInformation = new MyPrinterInformation();
      printerInformation.printerId = 'testPrinterId';
      printerInformation.printerName = 'testPrinterName';
      printerInformation.printerStatus = print.PrinterStatus.PRINTER_IDLE;
      printerInformation.description = 'testDescription';
      printerInformation.uri = 'testUri';
      printerInformation.printerMake = 'testPrinterMake';
      printerInformation.options = 'testOptions';
      printerInformation.capability = new MyPrinterCapabilities();
      let pageSize: print.PrintPageSize = new MyPrintPageSize();
      pageSize.id = '0';
      pageSize.name = '0';
      pageSize.width = 210;
      pageSize.height = 297;
      printerInformation.capability.supportedPageSizes = [pageSize];

      try {
        await print.addPrinterToDiscovery(printerInformation);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.log('print_function_0600 expect failed, err: ' + JSON.stringify(error));
        expect(error).assertEqual(201);
        done();
      }
    })

    /**
     * @tc.number print_function_0700
     * @tc.name Test print
     * @tc.desc check the 201 error code of updatePrinterInDiscovery function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0700', Level.LEVEL2, async (done: Function) => {
      let printerInformation: print.PrinterInformation = new MyPrinterInformation();
      printerInformation.printerId = 'testPrinterId';
      printerInformation.printerName = 'testPrinterName';
      printerInformation.printerStatus = print.PrinterStatus.PRINTER_IDLE;
      printerInformation.description = 'testDescription';
      printerInformation.uri = 'testUri';
      printerInformation.printerMake = 'testPrinterMake';
      printerInformation.options = 'testOptions';
      printerInformation.capability = new MyPrinterCapabilities();
      let pageSize: print.PrintPageSize = new MyPrintPageSize();
      pageSize.id = '0';
      pageSize.name = '0';
      pageSize.width = 210;
      pageSize.height = 297;
      printerInformation.capability.supportedPageSizes = [pageSize];

      try {
        await print.updatePrinterInDiscovery(printerInformation);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.log('print_function_0700 expect failed, err: ' + JSON.stringify(error));
        expect(error).assertEqual(201);
        done();
      }
    })

    /**
     * @tc.number print_function_0800
     * @tc.name Test print
     * @tc.desc check the 201 error code of removePrinterFromDiscovery function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0800', Level.LEVEL2, async (done: Function) => {
      let printerId : string = 'testPrinterId';

      // Permissions required: ohos.permission.PRINT
      try {
        await print.removePrinterFromDiscovery(printerId);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.log('print_function_0800 expect failed, err: ' + JSON.stringify(error));
        expect(error).assertEqual(201);
        done();
      }
    })

    /**
     * @tc.number print_function_0900
     * @tc.name Test print
     * @tc.desc check the 201 error code of getPrinterInformationById function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_0900', Level.LEVEL2, async (done: Function) => {
      let printerId : string = 'testPrinterId';

      // Permissions required: ohos.permission.PRINT
      try {
        await print.getPrinterInformationById(printerId);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.log('print_function_0900 expect failed, err: ' + JSON.stringify(error));
        expect(error).assertEqual(201);
        done();
      }
    })

    /**
     * @tc.number print_function_1000
     * @tc.name Test print
     * @tc.desc check the 201 error code of getAddedPrinters function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_1000', Level.LEVEL2, async (done: Function) => {
      // Permissions required: ohos.permission.PRINT
      try {
        await print.getAddedPrinters();
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.log('print_function_1000 expect failed, err: ' + JSON.stringify(error));
        expect(error).assertEqual(201);
        done();
      }
    })

    /**
     * @tc.number print_function_1100
     * @tc.name Test print
     * @tc.desc check the 201 error code of the printerChange event registration function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_1100', Level.LEVEL2, async (done: Function) => {
      // Permissions required: ohos.permission.PRINT
      try {
        let onPrinterChange =
          (event: print.PrinterEvent, printerInformation: print.PrinterInformation) => {
            console.log('printerChange, event: ' + event + ', printerInformation: ' + JSON.stringify(printerInformation));
          };
        print.on('printerChange', onPrinterChange);
        done();
      } catch (error) {
        console.log('print_function_1100 expect failed, err: ' + JSON.stringify(error));
        expect(error.code).assertEqual(201);
        done();
      }
    })

    /**
     * @tc.number print_function_1200
     * @tc.name Test print
     * @tc.desc check the 201 error code of the printerChange event unregistration function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 2
     */
    it('print_function_1200', Level.LEVEL2, async (done: Function) => {
      // Permissions required: ohos.permission.PRINT
      try {
        print.off('printerChange');
        done();
      } catch (error) {
        console.log('print_function_1200 expect failed, err: ' + JSON.stringify(error));
        expect(error.code).assertEqual(201);
        done();
      }
    })

    /**
     * @tc.number print_function_1300
     * @tc.name Test print
     * @tc.desc check success of startDiscoverPrinter function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('print_function_1300', Level.LEVEL1, async (done: Function) => {
      let extensionList: string[] = [];
      // Permissions required: ohos.permission.PRINT
      print.startDiscoverPrinter(extensionList, (err: BusinessError) => {
        try {
          if (err) {
            console.log('print_function_1300 expect failed');
            expect(err).assertEqual(201);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })
    })

    /**
     * @tc.number print_function_1301
     * @tc.name Test print
     * @tc.desc check success of startDiscoverPrinter function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('print_function_1301', Level.LEVEL1, async (done: Function) => {
      let extensionList: string[] = [];
      // Permissions required: ohos.permission.PRINT
      await print.startDiscoverPrinter(extensionList).then((data: void) => {
        expect(false).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('print_function_1301 expect failed');
        expect(err).assertEqual(201);
        done();
      })
    })

    /**
     * @tc.number print_function_1400
     * @tc.name Test print
     * @tc.desc check success of stopDiscoverPrinter function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('print_function_1400', Level.LEVEL1, async (done: Function) => {
      // Permissions required: ohos.permission.PRINT
      print.stopDiscoverPrinter((err: BusinessError) => {
        try {
          if (err) {
            console.log('print_function_1400 expect failed');
            expect(err).assertEqual(201);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })
    })

    /**
     * @tc.number print_function_1401
     * @tc.name Test print
     * @tc.desc check success of stopDiscoverPrinter function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('print_function_1401', Level.LEVEL1, async (done: Function) => {
      // Permissions required: ohos.permission.PRINT
      await print.stopDiscoverPrinter().then(() => {
        expect(false).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('print_function_1401 expect failed');
        expect(err).assertEqual(201);
        done();
      })
    })

    /**
     * @tc.number print_function_1500
     * @tc.name Test print
     * @tc.desc check success of connectPrinter function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('print_function_1500', Level.LEVEL1, async (done: Function) => {
      let printId: string = '123';
      // Permissions required: ohos.permission.PRINT
      print.connectPrinter(printId, (err: BusinessError) => {
        try {
          if (err) {
            console.log('print_function_1500 expect failed');
            expect(err).assertEqual(201);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })
    })

    /**
     * @tc.number print_function_1501
     * @tc.name Test print
     * @tc.desc check success of connectPrinter function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 1
     */
    it('print_function_1501', Level.LEVEL1, async (done: Function) => {
      let printId: string = '123';
      // Permissions required: ohos.permission.PRINT
      await print.connectPrinter(printId).then(() => {
        expect(false).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('print_function_1501 expect failed');
        expect(err).assertEqual(201);
        done();
      })
    })
  })
}
