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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import print from '@ohos.print';
import Context from 'application.Context';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';


const domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
const tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

function registerPrintTask(printTask: print.PrintTask) {
  printTask.onBlock(() => {
    hilog.info(domain, tag, 'print state is block');
  })
  printTask.onSucceed(() => {
    hilog.info(domain, tag, 'print state is succeed');
  })
  printTask.onFail(() => {
    hilog.info(domain, tag, 'print state is fail');
  })
  printTask.onCancel(() => {
    hilog.info(domain, tag, 'print state is cancel');
  })
}

function UnregisterPrintTask(printTask: print.PrintTask) {
  printTask.offBlock(() => {
    hilog.info(domain, tag, 'unregister print state is blocked');
  })
  printTask.offSucceed(() => {
    hilog.info(domain, tag, 'unregister print state is succeed');
  })
  printTask.offFail(() => {
    hilog.info(domain, tag, 'unregister print state is fail');
  })
  printTask.offCancel(() => {
    hilog.info(domain, tag, 'unregister print state is cancel');
  })
}
class MyPrintDocumentAdapter implements print.PrintDocumentAdapter {
  onStartLayoutWrite(jobId: string, oldAttrs: print.PrintAttributes, newAttrs: print.PrintAttributes, fd: int,
    writeResultCallback: (jobId: string, writeResult: print.PrintFileCreationState) => void) {
    writeResultCallback(jobId, print.PrintFileCreationState.PRINT_FILE_CREATED);
    writeResultCallback(jobId, print.PrintFileCreationState.PRINT_FILE_CREATION_FAILED);
    writeResultCallback(jobId, print.PrintFileCreationState.PRINT_FILE_CREATED_UNRENDERED);
  };

  onJobStateChanged(jobId: string, state: print.PrintDocumentAdapterState) {
    if (state == print.PrintDocumentAdapterState.PREVIEW_DESTROY) {
      hilog.info(domain, tag, '%{public}s', 'PREVIEW_DESTROY');
    } else if (state == print.PrintDocumentAdapterState.PRINT_TASK_SUCCEED) {
      hilog.info(domain, tag, '%{public}s', 'PRINT_TASK_SUCCEED');
    } else if (state == print.PrintDocumentAdapterState.PRINT_TASK_FAIL) {
      hilog.info(domain, tag, '%{public}s', 'PRINT_TASK_FAIL');
    } else if (state == print.PrintDocumentAdapterState.PRINT_TASK_CANCEL) {
      hilog.info(domain, tag, '%{public}s', 'PRINT_TASK_CANCEL');
    } else if (state == print.PrintDocumentAdapterState.PRINT_TASK_BLOCK) {
      hilog.info(domain, tag, '%{public}s', 'PRINT_TASK_BLOCK');
    }
  };
}

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
}

class MyPrintPageSize implements print.PrintPageSize {
  id: string = '0';
  name: string = '0';
  width: int = 210;
  height: int = 297;
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
}

