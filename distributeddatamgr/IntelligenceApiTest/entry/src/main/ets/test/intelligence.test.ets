/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import osAccount from '@ohos.account.osAccount';
import intelligence from '@ohos.data.intelligence'
import { BusinessError } from '@kit.BasicServicesKit';
import { config } from '@kit.AccessibilityKit';
import { ErrorCode } from '@kit.AbilityKit';
import deviceInfo from '@ohos.deviceInfo';

const TAG =["Intelligence_Test"];

let textConfig:intelligence.ModelConfig  = {
  version:intelligence.ModelVersion.BASIC_MODEL,
  isNpuAvailable:false,
  cachePath:"test"
}

let imageConfig:intelligence.ModelConfig = {
  version:intelligence.ModelVersion.BASIC_MODEL,
  isNpuAvailable:false,
  cachePath:"image"
}


export default function intelligenceTest() {
  let currentDeviceIsPc = false;
  describe('intelligenceTest', () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll");
      let deviceTypeInfo = deviceInfo.deviceType;
      currentDeviceIsPc = deviceTypeInfo === '2in1' ? true : false;
      console.info(TAG + "the value of the deviceType is : " + deviceInfo.deviceType);
    })
    beforeEach(async () => {
      console.info(TAG + "beforeEach");
    })
    afterEach(async () => {
      console.info(TAG + "afterEach");
    })
    afterAll(async () => {
      console.info(TAG + "afterAll");
    })

    console.info("*************intelligence Test begin**************");
    let retArray = [401, 801, 313000000];


    /**
     * @tc.name intelligenceApiTest0100
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0100
     * @tc.desc splitText interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */

    it("intelligenceApiTest0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0100 start")
      let text =
        "日常生活中，我们对接触到的事物，会产生一个不假思索地看法，或者说直觉性的认知.百科全书里这样解释道“ 认知包括感觉、知觉、记忆、思维、想象和语言等。";
      let config: intelligence.SplitConfig = {
        size: 50,
        overlapRatio: 0.5
      };
      if (currentDeviceIsPc) {
        await intelligence.splitText(text, config)
        .then((data) => {
          console.info(TAG + "get result:" + data);
          let dataSize = data.length;
          let ret = dataSize > 0;
          expect(ret).assertEqual(true);
          done();
        })
      } else {
        await intelligence.splitText(text, config)
        .then((data) => {
          console.info(TAG + "get result:" + data);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.info(TAG + "get promise result:" + err.code);
          expect(err.code).assertEqual(801);
          done();
        })
      }     
    })


    /**
     * @tc.name intelligenceApiTest0200
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0200
     * @tc.desc getTextEmbeddingModel promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0200 start");
      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result" + data);
            let ret = false;
            if (data != null) {
              ret = true;
            }
            expect(ret).assertEqual(true);
            done();
            })
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result:" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest0300
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0300
     * @tc.desc getImageEmbeddingModel promise interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0300 start");
      if (currentDeviceIsPc) {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            let ret = false
            if (data != null) {
              ret = true;
            }
            expect(ret).assertEqual(true);
            done();
          })
      } else {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result:" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })



    /**
     * @tc.name intelligenceApiTest0400
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0400
     * @tc.desc getTextEmbeddingModel loadModel interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0400 start");

      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            data.loadModel()
            .then(() => {
              console.info(TAG + "get loadMldel result 0400:");
              done();
            })
          })
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
        .then((data) => {
          console.info(TAG + "get result:" + data);
          expect().assertFail();
        })
        .catch((err: BusinessError) => {
          expect(err.code).assertEqual(801);
          done();
        })
      }
    })


    /**
     * @tc.name intelligenceApiTest0500
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0500
     * @tc.desc getTextEmbeddingModel loadModel interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0500 start");
      if (currentDeviceIsPc) {
        try {
          intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            data.loadModel()
            .then(() => {
              console.info(TAG + "loadModel success result 0500:" );
              data.releaseModel()
              done();
            }) 
          })
          
        } catch(err){
          console.info(TAG + "intelligenceApiTest0500 is fail:" );
          expect().assertFail();
          done();
        }
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
            done();
                })
          .catch((err: BusinessError) => {
            console.info(TAG + "get result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest0600
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0600
     * @tc.desc getTextEmbeddingModel releaseModel abnormal interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0600 start");

      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
              data.releaseModel()
                .then(() => {
                  console.info(TAG + "releaseModel result 0600:");
                  expect().assertFail();
                  done();
                })
                .catch((err:BusinessError) => {
                  console.info(TAG + "getEmbedding result" + err.code);
                  expect(err.code).assertEqual(31300000);
                  done();
                })
              })
    } else {
      intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "loadModel promise result:" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest0700
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0700
     * @tc.desc getTextEmbeddingModel getEmbedding interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0700 start");

      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            data.getEmbedding('123')
            .then((loadData) => {
               console.info(TAG + "getEmbedding result:" + loadData);
               let dataSize:number = loadData.length;
               let ret = dataSize > 0;
               expect().assertFail();
               done();
            })
            .catch((err:BusinessError) => {
              console.info(TAG + "getEmbedding result" + err.code);
              expect(err.code).assertEqual(31300000);
              done();
            })
          })
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "getEmbedding promise result:" + err.code);
            expect(err.code).assertEqual(801);
            done();

          })
      }
    })


    /**
     * @tc.name intelligenceApiTest0800
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0800
     * @tc.desc getTextEmbeddingModel getEmbedding abnormal interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0800 start");

      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
          .then(async (data) => {
            console.info(TAG + "get result:" + data);
            await data.loadModel();
            let text = 'text';
            data.getEmbedding(text)
            .then((loadData) => {
              console.info(TAG + "getEmbedding result 0800 :" + loadData);
              let dataSize:number = loadData.length;
              let ret = dataSize > 0;
              expect(ret).assertEqual(true);
              done();
            })
          })
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
            done();
            })
            .catch((err: BusinessError) => {
              console.info(TAG + "getEmbedding promise result:" + err.code);
              expect(err.code).assertEqual(801);
              done();
            })
        }
    })


    /**
     * @tc.name intelligenceApiTest0900
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_0900
     * @tc.desc getTextEmbeddingModel getEmbedding batchTexts interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest0900 start");

      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
        .then(async (data) => {
          console.info(TAG + "get result: " + data);
          await data.loadModel();
          let batchTexts = ['11', '22', '33'];
          data.getEmbedding(batchTexts)
          .then((loadData) => {
            console.info(TAG + "getEmbedding result 0900: " + loadData);
            let dataSize:number = loadData.length;
            let ret = dataSize > 0;
            expect(ret).assertEqual(true);
            done();
            })
        })
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result: " + data);
            expect().assertFail();
            done();
            })
            .catch((err: BusinessError) => {
              console.info(TAG + "getEmbedding promise result: " + err.code);
              expect(err.code).assertEqual(801);
              done();
            })
        }
    })


    /**
     * @tc.name intelligenceApiTest1000
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_1000
     * @tc.desc getImageEmbeddingModel loadModel interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest1000 start");

      if (currentDeviceIsPc) {
        try {
          intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            data.loadModel()
            .then(() => {
              console.info(TAG + "loadModel result 1000 :");
              data.releaseModel();
              done();
            })
          })
        } catch(err){
          console.info(TAG + "intelligenceApiTest1000 is fail:");
          expect().assertFail();
          done();
        }
      } else {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            expect().assertFail();
            done();
          })
          .catch((err:BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest1100
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_1100
     * @tc.desc getImageEmbeddingModel(imageConfig) releaseModel interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest1100 start");

      if (currentDeviceIsPc) {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            data.releaseModel()
            .then(() => {
              console.info(TAG + "releaseModel result 1100 :");
              expect().assertFail();
              done();
            })
            .catch((err:BusinessError) => {
              console.info(TAG + "getEmbedding result" + err.code);
              expect(err.code).assertEqual(31300000);
              done();
            })
          })
      } else {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            expect().assertFail();
            done();
          })
          .catch((err:BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest1200
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_1200
     * @tc.desc getImageEmbeddingModel(imageConfig) getEmbedding test interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest1200 start");

      if (currentDeviceIsPc) {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then(async (data) => {
            console.info(TAG + "get result :" + data);
            await data.loadModel();
            data.getEmbedding('111.jpg')
            .then((loadData) => {
              console.info(TAG + "getEmbedding result 1200 :" + loadData);
              expect().assertFail();
              done();
            })
            .catch((err:BusinessError) => {
              console.error("Failed to get Embedding and code is " + err.code);
              expect(err.code).assertEqual(31300000);
              done();
              })
          })
      } else {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            expect().assertFail();
            done();
          })
          .catch((err:BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
      
    })
    

    /**
     * @tc.name intelligenceApiTest2600
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2600
     * @tc.desc getImageEmbeddingModel invalue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest2600 start");

      if (currentDeviceIsPc) {
        try {
          await intelligence.getImageEmbeddingModel(undefined);
          console.info(TAG + "getImageEmbeddingModel success :" );
          expect().assertFail();
          done();
        }
        catch (err) {
          console.info(TAG + "get promise result" + err.code);
          expect(err.code).assertEqual(401);
          done();
        }
      } else {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest2700
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2700
     * @tc.desc getImageEmbeddingModel invalue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest2700 start");
      if (currentDeviceIsPc) {
        try {
          await intelligence.getTextEmbeddingModel(undefined);
          console.info(TAG + "getTextEmbeddingModel success :");
          expect().assertFail();
          done();
        } catch(err) {
              console.info(TAG + "getTextEmbeddingModel fail" + err.code);
              expect(err.code).assertEqual(401);
              done();
            }
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
      console.info(TAG + "intelligenceApiTest2700 end");
    })


    /**
     * @tc.name intelligenceApiTest2800
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2800
     * @tc.desc getTextEmbeddingModel invalue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */


     it("intelligenceApiTest2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest2800 start")
      let text =
        "日常生活中，我们对接触到的事物，会产生一个不假思索地看法，或者说直觉性的认知.百科全书里这样解释道“ 认知包括感觉、知觉、记忆、思维、想象和语言等。";
      let config: intelligence.SplitConfig = {
        size: 50,
        overlapRatio: 2
      };
      if (currentDeviceIsPc) {
        try {
          await intelligence.splitText(text, config)
            .then(() =>{
              expect().assertFail();
              done();
            })
            .catch((err:BusinessError) =>{
              console.info(TAG + 'splitText is fail' +err.message + err.code);
              expect(err.code).assertEqual(31300000);
              done();
            })
        } catch (err) {
          console.info(TAG + 'splitText is fail' +err.message + err.code);
          expect(err.code).assertEqual(401);
          done();
        }
      } else {
        await intelligence.splitText(text, config)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result:" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest2900
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_2800
     * @tc.desc getImageEmbeddingModel getEmbedding  is invalue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest2900 start");
      if (currentDeviceIsPc) {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then(async (data) => {
            console.info(TAG + "get result :" + data);
            await data.loadModel();
            try {
              data.getEmbedding(undefined)
              console.info(TAG + "getEmbedding is success 2900 :");
                  expect().assertFail();
                  done();
                } catch(err){
                  console.error("Failed to get Embedding and code is " + err.code);
                  expect(err.code).assertEqual(401);
                  done();
            }
          })
      } else {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest3000
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_3000
     * @tc.desc getImageEmbeddingModel getEmbedding batchTexts is invalue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest3000 start")
      let text =
        "日常生活中，我们对接触到的事物，会产生一个不假思索地看法，或者说直觉性的认知.百科全书里这样解释道“ 认知包括感觉、知觉、记忆、思维、想象和语言等。";
      let config: intelligence.SplitConfig = {
        size: 50,
        overlapRatio: 50
      };
      if (currentDeviceIsPc) {
        try {
          await intelligence.splitText(text, config)
            .then(() =>{
              expect().assertFail();
              done();
            })
            .catch((err:BusinessError) =>{
              console.info(TAG + 'splitText is fail' +err.message + err.code);
              expect(err.code).assertEqual(31300000);
              done();
            })
        } catch (err) {
          console.info(TAG + 'splitText is fail' +err.message + err.code);
          expect(err.code).assertEqual(401);
          done();
        }
      } else {
        await intelligence.splitText(text, config)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get promise result:" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })
	
	
	/**
     * @tc.name intelligenceApiTest3100
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_3100
     * @tc.desc getTextEmbeddingModel loadModel interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest3100 start");
      if (currentDeviceIsPc) {
        try {
          intelligence.getTextEmbeddingModel(textConfig)
            .then((data) => {
              console.info(TAG + "get result:" + data);
              data.loadModel()
                .then(() => {
                  console.info(TAG + "loadModel success result 3100:" );
                  data.releaseModel()
                  done();
                })
            })

        } catch(err){
          console.info(TAG + "intelligenceApiTest3100 is fail:" );
          expect().assertFail();
          done();
        }
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            data.loadModel()
              .then(() =>{
                console.info(TAG + "loadModel success");
                done();
              })
              .catch((err:BusinessError) =>{
                console.info(TAG + "loadModel" + err.code);
                expect(err.code).assertEqual(801);
              })
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest3200
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_3200
     * @tc.desc getTextEmbeddingModel releaseModel abnormal interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiTest3200 start");
      if (currentDeviceIsPc) {
        try {
          intelligence.getTextEmbeddingModel(textConfig)
            .then((data) => {
              console.info(TAG + "get result:" + data);
              data.loadModel()
                .then(() => {
                  console.info(TAG + "loadModel success result 3200:" );
                  data.releaseModel()
                  done();
                })
            })

        } catch(err){
          console.info(TAG + "intelligenceApiTest3200 is fail:" );
          expect().assertFail();
          done();
        }
      } else {
        intelligence.getTextEmbeddingModel(textConfig)
          .then((data) => {
            console.info(TAG + "get result:" + data);
            data.loadModel()
              .then(() =>{
                console.info(TAG + "loadModel success");
                data.releaseModel()
                  .then(() =>{
                    console.info(TAG + "releaseModel success");
                    done();
                  }).catch((err:BusinessError) =>{
                  console.info(TAG + "releaseModel result" + err.code);
                    expect(err.code).assertEqual(801);
                    done();
                })
                done();
              })
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.info(TAG + "get result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest3300
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_3300
     * @tc.desc getImageEmbeddingModel releaseModel abnormal interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("intelligenceApiTest3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest3300 start");

      if (currentDeviceIsPc) {
        try {
          intelligence.getImageEmbeddingModel(imageConfig)
            .then((data) => {
              console.info(TAG + "get result :" + data);
              data.loadModel()
                .then(() => {
                  console.info(TAG + "loadModel result 3300 :");
                  data.releaseModel();
                  done();
                })
            })
        } catch(err){
          console.info(TAG + "intelligenceApiTest3300 is fail:");
          expect().assertFail();
          done();
        }
      } else {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            data.loadModel()
              .then(() => {
                console.info(TAG + "loadModel result 3300 :");
                data.releaseModel()
                  .then(() =>{
                    console.info(TAG + "releaseModel result success :");
                    expect().assertFail();
                    done();
                  })
                  .catch((err:BusinessError) =>{
                    console.info(TAG + "get promise result" + err.code);
                    expect(err.code).assertEqual(801);
                    done();
                  })
                done();
              })
            expect().assertFail();
            done();
          })
          .catch((err:BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })


    /**
     * @tc.name intelligenceApiTest3400
     * @tc.number SUB_DistributedData_Intelligence_SDK_intelligenceApiTest_3400
     * @tc.desc getImageEmbeddingModel releaseModel abnormal interface test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("intelligenceApiTest3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiTest3400 start");

      if (currentDeviceIsPc) {
        try {
          intelligence.getImageEmbeddingModel(imageConfig)
            .then((data) => {
              console.info(TAG + "get result :" + data);
              data.loadModel()
                .then(() => {
                  console.info(TAG + "loadModel result success :");
                  data.releaseModel();
                  done();
                })
            })
        } catch(err){
          console.info(TAG + "intelligenceApiTest3300 is fail:");
          expect().assertFail();
          done();
        }
      } else {
        intelligence.getImageEmbeddingModel(imageConfig)
          .then((data) => {
            console.info(TAG + "get result :" + data);
            data.loadModel()
              .then(() => {
                console.info(TAG + "loadModel result 3300 :");
                expect().assertFail();
                done();
              })
              .catch((err:BusinessError) =>{
                console.info(TAG + "loadModel result" + err.code);
                expect(err.code).assertEqual(801);
                done();
              })
            expect().assertFail();
            done();
          })
          .catch((err:BusinessError) => {
            console.info(TAG + "get promise result" + err.code);
            expect(err.code).assertEqual(801);
            done();
          })
      }
    })
	
  })
}



