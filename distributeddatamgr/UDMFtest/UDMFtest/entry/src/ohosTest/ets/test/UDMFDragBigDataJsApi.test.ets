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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level} from '@ohos/hypium'
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import { BusinessError } from '@ohos.base';

let sleep = (ms: number) => {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

const LONG_TEST2M = 'a'.repeat((2 * 1024 * 1024));

let optionsValid: unifiedDataChannel.Options;

export default function UDMFDragBigDataJsApiTest() {
  describe('UDMFDragBigDataJsApiTest', () => {
    beforeEach(async () => {
      optionsValid = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      console.info("beforeEach");
      await unifiedDataChannel.deleteData(optionsValid).then((data) => {
        let size = data.length;
        console.info(` [beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err: BusinessError) => {
        console.info(` [beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })

    afterEach(async () => {
      console.info("beforeEach");
      optionsValid = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      await unifiedDataChannel.deleteData(optionsValid).then((data) => {
        let size = data.length;
        console.info(` [beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err: BusinessError) => {
        console.info(` [beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
      await sleep(5000);
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0150
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0150
     * @tc.desc   text -- one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
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
          let options: unifiedDataChannel.Options = {
            key: data
          };
          console.info(TAG, `query start. The options: ${JSON.stringify(options)}`);
          unifiedDataChannel.queryData(options).then((data) => {
            console.info(TAG, 'query success.');
            expect(data.length).assertEqual(1);
            let record = data[0].getRecords()[0] as unifiedDataChannel.Text;
            if (record.details != undefined) {
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0450
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0450
     * @tc.desc   PlainText --one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const TAG = 'SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1350:';
      console.info(TAG, 'start');
      try {
        let systemDefinedRecord = new unifiedDataChannel.SystemDefinedRecord();
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
            if ((record.details) != undefined) {
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1650
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1650
     * @tc.desc   SystemDefinedForm one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1950
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1950
     * @tc.desc   SystemDefinedAppItem one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_1950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_2850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_3750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
            if ((record.details) != undefined) {
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
     * @tc.name   SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4050
     * @tc.number SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4050
     * @tc.desc   ApplicationDefinedRecord one data is 2M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_UDMF_SDK_DragBigDataJsApiTest_4050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
      } catch (e) {
        console.error(TAG, 'Unreachable code!');
        expect(null).assertFail();
        done();
      }
      console.info(TAG, 'end');
    });
  })
}