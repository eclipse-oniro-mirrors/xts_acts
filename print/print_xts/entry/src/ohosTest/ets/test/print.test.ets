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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import print from '@ohos.print';
import { BusinessError } from '@ohos.base';

const DOMAIN: number = 0x0023
const TAG: string = 'printTestXTS';

function registerPrintTask(printTask: print.PrintTask) {
  printTask.on('block', () => {
    hilog.info(DOMAIN, TAG, 'print state is block')
  });
  printTask.on('succeed', () => {
    hilog.info(DOMAIN, TAG, 'print state is succeed')
  });
  printTask.on('fail', () => {
    hilog.info(DOMAIN, TAG, 'print state is fail')
  });
  printTask.on('cancel', () => {
    hilog.info(DOMAIN, TAG, 'print state is cancel')
  });
}

function UnregisterPrintTask(printTask: print.PrintTask) {
  printTask.off('block', () => {
    hilog.info(DOMAIN, TAG, 'unregister print state is blocked')
  });
  printTask.off('succeed', () => {
    hilog.info(DOMAIN, TAG, 'unregister print state is succeed')
  });
  printTask.off('fail', () => {
    hilog.info(DOMAIN, TAG, 'unregister print state is fail')
  });
  printTask.off('cancel', () => {
    hilog.info(DOMAIN, TAG, 'unregister print state is cancel')
  });
}

function UnregisterPrintTaskWithoutCallback(printTask: print.PrintTask) {
  printTask.off('block');
  printTask.off('succeed');
  printTask.off('fail');
  printTask.off('cancel');
}

async function AddPrinterToDiscovery(printerInfo: print.PrinterInformation) {
  await print.addPrinterToDiscovery(printerInfo).then((data : void) => {
    console.log('addPrinterToDiscovery data : ' + JSON.stringify(data));
  }).catch((error: BusinessError) => {
    console.log('addPrinterToDiscovery error : ' + JSON.stringify(error));
  })
}

async function UpdatePrinterInDiscovery(printerInfo: print.PrinterInformation) {
  await print.updatePrinterInDiscovery(printerInfo).then((data : void) => {
    console.log('updatePrinterInDiscovery data : ' + JSON.stringify(data));
  }).catch((error: BusinessError) => {
    console.log('updatePrinterInDiscovery error : ' + JSON.stringify(error));
  })
}

