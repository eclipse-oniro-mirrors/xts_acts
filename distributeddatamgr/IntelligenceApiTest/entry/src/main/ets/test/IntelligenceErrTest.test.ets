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

let textConfig:intelligence.ModelConfig  = {
  version:intelligence.ModelVersion.BASIC_MODEL,
  isNpuAvailable:true,
  cachePath:"test"
}

let imageConfig:intelligence.ModelConfig = {
  version:intelligence.ModelVersion.BASIC_MODEL,
  isNpuAvailable:false,
  cachePath:"image"
}
let imageConfig:intelligence.ModelConfig = {
  version:intelligence.ModelVersion.BASIC_MODEL,
  isNpuAvailable:true,
  cachePath:"image"
}


export default function intelligenceErrTest() {
  describe('intelligenceErrTest', () => {
    let currentDeviceIsPc = false;
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


    /**
     * @tc.name   intelligenceApiErrTest0100
     * @tc.number SUB_DistributedData_Intelligence_SDK_Promise_Err_Test_0100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("intelligenceApiErrTest0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiErrTest0100 start");
      if (currentDeviceIsPc) {
        try {
          await intelligence.getTextEmbeddingModel(null);
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
      console.info(TAG + "intelligenceApiErrTest0100 end");
    })

    /**
     * @tc.name   intelligenceApiErrTest0200
     * @tc.number SUB_DistributedData_Intelligence_SDK_Promise_Err_Test_0200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("intelligenceApiErrTest0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiErrTest0200 start");
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
      console.info(TAG + "intelligenceApiErrTest0200 end");
    })


    /**
     * @tc.name   intelligenceApiErrTest0300
     * @tc.number SUB_DistributedData_Intelligence_SDK_Promise_Err_Test_0300
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("intelligenceApiErrTest0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiErrTest0300 start");
      if (currentDeviceIsPc) {
        try {
          await intelligence.getImageEmbeddingModel(undefined);
          console.info(TAG + "getImageEmbeddingModel success :");
          expect().assertFail();
          done();
        } catch(err) {
          console.info(TAG + "getImageEmbeddingModel fail" + err.code);
          expect(err.code).assertEqual(401);
          done();
        }
      } else {
        intelligence.getImageEmbeddingModel(textConfig)
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
      console.info(TAG + "intelligenceApiErrTest0300 end");
    })


    /**
     * @tc.name   intelligenceApiErrTest0400
     * @tc.number SUB_DistributedData_Intelligence_SDK_Promise_Err_Test_0400
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("intelligenceApiErrTest0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + "intelligenceApiErrTest0400 start");
      if (currentDeviceIsPc) {
        try {
          await intelligence.getImageEmbeddingModel(null);
          console.info(TAG + "getImageEmbeddingModel success :");
          expect().assertFail();
          done();
        } catch(err) {
          console.info(TAG + "getImageEmbeddingModel fail" + err.code);
          expect(err.code).assertEqual(401);
          done();
        }
      } else {
        intelligence.getImageEmbeddingModel(textConfig)
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
      console.info(TAG + "intelligenceApiErrTest0400 end");
    })

    /**
     * @tc.name   intelligenceApiErrTest0500
     * @tc.number SUB_DistributedData_Intelligence_SDK_Promise_Err_Test_0500
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("intelligenceApiErrTest0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiErrTest0500 start");

      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
          .then(async (data) => {
            console.info(TAG + "get result:" + data);
            await data.loadModel();
            let text = 'text';
            data.getEmbedding(undefined)
              .then((loadData) => {
                expect().assertFail();
                done();
              })
              .catch((err:BusinessError) =>{
                console.info(TAG + "getEmbedding" + err.code);
                expect(err.code).assertEqual(401);
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
     * @tc.name   intelligenceApiErrTest0600
     * @tc.number SUB_DistributedData_Intelligence_SDK_Promise_Err_Test_0600
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("intelligenceApiErrTest0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiErrTest0500 start");

      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
          .then(async (data) => {
            console.info(TAG + "get result:" + data);
            await data.loadModel();
            let text = 'text';
            data.getEmbedding([])
              .then((loadData) => {
                expect().assertFail();
                done();
              })
              .catch((err:BusinessError) =>{
                console.info(TAG + "getEmbedding" + err.code);
                expect(err.code).assertEqual(401);
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
     * @tc.name   intelligenceApiErrTest0700
     * @tc.number SUB_DistributedData_Intelligence_SDK_Promise_Err_Test_0700
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("intelligenceApiErrTest0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiErrTest0700 start");

      if (currentDeviceIsPc) {
        intelligence.getTextEmbeddingModel(textConfig)
          .then(async (data) => {
            console.info(TAG + "get result:" + data);
            await data.loadModel();
            let text = 'text';
            data.getEmbedding("")
              .then((loadData) => {
                expect().assertFail();
                done();
              })
              .catch((err:BusinessError) =>{
                console.info(TAG + "getEmbedding" + err.code);
                expect(err.code).assertEqual(401);
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
     * @tc.name   intelligenceApiErrTest0800
     * @tc.number SUB_DistributedData_Intelligence_SDK_Promise_Err_Test_0800
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("intelligenceApiErrTest0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiErrTest0800 start")
      let text =
        "日常生活中，我们对接触到的事物，会产生一个不假思索地看法，或者说直觉性的认知.百科全书里这样解释道“ 认知包括感觉、知觉、记忆、思维、想象和语言等。";
      let config: intelligence.SplitConfig = {
        size: 50,
        overlapRatio: 2
      };
      if (currentDeviceIsPc) {
        try {
          await intelligence.splitText(null, config)
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
     * @tc.name   intelligenceApiErrTest0900
     * @tc.number SUB_DistributedData_Intelligence_SDK_Promise_Err_Test_0900
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("intelligenceApiErrTest0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiErrTest0900 start")
      let text =
        "日常生活中，我们对接触到的事物，会产生一个不假思索地看法，或者说直觉性的认知.百科全书里这样解释道“ 认知包括感觉、知觉、记忆、思维、想象和语言等。";
      let config: intelligence.SplitConfig = {
        size: 50,
        overlapRatio: 2
      };
      if (currentDeviceIsPc) {
        try {
          await intelligence.splitText(undefined, config)
            .then(() =>{
              expect().assertFail();
              done();
            })
            .catch((err:BusinessError) =>{
              console.info(TAG + 'splitText is fail' +err.message + err.code);
              expect(err.code).assertEqual(401);
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
     * @tc.name   intelligenceApiErrTest1000
     * @tc.number SUB_DistributedData_Intelligence_SDK_Promise_Err_Test_1000
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("intelligenceApiErrTest1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiErrTest1000 start")
      let text =
        "日常生活中，我们对接触到的事物，会产生一个不假思索地看法，或者说直觉性的认知.百科全书里这样解释道“ 认知包括感觉、知觉、记忆、思维、想象和语言等。";
      let config: intelligence.SplitConfig = {
        size: 50,
        overlapRatio: 2
      };
      if (currentDeviceIsPc) {
        try {
          await intelligence.splitText("", config)
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
     * @tc.name   intelligenceApiErrTest1100
     * @tc.number SUB_DistributedData_Intelligence_SDK_Promise_Err_Test_1100
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("intelligenceApiErrTest1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiErrTest1100 start")
      let text =
        "日常生活中，我们对接触到的事物，会产生一个不假思索地看法，或者说直觉性的认知.百科全书里这样解释道“ 认知包括感觉、知觉、记忆、思维、想象和语言等。";
      let config: intelligence.SplitConfig = {
        size: 50,
        overlapRatio: 2
      };
      if (currentDeviceIsPc) {
        try {
          await intelligence.splitText(text, null)
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
     * @tc.name   intelligenceApiErrTest1200
     * @tc.number SUB_DistributedData_Intelligence_SDK_Promise_Err_Test_1200
     * @tc.desc   interface test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("intelligenceApiErrTest1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + "intelligenceApiErrTest1200 start")
      let text =
        "日常生活中，我们对接触到的事物，会产生一个不假思索地看法，或者说直觉性的认知.百科全书里这样解释道“ 认知包括感觉、知觉、记忆、思维、想象和语言等。";
      let config: intelligence.SplitConfig = {
        size: 50,
        overlapRatio: 2
      };
      if (currentDeviceIsPc) {
        try {
          await intelligence.splitText(text, undefined)
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
  })
}