/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import { hidebug } from '@kit.PerformanceAnalysisKit';

export default function HidebuggwpasanTest() {
  describe('HidebuggwpasanTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0100
     * @tc.name testHidebuggwpasan_0100
     * @tc.desc 传入3个参数 alwaysEnabled: true 时间改为 10天
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testHidebuggwpasan_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testHidebuggwpasan_0100 start");
      let options1: hidebug.GwpAsanOptions = {
        alwaysEnabled: true,
        sampleRate: 5000,
        maxSimutaneousAllocations: 5000,
      };
      try {
        console.info("testHidebuggwpasan_0100 start 01");
        hidebug.enableGwpAsanGrayscale(options1, 10);
        console.info("testHidebuggwpasan_0100 start 02");
        let state = hidebug.getGwpAsanGrayscaleState();
        console.log('testHidebuggwpasan_0100: ' + state);
        expect(state == 10).assertTrue();
        console.info("testHidebuggwpasan_0100 start 03");
        hidebug.disableGwpAsanGrayscale();
        console.info("testHidebuggwpasan_0100 start 04");
        done();
      } catch (err) {
        console.info(`testHidebuggwpasan_0100 > error code: ${err.code}, error msg: ${err.message}`);
        expect().assertFail();
        done();
      }
      console.info("testHidebuggwpasan_0100 end");
    })

        /**
     * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0200
     * @tc.name testHidebuggwpasan_0200
     * @tc.desc 传入3个参数,alwaysEnabled: false,时间改为 10天
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHidebuggwpasan_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("testHidebuggwpasan_0200 start");
      let options2: hidebug.GwpAsanOptions = {
        alwaysEnabled: false,
        sampleRate: 5000,
        maxSimutaneousAllocations: 5000,
      };
      try {
        console.info("testHidebuggwpasan_0200 start 01");
        hidebug.enableGwpAsanGrayscale(options2, 3);
        console.info("testHidebuggwpasan_0200 start 02");
        let state = hidebug.getGwpAsanGrayscaleState();
        console.log('testHidebuggwpasan_0200: ' + state);
        expect(state == 3).assertTrue();
        console.info("testHidebuggwpasan_0200 start 03");
        hidebug.disableGwpAsanGrayscale();
        console.info("testHidebuggwpasan_0200 start 04");
        done();
      } catch (err) {
        console.info(`testHidebuggwpasan_0200 > error code: ${err.code}, error msg: ${err.message}`);
        expect().assertFail();
        done();
      }
      console.info("testHidebuggwpasan_0200 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0300
     * @tc.name testHidebuggwpasan_0300
     * @tc.desc 传入3个参数,alwaysEnabled: true,时间为undefined,抛出异常401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHidebuggwpasan_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("testHidebuggwpasan_0300 start");
      let options3: hidebug.GwpAsanOptions = {
        alwaysEnabled: true,
      };
      try {
        console.info("testHidebuggwpasan_0300 start 01");
        hidebug.enableGwpAsanGrayscale(options3,undefined);
        console.info("testHidebuggwpasan_0300 start 02");
        expect().assertFail()
        done();
      } catch (err) {
        console.info(`testHidebuggwpasan_0300 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("testHidebuggwpasan_0300 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0400
     * @tc.name testHidebuggwpasan_0400
     * @tc.desc 全部为默认值参数,alwaysEnabled为空值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHidebuggwpasan_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("testHidebuggwpasan_0400 start");
      try {
        console.info("testHidebuggwpasan_0400 start 01");
        hidebug.enableGwpAsanGrayscale();
        console.info("testHidebuggwpasan_0400 start 02");
        let state = hidebug.getGwpAsanGrayscaleState();
        console.log('testHidebuggwpasan_0400: ' + state);
        expect(state == 7).assertTrue();
        console.info("testHidebuggwpasan_0400 start 03");
        hidebug.disableGwpAsanGrayscale();
        console.info("testHidebuggwpasan_0400 start 04");
        done();
      } catch (err) {
        console.info(`testHidebuggwpasan_0400 > error code: ${err.code}, error msg: ${err.message}`);
        expect().assertFail();
        done();
      }
      console.info("testHidebuggwpasan_0400 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0500
     * @tc.name testHidebuggwpasan_0500
     * @tc.desc 默认值为undefined,抛出错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHidebuggwpasan_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("testHidebuggwpasan_0500 start");
      try {
        console.info("testHidebuggwpasan_0500 start 01");
        hidebug.enableGwpAsanGrayscale(undefined);
        expect().assertFail()
        done();
      } catch (err) {
        console.info(`testHidebuggwpasan_0500 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("testHidebuggwpasan_0500 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0600
     * @tc.name testHidebuggwpasan_0600
     * @tc.desc 全部为默认值参数,options传入一个参数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHidebuggwpasan_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("testHidebuggwpasan_0600 start");
      let options6: hidebug.GwpAsanOptions = {
        alwaysEnabled: true,
      };
      try {
        console.info("testHidebuggwpasan_0600 start 01");
        hidebug.enableGwpAsanGrayscale(options6);
        console.info("testHidebuggwpasan_0600 start 02");
        hidebug.disableGwpAsanGrayscale();
        done();
      } catch (err) {
        console.info(`testHidebuggwpasan_0600 > error code: ${err.code}, error msg: ${err.message}`);
        expect().assertFalse();
        done();
      }
      console.info("testHidebuggwpasan_0600 end");
    })


    /**
     * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0700
     * @tc.name testHidebuggwpasan_0700
     * @tc.desc 全部为默认值参数,options传入两个参数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHidebuggwpasan_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("testHidebuggwpasan_0700 start");
      let options7: hidebug.GwpAsanOptions = {
        alwaysEnabled: true,
        sampleRate: 1200
      };
      try {
        console.info("testHidebuggwpasan_0700 start 01");
        hidebug.enableGwpAsanGrayscale(options7);
        console.info("testHidebuggwpasan_0700 start 02");
        hidebug.disableGwpAsanGrayscale();
        done();
      } catch (err) {
        console.info(`testHidebuggwpasan_0700 > error code: ${err.code}, error msg: ${err.message}`);
        expect().assertFalse();
        done();
      }
      console.info("testHidebuggwpasan_0700 end");
    })


    /**
     * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0800
     * @tc.name testHidebuggwpasan_0800
     * @tc.desc 全部为默认值参数,options传入参数sampleRate为0,抛出错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHidebuggwpasan_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("testHidebuggwpasan_0800 start");
      let options8: hidebug.GwpAsanOptions = {
        alwaysEnabled: true,
        sampleRate: 0,
      };
      try {
        console.info("testHidebuggwpasan_0800 start 01");
        hidebug.enableGwpAsanGrayscale(options8);
        expect().assertFalse()
        done();
      } catch (err) {
        console.info(`testHidebuggwpasan_0800 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("testHidebuggwpasan_0800 end");
    })


    /**
     * @tc.number SUB_DFX_DFR_Third_Asan_Interface_0900
     * @tc.name testHidebuggwpasan_0900
     * @tc.desc 全部为默认值参数,options传入参数maxSimutaneousAllocations为0,抛出错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHidebuggwpasan_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("testHidebuggwpasan_0900 start");
      let options9: hidebug.GwpAsanOptions = {
        alwaysEnabled: true,
        sampleRate: 5000,
        maxSimutaneousAllocations: 0,
      };
      try {
        console.info("testHidebuggwpasan_0900 start 01");
        hidebug.enableGwpAsanGrayscale(options9);
        expect().assertFalse()
        done();
      } catch (err) {
        console.info(`testHidebuggwpasan_0900 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("testHidebuggwpasan_0900 end");
    })

    /**
     * @tc.number SUB_DFX_DFR_Third_Asan_Interface_1000
     * @tc.name testHidebuggwpasan_1000
     * @tc.desc 全部为默认值参数,传入参数天数为0,抛出错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHidebuggwpasan_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info("testHidebuggwpasan_0900 start");
      let options10: hidebug.GwpAsanOptions = {
        alwaysEnabled: true,
      };
      try {
        console.info("testHidebuggwpasan_0900 start 01");
        hidebug.enableGwpAsanGrayscale(options10,0);
        expect().assertFalse()
        done();
      } catch (err) {
        console.info(`testHidebuggwpasan_0900 > error code: ${err.code}, error msg: ${err.message}`);
        expect(err.code == 401).assertTrue();
        done();
      }
      console.info("testHidebuggwpasan_0900 end");
    })
    

    
  })
}
