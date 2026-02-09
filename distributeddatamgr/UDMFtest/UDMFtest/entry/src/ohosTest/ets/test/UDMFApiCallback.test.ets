/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = '[ttt]'

export default function UDMFApiCallback() {
  describe('UDMFApiCallback', () => {

    beforeEach(async () => {
      console.info(TAG + "beforeEach")
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      await unifiedDataChannel.deleteData(options).then((data) => {
        let size = data.length;
        console.info(TAG, ` [beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err:BusinessError) => {
        console.info(TAG, ` [beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })

    console.info(TAG + "*************Unit Test Begin*************")

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0100
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0100
     * @tc.desc   unifiedDataChannel insertData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let Options:unifiedDataChannel.Options = {}
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(Options, unifiedData, (err, data) => {
          if (err === undefined) {
            console.info(TAG + `data = ${data}, options = ${Options}`);
            expect(err === undefined).assertFail();
            done();
          } else {
            console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
            expect(err !== null).assertFail();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, `Failed to insertData0100 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0200
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0200
     * @tc.desc   unifiedDataChannel insertData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let Options:unifiedDataChannel.Options = {
        intention: undefined
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(Options, unifiedData, (err, data) => {
          if (err === undefined) {
            console.info(TAG + `data = ${data}, options = ${Options}`);
            expect(err === undefined).assertFail();
            done();
          } else {
            console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
            expect(err !== null).assertFail();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, `Failed to insertData0200 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0300
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0300
     * @tc.desc   unifiedDataChannel insertData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let Options: unifiedDataChannel.Options= {
        intention: null
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(Options, unifiedData, (err, data) => {
          if (err === undefined) {
            console.info(TAG + `data = ${data}, options = ${Options}`);
            expect(err === undefined).assertFail();
            done();
          } else {
            console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
            expect(err !== null).assertFail();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, `Failed to insertData0300 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0400
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0400
     * @tc.desc   unifiedDataChannel insertData callback interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let Options:unifiedDataChannel.Options = {
        intention: undefined,
        key: undefined
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(Options, unifiedData, (err, data) => {
          if (err === undefined) {
            console.info(TAG + `data = ${data}, options = ${Options}`);
            expect(err === undefined).assertFail();
            done();
          } else {
            console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
            expect(err !== null).assertFail();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, `Failed to insertData0400 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0500
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0500
     * @tc.desc   unifiedDataChannel insertData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let Options: unifiedDataChannel.Options= {
        key: String (null)
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(Options, unifiedData, (err, data) => {
          if (err === undefined) {
            console.info(TAG + `data = ${data}, options = ${Options}`);
            expect(err === undefined).assertFail();
            done();
          } else {
            console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
            expect(err !== null).assertFail();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, `Failed to insertData0500 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0600
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0600
     * @tc.desc   unifiedDataChannel insertData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options, unifiedData, (err, data) => {
          if (err === undefined) {
            console.info(TAG + `data = ${data}, options = ${options}`);
            expect(err === undefined).assertTrue()
            done();
          } else {
            console.error(TAG, `Failed to insertData0600 code is ${err.code},message is ${err.message} `);
            expect(err !== null).assertFail();
            done();
          }
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1000
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1000
     * @tc.desc   unifiedDataChannel updateData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options:unifiedDataChannel.Options= {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
          if (e !== undefined) {
            console.info(TAG, ` Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options}`);
          unifiedDataChannel.updateData({
            key: data
          }, unifiedData, (err, ret) => {
            if (err === undefined) {
              console.info(TAG + `updateData success; data = ${ret}, options = ${options}`);
              expect(err === undefined).assertTrue()
              done();
            } else {
              console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            }
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0800
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0800
     * @tc.desc   unifiedDataChannel insertData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
          if (e !== undefined) {
            console.info(TAG, ` Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0200 success; data = ${data}, options = ${options}`);
          try {
            unifiedDataChannel.updateData({
              key: undefined
            }, unifiedData, (err, ret) => {
              if (err === undefined) {
                console.info(TAG + `updateData success; data = ${ret}, options = ${options}`);
                expect(err !== null).assertFail()
                done();
              } else {
                console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
                expect(err !== null).assertFail();
                done();
              }
            });
          } catch (errInfo) {
            console.info(`UpdateData failed. code is ${errInfo.code},message is ${errInfo.message} `);
            expect(errInfo.code).assertEqual('401');
            done();
          }
        });
      } catch (error) {
        console.info(`UpdateData1 failed. code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0900
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0900
     * @tc.desc   unifiedDataChannel insertData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
          if (e !== undefined) {
            console.info(TAG, ` Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0300 success; data = ${data}, options = ${options}`);
          try {
            unifiedDataChannel.updateData({
              key: null
            }, unifiedData, (err, ret) => {
              if (err === undefined) {
                console.info(TAG + `updateData success; data = ${ret}, options = ${options}`);
                expect(err !== null).assertFail()
                done();
              } else {
                console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
                expect(err !== null).assertFail()
                done();
              }
            });
          } catch (errInfo) {
            console.info(`UpdateData failed. code is ${errInfo.code},message is ${errInfo.message} `);
            expect(errInfo.code).assertEqual('401');
            done();
          }
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0700
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0700
     * @tc.desc   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB,
        key: undefined
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
          if (e !== undefined) {
            console.info(TAG, ` Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0500 success; data = ${data}, options = ${options}`);
          try {
            unifiedDataChannel.updateData({}, unifiedData, (err, ret) => {
              if (err === undefined) {
                console.info(TAG + `updateData success; data = ${ret}, options = ${options}`);
                expect(err === undefined).assertTrue()
                done();
              } else {
                console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
                expect(err !== null).assertFail();
                done();
              }
            });
          } catch (errInfo) {
            console.info(`UpdateData failed. code is ${errInfo.code},message is ${errInfo.message} `);
            expect(errInfo.code).assertEqual('401');
            done();
          }
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1100
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1100
     * @tc.desc   unifiedDataChannel queryData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }; 
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.queryData(options, (err, ret) => {
          let dataSize = ret.length;
          unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options}`);
          unifiedDataChannel.queryData(options, (err, ret) => {
            if (err === undefined) {
              let size = ret.length;
              console.info(TAG, ` data.size = ${size}`);
              for (let i = dataSize; i < size-dataSize; i++) {
                let records = ret[i].getRecords();
                let size = records.length;
                for (let j = 0; j < size; j++) {
                  if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                    let text:unifiedDataChannel.PlainText = (records[j]) as unifiedDataChannel.PlainText;
                    console.info(TAG, ` queryData.result = ${i + 1}.${text.textContent}`);
                  }
                }
              }
              expect(size-dataSize).assertEqual(1);
              done();
            } else {
              console.info(`Failed to queryData. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            }
          });
        });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1200
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1200
     * @tc.desc   unifiedDataChannel queryData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options}`);
          unifiedDataChannel.queryData({
            key: data
          }, (err, ret) => {
            if (err === undefined) {
              let size = ret.length;
              console.info(TAG, ` data.size = ${size}`);
              for (let i = 0; i < size; i++) {
                let records = ret[i].getRecords();
                let size = records.length;
                for (let j = 0; j < size; j++) {
                  if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                    let text :unifiedDataChannel.PlainText= (records[j]) as unifiedDataChannel.PlainText;
                    console.info(TAG, ` queryData.result = ${i + 1}.${text.textContent}`);
                  }
                }
              }
              expect(size).assertEqual(1);
              done();
            } else {
              console.info(`Failed to queryData. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            }
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1300
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1300
     * @tc.desc   unifiedDataChannel queryData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options1:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options1, unifiedData, (e, data) => {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options1}`);
          let options2:unifiedDataChannel.Options = {
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: data
          };
          unifiedDataChannel.queryData(options2, (err, ret) => {
            if (err === undefined) {
              let size = ret.length;
              console.info(TAG, ` data.size = ${size}`);
              for (let i = 0; i < size; i++) {
                let records = ret[i].getRecords();
                let size = records.length;
                for (let j = 0; j < size; j++) {
                  if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                    let text:unifiedDataChannel.PlainText = (records[j]) as unifiedDataChannel.PlainText;
                    console.info(TAG, ` queryData.result = ${i + 1}.${text.textContent}`);
                  }
                }
              }
              expect(size).assertEqual(1);
              done();
            } else {
              console.info(`Failed to queryData. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            }
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1400
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1400
     * @tc.desc   unifiedDataChannel queryData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options1:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options1, unifiedData, (e, data) => {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0400 success; data = ${data}, options = ${options1}`);
          let options2:unifiedDataChannel.Options = {
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: 'data'
          };
          try {
            unifiedDataChannel.queryData(options2, (err, ret) => {
              if (err === undefined) {
                let size = ret.length;
                console.info(TAG, ` data.size = ${size}`);
                for (let i = 0; i < size; i++) {
                  let records = ret[i].getRecords();
                  let size = records.length;
                  for (let j = 0; j < size; j++) {
                    if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                      let text:unifiedDataChannel.PlainText = (records[j]) as unifiedDataChannel.PlainText;
                      console.info(TAG, ` queryData.result = ${i + 1}.${text.textContent}`);
                    }
                  }
                }
                expect(err === undefined).assertFail();
                done();
              } else {
                console.info(`Failed to queryData code is ${err.code},message is ${err.message} `);
                expect(err.code === 401).assertFail();
                done();
              }
            });
          } catch (errorInfo) {
            console.info(`Failed to queryData. code is ${errorInfo.code},message is ${errorInfo.message} `);
            expect(errorInfo.code).assertEqual('401');
            done();
          }
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1500
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1500
     * @tc.desc   unifiedDataChannel queryData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options1: unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.queryData(options1, (errInfo, ret) => {
          let dataSize = ret.length;
          unifiedDataChannel.insertData(options1, unifiedData, (e, data) => {
            if (e !== undefined) {
              console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
              return;
            }
            console.info(TAG + `insertData0500 success; data = ${data}, options = ${options1}`);
            let options2:unifiedDataChannel.Options = {
              intention: unifiedDataChannel.Intention.DATA_HUB,
              key: undefined
            };
            unifiedDataChannel.queryData(options2, (err, ret) => {
              if (err === undefined) {
                let size = ret.length;
                console.info(TAG, ` data.size = ${size}`);
                for (let i = dataSize; i < size - dataSize; i++) {
                  let records = ret[i].getRecords();
                  let size = records.length;
                  for (let j = 0; j < size; j++) {
                    if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                      let text:unifiedDataChannel.PlainText = (records[j]) as unifiedDataChannel.PlainText;
                      console.info(TAG, ` queryData.result = ${i + 1}.${text.textContent}`);
                    }
                  }
                }
                expect(size - dataSize).assertEqual(1);
                done();
              } else {
                console.info(`Failed to queryData. code is ${err.code},message is ${err.message} `);
                expect(err.code).assertEqual('401');
                done();
              }
            });
          });
        });

      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1600
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1600
     * @tc.desc   unifiedDataChannel deleteData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options}`);
          unifiedDataChannel.queryData(options, (errInfo, ret) => {
            if (errInfo !== undefined) {
              console.info(`Failed to queryData. code is ${errInfo.code},message is ${errInfo.message} `);
              return;
            }
            console.info(TAG, ` queryData size = ${ret.length}`);
            unifiedDataChannel.deleteData(options, (err, row) => {
              if (err == undefined) {
                let size = row.length;
                console.info(TAG, ` deleteData size = ${size}`);
                for (let i = 0; i < size; i++) {
                  let records = row[i].getRecords();
                  let size = records.length;
                  for (let j = 0; j < size; j++) {
                    if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                      let text:unifiedDataChannel.PlainText = (records[j]) as unifiedDataChannel.PlainText;
                      console.info(TAG, ` deleteData.result = ${i + 1}.${text.textContent}`);
                    }
                  }
                }
                expect(size).assertEqual(1);
                done();
              } else {
                console.info(`Failed to deleteData. code is ${err.code},message is ${err.message} `);
                expect(err !== null).assertFail();
                done();
              }
            });
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1700
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1700
     * @tc.desc   unifiedDataChannel deleteData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0200 success; data = ${data}, options = ${options}`);
          unifiedDataChannel.queryData(options, (errInfo, ret) => {
            if (errInfo !== undefined) {
              console.info(`Failed to queryData. code is ${errInfo.code},message is ${errInfo.message} `);
              return;
            }
            console.info(TAG, ` queryData size = ${ret.length}`);
            unifiedDataChannel.deleteData({
              key: data
            }, (err, row) => {
              if (err == undefined) {
                let size = row.length;
                console.info(TAG, ` deleteData size = ${size}`);
                for (let i = 0; i < size; i++) {
                  let records = row[i].getRecords();
                  let size = records.length;
                  for (let j = 0; j < size; j++) {
                    if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                      let text:unifiedDataChannel.PlainText = (records[j]) as unifiedDataChannel.PlainText;
                      console.info(TAG, ` deleteData.result = ${i + 1}.${text.textContent}`);
                    }
                  }
                }
                expect(size).assertEqual(1);
                done();
              } else {
                console.info(`Failed to deleteData. code is ${err.code},message is ${err.message} `);
                expect(err !== null).assertFail();
                done();
              }
            });
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1800
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1800
     * @tc.desc   unifiedDataChannel deleteData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options1:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options1, unifiedData, (e, data) => {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options1}`);
          unifiedDataChannel.queryData(options1, (errInfo, ret) => {
            if (errInfo !== undefined) {
              console.info(`Failed to queryData. code is ${errInfo.code},message is ${errInfo.message} `);
              return;
            }
            console.info(TAG, ` queryData size = ${ret.length}`);
            let options2:unifiedDataChannel.Options = {
              intention: unifiedDataChannel.Intention.DATA_HUB,
              key: data
            };
            unifiedDataChannel.deleteData(options2, (err, row) => {
              if (err == undefined) {
                let size = row.length;
                console.info(TAG, ` deleteData size = ${size}`);
                for (let i = 0; i < size; i++) {
                  let records = row[i].getRecords();
                  let size = records.length;
                  for (let j = 0; j < size; j++) {
                    if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                      let text:unifiedDataChannel.PlainText = (records[j]) as unifiedDataChannel.PlainText;
                      console.info(TAG, ` deleteData.result = ${i + 1}.${text.textContent}`);
                    }
                  }
                }
                expect(size).assertEqual(1);
                done();
              } else {
                console.info(`Failed to deleteData. code is ${err.code},message is ${err.message} `);
                expect(err !== null).assertFail();
                done();
              }
            });
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1900
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1900
     * @tc.desc   unifiedDataChannel deleteData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options1:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options1, unifiedData, (e, data) => {
          if (e !== undefined) {
            console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
            return;
          }
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options1}`);
          unifiedDataChannel.queryData(options1, (errInfo, ret) => {
            if (errInfo !== undefined) {
              console.info(`Failed to queryData. code is ${errInfo.code},message is ${errInfo.message} `);
              return;
            }
            console.info(TAG, ` queryData size = ${ret.length}`);
            let options2:unifiedDataChannel.Options = {
              intention: unifiedDataChannel.Intention.DATA_HUB,
              key: 'data'
            };
            try {
              unifiedDataChannel.deleteData(options2, (err, row) => {
                if (err == undefined) {
                  let size = row.length;
                  console.info(TAG, ` deleteData size = ${size}`);
                  for (let i = 0; i < size; i++) {
                    let records = row[i].getRecords();
                    let size = records.length;
                    for (let j = 0; j < size; j++) {
                      if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                        let text:unifiedDataChannel.PlainText = (records[j]) as unifiedDataChannel.PlainText;
                        console.info(TAG, ` deleteData.result = ${i + 1}.${text.textContent}`);
                      }
                    }
                  }
                  expect(err !== null).assertFail();
                  done();
                } else {
                  console.info(`Failed to deleteData. code is ${err.code},message is ${err.message} `);
                  expect(err.code === 401).assertFail();
                  done();
                }
              });
            } catch (error) {
              console.info(`Failed to deleteData. code is ${error.code},message is ${error.message} `);
              expect(error.code).assertEqual('401');
              done();
            }

          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_2000
     * @tc.number SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_2000
     * @tc.desc   unifiedDataChannel deleteData callback interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataCallbackJsAPITest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      let options1:unifiedDataChannel.Options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
          unifiedDataChannel.insertData(options1, unifiedData, (e, data) => {
            if (e !== undefined) {
              console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
              return;
            }
            console.info(TAG + `insertData0100 success; data = ${data}, options = ${options1}`);
            unifiedDataChannel.queryData(options1, (errInfo, ret) => {
              if (errInfo !== undefined) {
                console.info(`Failed to queryData. code is ${errInfo.code},message is ${errInfo.message} `);
                return;
              }
              console.info(TAG, ` queryData size = ${ret.length}`);
              let options2:unifiedDataChannel.Options = {
                intention: unifiedDataChannel.Intention.DATA_HUB,
                key: undefined
              };
              unifiedDataChannel.deleteData(options2, (err, row) => {
                if (err == undefined) {
                  let size = row.length;
                  console.info(TAG, ` deleteData size = ${size}`);
                  for (let i = 0; i < size; i++) {
                    let records = row[i].getRecords();
                    let size = records.length;
                    for (let j = 0; j < size; j++) {
                      if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                        let text:unifiedDataChannel.PlainText = (records[j]) as unifiedDataChannel.PlainText;
                        console.info(TAG, ` deleteData.result = ${i + 1}.${text.textContent}`);
                      }
                    }
                  }
                  expect(size).assertEqual(1);
                  done();
                } else {
                  console.info(`Failed to deleteData. code is ${err.code},message is ${err.message} `);
                  expect(err !== null).assertFail();
                  done();
                }
              });
            });
          });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })
    console.info(TAG + "*************Unit Test End*************")
  })
}