/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file expect in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium'
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import { BusinessError } from '@ohos.base';

const LONG_TEST2M = 'a'.repeat((2 * 1024 * 1024));
const LONG_TESTOVER2M = LONG_TEST2M + "a";
const LONG_TESTIN2M = 'a'.repeat((2 * 1024 * (1024-1)));
const LONG_TEST4M = LONG_TEST2M +LONG_TEST2M;
const LONG_TESTOVER4M = LONG_TEST2M + LONG_TESTOVER2M;
const LONG_TESTIN4M = LONG_TEST2M+LONG_TESTIN2M;


let optionsValid : unifiedDataChannel.Options;

export default function UDMFDragBigDataJsApiTest() {
  describe('UDMFDragBigDataJsApiTest', () => {
    beforeEach(async () => {
      optionsValid = { intention: unifiedDataChannel.Intention.DATA_HUB };
      console.info("beforeEach");
      await unifiedDataChannel.deleteData(optionsValid).then((data) => {
        let size = data.length;
        console.info(` [beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err:BusinessError) => {
        console.info(` [beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })

    afterEach(async () => {
      console.info("beforeEach");
      optionsValid = { intention: unifiedDataChannel.Intention.DATA_HUB };
      await unifiedDataChannel.deleteData(optionsValid).then((data) => {
        let size = data.length;
        console.info(` [beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err:BusinessError) => {
        console.info(` [beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })
    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0100
     * @tc.desc      : text -- one data is Over 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0100', 0, (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0100:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.Text();
        text.details = {
          title: '',
          content: LONG_TESTOVER2M,
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options:unifiedDataChannel.Options = { key: data };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Text;
            if (record.details != undefined ){
              expect(record.details.content).assertEqual(LONG_TESTOVER2M);
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
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0150
     * @tc.desc      : text -- one data is 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0150', 0, (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0150:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.Text();
        text.details = {
          title: '',
          content: LONG_TEST2M,
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options:unifiedDataChannel.Options = { key: data };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Text;
            if (record.details != undefined ){
              expect(record.details.content).assertEqual(LONG_TEST2M);
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
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0200
     * @tc.desc      : text -- one data is in 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0200', 0, (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0200:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.Text();
        text.details = {
          title: '',
          content: LONG_TESTIN2M,
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options:unifiedDataChannel.Options = { key: data };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Text;
            if (record.details != undefined ){
              expect(record.details.content).assertEqual(LONG_TESTIN2M);
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
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0250
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0250
     * @tc.desc      : text --one data is over 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0250', 0, (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0250:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.Text();
        text.details = {
          title: '',
          content: LONG_TESTOVER4M,
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options:unifiedDataChannel.Options = { key: data };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Text;
            if (record.details != undefined ){
              expect(record.details.content).assertEqual(LONG_TESTOVER4M);
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
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0300
     * @tc.desc      : text --one data is 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0300', 0, (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0300:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.Text();
        text.details = {
          title: '',
          content: LONG_TEST4M,
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options:unifiedDataChannel.Options = { key: data };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Text;
            if (record.details != undefined ){
              expect(record.details.content).assertEqual(LONG_TEST4M);
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
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0350
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0350
     * @tc.desc      : text --one data is  in 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0350', 0, (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0350:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.Text();
        text.details = {
          title: '',
          content: LONG_TESTIN4M,
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options:unifiedDataChannel.Options = { key: data };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Text;
            if (record.details != undefined ){
              expect(record.details.content).assertEqual(LONG_TESTIN4M);
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
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0400
     * @tc.desc      : text --one data is  is  100M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0400', 0, (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0400:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.Text();
        let LONG_TEST = "";
        for (let i =0; i < 25;i++){
          LONG_TEST =LONG_TEST+LONG_TEST2M;
        }
        text.details = {
          title:LONG_TEST,
          content: LONG_TEST,
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options:unifiedDataChannel.Options = { key: data };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record:unifiedDataChannel.Text  = data[0].getRecords()[0];
            if (record.details != undefined ){
              expect(record.details.content).assertEqual(LONG_TEST);
              expect(record.details.title).assertEqual(LONG_TEST);
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
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0450
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0450
     * @tc.desc      : PlainText --one data is 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0450', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.PlainText;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0500
     * @tc.desc      : PlainText one data is over 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0500', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.PlainText;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0550
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0550
     * @tc.desc      : PlainText --one data in 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0550', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.PlainText;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0600
     * @tc.desc      : PlainText -- one data is 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0600', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.PlainText;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0650
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0650
     * @tc.desc      : PlainText one data is over 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0650', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.PlainText;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0700
     * @tc.desc      : PlainText one  data is in 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0700', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.PlainText;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0750
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0750
     * @tc.desc      : Hyperlink one data is 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0750', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Hyperlink;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0800
     * @tc.desc      : Hyperlink one data is over 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0800', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Hyperlink;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0850
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0850
     * @tc.desc      : Hyperlink one data is in 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0850', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Hyperlink;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0900
     * @tc.desc      : Hyperlink one data is 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0900', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Hyperlink;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest0950
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0950
     * @tc.desc      : Hyperlink one data is over 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0950', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Hyperlink;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1000
     * @tc.desc      : Hyperlink one data is in 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1000', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Hyperlink;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1050
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1050
     * @tc.desc      : HTML one data is 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1050', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1050:';
      console.info(TAG, 'start');
      try {
        let html  = new unifiedDataChannel.HTML();
        html.plainContent = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(html);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.HTML;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1100
     * @tc.desc      : HTML  one data is over 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1100', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1100:';
      console.info(TAG, 'start');
      try {
        let html  = new unifiedDataChannel.HTML();
        html.plainContent =  LONG_TESTOVER2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(html);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.HTML;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1150
     * @tc.desc      : HTML one data is in 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1150', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1150:';
      console.info(TAG, 'start');
      try {
        let html  = new unifiedDataChannel.HTML();
        html.plainContent = LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(html);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.HTML;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1200
     * @tc.desc      : HTML one data is 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1200', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1200:';
      console.info(TAG, 'start');
      try {
        let html  = new unifiedDataChannel.HTML();
        html.plainContent =  LONG_TEST4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(html);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.HTML;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1250
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1250
     * @tc.desc      : HTML one data is over 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1250', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1250:';
      console.info(TAG, 'start');
      try {
        let html  = new unifiedDataChannel.HTML();
        html.plainContent =  LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(html);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.HTML;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1300
     * @tc.desc      : HTML one data is in 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1300', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1300:';
      console.info(TAG, 'start');
      try {
        let html  = new unifiedDataChannel.HTML();
        html.plainContent = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(html);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.HTML;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1350
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1350
     * @tc.desc      : SystemDefinedRecord one data is  2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1350', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1350:';
      console.info(TAG, 'start');
      try {
        let systemDefinedRecord   = new unifiedDataChannel.SystemDefinedRecord();
        systemDefinedRecord.details = {
          title: '',
          content: LONG_TEST2M
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedRecord);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedRecord;
            if ((record.details) != undefined ) {
              expect(record.details.content).assertEqual(LONG_TEST2M);
              unifiedDataChannel.deleteData(options).then((data) => {
                console.info(TAG, 'delete success.');
                expect(data.length).assertEqual(1);
                done();
              }).catch(() => {
                console.error(TAG, 'Unreachable code!');
                expect(null).assertFail();
                done();
              });
            }else {
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1400
     * @tc.desc      : SystemDefinedRecord one data is  over 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1400', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1400:';
      console.info(TAG, 'start');
      try {
        let systemDefinedRecord   = new unifiedDataChannel.SystemDefinedRecord();
        systemDefinedRecord.details = {
          title: '',
          content: LONG_TESTOVER2M
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedRecord);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedRecord;
            if ((record.details) != undefined){
              expect(record.details.content).assertEqual(LONG_TESTOVER2M);
              unifiedDataChannel.deleteData(options).then((data) => {
                console.info(TAG, 'delete success.');
                expect(data.length).assertEqual(1);
                done();
              }).catch(() => {
                console.error(TAG, 'Unreachable code!');
                expect(null).assertFail();
                done();
              });
            }else{
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1450
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1450
     * @tc.desc      : SystemDefinedRecord one data is in 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1450', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1450:';
      console.info(TAG, 'start');
      try {
        let systemDefinedRecord   = new unifiedDataChannel.SystemDefinedRecord();
        systemDefinedRecord.details = {
          title: '',
          content: LONG_TESTIN2M
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedRecord);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedRecord;
            if ((record.details) != undefined ){
              expect(record.details.content).assertEqual(LONG_TESTIN2M);
              unifiedDataChannel.deleteData(options).then((data) => {
                console.info(TAG, 'delete success.');
                expect(data.length).assertEqual(1);
                done();
              }).catch(() => {
                console.error(TAG, 'Unreachable code!');
                expect(null).assertFail();
                done();
              });
            }else{
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1500
     * @tc.desc      : SystemDefinedRecord one data is 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1500', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1500:';
      console.info(TAG, 'start');
      try {
        let systemDefinedRecord   = new unifiedDataChannel.SystemDefinedRecord();
        systemDefinedRecord.details = {
          title: '',
          content: LONG_TEST4M
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedRecord);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedRecord;
            if ((record.details) != undefined){
              expect(record.details.content).assertEqual(LONG_TEST4M);
              unifiedDataChannel.deleteData(options).then((data) => {
                console.info(TAG, 'delete success.');
                expect(data.length).assertEqual(1);
                done();
              }).catch(() => {
                console.error(TAG, 'Unreachable code!');
                expect(null).assertFail();
                done();
              });
            }else{
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1550
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1550
     * @tc.desc      : SystemDefinedRecord one data is over 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1550', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1550:';
      console.info(TAG, 'start');
      try {
        let systemDefinedRecord   = new unifiedDataChannel.SystemDefinedRecord();
        systemDefinedRecord.details = {
          title: '',
          content: LONG_TESTOVER4M
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedRecord);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedRecord;
            if ((record.details) != undefined){
              expect(record.details.content).assertEqual(LONG_TESTOVER4M);
              unifiedDataChannel.deleteData(options).then((data) => {
                console.info(TAG, 'delete success.');
                expect(data.length).assertEqual(1);
                done();
              }).catch(() => {
                console.error(TAG, 'Unreachable code!');
                expect(null).assertFail();
                done();
              });
            }else{
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1600
     * @tc.desc      : SystemDefinedRecord one data is in 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1600', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1600:';
      console.info(TAG, 'start');
      try {
        let systemDefinedRecord   = new unifiedDataChannel.SystemDefinedRecord();
        systemDefinedRecord.details = {
          title: '',
          content: LONG_TESTIN4M
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedRecord);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedRecord;
            if ((record.details)!=undefined){
              expect(record.details.content).assertEqual(LONG_TESTIN4M);
              unifiedDataChannel.deleteData(options).then((data) => {
                console.info(TAG, 'delete success.');
                expect(data.length).assertEqual(1);
                done();
              }).catch(() => {
                console.error(TAG, 'Unreachable code!');
                expect(null).assertFail();
                done();
              });
            }else {
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1650
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1650
     * @tc.desc      : SystemDefinedForm one data is 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1650', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1650:';
      console.info(TAG, 'start');
      try {
        let systemDefinedForm   = new unifiedDataChannel.SystemDefinedForm();
        systemDefinedForm.module = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedForm);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedForm;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1700
     * @tc.desc      : SystemDefinedForm one data over 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1700', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1700:';
      console.info(TAG, 'start');
      try {
        let systemDefinedForm   = new unifiedDataChannel.SystemDefinedForm();
        systemDefinedForm.module = LONG_TESTOVER2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedForm);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedForm;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1750
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1750
     * @tc.desc      : SystemDefinedForm one data in 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1750', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1750:';
      console.info(TAG, 'start');
      try {
        let systemDefinedForm   = new unifiedDataChannel.SystemDefinedForm();
        systemDefinedForm.module = LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedForm);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedForm;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1800
     * @tc.desc      : SystemDefinedForm one data is 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1800', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1800:';
      console.info(TAG, 'start');
      try {
        let systemDefinedForm   = new unifiedDataChannel.SystemDefinedForm();
        systemDefinedForm.module = LONG_TEST4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedForm);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedForm;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1850
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1850
     * @tc.desc      : SystemDefinedForm one data is over 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1850', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1850:';
      console.info(TAG, 'start');
      try {
        let systemDefinedForm   = new unifiedDataChannel.SystemDefinedForm();
        systemDefinedForm.module = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedForm);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedForm;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1900
     * @tc.desc      : SystemDefinedForm one data is in 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1900', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1900:';
      console.info(TAG, 'start');
      try {
        let systemDefinedForm   = new unifiedDataChannel.SystemDefinedForm();
        systemDefinedForm.module = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(systemDefinedForm);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedForm;
            expect(record.module).assertEqual(LONG_TESTIN4M);
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest1950
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1950
     * @tc.desc      : SystemDefinedAppItem one data is 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1950', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1950:';
      console.info(TAG, 'start');
      try {
        let appItem    = new unifiedDataChannel.SystemDefinedAppItem();
        appItem.abilityName = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(appItem);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedAppItem;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2000
     * @tc.desc      : SystemDefinedAppItem one data is over 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2000', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2000:';
      console.info(TAG, 'start');
      try {
        let appItem    = new unifiedDataChannel.SystemDefinedAppItem();
        appItem.abilityName = LONG_TESTOVER2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(appItem);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedAppItem;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2050
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2050
     * @tc.desc      : SystemDefinedAppItem one data is in 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2050', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2050:';
      console.info(TAG, 'start');
      try {
        let appItem    = new unifiedDataChannel.SystemDefinedAppItem();
        appItem.abilityName = LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(appItem);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedAppItem;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2100
     * @tc.desc      : SystemDefinedAppItem one data is 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2100', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2100:';
      console.info(TAG, 'start');
      try {
        let appItem    = new unifiedDataChannel.SystemDefinedAppItem();
        appItem.abilityName = LONG_TEST4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(appItem);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedAppItem;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2150
     * @tc.desc      : SystemDefinedAppItem one data is over 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2150', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2150:';
      console.info(TAG, 'start');
      try {
        let appItem    = new unifiedDataChannel.SystemDefinedAppItem();
        appItem.abilityName = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(appItem);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedAppItem;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2200
     * @tc.desc      : SystemDefinedAppItem one data is in 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2200', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2200:';
      console.info(TAG, 'start');
      try {
        let appItem    = new unifiedDataChannel.SystemDefinedAppItem();
        appItem.abilityName = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(appItem);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedAppItem;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2250
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2250
     * @tc.desc      : Folder one data is 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2250', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2250:';
      console.info(TAG, 'start');
      try {
        let folder     = new unifiedDataChannel.Folder();
        folder.uri = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(folder);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Folder;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2300
     * @tc.desc      : Folder one data is over 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2300', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2300:';
      console.info(TAG, 'start');
      try {
        let folder     = new unifiedDataChannel.Folder();
        folder.uri = LONG_TESTOVER2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(folder);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Folder;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2350
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2350
     * @tc.desc      : Folder one data is in 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2350', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2350:';
      console.info(TAG, 'start');
      try {
        let folder    = new unifiedDataChannel.Folder();
        folder.uri= LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(folder);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Folder;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2400
     * @tc.desc      : Folder one data is 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2400', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2400:';
      console.info(TAG, 'start');
      try {
        let folder  = new unifiedDataChannel.Folder();
        folder.uri = LONG_TEST4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(folder);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Folder;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2450
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2450
     * @tc.desc      : Folder one data is over 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2450', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2450:';
      console.info(TAG, 'start');
      try {
        let folder  = new unifiedDataChannel.Folder();
        folder.uri = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(folder);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Folder;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2500
     * @tc.desc      : Folder one data is in 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2500', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2500:';
      console.info(TAG, 'start');
      try {
        let folder  = new unifiedDataChannel.Folder();
        folder.uri = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(folder);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Folder;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2550
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2550
     * @tc.desc      : File one data is 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2550', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2550:';
      console.info(TAG, 'start');
      try {
        let file     = new unifiedDataChannel.File();
        file.uri = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(file);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.File;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2600
     * @tc.desc      : File one data is over 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2600', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2600:';
      console.info(TAG, 'start');
      try {
        let file    = new unifiedDataChannel.File();
        file.uri = LONG_TESTOVER2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(file);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.File;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2650
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2650
     * @tc.desc      : File one data is in 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2650', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2650:';
      console.info(TAG, 'start');
      try {
        let file    = new unifiedDataChannel.File();
        file.uri= LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(file);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.File;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2700
     * @tc.desc      : File one data is 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2700', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2700:';
      console.info(TAG, 'start');
      try {
        let file  = new unifiedDataChannel.File();
        file.uri = LONG_TEST4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(file);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.File;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2750
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2750
     * @tc.desc      : File one data is over 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2750', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2750:';
      console.info(TAG, 'start');
      try {
        let file  = new unifiedDataChannel.File();
        file.uri = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(file);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.File;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2800
     * @tc.desc      : File one data is in 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2800', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2800:';
      console.info(TAG, 'start');
      try {
        let file  = new unifiedDataChannel.File();
        file.uri = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(file);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.File;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });


    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2850
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2850
     * @tc.desc      : Image one data is 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2850', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2850:';
      console.info(TAG, 'start');
      try {
        let image  = new unifiedDataChannel.Image();
        image.uri = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(image);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Image;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2900
     * @tc.desc      : Image one data is over 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2900', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2900:';
      console.info(TAG, 'start');
      try {
        let image    = new unifiedDataChannel.Image();
        image.uri = LONG_TESTOVER2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(image);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Image;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest2950
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2950
     * @tc.desc      : Image one data is in 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2950', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2950:';
      console.info(TAG, 'start');
      try {
        let image = new unifiedDataChannel.Image();
        image.uri= LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(image);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Image;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3000
     * @tc.desc      : Image one data is 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3000', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3000:';
      console.info(TAG, 'start');
      try {
        let image  = new unifiedDataChannel.Image();
        image.uri = LONG_TEST4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(image);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Image;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3050
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3050
     * @tc.desc      : Image one data is over 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3050', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3050:';
      console.info(TAG, 'start');
      try {
        let image  = new unifiedDataChannel.Image();
        image.uri = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(image);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Image;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3100
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3100
     * @tc.desc      : Image one data is in 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3100', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3100:';
      console.info(TAG, 'start');
      try {
        let image  = new unifiedDataChannel.Image();
        image.uri = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(image);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Image;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3150
     * @tc.desc      : Video one data is 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3150', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3150:';
      console.info(TAG, 'start');
      try {
        let video  = new unifiedDataChannel.Video();
        video.uri = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(video);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Video;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3200
     * @tc.desc      : Video one data is over 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3200', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Video;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3250
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3250
     * @tc.desc      : Video one data is in 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3250', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3250:';
      console.info(TAG, 'start');
      try {
        let video = new unifiedDataChannel.Video();
        video.uri= LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(video);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Video;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3300
     * @tc.desc      : Video one data is 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3300', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Video;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3350
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3350
     * @tc.desc      : Video one data is over 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3350', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3350:';
      console.info(TAG, 'start');
      try {
        let video  = new unifiedDataChannel.Video();
        video.uri = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(video);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Video;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3400
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3400
     * @tc.desc      : Video one data is in 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3400', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3400:';
      console.info(TAG, 'start');
      try {
        let video  = new unifiedDataChannel.Video();
        video.uri = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(video);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Video;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3450
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3450
     * @tc.desc      : Audio one data is 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3450', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3450:';
      console.info(TAG, 'start');
      try {
        let audio  = new unifiedDataChannel.Audio();
        audio.uri = LONG_TEST2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(audio);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Audio;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3500
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3500
     * @tc.desc      : Audio one data is over 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3500', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Audio;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3550
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3550
     * @tc.desc      : Audio one data is in 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3550', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3550:';
      console.info(TAG, 'start');
      try {
        let audio = new unifiedDataChannel.Audio();
        audio.uri= LONG_TESTIN2M;
        let unifiedData = new unifiedDataChannel.UnifiedData(audio);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Audio;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3600
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3600
     * @tc.desc      : Audio one data is 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3600', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Audio;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3650
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3650
     * @tc.desc      : Audio one data is  over 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3650', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3650:';
      console.info(TAG, 'start');
      try {
        let audio  = new unifiedDataChannel.Audio();
        audio.uri = LONG_TESTOVER4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(audio);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Audio;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3700
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3700
     * @tc.desc      : Audio one data is  in 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3700', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3700:';
      console.info(TAG, 'start');
      try {
        let audio  = new unifiedDataChannel.Audio();
        audio.uri = LONG_TESTIN4M;
        let unifiedData = new unifiedDataChannel.UnifiedData(audio);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Audio;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3750
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3750
     * @tc.desc      : SystemDefinedPixelMap one data is 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3750', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3750:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.SystemDefinedPixelMap();
        let LONG_U8_ARRAY = new Uint8Array(Math.pow(2, 20));
        LONG_U8_ARRAY.fill(0);
        text.rawData = LONG_U8_ARRAY;
        text.details = {
          recordKey1: 's',
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedPixelMap;
            if ((record.details) != undefined){
              expect(record.details.recordKey1).assertEqual('s');
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
            }else {
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3800
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3800
     * @tc.desc      : SystemDefinedPixelMap one data is over 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3800', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3800:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.SystemDefinedPixelMap();
        let LONG_U8_ARRAY = new Uint8Array(Math.pow(2, 20));
        LONG_U8_ARRAY.fill(0);
        text.rawData = LONG_U8_ARRAY;
        text.details = {
          recordKey1: 'ss',
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedPixelMap;
            if((record.details) != undefined) {
              expect(record.details.recordKey1).assertEqual('ss');
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
            }else {
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3850
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3850
     * @tc.desc      : SystemDefinedPixelMap one data is in 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3850', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedPixelMap;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3900
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3900
     * @tc.desc      : SystemDefinedPixelMap one data is 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3900', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3900:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.SystemDefinedPixelMap();
        let LONG_U8_ARRAY = new Uint8Array(Math.pow(2, 21));
        LONG_U8_ARRAY.fill(0);
        text.rawData = LONG_U8_ARRAY;
        text.details = {
          recordKey1: 's',
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        console.info(TAG, `insert success. The key: ` + (LONG_U8_ARRAY.toString().length+(text.details.recordKey1).toString().length));
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedPixelMap;
            if((record.details) != undefined) {
              expect(record.details.recordKey1).assertEqual('s');
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
            }else {
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest3950
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3950
     * @tc.desc      : SystemDefinedPixelMap one data is over 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3950', 0, async (done:Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3950:';
      console.info(TAG, 'start');
      try {
        let text = new unifiedDataChannel.SystemDefinedPixelMap();
        let LONG_U8_ARRAY = new Uint8Array(Math.pow(2, 21));
        LONG_U8_ARRAY.fill(0);
        text.rawData = LONG_U8_ARRAY;
        text.details = {
          recordKey1: 'ss',
        };
        let unifiedData = new unifiedDataChannel.UnifiedData(text);
        unifiedDataChannel.insertData(optionsValid, unifiedData).then((data) => {
          console.info(TAG, `insert success. The key: ${data}`);
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedPixelMap;
            if((record.details) != undefined) {
              expect(record.details.recordKey1).assertEqual('ss');
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
            }else {
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest4000
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4000
     * @tc.desc      : SystemDefinedPixelMap one data is in 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4000', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.SystemDefinedPixelMap;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest4050
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4050
     * @tc.desc      : ApplicationDefinedRecord one data is 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4050', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.ApplicationDefinedRecord;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest4150
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4150
     * @tc.desc      : ApplicationDefinedRecord one data is over 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4150', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.ApplicationDefinedRecord;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest4200
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4200
     * @tc.desc      : ApplicationDefinedRecord one data is in 2M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4200', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.ApplicationDefinedRecord;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest4250
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4250
     * @tc.desc      : ApplicationDefinedRecord one data is 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4250', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.ApplicationDefinedRecord;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest4300
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4300
     * @tc.desc      : ApplicationDefinedRecord one data is over 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4300', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.ApplicationDefinedRecord;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name      : testSUBDistributedDataUDMFSDKDragBigDataJsApiTest4350
     * @tc.number    : SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4350
     * @tc.desc      : pplicationDefinedRecord one data is in 4M
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4350', 0, async (done:Function) => {
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
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.ApplicationDefinedRecord;
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
      }
      catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });



  })
}