export default function printTest() {

  describe("printTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    /**
     * @tc.name   print_function_0100
     * @tc.number print_function_0100
     * @tc.desc   check the print function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0100', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0100 start');
      try {
        const fileList = new Array<string>();
        fileList.push('file://data/print/a.png');
        fileList.push('file://data/print/b.png');
        hilog.info(domain, tag, 'begin test print');
        print.print(fileList, (err: BusinessError<void>|null, printTask: print.PrintTask | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'enter print callback');
        })
      } catch (err) {
        hilog.error(domain, tag, 'print_function_0100 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0100 end');
    })

    /**
     * @tc.name   print_function_0200
     * @tc.number print_function_0200
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0200', Level.LEVEL0, () => {
      try {
        let printDuplexMode = [
          print.PrintDuplexMode.DUPLEX_MODE_NONE,
          print.PrintDuplexMode.DUPLEX_MODE_LONG_EDGE,
          print.PrintDuplexMode.DUPLEX_MODE_SHORT_EDGE,
        ];
        hilog.info(domain, tag, 'printDuplexMode:%{public}s', JSON.stringify(printDuplexMode));

        let printColorMode = [
          print.PrintColorMode.COLOR_MODE_MONOCHROME,
          print.PrintColorMode.COLOR_MODE_COLOR,
        ];
        hilog.info(domain, tag, 'printColorMode:%{public}s', JSON.stringify(printColorMode));

        let printDirectionMode = [
          print.PrintDirectionMode.DIRECTION_MODE_AUTO,
          print.PrintDirectionMode.DIRECTION_MODE_PORTRAIT,
          print.PrintDirectionMode.DIRECTION_MODE_LANDSCAPE,
        ];
        hilog.info(domain, tag, 'printDirectionMode:%{public}s', JSON.stringify(printDirectionMode));

        let printPageType = [
          print.PrintPageType.PAGE_ISO_A3,
          print.PrintPageType.PAGE_ISO_A4,
          print.PrintPageType.PAGE_ISO_A5,
          print.PrintPageType.PAGE_JIS_B5,
          print.PrintPageType.PAGE_ISO_C5,
          print.PrintPageType.PAGE_ISO_DL,
          print.PrintPageType.PAGE_LETTER,
          print.PrintPageType.PAGE_LEGAL,
          print.PrintPageType.PAGE_PHOTO_4X6,
          print.PrintPageType.PAGE_PHOTO_5X7,
          print.PrintPageType.PAGE_INT_DL_ENVELOPE,
          print.PrintPageType.PAGE_B_TABLOID,
        ];
        hilog.info(domain, tag, 'printPageType:%{public}s', JSON.stringify(printPageType));

        let printDocumentAdapterState = [
          print.PrintDocumentAdapterState.PREVIEW_DESTROY,
          print.PrintDocumentAdapterState.PRINT_TASK_SUCCEED,
          print.PrintDocumentAdapterState.PRINT_TASK_FAIL,
          print.PrintDocumentAdapterState.PRINT_TASK_CANCEL,
          print.PrintDocumentAdapterState.PRINT_TASK_BLOCK,
        ];
        hilog.info(domain, tag, 'printDocumentAdapterState:%{public}s', JSON.stringify(printDocumentAdapterState));

        let printFileCreationState = [
          print.PrintFileCreationState.PRINT_FILE_CREATED,
          print.PrintFileCreationState.PRINT_FILE_CREATION_FAILED,
          print.PrintFileCreationState.PRINT_FILE_CREATED_UNRENDERED,
        ];
        hilog.info(domain, tag, 'printFileCreationState:%{public}s', JSON.stringify(printFileCreationState));
      } catch (err) {
        hilog.error(domain, tag, 'print_function_0200 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.name   print_function_0300
     * @tc.number print_function_0300
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0300 start');
      try {
        const extensionList = ['extension1', 'extension2'];
        print.startDiscoverPrinter(extensionList).then(() => {
          hilog.info(domain, tag, 'print_function_0300 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_0300 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0300 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0300 end');
    })

    /**
     * @tc.name   print_function_0400
     * @tc.number print_function_0400
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0400 start');

      try {
        const extensionList = ['extension1', 'extension2'];
        print.startDiscoverPrinter(extensionList, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_0400 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_0400 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0400 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0400 end');
    });

    /**
     * @tc.name   print_function_0500
     * @tc.number print_function_0500
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0500 start');
      try {
        print.stopDiscoverPrinter().then(() => {
          hilog.info(domain, tag, 'print_function_0500 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_0500 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0500 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0500 end');
    })

    /**
     * @tc.name   print_function_0600
     * @tc.number print_function_0600
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0600 start');

      try {
        print.stopDiscoverPrinter((err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_0600 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_0600 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0600 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0600 end');
    });

    /**
     * @tc.name   print_function_0700
     * @tc.number print_function_0700
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0700 start');
      try {
        let printerId : string = 'testPrinterId';
        print.connectPrinter(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_0700 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_0700 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0700 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0700 end');
    })

    /**
     * @tc.name   print_function_0800
     * @tc.number print_function_0800
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0800 start');

      try {
        let printerId : string = 'testPrinterId';
        print.connectPrinter(printerId, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_0800 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_0800 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0800 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0800 end');
    });

    /**
     * @tc.name   print_function_0900
     * @tc.number print_function_0900
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0900 start');
      try {
        let printerId : string = 'testPrinterId';
        print.disconnectPrinter(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_0900 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_0900 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0900 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0900 end');
    })

    /**
     * @tc.name   print_function_1000
     * @tc.number print_function_1000
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1000 start');

      try {
        let printerId : string = 'testPrinterId';
        print.disconnectPrinter(printerId, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_1000 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_1000 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1000 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1000 end');
    });

    /**
     * @tc.name   print_function_1100
     * @tc.number print_function_1100
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1100 start');
      try {
        let printerId : string = 'testPrinterId';
        print.queryPrinterCapability(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_1100 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_1100 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1100 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1100 end');
    })

    /**
     * @tc.name   print_function_1200
     * @tc.number print_function_1200
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1200 start');

      try {
        let printerId : string = 'testPrinterId';
        print.queryPrinterCapability(printerId, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_1200 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_1200 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1200 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1200 end');
    });

    /**
     * @tc.name   print_function_1300
     * @tc.number print_function_1300
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1300 start');
      try {
        let printerId : string = 'testPrinterId';
        print.cancelPrintJob(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_1300 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_1300 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1300 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1300 end');
    })

    /**
     * @tc.name   print_function_1400
     * @tc.number print_function_1400
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1400 start');

      try {
        let printerId : string = 'testPrinterId';
        print.cancelPrintJob(printerId, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_1400 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_1400 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1400 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1400 end');
    });

    /**
     * @tc.name   print_function_1500
     * @tc.number print_function_1500
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1500 start');
      try {
        let printerIds: Array<string> = ['1', '2', '3'];
        print.removePrinters(printerIds).then(() => {
          hilog.info(domain, tag, 'print_function_1500 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_1500 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1500 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1500 end');
    })

    /**
     * @tc.name   print_function_1600
     * @tc.number print_function_1600
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1600 start');

      try {
        let printerIds: Array<string> = ['1', '2', '3'];
        print.removePrinters(printerIds, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_1600 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_1600 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1600 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1600 end');
    });

    /**
     * @tc.name   print_function_1700
     * @tc.number print_function_1700
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1700 start');
      try {
        let printerId : string = 'testPrinterId';
        let state = print.PrinterState.PRINTER_CONNECTED;
        print.updatePrinterState(printerId, state).then(() => {
          hilog.info(domain, tag, 'print_function_1700 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_1700 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1700 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1700 end');
    })

    /**
     * @tc.name   print_function_1800
     * @tc.number print_function_1800
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1800 start');

      try {
        let printerId : string = 'testPrinterId';
        let state = print.PrinterState.PRINTER_CONNECTED;
        print.updatePrinterState(printerId, state, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_1800 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_1800 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1800 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1800 end');
    });

    /**
     * @tc.name   print_function_1900
     * @tc.number print_function_1900
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1900 start');
      try {
        let printerId : string = 'testPrinterId';
        print.updateExtensionInfo(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_1900 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_1900 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1900 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1900 end');
    })

    /**
     * @tc.name   print_function_2000
     * @tc.number print_function_2000
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2000 start');

      try {
        let printerId : string = 'testPrinterId';
        print.updateExtensionInfo(printerId, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_2000 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_2000 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2000 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2000 end');
    });

    /**
     * @tc.name   print_function_2100
     * @tc.number print_function_2100
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2100 start');
      try {
        print.queryAllPrintJobs().then(() => {
          hilog.info(domain, tag, 'print_function_2100 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_2100 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2100 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2100 end');
    })

    /**
     * @tc.name   print_function_2200
     * @tc.number print_function_2200
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2200 start');

      try {
        print.queryAllPrintJobs((err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_2200 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_2200 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2200 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2200 end');
    });

    /**
     * @tc.name   print_function_2300
     * @tc.number print_function_2300
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2300 start');
      try {
        let jobId : string = "testJobId";
        let state = print.PrintJobState.PRINT_JOB_QUEUED;
        let subState = print.PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED;
        print.updatePrintJobState(jobId, state, subState).then(() => {
          hilog.info(domain, tag, 'print_function_2300 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_2300 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2300 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2300 end');
    })

    /**
     * @tc.name   print_function_2400
     * @tc.number print_function_2400
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2400 start');

      try {
        let jobId : string = "testJobId";
        let state = print.PrintJobState.PRINT_JOB_QUEUED;
        let subState = print.PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED;
        print.updatePrintJobState(jobId, state, subState, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_2400 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_2400 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2400 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2400 end');
    });

    /**
     * @tc.name   print_function_2500
     * @tc.number print_function_2500
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2500 start');
      try {
        let jobId : string = "testJobId";
        print.notifyPrintServiceSpoolerCloseForCancelled(jobId).then(() => {
          hilog.info(domain, tag, 'print_function_2500 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_2500 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2500 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2500 end');
    })

    /**
     * @tc.name   print_function_2600
     * @tc.number print_function_2600
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_2600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2600 start');

      try {
        let printerId : string = 'testPrinterId';
        let jobId : string = "testJobId";
        print.notifyPrintServiceSpoolerCloseForCancelled(jobId, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_2600 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_2600 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2600 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2600 end');
    });

    /**
     * @tc.name   print_function_2700
     * @tc.number print_function_2700
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_2700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2700 start');
      try {
        let event = print.ApplicationEvent.APPLICATION_CLOSED_FOR_STARTED;
        print.notifyPrintServiceEvent(event).then(() => {
          hilog.info(domain, tag, 'print_function_2700 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_2700 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2700 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2700 end');
    })

    /**
     * @tc.name   print_function_2800
     * @tc.number print_function_2800
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_2800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2800 start');
      try {
        let printerId : string = 'testPrinterId';
        print.removePrinterFromDiscovery(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_2800 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_2800 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2800 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2800 end');
    })

    /**
     * @tc.name   print_function_2900
     * @tc.number print_function_2900
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_2900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2900 start');
      try {
        const printerInfos: Array<print.PrinterInfo> = [
          {
            printerId: 'printer1',
            printerName: '办公室打印机',
            printerState: print.PrinterState.PRINTER_ADDED
          },
          {
            printerId: 'printer2',
            printerName: '财务部打印机',
            printerState: print.PrinterState.PRINTER_REMOVED
          }
        ];
        print.addPrinters(printerInfos).then(() => {
          hilog.info(domain, tag, 'print_function_2900 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_2900 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2900 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2900 end');
    })

    /**
     * @tc.name   print_function_3000
     * @tc.number print_function_3000
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_3000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3000 start');

      try {
        const printerInfos: Array<print.PrinterInfo> = [
          {
            printerId: 'printer1',
            printerName: '办公室打印机',
            printerState: print.PrinterState.PRINTER_ADDED
          },
          {
            printerId: 'printer2',
            printerName: '财务部打印机',
            printerState: print.PrinterState.PRINTER_REMOVED
          }
        ];
        print.addPrinters(printerInfos, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_3000 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_3000 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3000 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_3000 end');
    });

    /**
     * @tc.name   print_function_3100
     * @tc.number print_function_3100
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_3100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3100 start');
      try {
        const printerInfos: Array<print.PrinterInfo> = [
          {
            printerId: 'printer1',
            printerName: '办公室打印机',
            printerState: print.PrinterState.PRINTER_ADDED
          },
          {
            printerId: 'printer2',
            printerName: '财务部打印机',
            printerState: print.PrinterState.PRINTER_REMOVED
          }
        ];
        print.updatePrinters(printerInfos).then(() => {
          hilog.info(domain, tag, 'print_function_3100 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_3100 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3100 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_3100 end');
    })

    /**
     * @tc.name   print_function_3200
     * @tc.number print_function_3200
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_3200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3200 start');
      try {
        let printerId : string = "testPrintId";
        print.getPrinterInfoById(printerId).then((info : print.PrinterInfo) => {
          hilog.info(domain, tag, 'print_function_3200 success, info = %{public}s', JSON.stringify(info));
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_3200 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3200 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_3200 end');
    })

    /**
     * @tc.name   print_function_3300
     * @tc.number print_function_3300
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_3300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3300 start');
      try {
        let info : print.PrinterInformation = {
          printerId : "printerIdTest",
          printerName : "printerNameTest",
          printerStatus : print.PrinterStatus.PRINTER_BUSY,
        };
        print.addPrinterToDiscovery(info).then(() => {
          hilog.info(domain, tag, '%{public}s', 'print_function_3300 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_3300 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3300 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_3200 end');
    })

    /**
     * @tc.name   print_function_3400
     * @tc.number print_function_3400
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_3400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3400 start');
      try {
        let info : print.PrinterInformation = {
          printerId : "printerIdTest",
          printerName : "printerNameTest",
          printerStatus : print.PrinterStatus.PRINTER_BUSY,
        };
        print.updatePrinterInDiscovery(info).then(() => {
          hilog.info(domain, tag, 'print_function_3400 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_3400 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3400 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_3400 end');
    })

    /**
     * @tc.name   print_function_3500
     * @tc.number print_function_3500
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_3500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3500 start');
      try {
        let printerId : string = 'testPrinterId';
        print.getPrinterInformationById(printerId).then((info: print.PrinterInformation) => {
          hilog.info(domain, tag, 'print_function_3500 success, %{public}s', JSON.stringify(info));
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_3500 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3500 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_3500 end');
    })

    /**
     * @tc.name   print_function_3600
     * @tc.number print_function_3600
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_3600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3600 start');
      try {
        let printJob : print.PrintJob = {
          fdList : [1, 2, 3],
          jobId : "123",
          printerId : "testPrintId",
          jobState : print.PrintJobState.PRINT_JOB_QUEUED,
          jobSubstate : print.PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED,
          copyNumber : 1,
          pageRange : {
            startPage : 1,
            endPage : 2,
            pages : [1, 2, 3]
          },
          isSequential : false,
          pageSize : {
            id : 'idTest',
            name : 'nameTest',
            width : 1,
            height : 2,
          },
          isLandscape : false,
          colorMode : 1,
          duplexMode : 1
        };
        print.requestPrintPreview(printJob).then((ret : int) => {
          hilog.info(domain, tag, 'print_function_3600 success, %{public}d', ret);
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_3600 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3600 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_3600 end');
    });

    /**
     * @tc.name   print_function_3700
     * @tc.number print_function_3700
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_3700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3700 start');

      try {
        let printJob : print.PrintJob = {
          fdList : [1, 2, 3],
          jobId : "123",
          printerId : "testPrintId",
          jobState : print.PrintJobState.PRINT_JOB_QUEUED,
          jobSubstate : print.PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED,
          copyNumber : 1,
          pageRange : {
            startPage : 1,
            endPage : 2,
            pages : [1, 2, 3]
          },
          isSequential : false,
          pageSize : {
            id : "idTest",
            name : "nameTest",
            width : 1,
            height : 2,
          },
          isLandscape : false,
          colorMode : 1,
          duplexMode : 1
        };
        print.requestPrintPreview(printJob, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_3700 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_3700 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3700 error');
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_3700 end');
    });

    /**
     * @tc.name   print_function_3800
     * @tc.number print_function_3800
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_3800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3800 start');
      try {
        let jobId : string = "testJobId";
        print.queryPrintJobById(jobId).then(() => {
          hilog.info(domain, tag, 'print_function_3800 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_3800 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3800 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_3800 end');
    });

    /**
     * @tc.name   print_function_3900
     * @tc.number print_function_3900
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_3900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3900 start');
      try {
        let jobId : string = "testJobId";
        print.queryPrintJobById(jobId, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_3900 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_3900 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3900 error');
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_3900 end');
    });

    /**
     * @tc.name   print_function_4000
     * @tc.number print_function_4000
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_4000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4000 start');
      try {
        let printJob : print.PrintJob = {
          fdList : [1, 2, 3],
          jobId : '123',
          printerId : 'testPrintId',
          jobState : print.PrintJobState.PRINT_JOB_QUEUED,
          jobSubstate : print.PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED,
          copyNumber : 1,
          pageRange : {
            startPage : 1,
            endPage : 2,
            pages : [1, 2, 3]
          },
          isSequential : false,
          pageSize : {
            id : 'idTest',
            name : 'nameTest',
            width : 1,
            height : 2,
          },
          isLandscape : false,
          colorMode : 1,
          duplexMode : 1
        };
        print.startPrintJob(printJob).then(() => {
          hilog.info(domain, tag, 'print_function_4000 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_4000 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4000 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_4000 end');
    });

    /**
     * @tc.name   print_function_4100
     * @tc.number print_function_4100
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_4100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4100 start');

      try {
        let printJob : print.PrintJob = {
          fdList : [1, 2, 3],
          jobId : '123',
          printerId : 'testPrintId',
          jobState : print.PrintJobState.PRINT_JOB_QUEUED,
          jobSubstate : print.PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED,
          copyNumber : 1,
          pageRange : {
            startPage : 1,
            endPage : 2,
            pages : [1, 2, 3]
          },
          isSequential : false,
          pageSize : {
            id : 'idTest',
            name : 'nameTest',
            width : 1,
            height : 2,
          },
          isLandscape : false,
          colorMode : 1,
          duplexMode : 1
        };
        print.startPrintJob(printJob, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_4100 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_4100 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4100 error');
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_4100 end');
    });

    /**
     * @tc.name   print_function_4200
     * @tc.number print_function_4200
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_4200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4200 start');
      try {
        print.queryPrintJobList().then((job) => {
          const printJob = job as Array<print.PrintJob>;
          hilog.info(domain, tag, 'print_function_4200 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_4200 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4200 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_4200 end');
    });

    /**
     * @tc.name   print_function_4300
     * @tc.number print_function_4300
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_4300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4300 start');

      try {
        print.queryPrintJobList((err: Object | null | undefined) => {
          hilog.info(domain, tag, 'print_function_4300 success');
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4300 error');
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_4300 end');
    });

    /**
     * @tc.name   print_function_4400
     * @tc.number print_function_4400
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_4400', Level.LEVEL0, ():void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4400 start');

      try {
        let jobId : string = 'testJobId';
        let printAttributes : print.PrintAttributes = {
          copyNumber : 1,
          pageRange : {
            startPage : 1,
            endPage : 2,
            pages : [1, 2, 3],
          },
          pageSize : {
            id : 'idTest',
            name : 'nameTest',
            width : 1,
            height : 2,
          },
          directionMode : print.PrintDirectionMode.DIRECTION_MODE_PORTRAIT,
          colorMode : print.PrintColorMode.COLOR_MODE_MONOCHROME,
          duplexMode : print.PrintDuplexMode.DUPLEX_MODE_LONG_EDGE
        };
        let fd : int = 1;
        print.startGettingPrintFile(jobId, printAttributes, fd, (state: Object | null | undefined) => {
          hilog.info(domain, tag, 'print_function_4400 success');
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4400 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_4400 end');
    });

    /**
     * @tc.name   print_function_4500
     * @tc.number print_function_4500
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_4500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4500 start');
      try {
        print.getAddedPrinters().then((printers : Array<string>) => {
          hilog.info(domain, tag, 'print_function_4500 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_4500 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4500 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_4500 end');
    });

    /**
     * @tc.name   print_function_4600
     * @tc.number print_function_4600
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_4600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4600 start');
      try {
        print.queryAllPrinterExtensionInfos().then((infos) => {
          hilog.info(domain, tag, 'print_function_4600 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_4600 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4600 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_4600 end');
    });

    /**
     * @tc.name   print_function_4700
     * @tc.number print_function_4700
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_4700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4700 start');

      try {
        print.queryAllPrinterExtensionInfos((err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_4700 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_4700 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4700 error');
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_4700 end');
    });

    /**
     * @tc.name   print_function_4800
     * @tc.number print_function_4800
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_4800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4800 start');

      try {
        let files: Array<string> = ['1', '2', '3'];
        print.print(files, (task: Object | null | undefined) => {
          if (task) {
            hilog.info(domain, tag, 'print_function_4800 error');
          } else {
            hilog.info(domain, tag, 'print_function_4800 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4800 error');
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_4800 end');
    });

    /**
     * @tc.name   print_function_4900
     * @tc.number print_function_4900
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_4900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4900 start');
      try {
        let files: Array<string> = ['1', '2', '3'];
        print.print(files).then((task) => {
          hilog.info(domain, tag, 'print_function_4900 success');
          done();
        }).catch((err: Object | null | undefined) => {
          hilog.error(domain, tag, 'print_function_4900 error');
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4900 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_4900 end');
    });

    /**
     * @tc.name   print_function_5000
     * @tc.number print_function_5000
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_5000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5000 start');

      try {
        let files: Array<string> = ['1', '2', '3'];
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let context : Context = abilityDelegator.getAppContext();
        print.print(files, context, (task: Object | null | undefined) => {
          if (task) {
            hilog.info(domain, tag, 'print_function_5000 error');
          } else {
            hilog.info(domain, tag, 'print_function_5000 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5000 error');
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_5000 end');
    });

    /**
     * @tc.name   print_function_5100
     * @tc.number print_function_5100
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_5100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5100 start');
      try {
        let files: Array<string> = ['1', '2', '3'];
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let context : Context = abilityDelegator.getAppContext();
        print.print(files, context).then((task: Object | null | undefined) => {
          hilog.info(domain, tag, 'print_function_5100 success');
          let printTask = task as print.PrintTask;
          registerPrintTask(printTask);
          UnregisterPrintTask(printTask);
          done();
        }).catch((err: Object | null | undefined) => {
          hilog.error(domain, tag, 'print_function_5100 error');
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5100 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_5100 end');
    });

    /**
     * @tc.name   print_function_5200
     * @tc.number print_function_5200
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_5200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5200 start');
      try {
        let jobName : string = 'testJobName';
        let printAdapter: print.PrintDocumentAdapter = new MyPrintDocumentAdapter();
        let printAttributes: print.PrintAttributes = {
          copyNumber : 1,
        };
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let context : Context = abilityDelegator.getAppContext();
        print.print(jobName, printAdapter, printAttributes, context).then((task: Object | null | undefined) => {
          hilog.info(domain, tag, 'print_function_5200 succeed');
          let printTask = task as print.PrintTask;
          registerPrintTask(printTask);
          UnregisterPrintTask(printTask);
          done();
        }).catch((err: Object | null | undefined) => {
          hilog.error(domain, tag, 'print_function_5200 error');
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5200 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_5200 end');
    });

    /**
     * @tc.name   print_function_5300
     * @tc.number print_function_5300
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_5300', Level.LEVEL0, ():void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5300 start');

      try {
        print.onPrinterStateChange((state: print.PrinterState, info: print.PrinterInfo) => {
          hilog.info(domain, tag, 'print_function_5300 success');
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5300 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_5300 end');
    });

    /**
     * @tc.name   print_function_5400
     * @tc.number print_function_5400
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_5400', Level.LEVEL0, ():void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5400 start');

      try {
        print.onJobStateChange((state: print.PrintJobState, job: print.PrintJob) => {
          hilog.info(domain, tag, 'print_function_5400 success');
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5400 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_5400 end');
    });

    /**
     * @tc.name   print_function_5500
     * @tc.number print_function_5500
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_5500', Level.LEVEL0, ():void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5500 start');

      try {
        print.onExtInfoChange((extensionId: string, info: string) => {
          hilog.info(domain, tag, 'print_function_5500 success');
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5500 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_5500 end');
    });

    /**
     * @tc.name   print_function_5600
     * @tc.number print_function_5600
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_5600', Level.LEVEL0, ():void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5600 start');

      try {
        print.offPrinterStateChange((state: boolean) => {
          hilog.info(domain, tag, 'print_function_5600 success');
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5600 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_5600 end');
    });

    /**
     * @tc.name   print_function_5700
     * @tc.number print_function_5700
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_5700', Level.LEVEL0, ():void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5700 start');

      try {
        print.offJobStateChange((state: boolean) => {
          hilog.info(domain, tag, 'print_function_5700 success');
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5700 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_5700 end');
    });

    /**
     * @tc.name   print_function_5800
     * @tc.number print_function_5800
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_5800', Level.LEVEL0, ():void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5800 start');

      try {
        print.offExtInfoChange((state: boolean) => {
          hilog.info(domain, tag, 'print_function_5800 success');
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5800 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_5800 end');
    });

    /**
     * @tc.name   print_function_5900
     * @tc.number print_function_5900
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_5900', Level.LEVEL0, ():void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5900 start');

      try {
        // PrintDirectionMode
        hilog.info(domain, tag, 'PrintDirectionMode.DIRECTION_MODE_AUTO = ' + print.PrintDirectionMode.DIRECTION_MODE_AUTO);
        hilog.info(domain, tag, 'PrintDirectionMode.DIRECTION_MODE_PORTRAIT = ' + print.PrintDirectionMode.DIRECTION_MODE_PORTRAIT);
        hilog.info(domain, tag, 'PrintDirectionMode.DIRECTION_MODE_LANDSCAPE = ' + print.PrintDirectionMode.DIRECTION_MODE_LANDSCAPE);

        // PrintColorMode
        hilog.info(domain, tag, 'PrintColorMode.COLOR_MODE_MONOCHROME = ' + print.PrintColorMode.COLOR_MODE_MONOCHROME);
        hilog.info(domain, tag, 'PrintColorMode.COLOR_MODE_COLOR = ' + print.PrintColorMode.COLOR_MODE_COLOR);

        // PrintDuplexMode
        hilog.info(domain, tag, 'PrintDuplexMode.DUPLEX_MODE_NONE = ' + print.PrintDuplexMode.DUPLEX_MODE_NONE);
        hilog.info(domain, tag, 'PrintDuplexMode.DUPLEX_MODE_LONG_EDGE = ' + print.PrintDuplexMode.DUPLEX_MODE_LONG_EDGE);
        hilog.info(domain, tag, 'PrintDuplexMode.DUPLEX_MODE_SHORT_EDGE = ' + print.PrintDuplexMode.DUPLEX_MODE_SHORT_EDGE);

        // PrintPageType
        hilog.info(domain, tag, 'PrintPageType.PAGE_ISO_A3 = ' + print.PrintPageType.PAGE_ISO_A3);
        hilog.info(domain, tag, 'PrintPageType.PAGE_ISO_A4 = ' + print.PrintPageType.PAGE_ISO_A4);
        hilog.info(domain, tag, 'PrintPageType.PAGE_ISO_A5 = ' + print.PrintPageType.PAGE_ISO_A5);
        hilog.info(domain, tag, 'PrintPageType.PAGE_JIS_B5 = ' + print.PrintPageType.PAGE_JIS_B5);
        hilog.info(domain, tag, 'PrintPageType.PAGE_ISO_C5 = ' + print.PrintPageType.PAGE_ISO_C5);
        hilog.info(domain, tag, 'PrintPageType.PAGE_ISO_DL = ' + print.PrintPageType.PAGE_ISO_DL);
        hilog.info(domain, tag, 'PrintPageType.PAGE_LETTER = ' + print.PrintPageType.PAGE_LETTER);
        hilog.info(domain, tag, 'PrintPageType.PAGE_LEGAL = ' + print.PrintPageType.PAGE_LEGAL);
        hilog.info(domain, tag, 'PrintPageType.PAGE_PHOTO_4X6 = ' + print.PrintPageType.PAGE_PHOTO_4X6);
        hilog.info(domain, tag, 'PrintPageType.PAGE_PHOTO_5X7 = ' + print.PrintPageType.PAGE_PHOTO_5X7);
        hilog.info(domain, tag, 'PrintPageType.PAGE_INT_DL_ENVELOPE = ' + print.PrintPageType.PAGE_INT_DL_ENVELOPE);
        hilog.info(domain, tag, 'PrintPageType.PAGE_B_TABLOID = ' + print.PrintPageType.PAGE_B_TABLOID);

        // PrintDocumentAdapterState
        hilog.info(domain, tag, 'PrintDocumentAdapterState.PREVIEW_DESTROY = ' + print.PrintDocumentAdapterState.PREVIEW_DESTROY);
        hilog.info(domain, tag, 'PrintDocumentAdapterState.PRINT_TASK_SUCCEED = ' + print.PrintDocumentAdapterState.PRINT_TASK_SUCCEED);
        hilog.info(domain, tag, 'PrintDocumentAdapterState.PRINT_TASK_FAIL = ' + print.PrintDocumentAdapterState.PRINT_TASK_FAIL);
        hilog.info(domain, tag, 'PrintDocumentAdapterState.PRINT_TASK_CANCEL = ' + print.PrintDocumentAdapterState.PRINT_TASK_CANCEL);
        hilog.info(domain, tag, 'PrintDocumentAdapterState.PRINT_TASK_BLOCK = ' + print.PrintDocumentAdapterState.PRINT_TASK_BLOCK);

        // PrintFileCreationState
        hilog.info(domain, tag, 'PrintFileCreationState.PRINT_FILE_CREATED = ' + print.PrintFileCreationState.PRINT_FILE_CREATED);
        hilog.info(domain, tag, 'PrintFileCreationState.PRINT_FILE_CREATION_FAILED = ' + print.PrintFileCreationState.PRINT_FILE_CREATION_FAILED);
        hilog.info(domain, tag, 'PrintFileCreationState.PRINT_FILE_CREATED_UNRENDERED = ' + print.PrintFileCreationState.PRINT_FILE_CREATED_UNRENDERED);

        // PrinterState
        hilog.info(domain, tag, 'PrinterState.PRINTER_ADDED = ' + print.PrinterState.PRINTER_ADDED);
        hilog.info(domain, tag, 'PrinterState.PRINTER_REMOVED = ' + print.PrinterState.PRINTER_REMOVED);
        hilog.info(domain, tag, 'PrinterState.PRINTER_CAPABILITY_UPDATED = ' + print.PrinterState.PRINTER_CAPABILITY_UPDATED);
        hilog.info(domain, tag, 'PrinterState.PRINTER_CONNECTED = ' + print.PrinterState.PRINTER_CONNECTED);
        hilog.info(domain, tag, 'PrinterState.PRINTER_DISCONNECTED = ' + print.PrinterState.PRINTER_DISCONNECTED);
        hilog.info(domain, tag, 'PrinterState.PRINTER_RUNNING = ' + print.PrinterState.PRINTER_RUNNING);

        // PrintJobState
        hilog.info(domain, tag, 'PrintJobState.PRINT_JOB_PREPARE = ' + print.PrintJobState.PRINT_JOB_PREPARE);
        hilog.info(domain, tag, 'PrintJobState.PRINT_JOB_QUEUED = ' + print.PrintJobState.PRINT_JOB_QUEUED);
        hilog.info(domain, tag, 'PrintJobState.PRINT_JOB_RUNNING = ' + print.PrintJobState.PRINT_JOB_RUNNING);
        hilog.info(domain, tag, 'PrintJobState.PRINT_JOB_BLOCKED = ' + print.PrintJobState.PRINT_JOB_BLOCKED);
        hilog.info(domain, tag, 'PrintJobState.PRINT_JOB_COMPLETED = ' + print.PrintJobState.PRINT_JOB_COMPLETED);

        // PrintJobSubState
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_COMPLETED_SUCCESS = ' + print.PrintJobSubState.PRINT_JOB_COMPLETED_SUCCESS);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_COMPLETED_FAILED = ' + print.PrintJobSubState.PRINT_JOB_COMPLETED_FAILED);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED = ' + print.PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_COMPLETED_FILE_CORRUPTED = ' + print.PrintJobSubState.PRINT_JOB_COMPLETED_FILE_CORRUPTED);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_OFFLINE = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_OFFLINE);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_BUSY = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_BUSY);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_CANCELLED = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_CANCELLED);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_OUT_OF_PAPER = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_OUT_OF_PAPER);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_OUT_OF_INK = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_OUT_OF_INK);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_OUT_OF_TONER = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_OUT_OF_TONER);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_JAMMED = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_JAMMED);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_DOOR_OPEN = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_DOOR_OPEN);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_SERVICE_REQUEST = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_SERVICE_REQUEST);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_LOW_ON_INK = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_LOW_ON_INK);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_LOW_ON_TONER = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_LOW_ON_TONER);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_REALLY_LOW_ON_INK = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_REALLY_LOW_ON_INK);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_BAD_CERTIFICATE = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_BAD_CERTIFICATE);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_ACCOUNT_ERROR = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_ACCOUNT_ERROR);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_PRINT_PERMISSION_ERROR = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_PRINT_PERMISSION_ERROR);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_PRINT_COLOR_PERMISSION_ERROR = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_PRINT_COLOR_PERMISSION_ERROR);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_NETWORK_ERROR = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_NETWORK_ERROR);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_SERVER_CONNECTION_ERROR = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_SERVER_CONNECTION_ERROR);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_LARGE_FILE_ERROR = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_LARGE_FILE_ERROR);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_FILE_PARSING_ERROR = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_FILE_PARSING_ERROR);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_SLOW_FILE_CONVERSION = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_SLOW_FILE_CONVERSION);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_RUNNING_UPLOADING_FILES = ' + print.PrintJobSubState.PRINT_JOB_RUNNING_UPLOADING_FILES);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_RUNNING_CONVERTING_FILES = ' + print.PrintJobSubState.PRINT_JOB_RUNNING_CONVERTING_FILES);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_FILE_UPLOADING_ERROR = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_FILE_UPLOADING_ERROR);
        hilog.info(domain, tag, 'PrintJobSubState.PRINT_JOB_BLOCK_UNKNOWN = ' + print.PrintJobSubState.PRINT_JOB_BLOCK_UNKNOWN);

        // PrintErrorCode
        hilog.info(domain, tag, 'PrintErrorCode.E_PRINT_NONE = ' + print.PrintErrorCode.E_PRINT_NONE);
        hilog.info(domain, tag, 'PrintErrorCode.E_PRINT_NO_PERMISSION = ' + print.PrintErrorCode.E_PRINT_NO_PERMISSION);
        hilog.info(domain, tag, 'PrintErrorCode.E_PRINT_INVALID_PARAMETER = ' + print.PrintErrorCode.E_PRINT_INVALID_PARAMETER);
        hilog.info(domain, tag, 'PrintErrorCode.E_PRINT_GENERIC_FAILURE = ' + print.PrintErrorCode.E_PRINT_GENERIC_FAILURE);
        hilog.info(domain, tag, 'PrintErrorCode.E_PRINT_RPC_FAILURE = ' + print.PrintErrorCode.E_PRINT_RPC_FAILURE);
        hilog.info(domain, tag, 'PrintErrorCode.E_PRINT_SERVER_FAILURE = ' + print.PrintErrorCode.E_PRINT_SERVER_FAILURE);
        hilog.info(domain, tag, 'PrintErrorCode.E_PRINT_INVALID_EXTENSION = ' + print.PrintErrorCode.E_PRINT_INVALID_EXTENSION);
        hilog.info(domain, tag, 'PrintErrorCode.E_PRINT_INVALID_PRINTER = ' + print.PrintErrorCode.E_PRINT_INVALID_PRINTER);
        hilog.info(domain, tag, 'PrintErrorCode.E_PRINT_INVALID_PRINT_JOB = ' + print.PrintErrorCode.E_PRINT_INVALID_PRINT_JOB);
        hilog.info(domain, tag, 'PrintErrorCode.E_PRINT_FILE_IO = ' + print.PrintErrorCode.E_PRINT_FILE_IO);
        hilog.info(domain, tag, 'PrintErrorCode.E_PRINT_TOO_MANY_FILES = ' + print.PrintErrorCode.E_PRINT_TOO_MANY_FILES);

        // ApplicationEvent
        hilog.info(domain, tag, 'ApplicationEvent.APPLICATION_CREATED = ' + print.ApplicationEvent.APPLICATION_CREATED);
        hilog.info(domain, tag, 'ApplicationEvent.APPLICATION_CLOSED_FOR_STARTED = ' + print.ApplicationEvent.APPLICATION_CLOSED_FOR_STARTED);
        hilog.info(domain, tag, 'ApplicationEvent.APPLICATION_CLOSED_FOR_CANCELED = ' + print.ApplicationEvent.APPLICATION_CLOSED_FOR_CANCELED);

        // PrintQuality
        hilog.info(domain, tag, 'PrintQuality.QUALITY_DRAFT = ' + print.PrintQuality.QUALITY_DRAFT);
        hilog.info(domain, tag, 'PrintQuality.QUALITY_NORMAL = ' + print.PrintQuality.QUALITY_NORMAL);
        hilog.info(domain, tag, 'PrintQuality.QUALITY_HIGH = ' + print.PrintQuality.QUALITY_HIGH);

        // PrintOrientationMode
        hilog.info(domain, tag, 'PrintOrientationMode.ORIENTATION_MODE_PORTRAIT = ' + print.PrintOrientationMode.ORIENTATION_MODE_PORTRAIT);
        hilog.info(domain, tag, 'PrintOrientationMode.ORIENTATION_MODE_LANDSCAPE = ' + print.PrintOrientationMode.ORIENTATION_MODE_LANDSCAPE);
        hilog.info(domain, tag, 'PrintOrientationMode.ORIENTATION_MODE_REVERSE_LANDSCAPE = ' + print.PrintOrientationMode.ORIENTATION_MODE_REVERSE_LANDSCAPE);
        hilog.info(domain, tag, 'PrintOrientationMode.ORIENTATION_MODE_REVERSE_PORTRAIT = ' + print.PrintOrientationMode.ORIENTATION_MODE_REVERSE_PORTRAIT);
        hilog.info(domain, tag, 'PrintOrientationMode.ORIENTATION_MODE_NONE = ' + print.PrintOrientationMode.ORIENTATION_MODE_NONE);

        // PrinterStatus
        hilog.info(domain, tag, 'PrinterStatus.PRINTER_IDLE = ' + print.PrinterStatus.PRINTER_IDLE);
        hilog.info(domain, tag, 'PrinterStatus.PRINTER_BUSY = ' + print.PrinterStatus.PRINTER_BUSY);
        hilog.info(domain, tag, 'PrinterStatus.PRINTER_UNAVAILABLE = ' + print.PrinterStatus.PRINTER_UNAVAILABLE);

        // PrinterEvent
        hilog.info(domain, tag, 'PrinterEvent.PRINTER_EVENT_ADDED = ' + print.PrinterEvent.PRINTER_EVENT_ADDED);
        hilog.info(domain, tag, 'PrinterEvent.PRINTER_EVENT_DELETED = ' + print.PrinterEvent.PRINTER_EVENT_DELETED);
        hilog.info(domain, tag, 'PrinterEvent.PRINTER_EVENT_STATE_CHANGED = ' + print.PrinterEvent.PRINTER_EVENT_STATE_CHANGED);
        hilog.info(domain, tag, 'PrinterEvent.PRINTER_EVENT_INFO_CHANGED = ' + print.PrinterEvent.PRINTER_EVENT_INFO_CHANGED);
        hilog.info(domain, tag, 'PrinterEvent.PRINTER_EVENT_PREFERENCE_CHANGED = ' + print.PrinterEvent.PRINTER_EVENT_PREFERENCE_CHANGED);

        // DefaultPrinterType
        hilog.info(domain, tag, 'DefaultPrinterType.DEFAULT_PRINTER_TYPE_SET_BY_USER = ' + print.DefaultPrinterType.DEFAULT_PRINTER_TYPE_SET_BY_USER);
        hilog.info(domain, tag, 'DefaultPrinterType.DEFAULT_PRINTER_TYPE_LAST_USED_PRINTER = ' + print.DefaultPrinterType.DEFAULT_PRINTER_TYPE_LAST_USED_PRINTER);
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5900 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_5900 end');
    });

    /**
     * @tc.name   print_function_6000
     * @tc.number print_function_6000
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_6000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_6000 start');

      try {
        let info: print.PrinterInformation = new MyPrinterInformation();
        info.printerId = '';
        info.printerName = '';
        info.printerStatus = print.PrinterStatus.PRINTER_IDLE;
        info.description = 'testDescription';
        let pageSize: print.PrintPageSize = new MyPrintPageSize();
        pageSize.id = '0';
        pageSize.name = '0';
        pageSize.width = 210;
        pageSize.height = 297;
        let capability = new MyPrinterCapabilities();
        capability.supportedPageSizes = [pageSize];
        capability.supportedColorModes = [
          print.PrintColorMode.COLOR_MODE_MONOCHROME,
          print.PrintColorMode.COLOR_MODE_COLOR
        ];
        capability.supportedDuplexModes = [
          print.PrintDuplexMode.DUPLEX_MODE_NONE,
          print.PrintDuplexMode.DUPLEX_MODE_LONG_EDGE,
          print.PrintDuplexMode.DUPLEX_MODE_SHORT_EDGE
        ];
        capability.supportedMediaTypes = ['stationery'];
        capability.supportedQualities = [
          print.PrintQuality.QUALITY_DRAFT,
          print.PrintQuality.QUALITY_NORMAL,
          print.PrintQuality.QUALITY_HIGH
        ];
        capability.supportedOrientations = [
          print.PrintOrientationMode.ORIENTATION_MODE_PORTRAIT,
          print.PrintOrientationMode.ORIENTATION_MODE_LANDSCAPE,
          print.PrintOrientationMode.ORIENTATION_MODE_REVERSE_LANDSCAPE,
          print.PrintOrientationMode.ORIENTATION_MODE_REVERSE_PORTRAIT,
          print.PrintOrientationMode.ORIENTATION_MODE_NONE
        ];
        capability.options = 'testOptions';
        info.uri = 'testUri';
        info.printerMake = 'testPrinterMake';
        let preferences = new MyPrinterPreferences();
        preferences.defaultDuplexMode = print.PrintDuplexMode.DUPLEX_MODE_NONE;
        preferences.defaultPrintQuality = print.PrintQuality.QUALITY_NORMAL;
        preferences.defaultMediaType = 'stationery';
        preferences.defaultPageSizeId = 'ISO_A4';
        preferences.defaultOrientation = print.PrintOrientationMode.ORIENTATION_MODE_NONE;
        preferences.borderless = false;
        preferences.options = 'testOptions';
        info.alias = 'testAlias';
        info.options = 'testOptions';
        info.capability = capability;
        info.preferences = preferences;
        print.addPrinterToDiscovery(info).then(() => {
          hilog.info(domain, tag, '%{public}s', 'print_function_6000 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_6000 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, 'print_function_6000 error');
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_6000 end');
    });

    /**
     * @tc.name   print_function_6100
     * @tc.number print_function_6100
     * @tc.desc   check the stopDiscoverPrinter api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_6100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_6100 start');
      try {
        print.stopDiscoverPrinter().then(() => {
          hilog.info(domain, tag, 'print_function_6100 success');
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_6100 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_6100 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_6100 end');
    })

    /**
     * @tc.name   print_function_6200
     * @tc.number print_function_6200
     * @tc.desc   check the getAddedPrinters api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_6200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_6200 start');
      try {
        print.getAddedPrinters().then((printers: Array<string>) => {
          hilog.info(domain, tag, 'print_function_6200 success, printers: %{public}s', JSON.stringify(printers));
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_6200 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_6200 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_6200 end');
    })

    /**
     * @tc.name   print_function_6300
     * @tc.number print_function_6300
     * @tc.desc   check the addPrinterToDiscovery api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_6300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_6300 start');
      try {
        let info: print.PrinterInformation = {
          printerId: 'printerIdTest',
          printerName: 'printerNameTest',
          printerStatus: print.PrinterStatus.PRINTER_BUSY,
          description: 'description',
        };
        hilog.info(domain, tag, 'start addPrinterToDiscovery');
        print.addPrinterToDiscovery(info).then(() => {
          hilog.info(domain, tag, 'print_function_6300 success');
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_6300 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, 'print_function_6300 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_6300 end');
    })

    /**
     * @tc.name   print_function_6400
     * @tc.number print_function_6400
     * @tc.desc   check the on printerChange api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_6400', Level.LEVEL0, (): void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_6400 start');

      try {
        let callback: print.PrinterChangeCallback = (event: print.PrinterEvent, printerInformation: print.PrinterInformation) => {
          hilog.info(domain, tag, 'print_function_6400 callback, event: %{public}d, printerId: %{public}s',
            event, printerInformation.printerId);
        };
        print.onPrinterChange(callback);
        hilog.info(domain, tag, 'print_function_6400 success');
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_6400 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_6400 end');
    })

    /**
     * @tc.name   print_function_6500
     * @tc.number print_function_6500
     * @tc.desc   check the off printerChange api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_6500', Level.LEVEL0, (): void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_6500 start');

      try {
        let callback: print.PrinterChangeCallback = (event: print.PrinterEvent, printerInformation: print.PrinterInformation) => {
          hilog.info(domain, tag, 'print_function_6500 callback, event: %{public}d, printerId: %{public}s',
            event, printerInformation.printerId);
        };
        print.offPrinterChange(callback);
        hilog.info(domain, tag, 'print_function_6500 success');
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_6500 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_6500 end');
    })

    /**
     * @tc.name   print_function_6600
     * @tc.number print_function_6600
     * @tc.desc   check print function without permission (callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_6600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_6600 start');
      try {
        const fileList = ['file://data/print/test.pdf'];
        print.print(fileList, (err: BusinessError<void>|null, printTask: print.PrintTask | undefined) => {
          if (err != null) {
            hilog.info(domain, tag, 'print_function_6600 errorCode = %{public}d', err.code);
            expect(err.code).assertEqual(401);
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_6600 unexpected error: %{public}s', error.message);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_6600 end');
    });

    /**
     * @tc.name   print_function_6700
     * @tc.number print_function_6700
     * @tc.desc   check print function without permission (promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_6700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_6700 start');
      try {
        const fileList = ['file://data/print/test.pdf'];
        print.print(fileList).then(() => {
          hilog.error(domain, tag, 'print_function_6700 should have failed');
          expect().assertFail();
          done();
        }).catch((error: Error) => {
          const err = error as BusinessError;
          hilog.info(domain, tag, 'print_function_6700 errorCode = %{public}d', err.code);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_6700 unexpected error: %{public}s', error.message);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_6700 end');
    });

    /**
     * @tc.name   print_function_6800
     * @tc.number print_function_6800
     * @tc.desc   check print function with context without permission (callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_6800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_6800 start');
      try {
        const fileList = ['file://data/print/test.pdf'];
        const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        const context = abilityDelegator.getAppContext();

        print.print(fileList, context, (err: BusinessError<void>|null, printTask: print.PrintTask | undefined) => {
          if (err != null) {
            hilog.info(domain, tag, 'print_function_6800 errorCode = %{public}d', err.code);
            expect(err.code).assertEqual(401);
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_6800 unexpected error: %{public}s', error.message);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_6800 end');
    });

    /**
     * @tc.name   print_function_6900
     * @tc.number print_function_6900
     * @tc.desc   check print function with context without permission (promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_6900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_6900 start');
      try {
        const fileList = ['file://data/print/test.pdf'];
        const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        const context = abilityDelegator.getAppContext();

        print.print(fileList, context).then(() => {
          hilog.error(domain, tag, 'print_function_6900 should have failed');
          expect().assertFail();
          done();
        }).catch((err: Error) => {
          const error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_6900 errorCode = %{public}d', err.code);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_6900 unexpected error: %{public}s', error.message);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_6900 end');
    });

    /**
     * @tc.name   print_function_7000
     * @tc.number print_function_7000
     * @tc.desc   test print function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_7000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_7000 start');
      try {
        let info: print.PrinterInformation = {
          printerId: 'printerId',
          printerName : 'printerName',
          printerStatus : print.PrinterStatus.PRINTER_IDLE,
          description : 'description',
          capability : {
            supportedPageSizes : [
              {
                id : 'id',
                name : 'name',
                width : 1,
                height : 2,
              }
            ],
            supportedColorModes : [
                print.PrintColorMode.COLOR_MODE_MONOCHROME
            ],
            supportedDuplexModes : [
              print.PrintDuplexMode.DUPLEX_MODE_NONE
            ],
            supportedMediaTypes : ['1', '2'],
            supportedQualities : [
              print.PrintQuality.QUALITY_DRAFT
            ],
            supportedOrientations : [
              print.PrintOrientationMode.ORIENTATION_MODE_PORTRAIT
            ],
            options : 'options'
          },
          uri: 'uri',
          printerMake : 'printerMake',
          preferences : {
            defaultDuplexMode : print.PrintDuplexMode.DUPLEX_MODE_NONE,
            defaultPrintQuality : print.PrintQuality.QUALITY_DRAFT,
            defaultMediaType : 'defaultMediaType',
            defaultPageSizeId : 'defaultPageSizeId',
            defaultOrientation : print.PrintOrientationMode.ORIENTATION_MODE_PORTRAIT,
            borderless : false,
            options : 'options'
          },
          alias : 'alias',
          options : 'options'
        }
        print.addPrinterToDiscovery(info).then(() => {
          hilog.info(domain, tag, '%{public}s', 'print_function_7000 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_7000 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, 'print_function_7000 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, 'PRINT_JOB_BLOCK_DRIVER_EXCEPTION = %{public}s', print.PrintJobSubState.PRINT_JOB_BLOCK_DRIVER_EXCEPTION);
      hilog.info(domain, tag, 'PRINT_JOB_BLOCK_DRIVER_MISSING = %{public}s', print.PrintJobSubState.PRINT_JOB_BLOCK_DRIVER_MISSING);
      hilog.info(domain, tag, 'PRINT_JOB_BLOCK_INTERRUPT = %{public}s', print.PrintJobSubState.PRINT_JOB_BLOCK_INTERRUPT);
      hilog.info(domain, tag, 'PRINT_JOB_BLOCK_PRINTER_UNAVAILABLE = %{public}s', print.PrintJobSubState.PRINT_JOB_BLOCK_PRINTER_UNAVAILABLE);
      hilog.info(domain, tag, 'PRINTER_EVENT_LAST_USED_PRINTER_CHANGED = %{public}s', print.PrinterEvent.PRINTER_EVENT_LAST_USED_PRINTER_CHANGED);
      hilog.info(domain, tag, '%{public}s', 'print_function_7000 end');
    });


    /**
     * @tc.name   print_function_7100
     * @tc.number print_function_7100
     * @tc.desc   check the print function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_7100', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'print_function_7100 start');
      try {
        const fileList = new Array<string>();
        fileList.push('file://data/print/a.png');
        fileList.push('file://data/print/b.png');
        hilog.info(domain, tag, 'begin test print');
        print.print(fileList, (err: BusinessError<void>|null, printTask: print.PrintTask | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'enter print callback');
          if (printTask != undefined) {
            try {
              printTask.onBlock(() => {
                hilog.info(domain, tag, '%{public}s', 'enter printTask on block');
              })
              printTask.onSucceed(() => {
                hilog.info(domain, tag, '%{public}s', 'enter printTask on succeed');
              })
              printTask.onFail(() => {
                hilog.info(domain, tag, '%{public}s', 'enter printTask on fail');
              })
              printTask.onCancel(() => {
                hilog.info(domain, tag, '%{public}s', 'enter printTask on cancel');
              })
              printTask.offBlock(() => {
                hilog.info(domain, tag, '%{public}s', 'enter printTask off block');
              })
              printTask.offSucceed(() => {
                hilog.info(domain, tag, '%{public}s', 'enter printTask off succeed');
              })
              printTask.offFail(() => {
                hilog.info(domain, tag, '%{public}s', 'enter printTask off fail');
              })
              printTask.offCancel(() => {
                hilog.info(domain, tag, '%{public}s', 'enter printTask off cancel');
              })
            } catch(err) {
              let error = err as BusinessError;
              expect(error.code).assertEqual(401);
            }
          }
        })
      } catch (err) {
        hilog.error(domain, tag, 'print_function_7100 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_7100 end');
    })

    /**
     * @tc.name   print_function_7200
     * @tc.number print_function_7200
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_7200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_7200 start');
      try {
        let info : print.PrinterInformation = {
          printerId : "printerIdTest",
          printerName : "printerNameTest",
          printerStatus : print.PrinterStatus.PRINTER_BUSY,
        };
        print.updatePrinterInDiscovery(info).then(() => {
          hilog.info(domain, tag, 'print_function_7200 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_7200 error, %{public}s', JSON.stringify(error));
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        hilog.error(domain, tag, 'print_function_7200 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_7200 end');
    })

    /**
     * @tc.name   print_function_7300
     * @tc.number print_function_7300
     * @tc.desc   check removePrinterFromDiscovery api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_7300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_7300 start');
      try {
        let printerId: string = 'printerIdTest';
        print.removePrinterFromDiscovery(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_7300 success');
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_7300 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_7300 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_7300 end');
    });

    /**
     * @tc.name   print_function_7400
     * @tc.number print_function_7400
     * @tc.desc   check getPrinterInformationById api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_7400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_7400 start');
      try {
        let printerId: string = '';
        print.getPrinterInformationById(printerId).then((info: print.PrinterInformation) => {
          hilog.info(domain, tag, 'print_function_7400 success, info: %{public}s', JSON.stringify(info));
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_7400 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_7400 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_7400 end');
    });

    /**
     * @tc.name   print_function_7500
     * @tc.number print_function_7500
     * @tc.desc   check on printerChange api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_7500', Level.LEVEL0, (): void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_7500 start');

      try {
        let callback: print.PrinterChangeCallback = (event: print.PrinterEvent, printerInformation: print.PrinterInformation) => {
          hilog.info(domain, tag, 'print_function_7500 callback, event: %{public}d, printerId: %{public}s',
            event, printerInformation.printerId);
        };
        print.onPrinterChange(callback);
        hilog.info(domain, tag, 'print_function_7500 success');
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_7500 error');
        expect(error.code).assertEqual(401);
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_7500 end');
    });

    /**
     * @tc.name   print_function_7600
     * @tc.number print_function_7600
     * @tc.desc   check off printerChange api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_7600', Level.LEVEL0, (): void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_7600 start');

      try {
        let callback: print.PrinterChangeCallback = (event: print.PrinterEvent, printerInformation: print.PrinterInformation) => {
          hilog.info(domain, tag, 'print_function_7600 callback, event: %{public}d, printerId: %{public}s',
            event, printerInformation.printerId);
        };
        print.offPrinterChange(callback);
        hilog.info(domain, tag, 'print_function_7600 success');
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_7600 error');
        expect(error.code).assertEqual(401);
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_7600 end');
    });

    /**
     * @tc.name   print_function_7700
     * @tc.number print_function_7700
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_7700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_7700 start');
      try {
        let jobName : string = 'testJobName';
        let printAdapter: print.PrintDocumentAdapter = new MyPrintDocumentAdapter();
        let printAttributes: print.PrintAttributes = {
          copyNumber : 1,
        };
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let context : Context = abilityDelegator.getAppContext();
        print.print(jobName, printAdapter, printAttributes, context).then((task: Object | null | undefined) => {
          hilog.info(domain, tag, 'print_function_7700 succeed');
          done();
        }).catch((err: Object | null | undefined) => {
          const error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_7600 error');
          expect(error.code).assertEqual(401);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_7700 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_7700 end');
    });

    hilog.info(domain, tag, '%{public}s', 'printTest end');
  });
}