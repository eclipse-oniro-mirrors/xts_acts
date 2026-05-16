/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError, RecordData } from '@ohos.base';
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';

const LONG_TEST2M = 'a'.repeat((2 * 1024 * 1024));
const LONG_TESTOVER2M = LONG_TEST2M + "a";
const LONG_TESTIN2M = 'a'.repeat((2 * 1024 * (1024 - 1)));
const LONG_TEST4M = LONG_TEST2M + LONG_TEST2M;
const LONG_TESTOVER4M = LONG_TEST2M + LONG_TESTOVER2M;
const LONG_TESTIN4M = LONG_TEST2M + LONG_TESTIN2M;

let optionsValid: unifiedDataChannel.Options = {
  intention: unifiedDataChannel.Intention.DATA_HUB
};

export default function UDMFDragBigDataPartJsApiTest() {

  describe("UDMFDragBigDataPartJsApiTest", (): void => {
    beforeAll(() => {
      console.info("beforeAll");
      unifiedDataChannel.deleteData(optionsValid).then((data: Array<unifiedDataChannel.UnifiedData>) => {
        let size = data.length;
        console.info(` [beforeAll] success to deleteData data.size = ${size}`);
      }).catch((error) => {
        let err: BusinessError = error as BusinessError;
        console.info(` [beforeAll] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })

    afterAll(() => {
      console.info("afterAll");
      unifiedDataChannel.deleteData(optionsValid).then((data: Array<unifiedDataChannel.UnifiedData>) => {
        let size = data.length;
        console.info(` [afterAll] success to deleteData data.size = ${size}`);
      }).catch((error) => {
        let err: BusinessError = error as BusinessError;
        console.info(` [afterAll] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1950
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1950
     * @tc.desc   SystemDefinedAppItem one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1950:';
      console.info(TAG, 'start');
      try {
        let appItem = new unifiedDataChannel.SystemDefinedAppItem();
        appItem.abilityName = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(appItem);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedAppItem;
            expect(record.abilityName).assertEqual(LONG_TEST2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2000
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2000
     * @tc.desc   SystemDefinedAppItem one data is over 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2000:';
      console.info(TAG, 'start');
      try {
        let appItem = new unifiedDataChannel.SystemDefinedAppItem();
        appItem.abilityName = LONG_TESTOVER2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(appItem);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedAppItem;
            expect(record.abilityName).assertEqual(LONG_TESTOVER2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2050
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2050
     * @tc.desc   SystemDefinedAppItem one data is in 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2050:';
      console.info(TAG, 'start');
      try {
        let appItem = new unifiedDataChannel.SystemDefinedAppItem();
        appItem.abilityName = LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(appItem);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedAppItem;
            expect(record.abilityName).assertEqual(LONG_TESTIN2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2100
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2100
     * @tc.desc   SystemDefinedAppItem one data is 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2100:';
      console.info(TAG, 'start');
      try {
        let appItem = new unifiedDataChannel.SystemDefinedAppItem();
        appItem.abilityName = LONG_TEST4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(appItem);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedAppItem;
            expect(record.abilityName).assertEqual(LONG_TEST4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2150
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2150
     * @tc.desc   SystemDefinedAppItem one data is over 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2150:';
      console.info(TAG, 'start');
      try {
        let appItem = new unifiedDataChannel.SystemDefinedAppItem();
        appItem.abilityName = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(appItem);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedAppItem;
            expect(record.abilityName).assertEqual(LONG_TESTOVER4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2200
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2200
     * @tc.desc   SystemDefinedAppItem one data is in 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2200:';
      console.info(TAG, 'start');
      try {
        let appItem = new unifiedDataChannel.SystemDefinedAppItem();
        appItem.abilityName = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(appItem);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedAppItem;
            expect(record.abilityName).assertEqual(LONG_TESTIN4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2250
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2250
     * @tc.desc   Folder one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2250:';
      console.info(TAG, 'start');
      try {
        let folder = new unifiedDataChannel.Folder();
        folder.uri = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(folder);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Folder;
            expect(record.uri).assertEqual(LONG_TEST2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2300
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2300
     * @tc.desc   Folder one data is over 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2300:';
      console.info(TAG, 'start');
      try {
        let folder = new unifiedDataChannel.Folder();
        folder.uri = LONG_TESTOVER2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(folder);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Folder;
            expect(record.uri).assertEqual(LONG_TESTOVER2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2350
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2350
     * @tc.desc   Folder one data is in 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2350:';
      console.info(TAG, 'start');
      try {
        let folder = new unifiedDataChannel.Folder();
        folder.uri = LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(folder);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Folder;
            expect(record.uri).assertEqual(LONG_TESTIN2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2400
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2400
     * @tc.desc   Folder one data is 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2400:';
      console.info(TAG, 'start');
      try {
        let folder = new unifiedDataChannel.Folder();
        folder.uri = LONG_TEST4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(folder);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Folder;
            expect(record.uri).assertEqual(LONG_TEST4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2450
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2450
     * @tc.desc   Folder one data is over 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2450:';
      console.info(TAG, 'start');
      try {
        let folder = new unifiedDataChannel.Folder();
        folder.uri = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(folder);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Folder;
            expect(record.uri).assertEqual(LONG_TESTOVER4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2500
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2500
     * @tc.desc   Folder one data is in 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2500:';
      console.info(TAG, 'start');
      try {
        let folder = new unifiedDataChannel.Folder();
        folder.uri = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(folder);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Folder;
            expect(record.uri).assertEqual(LONG_TESTIN4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2550
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2550
     * @tc.desc   File one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2550:';
      console.info(TAG, 'start');
      try {
        let file = new unifiedDataChannel.File();
        file.uri = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(file);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.File;
            expect(record.uri).assertEqual(LONG_TEST2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2600
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2600
     * @tc.desc   File one data is over 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2600:';
      console.info(TAG, 'start');
      try {
        let file = new unifiedDataChannel.File();
        file.uri = LONG_TESTOVER2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(file);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.File;
            expect(record.uri).assertEqual(LONG_TESTOVER2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2650
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2650
     * @tc.desc   File one data is in 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2650:';
      console.info(TAG, 'start');
      try {
        let file = new unifiedDataChannel.File();
        file.uri = LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(file);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.File;
            expect(record.uri).assertEqual(LONG_TESTIN2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2700
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2700
     * @tc.desc   File one data is 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2700:';
      console.info(TAG, 'start');
      try {
        let file = new unifiedDataChannel.File();
        file.uri = LONG_TEST4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(file);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.File;
            expect(record.uri).assertEqual(LONG_TEST4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2750
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2750
     * @tc.desc   File one data is over 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2750:';
      console.info(TAG, 'start');
      try {
        let file = new unifiedDataChannel.File();
        file.uri = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(file);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.File;
            expect(record.uri).assertEqual(LONG_TESTOVER4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2800
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2800
     * @tc.desc   File one data is in 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2800:';
      console.info(TAG, 'start');
      try {
        let file = new unifiedDataChannel.File();
        file.uri = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(file);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.File;
            expect(record.uri).assertEqual(LONG_TESTIN4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2850
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2850
     * @tc.desc   Image one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2850:';
      console.info(TAG, 'start');
      try {
        let image = new unifiedDataChannel.Image();
        image.uri = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(image);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Image;
            expect(record.uri).assertEqual(LONG_TEST2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2900
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2900
     * @tc.desc   Image one data is over 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2900:';
      console.info(TAG, 'start');
      try {
        let image = new unifiedDataChannel.Image();
        image.uri = LONG_TESTOVER2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(image);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Image;
            expect(record.uri).assertEqual(LONG_TESTOVER2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2950
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2950
     * @tc.desc   Image one data is in 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2950:';
      console.info(TAG, 'start');
      try {
        let image = new unifiedDataChannel.Image();
        image.uri = LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(image);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Image;
            expect(record.uri).assertEqual(LONG_TESTIN2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3000
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3000
     * @tc.desc   Image one data is 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3000:';
      console.info(TAG, 'start');
      try {
        let image = new unifiedDataChannel.Image();
        image.uri = LONG_TEST4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(image);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Image;
            expect(record.uri).assertEqual(LONG_TEST4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3050
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3050
     * @tc.desc   Image one data is over 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3050:';
      console.info(TAG, 'start');
      try {
        let image = new unifiedDataChannel.Image();
        image.uri = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(image);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Image;
            expect(record.uri).assertEqual(LONG_TESTOVER4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3100
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3100
     * @tc.desc   Image one data is in 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3100:';
      console.info(TAG, 'start');
      try {
        let image = new unifiedDataChannel.Image();
        image.uri = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(image);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Image;
            expect(record.uri).assertEqual(LONG_TESTIN4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3150
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3150
     * @tc.desc   Video one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3150:';
      console.info(TAG, 'start');
      try {
        let video = new unifiedDataChannel.Video();
        video.uri = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(video);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Video;
            expect(record.uri).assertEqual(LONG_TEST2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3200
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3200
     * @tc.desc   Video one data is over 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3200:';
      console.info(TAG, 'start');
      try {
        let video = new unifiedDataChannel.Video();
        video.uri = LONG_TESTOVER2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(video);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Video;
            expect(record.uri).assertEqual(LONG_TESTOVER2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3250
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3250
     * @tc.desc   Video one data is in 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3250:';
      console.info(TAG, 'start');
      try {
        let video = new unifiedDataChannel.Video();
        video.uri = LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(video);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Video;
            expect(record.uri).assertEqual(LONG_TESTIN2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3300
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3300
     * @tc.desc   Video one data is 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3300:';
      console.info(TAG, 'start');
      try {
        let video = new unifiedDataChannel.Video();
        video.uri = LONG_TEST4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(video);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Video;
            expect(record.uri).assertEqual(LONG_TEST4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3350
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3350
     * @tc.desc   Video one data is over 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3350:';
      console.info(TAG, 'start');
      try {
        let video = new unifiedDataChannel.Video();
        video.uri = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(video);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Video;
            expect(record.uri).assertEqual(LONG_TESTOVER4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3400
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3400
     * @tc.desc   Video one data is in 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3400:';
      console.info(TAG, 'start');
      try {
        let video = new unifiedDataChannel.Video();
        video.uri = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(video);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Video;
            expect(record.uri).assertEqual(LONG_TESTIN4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3450
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3450
     * @tc.desc   Audio one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3450:';
      console.info(TAG, 'start');
      try {
        let audio = new unifiedDataChannel.Audio();
        audio.uri = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(audio);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Audio;
            expect(record.uri).assertEqual(LONG_TEST2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3500
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3500
     * @tc.desc   Audio one data is over 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3500:';
      console.info(TAG, 'start');
      try {
        let audio = new unifiedDataChannel.Audio();
        audio.uri = LONG_TESTOVER2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(audio);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Audio;
            expect(record.uri).assertEqual(LONG_TESTOVER2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3550
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3550
     * @tc.desc   Audio one data is in 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3550:';
      console.info(TAG, 'start');
      try {
        let audio = new unifiedDataChannel.Audio();
        audio.uri = LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(audio);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Audio;
            expect(record.uri).assertEqual(LONG_TESTIN2M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3600
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3600
     * @tc.desc   Audio one data is 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3600:';
      console.info(TAG, 'start');
      try {
        let audio = new unifiedDataChannel.Audio();
        audio.uri = LONG_TEST4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(audio);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Audio;
            expect(record.uri).assertEqual(LONG_TEST4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3650
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3650
     * @tc.desc   Audio one data is  over 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3650:';
      console.info(TAG, 'start');
      try {
        let audio = new unifiedDataChannel.Audio();
        audio.uri = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(audio);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Audio;
            expect(record.uri).assertEqual(LONG_TESTOVER4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3700
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3700
     * @tc.desc   Audio one data is  in 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3700:';
      console.info(TAG, 'start');
      try {
        let audio = new unifiedDataChannel.Audio();
        audio.uri = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(audio);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.Audio;
            expect(record.uri).assertEqual(LONG_TESTIN4M);
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3750
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3750
     * @tc.desc   SystemDefinedPixelMap one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3750:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.SystemDefinedPixelMap();
        let LONG_U8_ARRAY = new Uint8Array(Math.pow(2, 20));
        LONG_U8_ARRAY.fill(0);
        text.rawData = LONG_U8_ARRAY;
        text.details = {
          'recordKey1': 's',
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedPixelMap;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            if ((record.details) != undefined) {
              expect(detailsGet['recordKey1']).assertEqual('s');
              expect((record.rawData).toString()).assertEqual(LONG_U8_ARRAY.toString());
              unifiedDataChannel.deleteData(options).then((data) => {
                console.info(TAG, 'delete success.');
                expect(data.length).assertEqual(1);
                done();
              }).catch(() => {
                console.error(TAG, 'Unreachable code!');
                expect(null).assertFail();
                done();
              });
            } else {
              expect().assertFail();
            }
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3800
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3800
     * @tc.desc   SystemDefinedPixelMap one data is over 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3800:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.SystemDefinedPixelMap();
        let LONG_U8_ARRAY = new Uint8Array(Math.pow(2, 20));
        LONG_U8_ARRAY.fill(0);
        text.rawData = LONG_U8_ARRAY;
        text.details = {
          'recordKey1': 'ss',
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedPixelMap;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            if ((record.details) != undefined) {
              expect(detailsGet['recordKey1']).assertEqual('ss');
              expect((record.rawData).toString()).assertEqual(LONG_U8_ARRAY.toString());
              unifiedDataChannel.deleteData(options).then((data) => {
                console.info(TAG, 'delete success.');
                expect(data.length).assertEqual(1);
                done();
              }).catch(() => {
                console.error(TAG, 'Unreachable code!');
                expect(null).assertFail();
                done();
              });
            } else {
              expect(null).assertFail();
            }
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3850
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3850
     * @tc.desc   SystemDefinedPixelMap one data is in 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3850:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.SystemDefinedPixelMap();
        let LONG_U8_ARRAY = new Uint8Array(Math.pow(2, 20));
        LONG_U8_ARRAY.fill(0);
        text.rawData = LONG_U8_ARRAY;
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedPixelMap;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            expect((record.rawData).toString()).assertEqual(LONG_U8_ARRAY.toString());
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3900
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3900
     * @tc.desc   SystemDefinedPixelMap one data is 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3900:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.SystemDefinedPixelMap();
        let LONG_U8_ARRAY = new Uint8Array(Math.pow(2, 21));
        LONG_U8_ARRAY.fill(0);
        text.rawData = LONG_U8_ARRAY;
        text.details = {
          'recordKey1': 's',
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedPixelMap;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            if ((record.details) != undefined) {
              expect(detailsGet['recordKey1']).assertEqual('s');
              expect((record.rawData).toString()).assertEqual(LONG_U8_ARRAY.toString());
              unifiedDataChannel.deleteData(options).then((data) => {
                console.info(TAG, 'delete success.');
                expect(data.length).assertEqual(1);
                done();
              }).catch(() => {
                console.error(TAG, 'Unreachable code!');
                expect(null).assertFail();
                done();
              });
            } else {
              expect(null).assertFail();
            }
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3950
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3950
     * @tc.desc   SystemDefinedPixelMap one data is over 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3950:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.SystemDefinedPixelMap();
        let LONG_U8_ARRAY = new Uint8Array(Math.pow(2, 21));
        LONG_U8_ARRAY.fill(0);
        text.rawData = LONG_U8_ARRAY;
        text.details = {
          'recordKey1': 'ss',
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedPixelMap;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            if ((record.details) != undefined) {
              expect(detailsGet['recordKey1']).assertEqual('ss');
              expect((record.rawData).toString()).assertEqual(LONG_U8_ARRAY.toString());
              unifiedDataChannel.deleteData(options).then((data) => {
                console.info(TAG, 'delete success.');
                expect(data.length).assertEqual(1);
                done();
              }).catch(() => {
                console.error(TAG, 'Unreachable code!');
                expect(null).assertFail();
                done();
              });
            } else {
              expect(null).assertFail();
            }
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4000
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4000
     * @tc.desc   SystemDefinedPixelMap one data is in 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4000:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.SystemDefinedPixelMap();
        let LONG_U8_ARRAY = new Uint8Array(Math.pow(2, 21));
        LONG_U8_ARRAY.fill(0);
        text.rawData = LONG_U8_ARRAY;
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedPixelMap;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            expect((record.rawData).toString()).assertEqual(LONG_U8_ARRAY.toString());
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4050
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4050
     * @tc.desc   ApplicationDefinedRecord one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4050:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.ApplicationDefinedRecord();
        let LONG_U8_ARRAY = new Uint8Array(Math.pow(2, 20));
        LONG_U8_ARRAY.fill(0);
        text.rawData = LONG_U8_ARRAY;
        text.applicationDefinedType = 's';
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.ApplicationDefinedRecord;
            expect(record.applicationDefinedType).assertEqual('s');
            expect((record.rawData).toString()).assertEqual(LONG_U8_ARRAY.toString());
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4150
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4150
     * @tc.desc   ApplicationDefinedRecord one data is over 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4150:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.ApplicationDefinedRecord();
        let LONG_U8_ARRAY = new Uint8Array(Math.pow(2, 20));
        LONG_U8_ARRAY.fill(0);
        text.rawData = LONG_U8_ARRAY;
        text.applicationDefinedType = 'ss';
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.ApplicationDefinedRecord;
            expect(record.applicationDefinedType).assertEqual('ss');
            expect((record.rawData).toString()).assertEqual(LONG_U8_ARRAY.toString());
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4200
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4200
     * @tc.desc   ApplicationDefinedRecord one data is in 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4200:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.ApplicationDefinedRecord();
        let LONG_U8_ARRAY = new Uint8Array(Math.pow(2, 20));
        LONG_U8_ARRAY.fill(0);
        text.rawData = LONG_U8_ARRAY;
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.ApplicationDefinedRecord;
            expect((record.rawData).toString()).assertEqual(LONG_U8_ARRAY.toString());
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4250
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4250
     * @tc.desc   ApplicationDefinedRecord one data is 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4250:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.ApplicationDefinedRecord();
        let LONG_U8_ARRAY = new Uint8Array(Math.pow(2, 21));
        LONG_U8_ARRAY.fill(0);
        text.rawData = LONG_U8_ARRAY;
        text.applicationDefinedType = 's';
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.ApplicationDefinedRecord;
            expect(record.applicationDefinedType).assertEqual('s');
            expect((record.rawData).toString()).assertEqual(LONG_U8_ARRAY.toString());
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4300
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4300
     * @tc.desc   ApplicationDefinedRecord one data is over 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4300:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.ApplicationDefinedRecord();
        let LONG_U8_ARRAY = new Uint8Array(Math.pow(2, 21));
        LONG_U8_ARRAY.fill(0);
        text.rawData = LONG_U8_ARRAY;
        text.applicationDefinedType = 'ss';
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.ApplicationDefinedRecord;
            expect(record.applicationDefinedType).assertEqual('ss');
            expect((record.rawData).toString()).assertEqual(LONG_U8_ARRAY.toString());
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4350
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4350
     * @tc.desc   pplicationDefinedRecord one data is in 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4350:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.ApplicationDefinedRecord();
        let LONG_U8_ARRAY = new Uint8Array(Math.pow(2, 21));
        LONG_U8_ARRAY.fill(0);
        text.rawData = LONG_U8_ARRAY;
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data: Array<unifiedDataChannel.UnifiedData>) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let recordsGet: Array<unifiedDataChannel.UnifiedRecord> = data[0].getRecords() as Array<unifiedDataChannel.UnifiedRecord>
            let record = recordsGet[0] as unifiedDataChannel.ApplicationDefinedRecord;
            expect((record.rawData).toString()).assertEqual(LONG_U8_ARRAY.toString());
            unifiedDataChannel.deleteData(options).then((data) => {
              console.info(TAG, 'delete success.');
              expect(data.length).assertEqual(1);
              done();
            }).catch(() => {
              console.error(TAG, 'Unreachable code!');
              expect(null).assertFail();
              done();
            });
          }).catch(() => {
            console.error(TAG, 'Unreachable code!');
            expect(null).assertFail();
            done();
          });
        }).catch(() => {
          console.error(TAG, 'Unreachable code!');
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });
  })
}