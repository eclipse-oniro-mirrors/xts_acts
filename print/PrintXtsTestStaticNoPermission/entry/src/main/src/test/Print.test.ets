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

export default function printTest() {

  describe("printTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   print_function_0100
     * @tc.number print_function_0100
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0100 start');

      try {
        const extensionList = ['extension1', 'extension2'];
        print.startDiscoverPrinter(extensionList, (err: Object | null | undefined) => {
          if (err) {
            let error = err as BusinessError;
            expect(error.code).assertEqual(201);
            hilog.error(domain, tag, 'print_function_0100 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_0100 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0100 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0100 end');
    });

    /**
     * @tc.name   print_function_0200
     * @tc.number print_function_0200
     * @tc.desc   check the enum api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0200 start');
      try {
        let jobName : string = 'testJobName';
        let printAdapter: print.PrintDocumentAdapter = new MyPrintDocumentAdapter();
        let printAttributes: print.PrintAttributes = {
          copyNumber : 1,
        };
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let context : Context = abilityDelegator.getAppContext();
        print.print(jobName, printAdapter, printAttributes, context).then((task: Object | null | undefined) => {
          hilog.info(domain, tag, 'print_function_0200 succeed');
          let printTask = task as print.PrintTask;
          done();
        }).catch((err: Object | null | undefined) => {
          hilog.error(domain, tag, 'print_function_0200 error');
          let error = err as BusinessError;
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0200 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0200 end');
    });

    /**
     * @tc.name   print_function_0300
     * @tc.number print_function_0300
     * @tc.desc   check stopDiscoverPrinter api (promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0300 start');
      try {
        print.stopDiscoverPrinter().then(() => {
          hilog.info(domain, tag, 'print_function_0300 success');
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_0300 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0300 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0300 end');
    });

    /**
     * @tc.name   print_function_0400
     * @tc.number print_function_0400
     * @tc.desc   check stopDiscoverPrinter api (callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0400 start');
      try {
        print.stopDiscoverPrinter((err: BusinessError<void>|null, data: undefined) => {
          if (err != null) {
            hilog.error(domain, tag, 'print_function_0400 error, code: %{public}d, message: %{public}s',
              err.code, err.message);
            expect(err.code).assertEqual(201);
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
     * @tc.desc   check connectPrinter api (promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0500 start');
      try {
        let printerId: string = 'testPrinterId';
        print.connectPrinter(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_0500 success');
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_0500 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0500 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0500 end');
    });

    /**
     * @tc.name   print_function_0600
     * @tc.number print_function_0600
     * @tc.desc   check connectPrinter api (callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0600 start');
      try {
        let printerId: string = 'testPrinterId';
        print.connectPrinter(printerId, (err: BusinessError<void>|null, data: undefined) => {
          if (err != null) {
            hilog.error(domain, tag, 'print_function_0600 error, code: %{public}d, message: %{public}s',
              err.code, err.message);
            expect(err.code).assertEqual(201);
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
     * @tc.desc   check getAddedPrinters api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0700 start');
      try {
        print.getAddedPrinters().then((printers: Array<string>) => {
          hilog.info(domain, tag, 'print_function_0700 success, printers: %{public}s', JSON.stringify(printers));
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_0700 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0700 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0700 end');
    });

    /**
     * @tc.name   print_function_0800
     * @tc.number print_function_0800
     * @tc.desc   check addPrinterToDiscovery api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0800 start');
      try {
        let info: print.PrinterInformation = {
          printerId: 'printerIdTest',
          printerName: 'printerNameTest',
          printerStatus: print.PrinterStatus.PRINTER_BUSY
        };
        print.addPrinterToDiscovery(info).then(() => {
          hilog.info(domain, tag, 'print_function_0800 success');
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_0800 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0800 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0800 end');
    });

    /**
     * @tc.name   print_function_0900
     * @tc.number print_function_0900
     * @tc.desc   check updatePrinterInDiscovery api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0900 start');
      try {
        let info: print.PrinterInformation = {
          printerId: 'printerIdTest',
          printerName: 'printerNameTest',
          printerStatus: print.PrinterStatus.PRINTER_IDLE
        };
        print.updatePrinterInDiscovery(info).then(() => {
          hilog.info(domain, tag, 'print_function_0900 success');
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_0900 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0900 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0900 end');
    });

    /**
     * @tc.name   print_function_1000
     * @tc.number print_function_1000
     * @tc.desc   check removePrinterFromDiscovery api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1000 start');
      try {
        let printerId: string = 'printerIdTest';
        print.removePrinterFromDiscovery(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_1000 success');
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_1000 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1000 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1000 end');
    });

    /**
     * @tc.name   print_function_1100
     * @tc.number print_function_1100
     * @tc.desc   check getPrinterInformationById api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1100 start');
      try {
        let printerId: string = 'printerIdTest';
        print.getPrinterInformationById(printerId).then((info: print.PrinterInformation) => {
          hilog.info(domain, tag, 'print_function_1100 success, info: %{public}s', JSON.stringify(info));
          done();
        }).catch((err: Error) => {
          let error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_1100 errorCode = %{public}d', error.code);
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1100 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1100 end');
    });

    /**
     * @tc.name   print_function_1200
     * @tc.number print_function_1200
     * @tc.desc   check on printerChange api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1200', Level.LEVEL0, (): void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1200 start');

      try {
        let callback: print.PrinterChangeCallback = (event: print.PrinterEvent, printerInformation: print.PrinterInformation) => {
          hilog.info(domain, tag, 'print_function_1200 callback, event: %{public}d, printerId: %{public}s',
            event, printerInformation.printerId);
        };
        print.onPrinterChange(callback);
        hilog.info(domain, tag, 'print_function_1200 success');
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1200 error');
        expect(error.code).assertEqual(201);
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_1200 end');
    });

    /**
     * @tc.name   print_function_1300
     * @tc.number print_function_1300
     * @tc.desc   check off printerChange api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1300', Level.LEVEL0, (): void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1300 start');

      try {
        let callback: print.PrinterChangeCallback = (event: print.PrinterEvent, printerInformation: print.PrinterInformation) => {
          hilog.info(domain, tag, 'print_function_1300 callback, event: %{public}d, printerId: %{public}s',
            event, printerInformation.printerId);
        };
        print.offPrinterChange(callback);
        hilog.info(domain, tag, 'print_function_1300 success');
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1300 error');
        expect(error.code).assertEqual(201);
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_1300 end');
    });

    /**
     * @tc.name   print_function_1400
     * @tc.number print_function_1400
     * @tc.desc   check print function with context without permission (promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1400 start');
      try {
        const fileList = ['file://data/print/test.pdf'];
        const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        const context = abilityDelegator.getAppContext();

        print.print(fileList, context).then(() => {
          hilog.error(domain, tag, 'print_function_1400 should have failed');
          expect().assertFail();
          done();
        }).catch((err: Error) => {
          const error = err as BusinessError;
          hilog.info(domain, tag, 'print_function_1400 errorCode = %{public}d', err.code);
          expect(error.code).assertEqual(201);
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1400 unexpected error: %{public}s', error.message);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1400 end');
    });

    /**
     * @tc.name   print_function_1500
     * @tc.number print_function_1500
     * @tc.desc   check print function with context without permission (callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1500 start');
      try {
        const fileList = ['file://data/print/test.pdf'];
        const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        const context = abilityDelegator.getAppContext();

        print.print(fileList, context, (err: BusinessError<void>|null, printTask: print.PrintTask | undefined) => {
          if (err != null) {
            hilog.info(domain, tag, 'print_function_1500 errorCode = %{public}d', err.code);
            expect(err.code).assertEqual(201);
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1500 unexpected error: %{public}s', error.message);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1500 end');
    });

    /**
     * @tc.name   print_function_1600
     * @tc.number print_function_1600
     * @tc.desc   check print function without permission (promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1600 start');
      try {
        const fileList = ['file://data/print/test.pdf'];
        print.print(fileList).then(() => {
          hilog.error(domain, tag, 'print_function_1600 should have failed');
          expect().assertFail();
          done();
        }).catch((error: Error) => {
          const err = error as BusinessError;
          hilog.info(domain, tag, 'print_function_1600 errorCode = %{public}d', err.code);
          expect(err.code).assertEqual(201);
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1600 unexpected error: %{public}s', error.message);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1600 end');
    });

    /**
     * @tc.name   print_function_1700
     * @tc.number print_function_1700
     * @tc.desc   check print function without permission (callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1700 start');
      try {
        const fileList = ['file://data/print/test.pdf'];
        print.print(fileList, (err: BusinessError<void>|null, printTask: print.PrintTask | undefined) => {
          if (err != null) {
            hilog.info(domain, tag, 'print_function_1700 errorCode = %{public}d', err.code);
            expect(err.code).assertEqual(201);
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1700 unexpected error: %{public}s', error.message);
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1700 end');
    });

    /**
     * @tc.name   print_function_1800
     * @tc.number print_function_1800
     * @tc.desc   check the print function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('print_function_1800', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1800 start');
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
              expect(error.code).assertEqual(201);
            }
          }
        })
      } catch (err) {
        hilog.error(domain, tag, 'print_function_1800 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1800 end');
    })

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
        const extensionList = ['extension1', 'extension2'];
        print.startDiscoverPrinter(extensionList).then(() => {
          hilog.info(domain, tag, 'print_function_1900 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          expect(error.code).assertEqual(201);
          hilog.error(domain, tag, 'print_function_1900 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1900 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1900 end');
    })
    hilog.info(domain, tag, '%{public}s', 'printTest end');
  });
}