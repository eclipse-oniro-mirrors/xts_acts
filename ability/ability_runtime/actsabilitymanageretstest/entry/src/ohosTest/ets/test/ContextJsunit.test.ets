/**
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import featureAbility from '@ohos.ability.featureAbility';
import { describe, beforeEach, afterEach, beforeAll, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from './Utils';
import backgroundTaskManager from '@ohos.backgroundTaskManager';

export default function ContextJsunit() {
  describe('faContextTest', () => {
    let TAG1 = "SUB_AA_OpenHarmony == faContextTest: ";
    let id: number;
    beforeAll(async (done: Function) => {
      console.log(TAG1 + "beforeAll called");
      let myReason = 'test FaShowOnLockTest';
      let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
        console.log(TAG1 + "Request suspension delay will time out.");
      })
      id = delayInfo.requestId;
      console.log(TAG1 + "requestId is : " + id);
      console.log(TAG1 + "beforeAll end");
      done();
    })

    afterAll(async (done: Function) => {
      console.log(TAG1 + "afterAll called");
      backgroundTaskManager.cancelSuspendDelay(id);
      console.log(TAG1 + "afterAll end");
      done();
    })
    beforeEach(async (done: Function) => {
      console.info("context before each called");
      done();
    })

    afterEach(async () => {
      console.info("context after each called");
    })

    /**
     * @tc.name   context_getCacheDir_test_0100
     * @tc.number context_getCacheDir_test_0100
     * @tc.desc   Check the return value of the interface (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("context_getCacheDir_test_0100", Level.LEVEL0, async (done: Function) => {
      console.log("------------------start context_getCacheDir_test_0100-------------------");
      try {
        let timeOldStamp = Utils.getNowTime();
        let context = featureAbility.getContext();
        context.getCacheDir()
          .then((data) => {
            let timeNewStamp = Utils.getNowTime();
            Utils.getDurationTime('context_getCacheDir_test_0100', timeOldStamp, timeNewStamp);
            console.log("context_getCacheDir_test_0100: CacheDir is " + data);
          })
        let data1: string = await context.getCacheDir();
        expect(typeof (data1)).assertEqual("string");
        expect(data1).assertEqual("/data/storage/el2/base/haps/entry/cache");
        done();
        console.log("------------------end context_getCacheDir_test_0100-------------------");
      } catch (error) {
        console.log("logMessage context_getCacheDir_test_0100: error = " + error);
        expect(error).assertEqual("/data/storage/el2/base/haps/entry/cache");
      }
    })

    /**
     * @tc.name   context_getCacheDir_test_0200
     * @tc.number context_getCacheDir_test_0200
     * @tc.desc   Check the return value of the interface (by AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("context_getCacheDir_test_0200", Level.LEVEL0, async (done: Function) => {
      console.log("------------------start context_getCacheDir_test_0200-------------------");
      try {
        let timeOldStamp = Utils.getNowTime();
        let context = featureAbility.getContext();
        context.getCacheDir((err, data) => {
          let timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('context_getCacheDir_test_0200', timeOldStamp, timeNewStamp);
          console.log("context_getCacheDir_test_0200: getCacheDir successful, result = " + data);
        })
        let data1: string = await context.getCacheDir();
        expect(typeof (data1)).assertEqual("string");
        expect(data1).assertEqual("/data/storage/el2/base/haps/entry/cache");
        done();
        console.log("------------------end context_getCacheDir_test_0200-------------------");
      } catch (error) {
        console.log("logMessage context_getCacheDir_test_0200: error = " + error);
        expect(error).assertEqual("/data/storage/el2/base/haps/entry/cache");
      }
    })

    /**
     * @tc.name   context_getFilesDir_test_0100
     * @tc.number context_getFilesDir_test_0100
     * @tc.desc   Check the return value of the interface (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("context_getFilesDir_test_0100", Level.LEVEL0, async (done: Function) => {
      console.log("------------------start context_getFilesDir_test_0100-------------------");
      try {
        let timeOldStamp = await Utils.getNowTime();
        let context = await featureAbility.getContext();
        context.getFilesDir()
          .then((data) => {
            let timeNewStamp = Utils.getNowTime();
            Utils.getDurationTime('context_getFilesDir_test_0100', timeOldStamp, timeNewStamp);
            console.log("context_getFilesDir_test_0100：FilesDir is " + data);
          })
        let data1: string = await context.getFilesDir();
        expect(typeof (data1)).assertEqual("string");
        expect(data1).assertEqual("/data/storage/el2/base/haps/entry/files");
        done();
        console.log("------------------end context_getFilesDir_test_0100-------------------");
      } catch (error) {
        console.log("logMessage context_getFilesDir_test_0100: error = " + error);
        expect(error).assertEqual("/data/storage/el2/base/haps/entry/files");
      }
    })

    /**
     * @tc.name   context_getFilesDir_test_0200
     * @tc.number context_getFilesDir_test_0200
     * @tc.desc   Check the return value of the interface (by AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("context_getFilesDir_test_0200", Level.LEVEL0, async (done: Function) => {
      console.log("------------------start context_getFilesDir_test_0200-------------------");
      try {
        let timeOldStamp = await Utils.getNowTime();
        let context = await featureAbility.getContext();
        context.getFilesDir((err, data) => {
          let timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('context_getFilesDir_test_0200', timeOldStamp, timeNewStamp);
          console.log("context_getFilesDir_test_0200: getFilesDir successful, result = " + data);
        })
        let data1: string = await context.getFilesDir();
        expect(typeof (data1)).assertEqual("string");
        expect(data1).assertEqual("/data/storage/el2/base/haps/entry/files");
        done();
        console.log("------------------end context_getFilesDir_test_0200-------------------");
      } catch (error) {
        console.log("logMessage context_getFilesDir_test_0200: error = " + error);
        expect(error).assertEqual("/data/storage/el2/base/haps/entry/files");
      }
    })


    /**
     * @tc.name   context_getOrCreateDistributedDir_0100
     * @tc.number context_getOrCreateDistributedDir_test_0100
     * @tc.desc   Check the return value of the interface (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("context_getOrCreateDistributedDir_0100", Level.LEVEL0, async (done: Function) => {
      console.log("------------------start context_getOrCreateDistributedDir_0100-------------------");
      try {
        let timeOldStamp = Utils.getNowTime();
        let context = featureAbility.getContext();
        context.getOrCreateDistributedDir().then((data) => {
          let timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('context_getOrCreateDistributedDir_0100', timeOldStamp, timeNewStamp);
          console.log("context_getOrCreateDistributedDir_0100: DistributedDir is " + data);
        })
        let data1: string = await context.getOrCreateDistributedDir();
        expect(typeof (data1)).assertEqual("string");
        expect(data1).assertEqual("/data/storage/el2/distributedfiles");
        done();
        console.log("------------------end context_getOrCreateDistributedDir_0100-------------------");
      } catch (error) {
        console.log("logMessage context_getOrCreateDistributedDir_0100: error = " + error);
        expect(error).assertEqual("/data/storage/el2/distributedfiles/entry");
      }
    })

    /**
     * @tc.name   context_getOrCreateDistributedDir_0200
     * @tc.number context_getOrCreateDistributedDir_0200
     * @tc.desc   Check the return value of the interface (by AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("context_getOrCreateDistributedDir_0200", Level.LEVEL0, async (done: Function) => {
      console.log("------------------start context_getOrCreateDistributedDir_0200-------------------");
      try {
        let timeOldStamp = await Utils.getNowTime();
        let context = await featureAbility.getContext();
        context.getOrCreateDistributedDir((err, data) => {
          let timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('context_getOrCreateDistributedDir_0200', timeOldStamp, timeNewStamp);
          console.log("context_getOrCreateDistributedDir_0200: getOrCreateDistributedDir successful, result = " + data);
        })
        let data1: string = await context.getOrCreateDistributedDir();
        expect(typeof (data1)).assertEqual("string");
        expect(data1).assertEqual("/data/storage/el2/distributedfiles");
        done();
        console.log("------------------end context_getOrCreateDistributedDir_0200-------------------");
      } catch (error) {
        console.log("logMessage context_getOrCreateDistributedDir_0200: error = " + error);
        expect(error).assertEqual("/data/storage/el2/distributedfiles/entry");
      }
    })

    /**
     * @tc.name   context_getAppType_0100
     * @tc.number context_getAppType_0100
     * @tc.desc   Check the return value of the interface (by promise)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("context_getAppType_0100", Level.LEVEL0, async (done: Function) => {
      console.log("------------------start context_getAppType_0100-------------------");
      try {
        let timeOldStamp = Utils.getNowTime();
        let context = featureAbility.getContext();
        context.getAppType()
          .then((data) => {
            let timeNewStamp = Utils.getNowTime();
            Utils.getDurationTime('context_getAppType_0100_0100', timeOldStamp, timeNewStamp);
            console.log("context_getAppType_0100: AppType is " + data);
          })
        let data1: string = await context.getAppType();
        expect(typeof (data1)).assertEqual("string");
        expect(data1).assertEqual("system");
        done();
        console.log("------------------end context_getAppType_0100-------------------");
      } catch (error) {
        console.log("logMessage context_getAppType_0100: error = " + error);
        expect(error).assertEqual("system");
      }
    })

    /**
     * @tc.name   context_getAppType_0200
     * @tc.number context_getAppType_0200
     * @tc.desc   Check the return value of the interface (by AsyncCallback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("context_getAppType_0200", Level.LEVEL0, async (done: Function) => {
      console.log("------------------start context_getAppType_0200-------------------");
      try {
        let timeOldStamp = await Utils.getNowTime();
        let context = await featureAbility.getContext();
        context.getAppType((err, data) => {
          let timeNewStamp = Utils.getNowTime();
          Utils.getDurationTime('context_getAppType_0200_0100', timeOldStamp, timeNewStamp);
          console.log("context_getAppType_0200: getAppType successful, result = " + data);
        })
        let data1: string = await context.getAppType();
        expect(typeof (data1)).assertEqual("string");
        expect(data1).assertEqual("system");
        done();
        console.log("------------------end context_getAppType_0200-------------------");
      } catch (error) {
        console.log("logMessage context_getAppType_0200: error = " + error);
        expect(error).assertEqual("system");
      }
    })
  })
}