export default function printTest() {
  describe('printTest', () => {


    /**
     * @tc.name   print_function_0100
     * @tc.number print_function_0100
     * @tc.desc   check the print function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('print_function_0100', Level.LEVEL2, async (done: Function) => {
      let file = ['file://data/print/a.png', 'file://data/print/b.png'];
      // Permissions required: ohos.permission.PRINT
      await print.print(file).then((printTask: print.PrintTask) => {
        expect(typeof (printTask)).assertEqual('object');
        expect(!!printTask).assertTrue();
        console.log('print_function_0100 succeed');
        done();
      }).catch((error: BusinessError) => {
        console.log('print_function_0100 failed, err: ' + JSON.stringify(error));
        expect(error).assertEqual(401);
        done();
      })

      await print.print(null).then((printTask: print.PrintTask) => {
        expect(typeof (printTask)).assertEqual('object');
        expect(!!printTask).assertTrue();
        console.log('print_function_0100 succeed');
        done();
      }).catch((error: BusinessError) => {
        console.log('print_function_0100 failed, err: ' + JSON.stringify(error));
        expect(error).assertEqual(13100001);
        done();
      })

      await print.print(undefined).then((printTask: print.PrintTask) => {
        expect(typeof (printTask)).assertEqual('object');
        expect(!!printTask).assertTrue();
        console.log('print_function_0100 succeed');
        done();
      }).catch((error: BusinessError) => {
        console.log('print_function_0100 failed, err: ' + JSON.stringify(error));
        expect(error).assertEqual(13100001);
        done();
      })
    })

    /**
     * @tc.name   print_function_0200
     * @tc.number print_function_0200
     * @tc.desc   check the print function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('print_function_0200', Level.LEVEL2, (done: Function) => {
      let file = ['file://data/print/a.png', 'file://data/print/b.png'];
      // Permissions required: ohos.permission.PRINT
      print.print(file, (err: BusinessError, printTask: print.PrintTask) => {
        try {
          if (err) {
            console.log('print_function_0200 expect failed, err: ' + JSON.stringify(err));
            expect(err).assertEqual(401);
            done();
          } else {
            expect(typeof (printTask)).assertEqual('object');
            expect(!!printTask).assertTrue();
            console.log('print_function_0200 succeed');
            done()
          }
        } catch (error) {
          done();
        }
      })

      print.print(null, (err: BusinessError, printTask: print.PrintTask) => {
        try {
          if (err) {
            console.log('print_function_0200 expect failed, err: ' + JSON.stringify(err));
            expect(err).assertEqual(13100001);
            done();
          } else {
            expect(typeof (printTask)).assertEqual('object');
            expect(!!printTask).assertTrue();
            console.log('print_function_0200 succeed');
            done()
          }
        } catch (error) {
          done();
        }
      })

      print.print(undefined, (err: BusinessError, printTask: print.PrintTask) => {
        try {
          if (err) {
            console.log('print_function_0200 expect failed, err: ' + JSON.stringify(err));
            expect(err).assertEqual(13100001);
            done();
          } else {
            expect(typeof (printTask)).assertEqual('object');
            expect(!!printTask).assertTrue();
            console.log('print_function_0200 succeed');
            done()
          }
        } catch (error) {
          done();
        }
      })
    })

    /**
     * @tc.name   print_function_0300
     * @tc.number print_function_0300
     * @tc.desc   check the print function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('print_function_0300', Level.LEVEL2, (done: Function) => {
      let file = ['file://data/print/a.png', 'file://data/print/b.png'];
      let context = getContext();
      // Permissions required: ohos.permission.PRINT
      print.print(file, context, (err: BusinessError, printTask: print.PrintTask) => {
        try {
          if (err) {
            console.log('print_function_0300 failed, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(13100003);
            done();
          } else {
            expect(typeof (printTask)).assertEqual('object');
            expect(!!printTask).assertTrue();
            console.log('print_function_0300 succeed');
            done();
          }
        } catch (error) {
          done();
        }
      })

      print.print(undefined, undefined, (err: BusinessError, printTask: print.PrintTask) => {
        try {
          if (err) {
            console.log('print_function_0300 failed, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(undefined);
            done();
          } else {
            expect(typeof (printTask)).assertEqual('object');
            expect(!!printTask).assertTrue();
            console.log('print_function_0300 succeed');
            done();
          }
        } catch (error) {
          done();
        }
      })

      print.print(null, null, (err: BusinessError, printTask: print.PrintTask) => {
        try {
          if (err) {
            console.log('print_function_0300 failed, err: ' + JSON.stringify(err));
            expect(err.code).assertEqual(undefined);
            done();
          } else {
            expect(typeof (printTask)).assertEqual('object');
            expect(!!printTask).assertTrue();
            console.log('print_function_0300 succeed');
            done();
          }
        } catch (error) {
          done();
        }
      })
    })

    /**
     * @tc.name   print_function_0400
     * @tc.number print_function_0400
     * @tc.desc   check the print function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0400', Level.LEVEL0, async (done: Function) => {
      let file = ['file://data/print/a.png', 'file://data/print/b.png'];
      let context = getContext();
      // Permissions required: ohos.permission.PRINT
      await print.print(file, context).then((printTask: print.PrintTask) => {
        expect(typeof (printTask)).assertEqual('object');
        expect(!!printTask).assertTrue();
        console.log('print_function_0400 succeed');
        done();
      }).catch((error: BusinessError) => {
        console.log('print_function_0400 failed, err: ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   print_function_0401
     * @tc.number print_function_0401
     * @tc.desc   check the printTask on and off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('print_function_0401', Level.LEVEL2, async (done: Function) => {
      let file = ['file://data/print/a.png', 'file://data/print/b.png'];
      let context = getContext();
      // Permissions required: ohos.permission.PRINT
      await print.print(file, context).then((printTask: print.PrintTask) => {
        printTask.on('block', () => {
          hilog.info(DOMAIN, TAG, 'print state is block')
        });
        printTask.on('succeed', () => {
          hilog.info(DOMAIN, TAG, 'print state is succeed')
        });
        printTask.on('fail', () => {
          hilog.info(DOMAIN, TAG, 'print state is fail')
        });
        printTask.on('cancel', () => {
          hilog.info(DOMAIN, TAG, 'print state is cancel')
        });
        printTask.off('block', () => {
          hilog.info(DOMAIN, TAG, 'unregister print state is blocked')
        });
        printTask.off('succeed', () => {
          hilog.info(DOMAIN, TAG, 'unregister print state is succeed')
        });
        printTask.off('fail', () => {
          hilog.info(DOMAIN, TAG, 'unregister print state is fail')
        });
        printTask.off('cancel', () => {
          hilog.info(DOMAIN, TAG, 'unregister print state is cancel')
        });
        expect(typeof (printTask)).assertEqual('object');
        expect(!!printTask).assertTrue();
        console.log('print_function_0401 succeed');
        done();
      }).catch((error: BusinessError) => {
        expect(false).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   print_function_0402
     * @tc.number print_function_0402
     * @tc.desc   check the printTask off without callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('print_function_0402', Level.LEVEL2, async (done: Function) => {
      let file = ['file://data/print/a.png', 'file://data/print/b.png'];
      let context = getContext();
      // Permissions required: ohos.permission.PRINT
      await print.print(file, context).then((printTask: print.PrintTask) => {
        registerPrintTask(printTask);
        UnregisterPrintTaskWithoutCallback(printTask);
        console.log('print_function_0402 succeed');
        done();
      }).catch((error: BusinessError) => {
        expect(false).assertTrue();
        done();
      })
    })

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
     * @tc.name   print_function_0500
     * @tc.number print_function_0500
     * @tc.desc   check the print function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_0500', Level.LEVEL1, async (done: Function) => {
      class MyPrintDocumentAdapter implements print.PrintDocumentAdapter {
        onStartLayoutWrite(jobId: string, oldAttrs: print.PrintAttributes, newAttrs: print.PrintAttributes, fd: number,
          writeResultCallback: (jobId: string, writeResult: print.PrintFileCreationState) => void) {
          writeResultCallback(jobId, print.PrintFileCreationState.PRINT_FILE_CREATED);
          writeResultCallback(jobId, print.PrintFileCreationState.PRINT_FILE_CREATION_FAILED);
          writeResultCallback(jobId, print.PrintFileCreationState.PRINT_FILE_CREATED_UNRENDERED);
          expect(!!jobId).assertTrue();
          done();
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
          expect(!!jobId).assertTrue();
          done();
        };
      }
      let jobName: string = 'jobName';
      let printAdapter: print.PrintDocumentAdapter = new MyPrintDocumentAdapter();
      let printAttributes: print.PrintAttributes = new MyPrintAttributes();
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
      await print.print(jobName, printAdapter, printAttributes, context).then((printTask: print.PrintTask) => {
        expect(typeof (printTask)).assertEqual('object');
        expect(!!printTask).assertTrue();
        registerPrintTask(printTask);
        UnregisterPrintTask(printTask);
        console.log('print_function_0100 succeed');
        done();
      }).catch((error: BusinessError) => {
        expect(false).assertTrue();
        done();
      });
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

    class MyPrinterPreferences implements print.PrinterPreferences {
      defaultDuplexMode?: print.PrintDuplexMode;
      defaultPrintQuality?: print.PrintQuality;
      defaultMediaType?: string;
      defaultPageSizeId?: string;
      defaultOrientation?: print.PrintOrientationMode;
      borderless?: boolean;
      options?: string;
      defaultColorMode?: print.PrintColorMode;
      defaultCollate?: boolean;
      defaultReverse?: boolean;
    }

    class MyPrinterInformation implements print.PrinterInformation {
      printerId: string = '';
      printerName: string = '';
      printerStatus: print.PrinterStatus = print.PrinterStatus.PRINTER_UNAVAILABLE;
      description?: string;
      capability?: print.PrinterCapabilities;
      uri?: string;
      printerMake?: string;
      preferences?: print.PrinterPreferences;
      alias?: string;
      options?: string;
      selectedDriver?: print.PpdInfo;
      selectedProtocol?: string;
    }

    class MyPrintMargin implements  print.PrintMargin {
      top: number = 123;
      bottom: number = 123;
      left: number = 123;
      right: number = 123;
    }

    class MyPrintResolution implements  print.PrintResolution {
      id: string = '123';
      horizontalDpi: number = 123;
      verticalDpi: number = 123;
    }

    class MyPreviewAttribute implements  print.PreviewAttribute {
      previewRange: print.PrinterRange = new MyPrinterRange();
      result?: number;
    }

    class MyPpdInfo implements  print.PpdInfo {
      manufacturer: string = '123';
      nickName: string = '123';
      ppdName: string = '123';
    }

    class MySharedHost implements  print.SharedHost {
      ip: string = '123';
      shareName: string = '123';
      workgroupName: string = '123';
    }

    /**
     * @tc.name   print_function_0600
     * @tc.number print_function_0600
     * @tc.desc   check the addPrinterToDiscovery function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_0600', Level.LEVEL1, async (done: Function) => {
      let printerInformation: print.PrinterInformation = new MyPrinterInformation();
      printerInformation.printerId = 'testPrinterId';
      printerInformation.printerName = 'testPrinterName';
      printerInformation.printerStatus = print.PrinterStatus.PRINTER_IDLE;
      printerInformation.printerStatus = print.PrinterStatus.PRINTER_BUSY;
      printerInformation.printerStatus = print.PrinterStatus.PRINTER_UNAVAILABLE;
      printerInformation.description = 'testDescription';
      printerInformation.capability = new MyPrinterCapabilities();
      let pageSize: print.PrintPageSize = new MyPrintPageSize();
      pageSize.id = '0';
      pageSize.name = '0';
      pageSize.width = 210;
      pageSize.height = 297;
      printerInformation.capability.supportedPageSizes = [pageSize];
      printerInformation.capability.supportedColorModes = [
        print.PrintColorMode.COLOR_MODE_MONOCHROME,
        print.PrintColorMode.COLOR_MODE_COLOR
      ];
      printerInformation.capability.supportedDuplexModes = [
        print.PrintDuplexMode.DUPLEX_MODE_NONE,
        print.PrintDuplexMode.DUPLEX_MODE_LONG_EDGE,
        print.PrintDuplexMode.DUPLEX_MODE_SHORT_EDGE
      ];
      printerInformation.capability.supportedMediaTypes = ['stationery'];
      printerInformation.capability.supportedQualities = [
        print.PrintQuality.QUALITY_DRAFT,
        print.PrintQuality.QUALITY_NORMAL,
        print.PrintQuality.QUALITY_HIGH
      ];
      printerInformation.capability.supportedOrientations = [
        print.PrintOrientationMode.ORIENTATION_MODE_PORTRAIT,
        print.PrintOrientationMode.ORIENTATION_MODE_LANDSCAPE,
        print.PrintOrientationMode.ORIENTATION_MODE_REVERSE_LANDSCAPE,
        print.PrintOrientationMode.ORIENTATION_MODE_REVERSE_PORTRAIT,
        print.PrintOrientationMode.ORIENTATION_MODE_NONE
      ];
      printerInformation.capability.options = 'testOptions';
      printerInformation.uri = 'testUri';
      printerInformation.printerMake = 'testPrinterMake';

      printerInformation.preferences = new MyPrinterPreferences();
      printerInformation.preferences.defaultDuplexMode = print.PrintDuplexMode.DUPLEX_MODE_NONE;
      printerInformation.preferences.defaultPrintQuality = print.PrintQuality.QUALITY_NORMAL;
      printerInformation.preferences.defaultMediaType = 'stationery';
      printerInformation.preferences.defaultPageSizeId = 'ISO_A4';
      printerInformation.preferences.defaultOrientation = print.PrintOrientationMode.ORIENTATION_MODE_NONE;
      printerInformation.preferences.borderless = false;
      printerInformation.preferences.options = 'testOptions';
      printerInformation.preferences.defaultColorMode = print.PrintColorMode.COLOR_MODE_MONOCHROME;
      printerInformation.preferences.defaultCollate = true;
      printerInformation.preferences.defaultReverse = false;

      printerInformation.alias = 'testAlias';
      printerInformation.options = 'testOptions';

      printerInformation.selectedDriver = new MyPpdInfo();
      printerInformation.selectedProtocol = '123';

      // Permissions required: ohos.permission.PRINT
      await print.addPrinterToDiscovery(printerInformation).then((data : void) => {
        console.log('addPrinterToDiscovery expect succeed, data: ' + JSON.stringify(data));
        expect(data).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        expect().assertFalse();
        done();
      })
    })

    /**
     * @tc.name   print_function_0601
     * @tc.number print_function_0601
     * @tc.desc   check the 401 error code of addPrinterToDiscovery function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('print_function_0601', Level.LEVEL2, async (done: Function) => {
      let printerInformation: print.PrinterInformation = new MyPrinterInformation();
      printerInformation.printerId = '';
      printerInformation.printerName = '';
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
      await print.addPrinterToDiscovery(printerInformation)
        .then((data : void) => {
          console.log('addPrinterToDiscovery succeed, data: ' + JSON.stringify(data));
          expect().assertFalse();
          done();
        })
        .catch((error: BusinessError) => {
          console.log('addPrinterToDiscovery expect failed, error: ' + JSON.stringify(error));
          expect(error).assertEqual(401);
          done();
        })
    })

    /**
     * @tc.name   print_function_0700
     * @tc.number print_function_0700
     * @tc.desc   check the updatePrinterInDiscovery function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_0700', Level.LEVEL1, async (done: Function) => {
      let printerInformation: print.PrinterInformation = new MyPrinterInformation();
      printerInformation.printerId = 'testPrinterId';
      printerInformation.printerName = 'testPrinterName';
      printerInformation.printerStatus = print.PrinterStatus.PRINTER_UNAVAILABLE;
      printerInformation.description = 'testDescription';
      printerInformation.capability = new MyPrinterCapabilities();
      let pageSize: print.PrintPageSize = new MyPrintPageSize();
      pageSize.id = '0';
      pageSize.name = '0';
      pageSize.width = 210;
      pageSize.height = 297;
      printerInformation.capability.supportedPageSizes = [pageSize];
      printerInformation.capability.supportedColorModes = [
        print.PrintColorMode.COLOR_MODE_MONOCHROME
      ];
      printerInformation.capability.supportedDuplexModes = [
        print.PrintDuplexMode.DUPLEX_MODE_NONE
      ];
      printerInformation.capability.supportedMediaTypes = ['stationery'];
      printerInformation.capability.supportedQualities = [
        print.PrintQuality.QUALITY_DRAFT
      ];
      printerInformation.capability.supportedOrientations = [
        print.PrintOrientationMode.ORIENTATION_MODE_PORTRAIT
      ];
      printerInformation.capability.options = 'testOptions';
      printerInformation.uri = 'testUri';
      printerInformation.printerMake = 'testPrinterMake';
      printerInformation.options = 'testOptions';

      // Permissions required: ohos.permission.PRINT
      await print.updatePrinterInDiscovery(printerInformation).then((data : void) => {
        console.log('updatePrinterInDiscovery expect succeed, data: ' + JSON.stringify(data));
        expect(data).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.log('updatePrinterInDiscovery failed, error: ' + JSON.stringify(error));
        expect().assertFalse();
        done();
      })
    })

    /**
     * @tc.name   print_function_0701
     * @tc.number print_function_0701
     * @tc.desc   check the 401 error code of updatePrinterInDiscovery function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('print_function_0701', Level.LEVEL2, async (done: Function) => {
      let printerInformation: print.PrinterInformation = new MyPrinterInformation();
      printerInformation.printerId = '';
      printerInformation.printerName = '';
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
      await print.updatePrinterInDiscovery(printerInformation)
        .then((data : void) => {
          console.log('updatePrinterInDiscovery succeed, data: ' + JSON.stringify(data));
          expect().assertFalse();
          done();
        })
        .catch((error: BusinessError) => {
          console.log('updatePrinterInDiscovery expect failed, error: ' + JSON.stringify(error));
          expect(error).assertEqual(401);
          done();
        })
    })

    /**
     * @tc.name   print_function_0800
     * @tc.number print_function_0800
     * @tc.desc   check the removePrinterFromDiscovery function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_0800', Level.LEVEL1, async (done: Function) => {
      let printerId : string = 'testPrinterId';

      // Permissions required: ohos.permission.PRINT
      await print.removePrinterFromDiscovery(printerId).then((data : void) => {
        console.log('removePrinterFromDiscovery expect succeed, data: ' + JSON.stringify(data));
        expect(data).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.log('removePrinterFromDiscovery failed, error: ' + JSON.stringify(error));
        expect().assertFalse();
        done();
      })
    })

    /**
     * @tc.name   print_function_0801
     * @tc.number print_function_0801
     * @tc.desc   check the 401 error code of removePrinterFromDiscovery function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('print_function_0801', Level.LEVEL2, async (done: Function) => {
      let printerId : string = '';

      // Permissions required: ohos.permission.PRINT
      await print.removePrinterFromDiscovery(printerId)
        .then((data : void) => {
          console.log('removePrinterFromDiscovery succeed, data: ' + JSON.stringify(data));
          expect().assertFalse();
          done();
        })
        .catch((error: BusinessError) => {
          console.log('removePrinterFromDiscovery expect failed, error: ' + JSON.stringify(error));
          expect(error).assertEqual(401);
          done();
        })

      await print.removePrinterFromDiscovery(null)
        .then((data : void) => {
          console.log('removePrinterFromDiscovery succeed, data: ' + JSON.stringify(data));
          expect().assertFalse();
          done();
        })
        .catch((error: BusinessError) => {
          console.log('removePrinterFromDiscovery expect failed, error: ' + JSON.stringify(error));
          expect(error).assertEqual(401);
          done();
        })

      await print.removePrinterFromDiscovery(undefined)
        .then((data : void) => {
          console.log('removePrinterFromDiscovery succeed, data: ' + JSON.stringify(data));
          expect().assertFalse();
          done();
        })
        .catch((error: BusinessError) => {
          console.log('removePrinterFromDiscovery expect failed, error: ' + JSON.stringify(error));
          expect(error).assertEqual(401);
          done();
        })
    })

    /**
     * @tc.name   print_function_0900
     * @tc.number print_function_0900
     * @tc.desc   check the getPrinterInformationById function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_0900', Level.LEVEL1, async(done: Function) => {
      let printerInformation: print.PrinterInformation = new MyPrinterInformation();
      printerInformation.printerId = 'testPrinterId';
      printerInformation.printerName = 'testPrinterName';
      printerInformation.printerStatus = print.PrinterStatus.PRINTER_UNAVAILABLE;
      printerInformation.description = 'testDescription';
      printerInformation.capability = new MyPrinterCapabilities();
      let pageSize: print.PrintPageSize = new MyPrintPageSize();
      pageSize.id = '0';
      pageSize.name = '0';
      pageSize.width = 210;
      pageSize.height = 297;
      printerInformation.capability.supportedPageSizes = [pageSize];
      printerInformation.capability.supportedColorModes = [
        print.PrintColorMode.COLOR_MODE_MONOCHROME
      ];
      printerInformation.capability.supportedDuplexModes = [
        print.PrintDuplexMode.DUPLEX_MODE_NONE
      ];
      printerInformation.capability.supportedMediaTypes = ['stationery'];
      printerInformation.capability.supportedQualities = [
        print.PrintQuality.QUALITY_DRAFT
      ];
      printerInformation.capability.supportedOrientations = [
        print.PrintOrientationMode.ORIENTATION_MODE_PORTRAIT
      ];
      printerInformation.capability.options = 'testOptions';
      printerInformation.uri = 'testUri';
      printerInformation.printerMake = 'testPrinterMake';
      printerInformation.options = 'testOptions';

      let printerId : string = 'testPrinterId';
      // Permissions required: ohos.permission.PRINT
      await print.getPrinterInformationById(printerId).then((printerInformation : print.PrinterInformation) => {
        console.log('getPrinterInformationById succeed, data: ' + JSON.stringify(printerInformation));
        expect(!!printerInformation).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.log('getPrinterInformationById failed, error: ' + JSON.stringify(error));
        expect(error).assertEqual(print.PrintErrorCode.E_PRINT_INVALID_PRINTER);
        done();
      })
    })

    /**
     * @tc.name   print_function_0901
     * @tc.number print_function_0901
     * @tc.desc   check the 401 error code of getPrinterInformationById function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('print_function_0901', Level.LEVEL2, async (done: Function) => {
      let printerId : string = '';

      // Permissions required: ohos.permission.PRINT
      await print.getPrinterInformationById(printerId)
        .then((printerInformation : print.PrinterInformation) => {
          console.log('getPrinterInformationById succeed, data: ' + JSON.stringify(printerInformation));
          expect().assertFalse();
          done();
        })
        .catch((error: BusinessError) => {
          console.log('getPrinterInformationById expect failed, error: ' + JSON.stringify(error));
          expect(error).assertEqual(401);
          done();
        })

      await print.getPrinterInformationById(null)
        .then((printerInformation : print.PrinterInformation) => {
          console.log('getPrinterInformationById succeed, data: ' + JSON.stringify(printerInformation));
          expect().assertFalse();
          done();
        })
        .catch((error: BusinessError) => {
          console.log('getPrinterInformationById expect failed, error: ' + JSON.stringify(error));
          expect(error).assertEqual(401);
          done();
        })

      await print.getPrinterInformationById(undefined)
        .then((printerInformation : print.PrinterInformation) => {
          console.log('getPrinterInformationById succeed, data: ' + JSON.stringify(printerInformation));
          expect().assertFalse();
          done();
        })
        .catch((error: BusinessError) => {
          console.log('getPrinterInformationById expect failed, error: ' + JSON.stringify(error));
          expect(error).assertEqual(401);
          done();
        })
    })

    /**
     * @tc.name   print_function_1000
     * @tc.number print_function_1000
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('print_function_1000', Level.LEVEL2, () => {
      let printerStates: print.PrinterState[] = [
        print.PrinterState.PRINTER_ADDED,
        print.PrinterState.PRINTER_REMOVED,
        print.PrinterState.PRINTER_CAPABILITY_UPDATED,
        print.PrinterState.PRINTER_CONNECTED,
        print.PrinterState.PRINTER_DISCONNECTED,
        print.PrinterState.PRINTER_RUNNING
      ];
      console.log('printerStates: ' + JSON.stringify(printerStates));

      let jobStates: print.PrintJobState[] = [
        print.PrintJobState.PRINT_JOB_PREPARE,
        print.PrintJobState.PRINT_JOB_QUEUED,
        print.PrintJobState.PRINT_JOB_RUNNING,
        print.PrintJobState.PRINT_JOB_BLOCKED,
        print.PrintJobState.PRINT_JOB_COMPLETED
      ];
      console.log('jobStates: ' + JSON.stringify(jobStates));

      let jobSubStates: print.PrintJobSubState[] = [
        print.PrintJobSubState.PRINT_JOB_COMPLETED_SUCCESS,
        print.PrintJobSubState.PRINT_JOB_COMPLETED_FAILED,
        print.PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED,
        print.PrintJobSubState.PRINT_JOB_COMPLETED_FILE_CORRUPTED,
        print.PrintJobSubState.PRINT_JOB_BLOCK_OFFLINE,
        print.PrintJobSubState.PRINT_JOB_BLOCK_BUSY,
        print.PrintJobSubState.PRINT_JOB_BLOCK_CANCELLED,
        print.PrintJobSubState.PRINT_JOB_BLOCK_OUT_OF_PAPER,
        print.PrintJobSubState.PRINT_JOB_BLOCK_OUT_OF_INK,
        print.PrintJobSubState.PRINT_JOB_BLOCK_OUT_OF_TONER,
        print.PrintJobSubState.PRINT_JOB_BLOCK_JAMMED,
        print.PrintJobSubState.PRINT_JOB_BLOCK_DOOR_OPEN,
        print.PrintJobSubState.PRINT_JOB_BLOCK_SERVICE_REQUEST,
        print.PrintJobSubState.PRINT_JOB_BLOCK_LOW_ON_INK,
        print.PrintJobSubState.PRINT_JOB_BLOCK_LOW_ON_TONER,
        print.PrintJobSubState.PRINT_JOB_BLOCK_REALLY_LOW_ON_INK,
        print.PrintJobSubState.PRINT_JOB_BLOCK_BAD_CERTIFICATE,
        print.PrintJobSubState.PRINT_JOB_BLOCK_DRIVER_EXCEPTION,
        print.PrintJobSubState.PRINT_JOB_BLOCK_ACCOUNT_ERROR,
        print.PrintJobSubState.PRINT_JOB_BLOCK_PRINT_PERMISSION_ERROR,
        print.PrintJobSubState.PRINT_JOB_BLOCK_PRINT_COLOR_PERMISSION_ERROR,
        print.PrintJobSubState.PRINT_JOB_BLOCK_NETWORK_ERROR,
        print.PrintJobSubState.PRINT_JOB_BLOCK_SERVER_CONNECTION_ERROR,
        print.PrintJobSubState.PRINT_JOB_BLOCK_LARGE_FILE_ERROR,
        print.PrintJobSubState.PRINT_JOB_BLOCK_FILE_PARSING_ERROR,
        print.PrintJobSubState.PRINT_JOB_BLOCK_SLOW_FILE_CONVERSION,
        print.PrintJobSubState.PRINT_JOB_RUNNING_UPLOADING_FILES,
        print.PrintJobSubState.PRINT_JOB_RUNNING_CONVERTING_FILES,
        print.PrintJobSubState.PRINT_JOB_BLOCK_FILE_UPLOADING_ERROR,
        print.PrintJobSubState.PRINT_JOB_BLOCK_DRIVER_MISSING,
        print.PrintJobSubState.PRINT_JOB_BLOCK_INTERRUPT,
        print.PrintJobSubState.PRINT_JOB_BLOCK_PRINTER_UNAVAILABLE,
        print.PrintJobSubState.PRINT_JOB_BLOCK_UNKNOWN
      ];
      console.log('jobSubStates: ' + JSON.stringify(jobSubStates));

      let errorCodes: print.PrintErrorCode[] = [
        print.PrintErrorCode.E_PRINT_NONE,
        print.PrintErrorCode.E_PRINT_NO_PERMISSION,
        print.PrintErrorCode.E_PRINT_INVALID_PARAMETER,
        print.PrintErrorCode.E_PRINT_GENERIC_FAILURE,
        print.PrintErrorCode.E_PRINT_RPC_FAILURE,
        print.PrintErrorCode.E_PRINT_SERVER_FAILURE,
        print.PrintErrorCode.E_PRINT_INVALID_EXTENSION,
        print.PrintErrorCode.E_PRINT_INVALID_PRINTER,
        print.PrintErrorCode.E_PRINT_INVALID_PRINT_JOB,
        print.PrintErrorCode.E_PRINT_FILE_IO,
        print.PrintErrorCode.E_PRINT_TOO_MANY_FILES,
        print.PrintErrorCode.E_PRINT_SMB_LOGIN_LOCKOUT,
        print.PrintErrorCode.E_PRINT_SMB_CONNECTION_FAILURE,
        print.PrintErrorCode.E_PRINT_SMB_INVALID_CREDENTIALS
      ];
      console.log('errorCodes: ' + JSON.stringify(errorCodes));

      let applicationEvents: print.ApplicationEvent[] = [
        print.ApplicationEvent.APPLICATION_CREATED,
        print.ApplicationEvent.APPLICATION_CLOSED_FOR_STARTED,
        print.ApplicationEvent.APPLICATION_CLOSED_FOR_CANCELED
      ];
      console.log('applicationEvents: ' + JSON.stringify(applicationEvents));

      let printDocumentAdapterStates: print.PrintDocumentAdapterState[] = [
        print.PrintDocumentAdapterState.PREVIEW_DESTROY,
        print.PrintDocumentAdapterState.PRINT_TASK_SUCCEED,
        print.PrintDocumentAdapterState.PRINT_TASK_FAIL,
        print.PrintDocumentAdapterState.PRINT_TASK_CANCEL,
        print.PrintDocumentAdapterState.PRINT_TASK_BLOCK
      ];
      console.log('printDocumentAdapterStates: ' + JSON.stringify(printDocumentAdapterStates));

      let printFileCreationStates: print.PrintFileCreationState[] = [
        print.PrintFileCreationState.PRINT_FILE_CREATED,
        print.PrintFileCreationState.PRINT_FILE_CREATION_FAILED,
        print.PrintFileCreationState.PRINT_FILE_CREATED_UNRENDERED
      ];
      console.log('printFileCreationStates: ' + JSON.stringify(printFileCreationStates));

      let printerEvents: print.PrinterEvent[] = [
        print.PrinterEvent.PRINTER_EVENT_ADDED,
        print.PrinterEvent.PRINTER_EVENT_DELETED,
        print.PrinterEvent.PRINTER_EVENT_STATE_CHANGED,
        print.PrinterEvent.PRINTER_EVENT_INFO_CHANGED,
        print.PrinterEvent.PRINTER_EVENT_PREFERENCE_CHANGED,
        print.PrinterEvent.PRINTER_EVENT_LAST_USED_PRINTER_CHANGED
      ];
      console.log('printerEvents: ' + JSON.stringify(printerEvents));

      let defaultPrinterTypes: print.DefaultPrinterType[] = [
        print.DefaultPrinterType.DEFAULT_PRINTER_TYPE_SET_BY_USER,
        print.DefaultPrinterType.DEFAULT_PRINTER_TYPE_LAST_USED_PRINTER
      ];
      console.log('defaultPrinterTypes: ' + JSON.stringify(defaultPrinterTypes));
      
      let printDocumentFormats: print.PrintDocumentFormat[] = [
        print.PrintDocumentFormat.DOCUMENT_FORMAT_AUTO,
        print.PrintDocumentFormat.DOCUMENT_FORMAT_JPEG,
        print.PrintDocumentFormat.DOCUMENT_FORMAT_PDF,
        print.PrintDocumentFormat.DOCUMENT_FORMAT_POSTSCRIPT,
        print.PrintDocumentFormat.DOCUMENT_FORMAT_TEXT,
        print.PrintDocumentFormat.DOCUMENT_FORMAT_RAW
      ];
      console.log('printDocumentFormats: ' + JSON.stringify(printDocumentFormats));
      
      let docFlavors: print.DocFlavor[] = [
        print.DocFlavor.FILE_DESCRIPTOR,
        print.DocFlavor.BYTES
      ];
      console.log('docFlavors: ' + JSON.stringify(docFlavors));
      expect(docFlavors.length).assertEqual(2);
    })

    /**
     * @tc.name   print_function_1100
     * @tc.number print_function_1100
     * @tc.desc   check the getAddedPrinters function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_1100', Level.LEVEL1, async (done: Function) => {
      // Permissions required: ohos.permission.PRINT
      let testPageSize : print.PrintPageSize = {
        id : 'ISO_A4',
        name : 'iso_a4_210x297mm',
        width : 8268,
        height : 11692
      };
      let testCapability : print.PrinterCapabilities = {
        supportedPageSizes : [testPageSize],
        supportedColorModes : [print.PrintColorMode.COLOR_MODE_MONOCHROME],
        supportedDuplexModes : [print.PrintDuplexMode.DUPLEX_MODE_NONE],
        supportedMediaTypes : ['stationery'],
        supportedQualities : [print.PrintQuality.QUALITY_NORMAL],
        supportedOrientations : [print.PrintOrientationMode.ORIENTATION_MODE_PORTRAIT],
        options : 'testOptions'
      };
      let printerInformation : print.PrinterInformation = {
        printerId : 'testPrinterId',
        printerName : 'testPrinterName',
        printerStatus : 0,
        description : 'testDesc',
        capability : testCapability,
        uri : 'file:/dev/null',
        printerMake : 'raw',
        options : 'testOptions'
      };
      await AddPrinterToDiscovery(printerInformation);
      await UpdatePrinterInDiscovery(printerInformation);

      await print.getAddedPrinters().then((printers : Array<string>) => {
        console.log('getAddedPrinters expect succeed, data: ' + JSON.stringify(printers));
        expect(printers.length > 0).assertTrue();
        expect(!!printers).assertTrue();
        done();
      }).catch((error: BusinessError) => {
        console.log('getAddedPrinters failed, error: ' + JSON.stringify(error));
        expect().assertFalse();
        done();
      })
    })

    /**
     * @tc.name   print_function_1200
     * @tc.number print_function_1200
     * @tc.desc   check the printerChange event registration and unregistration functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_1200', Level.LEVEL1, async (done: Function) => {
      let callBackCount : number = 0;
      let onPrinterChange =
        (event: print.PrinterEvent, printerInformation: print.PrinterInformation) => {
          console.log('printerChange, event: ' + event + ', printerInformation: ' + JSON.stringify(printerInformation));
          if (event === print.PrinterEvent.PRINTER_EVENT_ADDED || event === print.PrinterEvent.PRINTER_EVENT_STATE_CHANGED) {
            console.log('printerChange, callBackCount: ' + ++callBackCount);
          }
        };
      let testPageSize : print.PrintPageSize = {
        id : 'ISO_A4',
        name : 'iso_a4_210x297mm',
        width : 8268,
        height : 11692
      };
      let testCapability : print.PrinterCapabilities = {
        supportedPageSizes : [testPageSize],
        supportedColorModes : [print.PrintColorMode.COLOR_MODE_MONOCHROME],
        supportedDuplexModes : [print.PrintDuplexMode.DUPLEX_MODE_NONE],
        supportedMediaTypes : ['stationery'],
        supportedQualities : [print.PrintQuality.QUALITY_NORMAL],
        supportedOrientations : [print.PrintOrientationMode.ORIENTATION_MODE_PORTRAIT],
        options : 'testOptions'
      };
      let printerInformation : print.PrinterInformation = {
        printerId : 'testPrinterId',
        printerName : 'testPrinterName',
        printerStatus : 0,
        description : 'testDesc',
        capability : testCapability,
        uri : 'file:/dev/null',
        printerMake : 'raw',
        options : 'testOptions'
      };

      // Permissions required: ohos.permission.PRINT
      try {
        print.on('printerChange', onPrinterChange);

        await AddPrinterToDiscovery(printerInformation);
        await UpdatePrinterInDiscovery(printerInformation);
        expect(callBackCount).assertEqual(1);

        print.off('printerChange');
        await UpdatePrinterInDiscovery(printerInformation);
        expect(callBackCount).assertEqual(1);
        done();
      } catch (error) {
        console.log('print_function_1200 expect failed, err: ' + JSON.stringify(error));
        expect().assertFalse();
        done();
      }
    })

    /**
     * @tc.name   print_function_1300
     * @tc.number print_function_1300
     * @tc.desc   check success of startDiscoverPrinter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_1300', Level.LEVEL1, async (done: Function) => {
      let extensionList: string[] = [];
      // Permissions required: ohos.permission.PRINT
      print.startDiscoverPrinter(extensionList, (err: BusinessError, data: void) => {
        try {
          if (err) {
            expect(err).assertTrue();
            done();
          } else {
            console.log('print_function_1300 expect success');
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      print.startDiscoverPrinter(null, (err: BusinessError, data: void) => {
        try {
          if (err) {
            expect(err).assertTrue();
            done();
          } else {
            console.log('print_function_1300 expect success');
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      print.startDiscoverPrinter(undefined, (err: BusinessError, data: void) => {
        try {
          if (err) {
            expect(err).assertTrue();
            done();
          } else {
            console.log('print_function_1300 expect success');
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })
    })

    /**
     * @tc.name   print_function_1301
     * @tc.number print_function_1301
     * @tc.desc   check success of startDiscoverPrinter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_1301', Level.LEVEL1, async (done: Function) => {
      let extensionList: string[] = [];
      // Permissions required: ohos.permission.PRINT
      await print.startDiscoverPrinter(extensionList).then((data: void) => {
        console.log('print_function_1301 expect success');
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        expect(err).assertTrue();
        done();
      })

      await print.startDiscoverPrinter(null).then((data: void) => {
        console.log('print_function_1301 expect success');
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        expect(err).assertTrue();
        done();
      })

      await print.startDiscoverPrinter(undefined).then((data: void) => {
        console.log('print_function_1301 expect success');
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        expect(err).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   print_function_1400
     * @tc.number print_function_1400
     * @tc.desc   check success of stopDiscoverPrinter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_1400', Level.LEVEL1, async (done: Function) => {
      // Permissions required: ohos.permission.PRINT
      print.stopDiscoverPrinter((err: BusinessError, data: void) => {
        try {
          if (err) {
            expect(err).assertTrue();
            done();
          } else {
            console.log('print_function_1400 expect success');
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })
    })

    /**
     * @tc.name   print_function_1401
     * @tc.number print_function_1401
     * @tc.desc   check success of stopDiscoverPrinter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_1401', Level.LEVEL1, async (done: Function) => {
      // Permissions required: ohos.permission.PRINT
      await print.stopDiscoverPrinter().then((data: void) => {
        console.log('print_function_1401 expect success');
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        expect(err).assertTrue();
        done();
      })
    })

    /**
     * @tc.name   print_function_1500
     * @tc.number print_function_1500
     * @tc.desc   check success of connectPrinter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_1500', Level.LEVEL1, async (done: Function) => {
      let printId: string = '123';
      // Permissions required: ohos.permission.PRINT
      print.connectPrinter(printId, (err: BusinessError) => {
        try {
          if (err) {
            console.log('print_function_1500 expect failed by required real printer');
            expect(err).assertEqual(13100005);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      print.connectPrinter('', (err: BusinessError) => {
        try {
          if (err) {
            console.log('print_function_1500 expect failed by required real printer');
            expect(err).assertEqual(13100005);
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      print.connectPrinter(null, (err: BusinessError) => {
        try {
          if (err) {
            console.log('print_function_1500 expect failed by required real printer');
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

      print.connectPrinter(undefined, (err: BusinessError) => {
        try {
          if (err) {
            console.log('print_function_1500 expect failed by required real printer');
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
     * @tc.name   print_function_1501
     * @tc.number print_function_1501
     * @tc.desc   check success of connectPrinter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_1501', Level.LEVEL1, async (done: Function) => {
      let printId: string = '123';
      // Permissions required: ohos.permission.PRINT
      await print.connectPrinter(printId).then((data:void) => {
        expect(false).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('print_function_1501 expect failed by required real printer');
        expect(err).assertEqual(13100005);
        done();
      })

      await print.connectPrinter('').then((data:void) => {
        expect(false).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('print_function_1501 expect failed by required real printer');
        expect(err).assertEqual(13100005);
        done();
      })

      await print.connectPrinter(null).then((data:void) => {
        expect(false).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('print_function_1501 expect failed by required real printer');
        expect(err).assertEqual(401);
        done();
      })

    })
    
    /**
     * @tc.name   print_function_1600
     * @tc.number print_function_1600
     * @tc.desc   check success of startPrint function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_1600', Level.LEVEL1, async (done: Function) => {
      let printJobData : print.PrintJobData = {
        printerId : '123',
        jobName : 'testJobName',
        documentFormat : print.PrintDocumentFormat.DOCUMENT_FORMAT_AUTO,
        docFlavor : print.DocFlavor.FILE_DESCRIPTOR,
        copyNumber : 1,
        isLandscape : false,
        colorMode : print.PrintColorMode.COLOR_MODE_MONOCHROME,
        duplexMode : print.PrintDuplexMode.DUPLEX_MODE_NONE,
        pageSize : {
          id : 'idTest',
          name : 'nameTest',
          width : 1,
          height : 2,
        },
        jobId : '123',
        fdList : [1, 2, 3],
        binaryData : new Uint8Array([0x25, 0x50, 0x44, 0x46, 0x2d, 0x31, 0x2e, 0x34]),
        printQuality : print.PrintQuality.QUALITY_DRAFT,
        mediaType : 'testMediaType',
        isBorderless : false,
        isAutoRotate : false,
        isReverse : false,
        isCollate : false,
        isSequential : false,
        options : '{"key": "value", "debug": true}'
      };
      // Permissions required: ohos.permission.PRINT
      await print.startPrint(printJobData).then((data:void) => {
        expect(false).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('print_function_1600 expect failed by required real printer');
        expect(err).assertEqual(13100005);
        done();
      })
    })

    /**
     * @tc.name   print_function_addPrinter_01
     * @tc.number print_function_addPrinter_01
     * @tc.desc   check success of addPrinter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_addPrinter_01', Level.LEVEL1, async (done: Function) => {
      let printName: string = '123';
      let printerUri: string = '123';
      let printerPpdName: string = '123';
      let printerOption: string = '123';
      // Permissions required: ohos.permission.PRINTER_DRIVER
      await print.addPrinter(printName, printerUri, printerPpdName, printerOption).then((data: boolean) => {
        expect(false).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('print_function_addPrinter_01 expect failed by required real printer');
        expect(err).assertEqual(201);
        done();
      })
    })

    /**
     * @tc.name   print_function_addPrinter_02
     * @tc.number print_function_addPrinter_02
     * @tc.desc   check success of addPrinter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_addPrinter_02', Level.LEVEL1, async (done: Function) => {
      let printName: string = '';
      let printerUri: string = '';
      let printerPpdName: string = '';
      let printerOption: string = '';
      // Permissions required: ohos.permission.PRINTER_DRIVER
      await print.addPrinter(printName, printerUri, printerPpdName, printerOption).then((data: boolean) => {
        expect(false).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('print_function_addPrinter_01 expect failed by required real printer');
        expect(err).assertEqual(201);
        done();
      })
    })

    /**
     * @tc.name   print_function_addPrinter_03
     * @tc.number print_function_addPrinter_03
     * @tc.desc   check success of addPrinter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_addPrinter_03', Level.LEVEL1, async (done: Function) => {
      // Permissions required: ohos.permission.PRINTER_DRIVER
      await print.addPrinter(null, null, null, null).then((data: boolean) => {
        expect(false).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('print_function_addPrinter_01 expect failed by required real printer');
        expect(err).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.name   print_function_addPrinter_04
     * @tc.number print_function_addPrinter_04
     * @tc.desc   check success of addPrinter function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_addPrinter_04', Level.LEVEL1, async (done: Function) => {
      // Permissions required: ohos.permission.PRINTER_DRIVER
      await print.addPrinter(undefined, undefined, undefined, undefined).then((data: boolean) => {
        expect(false).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('print_function_addPrinter_01 expect failed by required real printer');
        expect(err).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.name   print_function_printProperties
     * @tc.number print_function_printProperties
     * @tc.desc   check success of print properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('print_function_printProperties', Level.LEVEL1, async (done: Function) => {
      let pageRange: print.PrinterRange = new MyPrinterRange();
      pageRange.startPage = 0;
      pageRange.endPage = 5;
      pageRange.pages = [1, 3];

      let printMargin: print.PrintMargin = new MyPrintMargin();
      printMargin.top = 1;
      printMargin.bottom = 1;
      printMargin.left = 1;
      printMargin.right = 1;

      let previewAttribute: print.PreviewAttribute = new MyPreviewAttribute();
      previewAttribute.previewRange = new MyPrinterRange();
      previewAttribute.result = 123;

      let printResolution: print.PrintResolution = new MyPrintResolution();
      printResolution.id = '123';
      printResolution.horizontalDpi = 123;
      printResolution.verticalDpi = 123;

      let sharedHost: print.SharedHost = new MySharedHost();
      sharedHost.ip = '123';
      sharedHost.shareName = '123';
      sharedHost.workgroupName = '123';

      let ppdInfo: print.PpdInfo = new MyPpdInfo();
      ppdInfo.manufacturer = '123';
      ppdInfo.nickName = '123';
      ppdInfo.ppdName = '123';

      expect(!!ppdInfo).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_print_print_fwk_updatePrintJobState_0100
     * @tc.number SUB_print_print_fwk_updatePrintJobState_0100
     * @tc.desc   check success of updatePrintJobState function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_print_print_fwk_updatePrintJobState_0100', Level.LEVEL1, async (done: Function) => {
      let jobId : string = "";
      let state = print.PrintJobState.PRINT_JOB_PREPARE;
      let subState = print.PrintJobSubState.PRINT_JOB_COMPLETED_SUCCESS;
      // Permissions required: ohos.permission.MANAGE_PRINT_JOB or ohos.permission.ENTERPRISE_MANAGE_PRINT

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      state = print.PrintJobState.PRINT_JOB_QUEUED;
      subState = print.PrintJobSubState.PRINT_JOB_COMPLETED_FAILED;

      print.updatePrintJobState(null, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_COMPLETED_FAILED expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      state = print.PrintJobState.PRINT_JOB_RUNNING;
      subState = print.PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED;

      print.updatePrintJobState(undefined, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_COMPLETED_CANCELLED expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      state = print.PrintJobState.PRINT_JOB_BLOCKED;
      subState = print.PrintJobSubState.PRINT_JOB_COMPLETED_FILE_CORRUPTED;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log(
              'SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_COMPLETED_FILE_CORRUPTED expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      state = print.PrintJobState.PRINT_JOB_COMPLETED;
      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_OFFLINE;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_OFFLINE expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_BUSY;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_BUSY expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_CANCELLED;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_CANCELLED expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_OUT_OF_PAPER;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_OUT_OF_PAPER expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_OUT_OF_INK;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_OUT_OF_INK expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_OUT_OF_TONER;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_OUT_OF_TONER expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_JAMMED;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_JAMMED expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_DOOR_OPEN;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_DOOR_OPEN expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_SERVICE_REQUEST;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_SERVICE_REQUEST expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_LOW_ON_INK;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_LOW_ON_INK expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_LOW_ON_TONER;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_LOW_ON_TONER expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_REALLY_LOW_ON_INK;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log(
              'SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_REALLY_LOW_ON_INK expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_BAD_CERTIFICATE;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_BAD_CERTIFICATE expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_DRIVER_EXCEPTION;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_DRIVER_EXCEPTION expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_ACCOUNT_ERROR;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_ACCOUNT_ERROR expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_PRINT_PERMISSION_ERROR;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_PRINT_PERMISSION_ERROR expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_PRINT_COLOR_PERMISSION_ERROR;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 ' +
              'PRINT_JOB_BLOCK_PRINT_COLOR_PERMISSION_ERROR expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_NETWORK_ERROR;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_NETWORK_ERROR expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_SERVER_CONNECTION_ERROR;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log(
              'SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_SERVER_CONNECTION_ERROR expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_LARGE_FILE_ERROR;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_LARGE_FILE_ERROR expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_FILE_PARSING_ERROR;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log(
              'SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_FILE_PARSING_ERROR expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_SLOW_FILE_CONVERSION;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log(
              'SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_SLOW_FILE_CONVERSION expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_RUNNING_UPLOADING_FILES;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log(
              'SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_RUNNING_UPLOADING_FILES expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_RUNNING_CONVERTING_FILES;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log(
              'SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_RUNNING_CONVERTING_FILES expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_FILE_UPLOADING_ERROR;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log(
              'SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_FILE_UPLOADING_ERROR expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_DRIVER_MISSING;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_DRIVER_MISSING expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_INTERRUPT;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_INTERRUPT expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_PRINTER_UNAVAILABLE;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log(
              'SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_PRINTER_UNAVAILABLE expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_UNKNOWN;

      print.updatePrintJobState(jobId, state, subState, (err: BusinessError, data: void) => {
        try {
          if (err) {
            console.log('SUB_print_print_fwk_updatePrintJobState_0100 PRINT_JOB_BLOCK_UNKNOWN expect success');
            expect(err).assertEqual(401);
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (error) {
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_print_print_fwk_updatePrintJobState_0200
     * @tc.number SUB_print_print_fwk_updatePrintJobState_0200
     * @tc.desc   check success of updatePrintJobState function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_print_print_fwk_updatePrintJobState_0200', Level.LEVEL1, async (done: Function) => {
      let jobId : string = "";
      let state = print.PrintJobState.PRINT_JOB_PREPARE;
      let subState = print.PrintJobSubState.PRINT_JOB_COMPLETED_SUCCESS;
      // Permissions required: ohos.permission.MANAGE_PRINT_JOB or ohos.permission.ENTERPRISE_MANAGE_PRINT

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 expect success');
        expect(err).assertEqual(401);
        done();
      })

      state = print.PrintJobState.PRINT_JOB_QUEUED;
      subState = print.PrintJobSubState.PRINT_JOB_COMPLETED_FAILED;

      await print.updatePrintJobState(null, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_COMPLETED_FAILED expect success');
        expect(err).assertEqual(401);
        done();
      })

      state = print.PrintJobState.PRINT_JOB_RUNNING;
      subState = print.PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED;

      await print.updatePrintJobState(undefined, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_COMPLETED_CANCELLED expect success');
        expect(err).assertEqual(401);
        done();
      })

      state = print.PrintJobState.PRINT_JOB_BLOCKED;
      subState = print.PrintJobSubState.PRINT_JOB_COMPLETED_FILE_CORRUPTED;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_COMPLETED_FILE_CORRUPTED expect success');
        expect(err).assertEqual(401);
        done();
      })

      state = print.PrintJobState.PRINT_JOB_COMPLETED;
      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_OFFLINE;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_OFFLINE expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_BUSY;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_BUSY expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_CANCELLED;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_CANCELLED expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_OUT_OF_PAPER;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_OUT_OF_PAPER expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_OUT_OF_INK;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_OUT_OF_INK expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_OUT_OF_TONER;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_OUT_OF_TONER expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_JAMMED;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_JAMMED expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_DOOR_OPEN;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_DOOR_OPEN expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_SERVICE_REQUEST;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_SERVICE_REQUEST expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_LOW_ON_INK;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_LOW_ON_INK expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_LOW_ON_TONER;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_LOW_ON_TONER expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_REALLY_LOW_ON_INK;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_REALLY_LOW_ON_INK expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_BAD_CERTIFICATE;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_BAD_CERTIFICATE expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_DRIVER_EXCEPTION;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_DRIVER_EXCEPTION expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_ACCOUNT_ERROR;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_ACCOUNT_ERROR expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_PRINT_PERMISSION_ERROR;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_PRINT_PERMISSION_ERROR expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_PRINT_COLOR_PERMISSION_ERROR;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log(
          'SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_PRINT_COLOR_PERMISSION_ERROR expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_NETWORK_ERROR;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_NETWORK_ERROR expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_SERVER_CONNECTION_ERROR;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log(
          'SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_SERVER_CONNECTION_ERROR expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_LARGE_FILE_ERROR;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_LARGE_FILE_ERROR expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_FILE_PARSING_ERROR;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_FILE_PARSING_ERROR expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_SLOW_FILE_CONVERSION;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_SLOW_FILE_CONVERSION expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_RUNNING_UPLOADING_FILES;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_RUNNING_UPLOADING_FILES expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_RUNNING_CONVERTING_FILES;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_RUNNING_CONVERTING_FILES expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_FILE_UPLOADING_ERROR;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_FILE_UPLOADING_ERROR expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_DRIVER_MISSING;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_DRIVER_MISSING expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_INTERRUPT;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_INTERRUPT expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_PRINTER_UNAVAILABLE;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_PRINTER_UNAVAILABLE expect success');
        expect(err).assertEqual(401);
        done();
      })

      subState = print.PrintJobSubState.PRINT_JOB_BLOCK_UNKNOWN;

      await print.updatePrintJobState(jobId, state, subState).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrintJobState_0200 PRINT_JOB_BLOCK_UNKNOWN expect success');
        expect(err).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.name   SUB_print_print_fwk_updatePrinterInformation_0100
     * @tc.number SUB_print_print_fwk_updatePrinterInformation_0100
     * @tc.desc   check success of updatePrinterInformation function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_print_print_fwk_updatePrinterInformation_0100', Level.LEVEL1, async (done: Function) => {
      let ppdInfo: print.PpdInfo = {
        manufacturer: '',
        nickName: '',
        ppdName: '',
      }
      let printerPreferences: print.PrinterPreferences = {
        defaultDuplexMode: print.PrintDuplexMode.DUPLEX_MODE_NONE,
        defaultPrintQuality: print.PrintQuality.QUALITY_DRAFT,
        defaultMediaType: '',
        defaultPageSizeId: '',
        defaultOrientation: print.PrintOrientationMode.ORIENTATION_MODE_PORTRAIT,
        borderless: true,
        defaultColorMode: print.PrintColorMode.COLOR_MODE_MONOCHROME,
        defaultCollate: true,
        defaultReverse: true,
        options: '',
      }
      let printerCapabilities: print.PrinterCapabilities = {
        supportedPageSizes: [],
        supportedColorModes: [],
        supportedDuplexModes: [],
        supportedMediaTypes: [],
        supportedQualities: [],
        supportedOrientations: [],
        options: '',
      };
      let printerInformation: print.PrinterInformation = {
        printerId: '',
        printerName: '',
        printerStatus: print.PrinterStatus.PRINTER_UNAVAILABLE,
        description: '',
        capability: printerCapabilities,
        uri: '',
        printerMake: '',
        preferences: printerPreferences,
        alias: '',
        selectedDriver: ppdInfo,
        selectedProtocol: '',
        options: '',
      };
      // Permissions required: ohos.permission.MANAGE_PRINT_JOB or ohos.permission.ENTERPRISE_MANAGE_PRINT

      await print.updatePrinterInformation(printerInformation).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrinterInformation_0100 expect success');
        expect(err).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.name   SUB_print_print_fwk_updatePrinterInformation_0200
     * @tc.number SUB_print_print_fwk_updatePrinterInformation_0200
     * @tc.desc   check success of updatePrinterInformation function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_print_print_fwk_updatePrinterInformation_0200', Level.LEVEL1, async (done: Function) => {
      let ppdInfo: print.PpdInfo = {
        manufacturer: '',
        nickName: '',
        ppdName: '',
      }
      let printerPreferences: print.PrinterPreferences = {
        defaultDuplexMode: print.PrintDuplexMode.DUPLEX_MODE_LONG_EDGE,
        defaultPrintQuality: print.PrintQuality.QUALITY_NORMAL,
        defaultMediaType: '',
        defaultPageSizeId: '',
        defaultOrientation: print.PrintOrientationMode.ORIENTATION_MODE_LANDSCAPE,
        borderless: false,
        defaultColorMode: print.PrintColorMode.COLOR_MODE_COLOR,
        defaultCollate: false,
        defaultReverse: false,
        options: '',
      }
      let printerCapabilities: print.PrinterCapabilities = {
        supportedPageSizes: [
          {
            id: '',
            name: '',
            width: 210,
            height: 297,
          }
        ],
        supportedColorModes: [
          print.PrintColorMode.COLOR_MODE_MONOCHROME,
          print.PrintColorMode.COLOR_MODE_COLOR
        ],
        supportedDuplexModes: [
          print.PrintDuplexMode.DUPLEX_MODE_NONE,
          print.PrintDuplexMode.DUPLEX_MODE_LONG_EDGE,
          print.PrintDuplexMode.DUPLEX_MODE_SHORT_EDGE
        ],
        supportedMediaTypes: [''],
        supportedQualities: [
          print.PrintQuality.QUALITY_DRAFT,
          print.PrintQuality.QUALITY_NORMAL,
          print.PrintQuality.QUALITY_HIGH
        ],
        supportedOrientations: [print.PrintOrientationMode.ORIENTATION_MODE_PORTRAIT,
          print.PrintOrientationMode.ORIENTATION_MODE_LANDSCAPE,
          print.PrintOrientationMode.ORIENTATION_MODE_REVERSE_LANDSCAPE,
          print.PrintOrientationMode.ORIENTATION_MODE_REVERSE_PORTRAIT,
          print.PrintOrientationMode.ORIENTATION_MODE_NONE],
        options: '',
      };
      let printerInformation: print.PrinterInformation = {
        printerId: '',
        printerName: '',
        printerStatus: print.PrinterStatus.PRINTER_IDLE,
        description: '',
        capability: printerCapabilities,
        uri: '',
        printerMake: '',
        preferences: printerPreferences,
        alias: '',
        selectedDriver: ppdInfo,
        selectedProtocol: '',
        options: '',
      };
      // Permissions required: ohos.permission.MANAGE_PRINT_JOB or ohos.permission.ENTERPRISE_MANAGE_PRINT

      await print.updatePrinterInformation(printerInformation).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrinterInformation_0200 expect success');
        expect(err).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.name   SUB_print_print_fwk_updatePrinterInformation_0300
     * @tc.number SUB_print_print_fwk_updatePrinterInformation_0300
     * @tc.desc   check success of updatePrinterInformation function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_print_print_fwk_updatePrinterInformation_0300', Level.LEVEL1, async (done: Function) => {
      let ppdInfo: print.PpdInfo = {
        manufacturer: '',
        nickName: '',
        ppdName: '',
      }
      let printerPreferences: print.PrinterPreferences = {
        defaultDuplexMode: print.PrintDuplexMode.DUPLEX_MODE_SHORT_EDGE,
        defaultPrintQuality: print.PrintQuality.QUALITY_HIGH,
        defaultMediaType: '',
        defaultPageSizeId: '',
        defaultOrientation: print.PrintOrientationMode.ORIENTATION_MODE_REVERSE_LANDSCAPE,
        borderless: false,
        defaultColorMode: print.PrintColorMode.COLOR_MODE_COLOR,
        defaultCollate: false,
        defaultReverse: false,
        options: '',
      }
      let printerCapabilities: print.PrinterCapabilities = {
        supportedPageSizes: [
          {
            id: '',
            name: '',
            width: 210,
            height: 297,
          }
        ],
        supportedColorModes: [
          print.PrintColorMode.COLOR_MODE_MONOCHROME,
          print.PrintColorMode.COLOR_MODE_COLOR
        ],
        supportedDuplexModes: [
          print.PrintDuplexMode.DUPLEX_MODE_NONE,
          print.PrintDuplexMode.DUPLEX_MODE_LONG_EDGE,
          print.PrintDuplexMode.DUPLEX_MODE_SHORT_EDGE
        ],
        supportedMediaTypes: [''],
        supportedQualities: [
          print.PrintQuality.QUALITY_DRAFT,
          print.PrintQuality.QUALITY_NORMAL,
          print.PrintQuality.QUALITY_HIGH
        ],
        supportedOrientations: [print.PrintOrientationMode.ORIENTATION_MODE_PORTRAIT,
          print.PrintOrientationMode.ORIENTATION_MODE_LANDSCAPE,
          print.PrintOrientationMode.ORIENTATION_MODE_REVERSE_LANDSCAPE,
          print.PrintOrientationMode.ORIENTATION_MODE_REVERSE_PORTRAIT,
          print.PrintOrientationMode.ORIENTATION_MODE_NONE],
        options: '',
      };
      let printerInformation: print.PrinterInformation = {
        printerId: '',
        printerName: '',
        printerStatus: print.PrinterStatus.PRINTER_BUSY,
        description: '',
        capability: printerCapabilities,
        uri: '',
        printerMake: '',
        preferences: printerPreferences,
        alias: '',
        selectedDriver: ppdInfo,
        selectedProtocol: '',
        options: '',
      };
      // Permissions required: ohos.permission.MANAGE_PRINT_JOB or ohos.permission.ENTERPRISE_MANAGE_PRINT

      await print.updatePrinterInformation(printerInformation).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrinterInformation_0300 expect success');
        expect(err).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.name   SUB_print_print_fwk_updatePrinterInformation_0400
     * @tc.number SUB_print_print_fwk_updatePrinterInformation_0400
     * @tc.desc   check success of updatePrinterInformation function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_print_print_fwk_updatePrinterInformation_0400', Level.LEVEL1, async (done: Function) => {
      let ppdInfo: print.PpdInfo = {
        manufacturer: '',
        nickName: '',
        ppdName: '',
      }
      let printerPreferences: print.PrinterPreferences = {
        defaultDuplexMode: print.PrintDuplexMode.DUPLEX_MODE_SHORT_EDGE,
        defaultPrintQuality: print.PrintQuality.QUALITY_HIGH,
        defaultMediaType: '',
        defaultPageSizeId: '',
        defaultOrientation: print.PrintOrientationMode.ORIENTATION_MODE_REVERSE_PORTRAIT,
        borderless: false,
        defaultColorMode: print.PrintColorMode.COLOR_MODE_COLOR,
        defaultCollate: false,
        defaultReverse: false,
        options: '',
      }
      let printerCapabilities: print.PrinterCapabilities = {
        supportedPageSizes: [
          {
            id: '',
            name: '',
            width: 210,
            height: 297,
          }
        ],
        supportedColorModes: [
          print.PrintColorMode.COLOR_MODE_MONOCHROME,
          print.PrintColorMode.COLOR_MODE_COLOR
        ],
        supportedDuplexModes: [
          print.PrintDuplexMode.DUPLEX_MODE_NONE,
          print.PrintDuplexMode.DUPLEX_MODE_LONG_EDGE,
          print.PrintDuplexMode.DUPLEX_MODE_SHORT_EDGE
        ],
        supportedMediaTypes: [''],
        supportedQualities: [
          print.PrintQuality.QUALITY_DRAFT,
          print.PrintQuality.QUALITY_NORMAL,
          print.PrintQuality.QUALITY_HIGH
        ],
        supportedOrientations: [print.PrintOrientationMode.ORIENTATION_MODE_PORTRAIT,
          print.PrintOrientationMode.ORIENTATION_MODE_LANDSCAPE,
          print.PrintOrientationMode.ORIENTATION_MODE_REVERSE_LANDSCAPE,
          print.PrintOrientationMode.ORIENTATION_MODE_REVERSE_PORTRAIT,
          print.PrintOrientationMode.ORIENTATION_MODE_NONE],
        options: '',
      };
      let printerInformation: print.PrinterInformation = {
        printerId: '',
        printerName: '',
        printerStatus: print.PrinterStatus.PRINTER_BUSY,
        description: '',
        capability: printerCapabilities,
        uri: '',
        printerMake: '',
        preferences: printerPreferences,
        alias: '',
        selectedDriver: ppdInfo,
        selectedProtocol: '',
        options: '',
      };
      // Permissions required: ohos.permission.MANAGE_PRINT_JOB or ohos.permission.ENTERPRISE_MANAGE_PRINT

      await print.updatePrinterInformation(printerInformation).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrinterInformation_0400 expect success');
        expect(err).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.name   SUB_print_print_fwk_updatePrinterInformation_0500
     * @tc.number SUB_print_print_fwk_updatePrinterInformation_0500
     * @tc.desc   check success of updatePrinterInformation function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_print_print_fwk_updatePrinterInformation_0500', Level.LEVEL1, async (done: Function) => {
      let ppdInfo: print.PpdInfo = {
        manufacturer: '',
        nickName: '',
        ppdName: '',
      }
      let printerPreferences: print.PrinterPreferences = {
        defaultDuplexMode: print.PrintDuplexMode.DUPLEX_MODE_SHORT_EDGE,
        defaultPrintQuality: print.PrintQuality.QUALITY_HIGH,
        defaultMediaType: '',
        defaultPageSizeId: '',
        defaultOrientation: print.PrintOrientationMode.ORIENTATION_MODE_NONE,
        borderless: false,
        defaultColorMode: print.PrintColorMode.COLOR_MODE_COLOR,
        defaultCollate: false,
        defaultReverse: false,
        options: '',
      }
      let printerCapabilities: print.PrinterCapabilities = {
        supportedPageSizes: [
          {
            id: '',
            name: '',
            width: 210,
            height: 297,
          }
        ],
        supportedColorModes: [
          print.PrintColorMode.COLOR_MODE_MONOCHROME,
          print.PrintColorMode.COLOR_MODE_COLOR
        ],
        supportedDuplexModes: [
          print.PrintDuplexMode.DUPLEX_MODE_NONE,
          print.PrintDuplexMode.DUPLEX_MODE_LONG_EDGE,
          print.PrintDuplexMode.DUPLEX_MODE_SHORT_EDGE
        ],
        supportedMediaTypes: [''],
        supportedQualities: [
          print.PrintQuality.QUALITY_DRAFT,
          print.PrintQuality.QUALITY_NORMAL,
          print.PrintQuality.QUALITY_HIGH
        ],
        supportedOrientations: [print.PrintOrientationMode.ORIENTATION_MODE_PORTRAIT,
          print.PrintOrientationMode.ORIENTATION_MODE_LANDSCAPE,
          print.PrintOrientationMode.ORIENTATION_MODE_REVERSE_LANDSCAPE,
          print.PrintOrientationMode.ORIENTATION_MODE_REVERSE_PORTRAIT,
          print.PrintOrientationMode.ORIENTATION_MODE_NONE],
        options: '',
      };
      let printerInformation: print.PrinterInformation = {
        printerId: '',
        printerName: '',
        printerStatus: print.PrinterStatus.PRINTER_BUSY,
        description: '',
        capability: printerCapabilities,
        uri: '',
        printerMake: '',
        preferences: printerPreferences,
        alias: '',
        selectedDriver: ppdInfo,
        selectedProtocol: '',
        options: '',
      };
      // Permissions required: ohos.permission.MANAGE_PRINT_JOB or ohos.permission.ENTERPRISE_MANAGE_PRINT

      await print.updatePrinterInformation(printerInformation).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrinterInformation_0500 expect success');
        expect(err).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.name   SUB_print_print_fwk_updatePrinterInformation_0600
     * @tc.number SUB_print_print_fwk_updatePrinterInformation_0600
     * @tc.desc   check success of updatePrinterInformation function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_print_print_fwk_updatePrinterInformation_0600', Level.LEVEL1, async (done: Function) => {
      let printerInformation: print.PrinterInformation | null = null;
      // Permissions required: ohos.permission.MANAGE_PRINT_JOB or ohos.permission.ENTERPRISE_MANAGE_PRINT

      await print.updatePrinterInformation(printerInformation).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrinterInformation_0600 expect success');
        expect(err).assertEqual(401);
        done();
      })
    })

    /**
     * @tc.name   SUB_print_print_fwk_updatePrinterInformation_0700
     * @tc.number SUB_print_print_fwk_updatePrinterInformation_0700
     * @tc.desc   check success of updatePrinterInformation function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_print_print_fwk_updatePrinterInformation_0700', Level.LEVEL1, async (done: Function) => {
      let printerInformation: print.PrinterInformation | undefined = undefined;
      // Permissions required: ohos.permission.MANAGE_PRINT_JOB or ohos.permission.ENTERPRISE_MANAGE_PRINT

      await print.updatePrinterInformation(printerInformation).then((data: void) => {
        expect(data).assertTrue();
        done();
      }).catch((err: BusinessError) => {
        console.log('SUB_print_print_fwk_updatePrinterInformation_0700 expect success');
        expect(err).assertEqual(401);
        done();
      })
    })
  })
}
