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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import unifiedDataChannel from '@ohos.data.unifiedDataChannel';
import uniformTypeDescriptor from '@ohos.data.uniformTypeDescriptor';

const TAG = '[ttt]'

export default function UDMFApiPromise() {
  describe('UDMFApiPromise', () => {

    beforeEach(async () => {
      console.info(TAG + "beforeEach")
      let options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      await unifiedDataChannel.deleteData(options).then((data) => {
        let size = data.length;
        console.info(TAG, ` [beforeEach] success to deleteData data.size = ${size}`);
      }).catch((err) => {
        console.info(TAG, ` [beforeEach] Failed to deleteData. code is ${err.code},message is ${err.message} `);
      });
    })

    console.info(TAG + "*************Unit Test Begin*************")

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0100
     * @tc.name      : unifiedDataChannel insertData promise interface test
     * @tc.desc      : unifiedDataChannel insertData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0100', 0, (done: Function) => {
      let Options = {}
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(Options, unifiedData).then((data) => {
          console.info(TAG + `data = ${data}, options = ${Options}`);
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
          expect(err !== null).assertFail();
          done();
        })
      } catch (error) {
        console.error(TAG, `Failed to insertData0100 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0200
     * @tc.name      : unifiedDataChannel insertData promise interface test
     * @tc.desc      : unifiedDataChannel insertData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0200', 0, (done: Function) => {
      let Options = {
        intention: undefined
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(Options, unifiedData).then((data) => {
          console.info(TAG + `data = ${data}, options = ${Options}`);
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
          expect(err !== null).assertFail();
          done();
        })
      } catch (error) {
        console.error(TAG, `Failed to insertData0200 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0300
     * @tc.name      : unifiedDataChannel insertData promise interface test
     * @tc.desc      : unifiedDataChannel insertData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0300', 0, (done: Function) => {
      let Options = {
        intention: null
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(Options, unifiedData).then((data) => {
          console.info(TAG + `data = ${data}, options = ${Options}`);
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
          expect(err !== null).assertFail();
          done();
        })
      } catch (error) {
        console.error(TAG, `Failed to insertData0300 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0400
     * @tc.name      : unifiedDataChannel insertData promise interface test
     * @tc.desc      : unifiedDataChannel insertData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0400', 0, (done: Function) => {
      let Options = {
        intention: undefined,
        key: undefined
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(Options, unifiedData).then((data) => {
          console.info(TAG + `data = ${data}, options = ${Options}`);
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
          expect(err !== null).assertFail();
          done();
        })
      } catch (error) {
        console.error(TAG, `Failed to insertData0400 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0500
     * @tc.name      : unifiedDataChannel insertData promise interface test
     * @tc.desc      : unifiedDataChannel insertData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0500', 0, (done: Function) => {
      let Options = {
        key: null
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = 'this is textContent';
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(Options, unifiedData).then((data) => {
          console.info(TAG + `data = ${data}, options = ${Options}`);
          expect().assertFail();
          done();
        }).catch((err) => {
          console.error(TAG, `Failed, code is ${err.code},message is ${err.message} `);
          expect(err !== null).assertFail();
          done();
        })
      } catch (error) {
        console.error(TAG, `Failed to insertData0500 code is ${error.code},message is ${error.message} `);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0600
     * @tc.name      : unifiedDataChannel insertData promise interface test
     * @tc.desc      : unifiedDataChannel insertData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0600', 0, (done: Function) => {
      let options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      }
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {
        unifiedDataChannel.insertData(options, unifiedData).then((data) => {
          console.info(TAG + `data = ${data}, options = ${options}`);
          expect(data !== null).assertTrue();
          done()
        }).catch((err) => {
          console.error(TAG, `Failed to insertData0600 code is ${err.code},message is ${err.message} `);
          expect(err !== null).assertFail();
          done();
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1000
     * @tc.name      : unifiedDataChannel updateData promise interface test
     * @tc.desc      : unifiedDataChannel updateData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1000', 0, (done: Function) => {
      let options = {
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
          }, unifiedData).then((ret) => {
            console.info(TAG + `updateData success; data = ${ret}, options = ${options}`);
            expect(ret !== null).assertTrue();
            done();
          }).catch((err) => {
            console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
            expect(err !== null).assertFail();
            done();
          });

        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0800
     * @tc.name      : unifiedDataChannel insertData promise interface test
     * @tc.desc      : unifiedDataChannel insertData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0800', 0, (done: Function) => {
      let options = {
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
            }, unifiedData).then((ret) => {
              console.info(TAG + `updateData success; data = ${ret}, options = ${options}`);
              expect().assertFail()
              done();
            }).catch((err) => {
              console.info(`UpdateData1111 failed. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            });
          } catch (errInfo) {
            console.info(`UpdateData2222 failed. code is ${errInfo.code},message is ${errInfo.message} `);
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0900
     * @tc.name      : unifiedDataChannel insertData promise interface test
     * @tc.desc      : unifiedDataChannel insertData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0900', 0, (done: Function) => {
      let options = {
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
            }, unifiedData).then((ret) => {
              console.info(TAG + `updateData success; data = ${ret}, options = ${options}`);
              expect().assertFail()
              done();
            }).catch((err) => {
              console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0700
     * @tc.name      : unifiedDataChannel insertData promise interface test
     * @tc.desc      : unifiedDataChannel insertData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */

    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_0700', 0, (done: Function) => {
      let options = {
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
          console.info(TAG + `insertData0100 success; data = ${data}, options = ${options}`);
          try {
            unifiedDataChannel.updateData({}, unifiedData).then((ret) => {
              console.info(TAG + `updateData success; data = ${ret}, options = ${options}`);
              expect(ret !== null).assertTrue();
              done();
            }).catch((err) => {
              console.info(`UpdateData failed. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1100
     * @tc.name      : unifiedDataChannel queryData promise interface test
     * @tc.desc      : unifiedDataChannel queryData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1100', 0, (done: Function) => {
      let options = {
        intention: unifiedDataChannel.Intention.DATA_HUB
      };
      let plainText = new unifiedDataChannel.PlainText();
      plainText.textContent = "hello world!";
      let unifiedData = new unifiedDataChannel.UnifiedData(plainText);
      try {

        unifiedDataChannel.queryData(options, (errInfo, ret) => {
          let dataSize = ret.length;
          unifiedDataChannel.insertData(options, unifiedData, (e, data) => {
            if (e !== undefined) {
              console.info(`Failed to insertData. code is ${e.code},message is ${e.message} `);
              return;
            }
            console.info(TAG + `insertData0100 success; data = ${data}, options = ${options}`);
            unifiedDataChannel.queryData(options).then((ret) => {
              let size = ret.length;
              console.info(TAG, ` data.size = ${size}`);
              for (let i = dataSize; i < size - dataSize; i++) {
                let records = ret[i].getRecords();
                let size = records.length;
                for (let j = 0; j < size; j++) {
                  if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                    let text = <unifiedDataChannel.PlainText> (records[j]);
                    console.info(TAG, ` queryData.result = ${i + 1}.${text.textContent}`);
                  }
                }
              }
              expect(size - dataSize).assertEqual(1);
              done();
            }).catch((err) => {
              console.info(`Failed to queryData. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1200
     * @tc.name      : unifiedDataChannel queryData promise interface test
     * @tc.desc      : unifiedDataChannel queryData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1200', 0, (done: Function) => {
      let options = {
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
          }).then((ret) => {
            let size = ret.length;
            console.info(TAG, ` data.size = ${size}`);
            for (let i = 0; i < size; i++) {
              let records = ret[i].getRecords();
              let size = records.length;
              for (let j = 0; j < size; j++) {
                if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                  let text = <unifiedDataChannel.PlainText> (records[j]);
                  console.info(TAG, ` queryData.result = ${i + 1}.${text.textContent}`);
                }
              }
            }
            expect(size).assertEqual(1);
            done();
          }).catch((err) => {
            console.info(`Failed to queryData. code is ${err.code},message is ${err.message} `);
            expect(err !== null).assertFail();
            done();
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1300
     * @tc.name      : unifiedDataChannel queryData promise interface test
     * @tc.desc      : unifiedDataChannel queryData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1300', 0, (done: Function) => {
      let options1 = {
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
          let options2 = {
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: data
          };
          unifiedDataChannel.queryData(options2).then((ret) => {
            let size = ret.length;
            console.info(TAG, ` data.size = ${size}`);
            for (let i = 0; i < size; i++) {
              let records = ret[i].getRecords();
              let size = records.length;
              for (let j = 0; j < size; j++) {
                if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                  let text = <unifiedDataChannel.PlainText> (records[j]);
                  console.info(TAG, ` queryData.result = ${i + 1}.${text.textContent}`);
                }
              }
            }
            expect(size).assertEqual(1);
            done();
          }).catch((err) => {
            console.info(`Failed to queryData. code is ${err.code},message is ${err.message} `);
            expect(err !== null).assertFail();
            done();
          });
        });
      } catch (error) {
        console.error(TAG, `Failed, code is ${error.code},message is ${error.message} `);
        expect(error !== null).assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1400
     * @tc.name      : unifiedDataChannel queryData promise interface test
     * @tc.desc      : unifiedDataChannel queryData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1400', 0, (done: Function) => {
      let options1 = {
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
          let options2 = {
            intention: unifiedDataChannel.Intention.DATA_HUB,
            key: 'data'
          };
          try {
            unifiedDataChannel.queryData(options2).then((ret) => {
              let size = ret.length;
              console.info(TAG, ` data.size = ${size}`);
              for (let i = 0; i < size; i++) {
                let records = ret[i].getRecords();
                let size = records.length;
                for (let j = 0; j < size; j++) {
                  if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                    let text = <unifiedDataChannel.PlainText> (records[j]);
                    console.info(TAG, ` queryData.result = ${i + 1}.${text.textContent}`);
                  }
                }
              }
              expect().assertFail();
              done();
            }).catch((err) => {
              console.info(`Failed. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
            });
          } catch (errInfo) {
            console.info(`Failed to queryData. code is ${errInfo.code},message is ${errInfo.message} `);
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1500
     * @tc.name      : unifiedDataChannel queryData promise interface test
     * @tc.desc      : unifiedDataChannel queryData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1500', 0, (done: Function) => {
      let options1 = {
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
            let options2 = {
              intention: unifiedDataChannel.Intention.DATA_HUB,
              key: undefined
            };
            unifiedDataChannel.queryData(options2).then((ret) => {
              let size = ret.length;
              console.info(TAG, ` data.size = ${size}`);
              for (let i = dataSize; i < size - dataSize; i++) {
                let records = ret[i].getRecords();
                let size = records.length;
                for (let j = 0; j < size; j++) {
                  if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                    let text = <unifiedDataChannel.PlainText> (records[j]);
                    console.info(TAG, ` queryData.result = ${i + 1}.${text.textContent}`);
                  }
                }
              }
              expect(size - dataSize).assertEqual(1);
              done();
            }).catch((err) => {
              console.info(`Failed to queryData. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1600
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : unifiedDataChannel deleteData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_SDK_UnifiedDataPromiseJsAPITest_1600', 0, (done: Function) => {
      let options = {
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
            unifiedDataChannel.deleteData(options).then((row) => {
              let size = row.length;
              console.info(TAG, ` deleteData size = ${size}`);
              for (let i = 0; i < size; i++) {
                let records = row[i].getRecords();
                let size = records.length;
                for (let j = 0; j < size; j++) {
                  if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                    let text = <unifiedDataChannel.PlainText> (records[j]);
                    console.info(TAG, ` deleteData.result = ${i + 1}.${text.textContent}`);
                  }
                }
              }
              expect(size).assertEqual(1);
              done();
            }).catch((err) => {
              console.info(`Failed to deleteData. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1700
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : unifiedDataChannel deleteData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1700', 0, (done: Function) => {
      let options = {
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
            }).then((row) => {
              let size = row.length;
              console.info(TAG, ` deleteData size = ${size}`);
              for (let i = 0; i < size; i++) {
                let records = row[i].getRecords();
                let size = records.length;
                for (let j = 0; j < size; j++) {
                  if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                    let text = <unifiedDataChannel.PlainText> (records[j]);
                    console.info(TAG, ` deleteData.result = ${i + 1}.${text.textContent}`);
                  }
                }
              }
              expect(size).assertEqual(1);
              done();
            }).catch((err) => {
              console.info(`Failed to deleteData. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1800
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : unifiedDataChannel deleteData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1800', 0, (done: Function) => {
      let options1 = {
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
            let options2 = {
              intention: unifiedDataChannel.Intention.DATA_HUB,
              key: data
            };
            unifiedDataChannel.deleteData(options2).then((row) => {
              let size = row.length;
              console.info(TAG, ` deleteData size = ${size}`);
              for (let i = 0; i < size; i++) {
                let records = row[i].getRecords();
                let size = records.length;
                for (let j = 0; j < size; j++) {
                  if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                    let text = <unifiedDataChannel.PlainText> (records[j]);
                    console.info(TAG, ` deleteData.result = ${i + 1}.${text.textContent}`);
                  }
                }
              }
              expect(size).assertEqual(1);
              done();
            }).catch((err) => {
              console.info(`Failed to deleteData. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1900
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : unifiedDataChannel deleteData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_1900', 0, (done: Function) => {
      let options1 = {
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
            let options2 = {
              intention: unifiedDataChannel.Intention.DATA_HUB,
              key: 'data'
            };
            try {
              unifiedDataChannel.deleteData(options2).then((row) => {
                let size = row.length;
                console.info(TAG, ` deleteData size = ${size}`);
                for (let i = 0; i < size; i++) {
                  let records = row[i].getRecords();
                  let size = records.length;
                  for (let j = 0; j < size; j++) {
                    if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                      let text = <unifiedDataChannel.PlainText> (records[j]);
                      console.info(TAG, ` deleteData.result = ${i + 1}.${text.textContent}`);
                    }
                  }
                }
                expect().assertFail();
                done();
              }).catch((err) => {
                console.info(`Failed to deleteData. code is ${err.code},message is ${err.message} `);
                expect(err !== null).assertFail();
                done();
              });
            } catch (errInfo) {
              console.info(`Failed to deleteData. code is ${errInfo.code},message is ${errInfo.message} `);
              expect(errInfo.code).assertEqual('401');
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
     * @tc.number    : SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_2000
     * @tc.name      : unifiedDataChannel deleteData promise interface test
     * @tc.desc      : unifiedDataChannel deleteData promise interface test.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_UDMF_SDK_UnifiedDataPromiseJsAPITest_2000', 0, (done: Function) => {
      let options1 = {
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
            let options2 = {
              intention: unifiedDataChannel.Intention.DATA_HUB,
              key: undefined
            };
            unifiedDataChannel.deleteData(options2).then((row) => {
              let size = row.length;
              console.info(TAG, ` deleteData size = ${size}`);
              for (let i = 0; i < size; i++) {
                let records = row[i].getRecords();
                let size = records.length;
                for (let j = 0; j < size; j++) {
                  if (records[j].getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
                    let text = <unifiedDataChannel.PlainText> (records[j]);
                    console.info(TAG, ` deleteData.result = ${i + 1}.${text.textContent}`);
                  }
                }
              }
              expect(size).assertEqual(1);
              done();
            }).catch((err) => {
              console.info(`Failed to deleteData. code is ${err.code},message is ${err.message} `);
              expect(err !== null).assertFail();
              done();
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