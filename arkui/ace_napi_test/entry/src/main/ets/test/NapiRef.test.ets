/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import hilog from '@ohos.hilog'
import napitestex from 'libnapitestex.so'
import worker, { MessageEvents } from '@ohos.worker';

const DOMAIN = 0x0000;
declare class ArkTools {
  static forceFullGC():void;
}

async function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function napiRefTest() {
  describe('napiRefTest', () => {
    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[napiRefTest] after each called')
    });
    
    /**
     * @tc.name   napiCreateStrongRefCheckArg
     * @tc.number SUB_NAPI_STRONGREF_0100
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiCreateStrongRefCheckArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiCreateStrongRefCheckArg";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.createStrongRefCheckArg();
        console.info('napiCreateStrongRefCheckArg value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiCreateStrongRefSingle
     * @tc.number SUB_NAPI_STRONGREF_0200
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiCreateStrongRefSingle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiCreateStrongRefSingle";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.createStrongRefSingle(ArkTools.forceFullGC);
        console.info('napiCreateStrongRefSingle value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiCreateStrongRef2Ref
     * @tc.number SUB_NAPI_STRONGREF_0300
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiCreateStrongRef2Ref', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiCreateStrongRef2Ref";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.createStrongRef2Ref(ArkTools.forceFullGC);
        console.info('napiCreateStrongRef2Ref value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiCreateStrongRef2Obj
     * @tc.number SUB_NAPI_STRONGREF_0400
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiCreateStrongRef2Obj', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiCreateStrongRef2Obj";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.createStrongRef2Obj(ArkTools.forceFullGC);
        console.info('napiCreateStrongRef2Obj value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGetStrongRefCheckArg
     * @tc.number SUB_NAPI_STRONGREF_0500
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiGetStrongRefCheckArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiGetStrongRefCheckArg";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.getStrongRefCheckArg();
        console.info('napiGetStrongRefCheckArg value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGetStrongRef
     * @tc.number SUB_NAPI_STRONGREF_0600
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiGetStrongRef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiGetStrongRef";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.getStrongRef();
        console.info('napiGetStrongRef value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiDeleteStrongRefCheckArg
     * @tc.number SUB_NAPI_STRONGREF_0700
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiDeleteStrongRefCheckArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiDeleteStrongRefCheckArg";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.deleteStrongRefCheckArg();
        console.info('napiDeleteStrongRefCheckArg value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiDeleteStrongRef
     * @tc.number SUB_NAPI_STRONGREF_0800
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiDeleteStrongRef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiDeleteStrongRef";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.deleteStrongRef(ArkTools.forceFullGC);
        console.info('napiDeleteStrongRef value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiDeleteStrongRef2Ref
     * @tc.number SUB_NAPI_STRONGREF_0900
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiDeleteStrongRef2Ref', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiDeleteStrongRef2Ref";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.deleteStrongRef2Ref(ArkTools.forceFullGC);
        console.info('napiDeleteStrongRef2Ref value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiDeleteStrongRefDouble
     * @tc.number SUB_NAPI_STRONGREF_1000
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiDeleteStrongRefDouble', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiDeleteStrongRefDouble";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.deleteStrongRefDouble(ArkTools.forceFullGC);
        console.info('napiDeleteStrongRefDouble value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiRepeateCreateDeleteStrongRef
     * @tc.number SUB_NAPI_STRONGREF_1100
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiRepeateCreateDeleteStrongRef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiRepeateCreateDeleteStrongRef";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.repeateCreateDeleteStrongRef();
        console.info('napiRepeateCreateDeleteStrongRef value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiDeleteUndefindAndCreateRef
     * @tc.number SUB_NAPI_STRONGREF_1200
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiDeleteUndefindAndCreateRef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiDeleteUndefindAndCreateRef";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.deleteUndefindAndCreateRef();
        console.info('napiDeleteUndefindAndCreateRef value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiOptStrongRefInErrorEnvTest
     * @tc.number SUB_NAPI_STRONGREF_1300
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiOptStrongRefInErrorEnvTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiOptStrongRefInErrorEnvTest";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.optStrongRefInErrorEnvTest(ArkTools.forceFullGC);
        console.info('napiOptStrongRefInErrorEnvTest value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiOptStrongRefInContextEnvTest
     * @tc.number SUB_NAPI_STRONGREF_1400
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiOptStrongRefInContextEnvTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiOptStrongRefInContextEnvTest";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.optStrongRefInContextEnvTest();
        console.info('napiOptStrongRefInContextEnvTest value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiOptStrongRefInArkRuntimeTest
     * @tc.number SUB_NAPI_STRONGREF_1500
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiOptStrongRefInArkRuntimeTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiOptStrongRefInArkRuntimeTest";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.optStrongRefInArkRuntimeTest();
        console.info('napiOptStrongRefInArkRuntimeTest value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiOptStrongRefStress
     * @tc.number SUB_NAPI_STRONGREF_1600
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiOptStrongRefStress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiOptStrongRefStress";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.optStrongRefStress();
        console.info('napiOptStrongRefStress value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiSameObjMutilStrongRef
     * @tc.number SUB_NAPI_STRONGREF_1700
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiSameObjMutilStrongRef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiSameObjMutilStrongRef";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.sameObjMutilStrongRef(ArkTools.forceFullGC);
        console.info('napiSameObjMutilStrongRef value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiGradualReferenceRelease
     * @tc.number SUB_NAPI_STRONGREF_1800
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiGradualReferenceRelease', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiGradualReferenceRelease";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.gradualReferenceRelease(ArkTools.forceFullGC);
        console.info('napiGradualReferenceRelease value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiStrongRefVariousTypes
     * @tc.number SUB_NAPI_STRONGREF_1900
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiStrongRefVariousTypes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiStrongRefVariousTypes";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.strongRefVariousTypes();
        console.info('napiStrongRefVariousTypes value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiPostDeleteBehavior
     * @tc.number SUB_NAPI_STRONGREF_2000
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiPostDeleteBehavior', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiPostDeleteBehavior";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.postDeleteBehavior();
        console.info('napiPostDeleteBehavior value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiCrossScopeStrongRef
     * @tc.number SUB_NAPI_STRONGREF_2100
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiCrossScopeStrongRef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiCrossScopeStrongRef";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.crossScopeStrongRef();
        console.info('napiCrossScopeStrongRef value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   napiManyStrongReferences
     * @tc.number SUB_NAPI_STRONGREF_2200
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('napiManyStrongReferences', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "napiManyStrongReferences";
      console.info(`${TAG} START`);
      try {
        let value : boolean = napitestex.manyStrongReferences();
        console.info('napiManyStrongReferences value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });    
  });
}
