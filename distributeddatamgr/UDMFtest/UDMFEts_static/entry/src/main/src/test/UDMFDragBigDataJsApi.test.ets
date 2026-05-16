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

export default function UDMFDragBigDataJsApiTest() {

  describe("UDMFDragBigDataJsApiTest", (): void => {
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0100
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0100
     * @tc.desc   text -- one data is Over 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0100:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.Text();
        text.details = {
          'title': '',
          'content': LONG_TESTOVER2M,
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
            let record = recordsGet[0] as unifiedDataChannel.Text;
            let detailsGet: Record<string, string> = record.details as Record<string, string>;
            if (detailsGet != undefined) {
              expect(detailsGet['content']).assertEqual(LONG_TESTOVER2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0150
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0150
     * @tc.desc   text -- one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0150:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.Text();
        text.details = {
          'title': '',
          'content': LONG_TEST2M,
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
            let record = recordsGet[0] as unifiedDataChannel.Text;
            let detailsGet: Record<string, string> = record.details as Record<string, string>;
            if (record.details != undefined) {
              expect(detailsGet['content']).assertEqual(LONG_TEST2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0200
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0200
     * @tc.desc   text -- one data is in 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0200:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.Text();
        text.details = {
          'title': '',
          'content': LONG_TESTIN2M,
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
            let record = recordsGet[0] as unifiedDataChannel.Text;
            let detailsGet: Record<string, string> = record.details as Record<string, string>;
            if (record.details != undefined) {
              expect(detailsGet['content']).assertEqual(LONG_TESTIN2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0250
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0250
     * @tc.desc   text --one data is over 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0250:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.Text();
        text.details = {
          'title': '',
          'content': LONG_TESTOVER4M,
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
            let record = recordsGet[0] as unifiedDataChannel.Text;
            let detailsGet: Record<string, string> = record.details as Record<string, string>;
            if (record.details != undefined) {
              expect(detailsGet['content']).assertEqual(LONG_TESTOVER4M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0300
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0300
     * @tc.desc   text --one data is 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0300:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.Text();
        text.details = {
          'title': '',
          'content': LONG_TEST4M,
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
            let record = recordsGet[0] as unifiedDataChannel.Text;
            let detailsGet: Record<string, string> = record.details as Record<string, string>;
            if (record.details != undefined) {
              expect(detailsGet['content']).assertEqual(LONG_TEST4M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0350
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0350
     * @tc.desc   text --one data is  in 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0350:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.Text();
        text.details = {
          'title': '',
          'content': LONG_TESTIN4M,
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
            let record = recordsGet[0] as unifiedDataChannel.Text;
            let detailsGet: Record<string, string> = record.details as Record<string, string>;
            if (record.details != undefined) {
              expect(detailsGet['content']).assertEqual(LONG_TESTIN4M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0400
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0400
     * @tc.desc   text --one data is  is  100M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0400:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.Text();
        let LONG_TEST = "";
        for (let i = 0; i < 2; i++) {
          LONG_TEST = LONG_TEST + LONG_TEST2M;
        }
        text.details = {
          'title': LONG_TEST,
          'content': LONG_TEST,
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
            let record = recordsGet[0] as unifiedDataChannel.Text;
            let detailsGet: Record<string, string> = record.details as Record<string, string>;
            if (record.details != undefined) {
              expect(detailsGet['content']).assertEqual(LONG_TEST);
              expect(detailsGet['title']).assertEqual(LONG_TEST);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0450
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0450
     * @tc.desc   PlainText --one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0450:';
      console.info(TAG, 'start');
      try {
        let plainText = new unifiedDataChannel.PlainText();
        plainText.textContent = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
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
            let record = recordsGet[0] as unifiedDataChannel.PlainText;
            expect(record.textContent).assertEqual(LONG_TEST2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0500
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0500
     * @tc.desc   PlainText one data is over 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0500:';
      console.info(TAG, 'start');
      try {
        let plainText = new unifiedDataChannel.PlainText();
        plainText.textContent = LONG_TESTOVER2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
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
            let record = recordsGet[0] as unifiedDataChannel.PlainText;
            expect(record.textContent).assertEqual(LONG_TESTOVER2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0550
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0550
     * @tc.desc   PlainText --one data in 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0550:';
      console.info(TAG, 'start');
      try {
        let plainText = new unifiedDataChannel.PlainText();
        plainText.textContent = LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
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
            let record = recordsGet[0] as unifiedDataChannel.PlainText;
            expect(record.textContent).assertEqual(LONG_TESTIN2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0600
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0600
     * @tc.desc   PlainText -- one data is 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0600:';
      console.info(TAG, 'start');
      try {
        let plainText = new unifiedDataChannel.PlainText();
        plainText.textContent = LONG_TEST4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
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
            let record = recordsGet[0] as unifiedDataChannel.PlainText;
            expect(record.textContent).assertEqual(LONG_TEST4M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0650
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0650
     * @tc.desc   PlainText one data is over 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0650:';
      console.info(TAG, 'start');
      try {
        let plainText = new unifiedDataChannel.PlainText();
        plainText.textContent = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
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
            let record = recordsGet[0] as unifiedDataChannel.PlainText;
            expect(record.textContent).assertEqual(LONG_TESTOVER4M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0700
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0700
     * @tc.desc   PlainText one  data is in 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0700:';
      console.info(TAG, 'start');
      try {
        let plainText = new unifiedDataChannel.PlainText();
        plainText.textContent = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
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
            let record = recordsGet[0] as unifiedDataChannel.PlainText;
            expect(record.textContent).assertEqual(LONG_TESTIN4M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0750
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0750
     * @tc.desc   Hyperlink one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0750:';
      console.info(TAG, 'start');
      try {
        let link = new unifiedDataChannel.Hyperlink();
        link.description = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(link);
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
            let record = recordsGet[0] as unifiedDataChannel.Hyperlink;
            expect(record.description).assertEqual(LONG_TEST2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0800
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0800
     * @tc.desc   Hyperlink one data is over 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0800:';
      console.info(TAG, 'start');
      try {
        let link = new unifiedDataChannel.Hyperlink();
        link.description = LONG_TESTOVER2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(link);
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
            let record = recordsGet[0] as unifiedDataChannel.Hyperlink;
            expect(record.description).assertEqual(LONG_TESTOVER2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0850
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0850
     * @tc.desc   Hyperlink one data is in 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0850:';
      console.info(TAG, 'start');
      try {
        let link = new unifiedDataChannel.Hyperlink();
        link.description = LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(link);
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
            let record = recordsGet[0] as unifiedDataChannel.Hyperlink;
            expect(record.description).assertEqual(LONG_TESTIN2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0900
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0900
     * @tc.desc   Hyperlink one data is 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0900:';
      console.info(TAG, 'start');
      try {
        let link = new unifiedDataChannel.Hyperlink();
        link.description = LONG_TEST4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(link);
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
            let record = recordsGet[0] as unifiedDataChannel.Hyperlink;
            expect(record.description).assertEqual(LONG_TEST4M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0950
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0950
     * @tc.desc   Hyperlink one data is over 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0950:';
      console.info(TAG, 'start');
      try {
        let link = new unifiedDataChannel.Hyperlink();
        link.description = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(link);
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
            let record = recordsGet[0] as unifiedDataChannel.Hyperlink;
            expect(record.description).assertEqual(LONG_TESTOVER4M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1000
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1000
     * @tc.desc   Hyperlink one data is in 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1000:';
      console.info(TAG, 'start');
      try {
        let link = new unifiedDataChannel.Hyperlink();
        link.description = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(link);
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
            let record = recordsGet[0] as unifiedDataChannel.Hyperlink;
            expect(record.description).assertEqual(LONG_TESTIN4M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1050
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1050
     * @tc.desc   HTML one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1050:';
      console.info(TAG, 'start');
      try {
        let html = new unifiedDataChannel.HTML();
        html.plainContent = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(html);
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
            let record = recordsGet[0] as unifiedDataChannel.HTML;
            expect(record.plainContent).assertEqual(LONG_TEST2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1100
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1100
     * @tc.desc   HTML  one data is over 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1100:';
      console.info(TAG, 'start');
      try {
        let html = new unifiedDataChannel.HTML();
        html.plainContent = LONG_TESTOVER2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(html);
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
            let record = recordsGet[0] as unifiedDataChannel.HTML;
            expect(record.plainContent).assertEqual(LONG_TESTOVER2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1150
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1150
     * @tc.desc   HTML one data is in 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1150:';
      console.info(TAG, 'start');
      try {
        let html = new unifiedDataChannel.HTML();
        html.plainContent = LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(html);
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
            let record = recordsGet[0] as unifiedDataChannel.HTML;
            expect(record.plainContent).assertEqual(LONG_TESTIN2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1200
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1200
     * @tc.desc   HTML one data is 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1200:';
      console.info(TAG, 'start');
      try {
        let html = new unifiedDataChannel.HTML();
        html.plainContent = LONG_TEST4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(html);
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
            let record = recordsGet[0] as unifiedDataChannel.HTML;
            expect(record.plainContent).assertEqual(LONG_TEST4M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1250
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1250
     * @tc.desc   HTML one data is over 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1250:';
      console.info(TAG, 'start');
      try {
        let html = new unifiedDataChannel.HTML();
        html.plainContent = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(html);
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
            let record = recordsGet[0] as unifiedDataChannel.HTML;
            expect(record.plainContent).assertEqual(LONG_TESTOVER4M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1300
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1300
     * @tc.desc   HTML one data is in 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1300:';
      console.info(TAG, 'start');
      try {
        let html = new unifiedDataChannel.HTML();
        html.plainContent = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(html);
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
            let record = recordsGet[0] as unifiedDataChannel.HTML;
            expect(record.plainContent).assertEqual(LONG_TESTIN4M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1350
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1350
     * @tc.desc   SystemDefinedRecord one data is  2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1350:';
      console.info(TAG, 'start');
      try {
        let systemDefinedRecord = new unifiedDataChannel.SystemDefinedRecord();
        systemDefinedRecord.details = {
          'title': '',
          'content': LONG_TEST2M
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedRecord);
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
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedRecord;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            if ((record.details) != undefined) {
              expect(detailsGet['content']).assertEqual(LONG_TEST2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1400
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1400
     * @tc.desc   SystemDefinedRecord one data is  over 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1400:';
      console.info(TAG, 'start');
      try {
        let systemDefinedRecord = new unifiedDataChannel.SystemDefinedRecord();
        systemDefinedRecord.details = {
          'title': '',
          'content': LONG_TESTOVER2M
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedRecord);
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
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedRecord;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            if ((record.details) != undefined) {
              expect(detailsGet['content']).assertEqual(LONG_TESTOVER2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1450
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1450
     * @tc.desc   SystemDefinedRecord one data is in 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1450:';
      console.info(TAG, 'start');
      try {
        let systemDefinedRecord = new unifiedDataChannel.SystemDefinedRecord();
        systemDefinedRecord.details = {
          'title': '',
          'content': LONG_TESTIN2M
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedRecord);
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
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedRecord;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            if ((record.details) != undefined) {
              expect(detailsGet['content']).assertEqual(LONG_TESTIN2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1500
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1500
     * @tc.desc   SystemDefinedRecord one data is 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1500:';
      console.info(TAG, 'start');
      try {
        let systemDefinedRecord = new unifiedDataChannel.SystemDefinedRecord();
        systemDefinedRecord.details = {
          'title': '',
          'content': LONG_TEST4M
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedRecord);
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
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedRecord;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            if ((record.details) != undefined) {
              expect(detailsGet['content']).assertEqual(LONG_TEST4M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1550
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1550
     * @tc.desc   SystemDefinedRecord one data is over 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1550:';
      console.info(TAG, 'start');
      try {
        let systemDefinedRecord = new unifiedDataChannel.SystemDefinedRecord();
        systemDefinedRecord.details = {
          'title': '',
          'content': LONG_TESTOVER4M
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedRecord);
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
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedRecord;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            if ((record.details) != undefined) {
              expect(detailsGet['content']).assertEqual(LONG_TESTOVER4M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1600
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1600
     * @tc.desc   SystemDefinedRecord one data is in 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1600:';
      console.info(TAG, 'start');
      try {
        let systemDefinedRecord = new unifiedDataChannel.SystemDefinedRecord();
        systemDefinedRecord.details = {
          'title': '',
          'content': LONG_TESTIN4M
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedRecord);
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
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedRecord;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            if ((record.details) != undefined) {
              expect(detailsGet['content']).assertEqual(LONG_TESTIN4M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1650
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1650
     * @tc.desc   SystemDefinedForm one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1650:';
      console.info(TAG, 'start');
      try {
        let systemDefinedForm = new unifiedDataChannel.SystemDefinedForm();
        systemDefinedForm.module = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedForm);
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
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedForm;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            expect(record.module).assertEqual(LONG_TEST2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1700
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1700
     * @tc.desc   SystemDefinedForm one data over 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1700:';
      console.info(TAG, 'start');
      try {
        let systemDefinedForm = new unifiedDataChannel.SystemDefinedForm();
        systemDefinedForm.module = LONG_TESTOVER2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedForm);
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
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedForm;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            expect(record.module).assertEqual(LONG_TESTOVER2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1750
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1750
     * @tc.desc   SystemDefinedForm one data in 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1750:';
      console.info(TAG, 'start');
      try {
        let systemDefinedForm = new unifiedDataChannel.SystemDefinedForm();
        systemDefinedForm.module = LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedForm);
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
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedForm;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            expect(record.module).assertEqual(LONG_TESTIN2M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1800
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1800
     * @tc.desc   SystemDefinedForm one data is 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1800:';
      console.info(TAG, 'start');
      try {
        let systemDefinedForm = new unifiedDataChannel.SystemDefinedForm();
        systemDefinedForm.module = LONG_TEST4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedForm);
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
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedForm;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            expect(record.module).assertEqual(LONG_TEST4M);
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1850
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1850
     * @tc.desc   SystemDefinedForm one data is over 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1850:';
      console.info(TAG, 'start');
      try {
        let systemDefinedForm = new unifiedDataChannel.SystemDefinedForm();
        systemDefinedForm.module = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedForm);
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
            let record = recordsGet[0] as unifiedDataChannel.SystemDefinedForm;
            let detailsGet: Record<string, int | long | double | string | Uint8Array> = record.details as Record<string, int | long | double | string | Uint8Array>;
            expect(record.module).assertEqual(LONG_TESTOVER4M);
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