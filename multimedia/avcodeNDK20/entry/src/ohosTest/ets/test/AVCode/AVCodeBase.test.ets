/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium'
import libavcode from 'libavcode.so'

export default function AVCodeBaseTest() {
  let TAG = '';
  describe('AVCodeBaseTest', () => {

    beforeAll(async () => {
      libavcode.WriteMp4File();
      console.info(TAG + "beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.")
    })

    /**
     * @tc.name   testAVCodeBaseTest00100
     * @tc.number SUB_AVCodeBase_Test_00100
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest00100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        TAG = 'testAVCodeBaseTest00100';
        try {
          console.info(TAG + "===> START");
          let result: number = libavcode.OH_AVCLevelTest1();
          console.info(TAG + "Test ret Result ===> " + result);
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error( "====> " + TAG + " err: " + err);
          done()
        }
    });

    /**
     * @tc.name   testAVCodeBaseTest00200
     * @tc.number SUB_AVCodeBase_Test_00200
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_1b.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest00200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest00200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest2();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest00300
     * @tc.number SUB_AVCodeBase_Test_00300
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest00300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest00300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest3();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest00400
     * @tc.number SUB_AVCodeBase_Test_00400
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest00400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest00400';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest4();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest00500
     * @tc.number SUB_AVCodeBase_Test_00500
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest00500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest00500';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest5();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest00600
     * @tc.number SUB_AVCodeBase_Test_00600
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest00600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest00600';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest6();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest00700
     * @tc.number SUB_AVCodeBase_Test_00700
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest00700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest00700';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest7();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest00800
     * @tc.number SUB_AVCodeBase_Test_00800
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest00800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest00800';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest8();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest00900
     * @tc.number SUB_AVCodeBase_Test_00900
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest00900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest00900';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest9();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest01000
     * @tc.number SUB_AVCodeBase_Test_01000
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest01000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest01000';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest10();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest01100
     * @tc.number SUB_AVCodeBase_Test_01100
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest01100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest01100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest11();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest01200
     * @tc.number SUB_AVCodeBase_Test_01200
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest01200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest01200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest12();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest01300
     * @tc.number SUB_AVCodeBase_Test_01300
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest01300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest01300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest13();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest01400
     * @tc.number SUB_AVCodeBase_Test_01400
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest01400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest01400';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest14();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest01500
     * @tc.number SUB_AVCodeBase_Test_01500
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest01500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest01500';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest15();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest01600
     * @tc.number SUB_AVCodeBase_Test_01600
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest01600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest01600';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest16();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest01700
     * @tc.number SUB_AVCodeBase_Test_01700
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest01700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest01700';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest17();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest01800
     * @tc.number SUB_AVCodeBase_Test_01800
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest01800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest01800';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest18();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest01900
     * @tc.number SUB_AVCodeBase_Test_01900
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest01900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest01900';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest19();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest02000
     * @tc.number SUB_AVCodeBase_Test_02000
     * @tc.desc   testing OH_AVCLevel AVC_LEVEL_62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest02000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest02000';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCLevelTest20();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest02100
     * @tc.number SUB_AVCodeBase_Test_02100
     * @tc.desc   testing OH_HEVCLevel HEVC_LEVEL_1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest02100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest02100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_HEVCLevelTest1();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest02200
     * @tc.number SUB_AVCodeBase_Test_02200
     * @tc.desc   testing OH_HEVCLevel HEVC_LEVEL_2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest02200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest02200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_HEVCLevelTest2();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest02300
     * @tc.number SUB_AVCodeBase_Test_02300
     * @tc.desc   testing OH_HEVCLevel HEVC_LEVEL_21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest02300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest02300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_HEVCLevelTest3();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest02400
     * @tc.number SUB_AVCodeBase_Test_02400
     * @tc.desc   testing OH_HEVCLevel HEVC_LEVEL_3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest02400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest02400';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_HEVCLevelTest4();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest02500
     * @tc.number SUB_AVCodeBase_Test_02500
     * @tc.desc   testing OH_HEVCLevel HEVC_LEVEL_31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest02500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest02050';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_HEVCLevelTest5();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest02600
     * @tc.number SUB_AVCodeBase_Test_02600
     * @tc.desc   testing OH_HEVCLevel HEVC_LEVEL_4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest02600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest02600';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_HEVCLevelTest6();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest02700
     * @tc.number SUB_AVCodeBase_Test_02700
     * @tc.desc   testing OH_HEVCLevel HEVC_LEVEL_41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest02700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest02700';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_HEVCLevelTest7();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest02800
     * @tc.number SUB_AVCodeBase_Test_02800
     * @tc.desc   testing OH_HEVCLevel HEVC_LEVEL_5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest02800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest02800';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_HEVCLevelTest8();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest02900
     * @tc.number SUB_AVCodeBase_Test_02900
     * @tc.desc   testing OH_HEVCLevel HEVC_LEVEL_51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest02900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest02900';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_HEVCLevelTest9();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest03000
     * @tc.number SUB_AVCodeBase_Test_03000
     * @tc.desc   testing OH_HEVCLevel HEVC_LEVEL_52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest03000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest03000';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_HEVCLevelTest10();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest03100
     * @tc.number SUB_AVCodeBase_Test_03100
     * @tc.desc   testing OH_HEVCLevel HEVC_LEVEL_6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest03100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest03100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_HEVCLevelTest11();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest03200
     * @tc.number SUB_AVCodeBase_Test_03200
     * @tc.desc   testing OH_HEVCLevel HEVC_LEVEL_61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest03200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest03200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_HEVCLevelTest12();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest03300
     * @tc.number SUB_AVCodeBase_Test_03300
     * @tc.desc   testing OH_HEVCLevel HEVC_LEVEL_62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest03300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest03300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_HEVCLevelTest13();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest03400
     * @tc.number SUB_AVCodeBase_Test_03400
     * @tc.desc   testing OH_VVCLevel VVC_LEVEL_1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest03400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest03400';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VVCLevelTest1();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest03500
     * @tc.number SUB_AVCodeBase_Test_03500
     * @tc.desc   testing OH_VVCLevel VVC_LEVEL_2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest03500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest03500';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VVCLevelTest2();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });
    /**
     * @tc.name   testAVCodeBaseTest03600
     * @tc.number SUB_AVCodeBase_Test_03600
     * @tc.desc   testing OH_VVCLevel VVC_LEVEL_21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest03600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest03600';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VVCLevelTest3();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });
    /**
     * @tc.name   testAVCodeBaseTest03700
     * @tc.number SUB_AVCodeBase_Test_03700
     * @tc.desc   testing OH_VVCLevel VVC_LEVEL_3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest03700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest03700';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VVCLevelTest4();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });
    /**
     * @tc.name   testAVCodeBaseTest03800
     * @tc.number SUB_AVCodeBase_Test_03800
     * @tc.desc   testing OH_VVCLevel VVC_LEVEL_31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest03800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest03800';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VVCLevelTest5();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest03900
     * @tc.number SUB_AVCodeBase_Test_03900
     * @tc.desc   testing OH_VVCLevel VVC_LEVEL_4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest03900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest03900';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VVCLevelTest6();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest04000
     * @tc.number SUB_AVCodeBase_Test_04000
     * @tc.desc   testing OH_VVCLevel VVC_LEVEL_41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest04000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest04000';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VVCLevelTest7();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest04100
     * @tc.number SUB_AVCodeBase_Test_04100
     * @tc.desc   testing OH_VVCLevel VVC_LEVEL_5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest04100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest04100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VVCLevelTest8();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest04200
     * @tc.number SUB_AVCodeBase_Test_04200
     * @tc.desc   testing OH_VVCLevel VVC_LEVEL_51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest04200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest04200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VVCLevelTest9();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest04300
     * @tc.number SUB_AVCodeBase_Test_04300
     * @tc.desc   testing OH_VVCLevel VVC_LEVEL_52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest04300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest04300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VVCLevelTest10();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest04400
     * @tc.number SUB_AVCodeBase_Test_04400
     * @tc.desc   testing OH_VVCLevel VVC_LEVEL_6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest04400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest04400';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VVCLevelTest11();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest04500
     * @tc.number SUB_AVCodeBase_Test_04500
     * @tc.desc   testing OH_VVCLevel VVC_LEVEL_61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest04500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest04500';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VVCLevelTest12();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest04600
     * @tc.number SUB_AVCodeBase_Test_04600
     * @tc.desc   testing OH_VVCLevel VVC_LEVEL_62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest04600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest04600';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VVCLevelTest13();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest04700
     * @tc.number SUB_AVCodeBase_Test_04700
     * @tc.desc   testing OH_VVCLevel VVC_LEVEL_63.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest04700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest04700';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VVCLevelTest14();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest04800
     * @tc.number SUB_AVCodeBase_Test_04800
     * @tc.desc   testing OH_VVCLevel VVC_LEVEL_155.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest04800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest04800';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VVCLevelTest15();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest04900
     * @tc.number SUB_AVCodeBase_Test_04900
     * @tc.desc   testing OH_MPEG4Level MPEG4_LEVEL_0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest04900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest04900';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_MPEG4Level1();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });
    /**
     * @tc.name   testAVCodeBaseTest05000
     * @tc.number SUB_AVCodeBase_Test_05000
     * @tc.desc   testing OH_MPEG4Level MPEG4_LEVEL_0B.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest05000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest05000';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_MPEG4Level2();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest051000
     * @tc.number SUB_AVCodeBase_Test_05100
     * @tc.desc   testing OH_MPEG4Level MPEG4_LEVEL_1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest051000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest051000';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_MPEG4Level3();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest05200
     * @tc.number SUB_AVCodeBase_Test_05200
     * @tc.desc   testing OH_MPEG4Level MPEG4_LEVEL_2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest05200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest05200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_MPEG4Level4();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest05300
     * @tc.number SUB_AVCodeBase_Test_05300
     * @tc.desc   testing OH_MPEG4Level MPEG4_LEVEL_3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest05300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest05300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_MPEG4Level5();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest05400
     * @tc.number SUB_AVCodeBase_Test_05400
     * @tc.desc   testing OH_MPEG4Level MPEG4_LEVEL_3B.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest05400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest05400';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_MPEG4Level6();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest05500
     * @tc.number SUB_AVCodeBase_Test_05500
     * @tc.desc   testing OH_MPEG4Level MPEG4_LEVEL_4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest05500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest05500';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_MPEG4Level7();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest05600
     * @tc.number SUB_AVCodeBase_Test_05600
     * @tc.desc   testing OH_MPEG4Level MPEG4_LEVEL_4A.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest05600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest05600';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_MPEG4Level8();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest05700
     * @tc.number SUB_AVCodeBase_Test_05700
     * @tc.desc   testing OH_MPEG4Level MPEG4_LEVEL_5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest05700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest05700';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_MPEG4Level9();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest05800
     * @tc.number SUB_AVCodeBase_Test_05800
     * @tc.desc   testing OH_MPEG4Level MPEG4_LEVEL_6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest05800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest05800';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_MPEG4Level10();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest05900
     * @tc.number SUB_AVCodeBase_Test_05900
     * @tc.desc   testing OH_VideoDecoder_Destroy AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest05900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest05900';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_DestroyTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest06000
     * @tc.number SUB_AVCodeBase_Test_06000
     * @tc.desc   testing OH_VideoDecoder_SetCallback AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest06000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest06000';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_SetCallbackTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest06100
     * @tc.number SUB_AVCodeBase_Test_06100
     * @tc.desc   testing OH_VideoDecoder_RegisterCallback AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest06100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest06100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_RegisterCallbackTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest06200
     * @tc.number SUB_AVCodeBase_Test_06200
     * @tc.desc   testing OH_VideoDecoder_SetSurface AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest06200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest06200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_SetSurfaceTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest06300
     * @tc.number SUB_AVCodeBase_Test_06300
     * @tc.desc   testing OH_VideoDecoder_Start AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest06300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest06300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_StartTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest06400
     * @tc.number SUB_AVCodeBase_Test_06400
     * @tc.desc   testing OH_VideoDecoder_Stop AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest06400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest06400';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_StopTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest06500
     * @tc.number SUB_AVCodeBase_Test_06500
     * @tc.desc   testing OH_VideoDecoder_Flush AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest06500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest06500';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_FlushTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest06600
     * @tc.number SUB_AVCodeBase_Test_06600
     * @tc.desc   testing OH_VideoDecoder_Reset AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest06600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest06600';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_ResetTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest06700
     * @tc.number SUB_AVCodeBase_Test_06700
     * @tc.desc   testing OH_VideoDecoder_SetParameter AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest06700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest06700';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_SetParameterTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest06800
     * @tc.number SUB_AVCodeBase_Test_06800
     * @tc.desc   testing OH_VideoDecoder_PushInputData AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest06800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest06800';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_PushInputDataTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest06900
     * @tc.number SUB_AVCodeBase_Test_06900
     * @tc.desc   testing OH_VideoDecoder_RenderOutputData AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest06900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest06900';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_RenderOutputDataTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest07000
     * @tc.number SUB_AVCodeBase_Test_07000
     * @tc.desc   testing OH_VideoDecoder_FreeOutputData AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest07000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest07000';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_FreeOutputDataTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest07100
     * @tc.number SUB_AVCodeBase_Test_07100
     * @tc.desc   testing OH_VideoDecoder_PushInputBuffer AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest07100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest07100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_PushInputBufferTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest07200
     * @tc.number SUB_AVCodeBase_Test_07200
     * @tc.desc   testing OH_VideoDecoder_RenderOutputBuffer AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest07200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest07200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_RenderOutputBufferTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest07300
     * @tc.number SUB_AVCodeBase_Test_07300
     * @tc.desc   testing OH_VideoDecoder_RenderOutputBufferAtTime AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest07300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest07300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_RenderOutputBufferAtTimeTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest07400
     * @tc.number SUB_AVCodeBase_Test_073400
     * @tc.desc   testing OH_VideoDecoder_FreeOutputBuffer AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest07400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest07400';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_FreeOutputBufferTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest07500
     * @tc.number SUB_AVCodeBase_Test_07500
     * @tc.desc   testing OH_VideoDecoder_QueryInputBuffer AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest07500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest07500';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_QueryInputBufferTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest07600
     * @tc.number SUB_AVCodeBase_Test_07600
     * @tc.desc   testing OH_VideoDecoder_QueryOutputBuffer AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest07600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest07600';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_QueryOutputBufferTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest07700
     * @tc.number SUB_AVCodeBase_Test_07700
     * @tc.desc   testing OH_VideoDecoder_SetDecryptionConfig AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest07700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest07700';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoDecoder_SetDecryptionConfigTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest07800
     * @tc.number SUB_AVCodeBase_Test_07800
     * @tc.desc   testing OH_VideoEncoder_SetCallback AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest07800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest07800';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoEncoder_SetCallbackTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest07900
     * @tc.number SUB_AVCodeBase_Test_07900
     * @tc.desc   testing OH_VideoEncoder_RegisterCallback AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest07900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest07900';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoEncoder_RegisterCallbackTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest08000
     * @tc.number SUB_AVCodeBase_Test_08000
     * @tc.desc   testing OH_VideoEncoder_RegisterParameterCallback AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest08000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest08000';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoEncoder_RegisterParameterCallbackTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest08100
     * @tc.number SUB_AVCodeBase_Test_08100
     * @tc.desc   testing OH_VideoEncoder_Prepare AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest08100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest08100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoEncoder_PrepareTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest08200
     * @tc.number SUB_AVCodeBase_Test_08200
     * @tc.desc   testing OH_VideoEncoder_SetParameter AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest08200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest08200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoEncoder_SetParameterTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest08300
     * @tc.number SUB_AVCodeBase_Test_08300
     * @tc.desc   testing OH_VideoEncoder_PushInputData AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest08300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest08300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoEncoder_PushInputDataTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest08400
     * @tc.number SUB_AVCodeBase_Test_08400
     * @tc.desc   testing OH_VideoEncoder_PushInputBuffer AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest08400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest08400';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoEncoder_PushInputBufferTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest08500
     * @tc.number SUB_AVCodeBase_Test_08500
     * @tc.desc   testing OH_VideoEncoder_PushInputParameter AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest08500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest08500';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoEncoder_PushInputParameterTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest08600
     * @tc.number SUB_AVCodeBase_Test_08600
     * @tc.desc   testing OH_VideoEncoder_FreeOutputBuffer AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest08600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest08600';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoEncoder_FreeOutputBufferTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest08700
     * @tc.number SUB_AVCodeBase_Test_08700
     * @tc.desc   testing OH_VideoEncoder_QueryInputBuffer AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest08700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest08700';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoEncoder_QueryInputBufferTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest08800
     * @tc.number SUB_AVCodeBase_Test_08800
     * @tc.desc   testing OH_VideoEncoder_QueryInputBuffer AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest08800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest08800';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoEncoder_QueryOutputBufferTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest08900
     * @tc.number SUB_AVCodeBase_Test_08900
     * @tc.desc   testing OH_VideoEncoder_IsValid AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest08900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest08900';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_VideoEncoder_IsValidTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest09000
     * @tc.number SUB_AVCodeBase_Test_09000
     * @tc.desc   testing OH_AVDemuxer_Destroy AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest09000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest09000';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVDemuxer_DestroyTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest09100
     * @tc.number SUB_AVCodeBase_Test_09100
     * @tc.desc   testing OH_AVDemuxer_SelectTrackByID AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest09100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest09100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVDemuxer_SelectTrackByIDTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest09200
     * @tc.number SUB_AVCodeBase_Test_09200
     * @tc.desc   testing OH_AVDemuxer_UnselectTrackByID AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest09200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest09200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVDemuxer_UnselectTrackByIDTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest09300
     * @tc.number SUB_AVCodeBase_Test_09300
     * @tc.desc   testing OH_AVDemuxer_ReadSample AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest09300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest09300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVDemuxer_ReadSampleTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest09400
     * @tc.number SUB_AVCodeBase_Test_09400
     * @tc.desc   testing OH_AVDemuxer_ReadSampleBuffer AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest09400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest09400';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVDemuxer_ReadSampleBufferTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest09500
     * @tc.number SUB_AVCodeBase_Test_09500
     * @tc.desc   testing OH_AVDemuxer_SeekToTime AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest09500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest09500';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVDemuxer_SeekToTimeTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest09600
     * @tc.number SUB_AVCodeBase_Test_09600
     * @tc.desc   testing OH_AVDemuxer_SetMediaKeySystemInfoCallback AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest09600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest09600';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVDemuxer_SetMediaKeySystemInfoCallbackTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest09700
     * @tc.number SUB_AVCodeBase_Test_09700
     * @tc.desc   testing OH_AVDemuxer_SetDemuxerMediaKeySystemInfoCallback AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest09700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest09700';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVDemuxer_SetDemuxerMediaKeySystemInfoCallbackTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest09800
     * @tc.number SUB_AVCodeBase_Test_09800
     * @tc.desc   testing OH_AVDemuxer_GetMediaKeySystemInfo AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest09800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest09800';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVDemuxer_GetMediaKeySystemInfoTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest09900
     * @tc.number SUB_AVCodeBase_Test_09900
     * @tc.desc   testing OH_AVMuxer_WriteSampleBuffer AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest09900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest09900';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVMuxer_WriteSampleBufferTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest10000
     * @tc.number SUB_AVCodeBase_Test_10000
     * @tc.desc   testing OH_AVSource_Destroy AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest10000';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVSource_DestroyTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest10100
     * @tc.number SUB_AVCodeBase_Test_10100
     * @tc.desc   testing OH_AVCencInfo_Destroy AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest10100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCencInfo_DestroyTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest10200
     * @tc.number SUB_AVCodeBase_Test_10200
     * @tc.desc   testing OH_AVCencInfo_SetKeyIdAndIv AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest10200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCencInfo_SetKeyIdAndIvTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest10300
     * @tc.number SUB_AVCodeBase_Test_10300
     * @tc.desc   testing OH_AVCencInfo_SetSubsampleInfo AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest10300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCencInfo_SetSubsampleInfoTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest10400
     * @tc.number SUB_AVCodeBase_Test_10400
     * @tc.desc   testing OH_AVCencInfo_SetMode AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest10400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest10400';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCencInfo_SetModeTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest10500
     * @tc.number SUB_AVCodeBase_Test_10500
     * @tc.desc   testing OH_AVCencInfo_SetAVBuffer AV_ERR_INVALID_VAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest10500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest10500';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVCencInfo_SetAVBufferTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest20600
     * @tc.number SUB_AVCodeBase_Test_20600
     * @tc.desc   testing OH_AVDemuxer_ReadSampleBuffer AV_ERR_OPERATE_NOT_PERMIT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest20600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest20600';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVDemuxer_ReadSampleBufferTestNotPermit();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest20700
     * @tc.number SUB_AVCodeBase_Test_20700
     * @tc.desc   testing OH_AVDemuxer_SeekToTime AV_ERR_OPERATE_NOT_PERMIT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest20700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest20700';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVDemuxer_SeekToTimeTestNotPermit();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest20800
     * @tc.number SUB_AVCodeBase_Test_20800
     * @tc.desc   testing OH_AVMuxer_SetRotation AV_ERR_OPERATE_NOT_PERMIT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest20800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest20800';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVMuxer_SetRotationNotPermit();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest20900
     * @tc.number SUB_AVCodeBase_Test_20900
     * @tc.desc   testing OH_AVMuxer_SetFormat AV_ERR_OPERATE_NOT_PERMIT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest20900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest20900';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVMuxer_SetFormatNotPermit();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest21000
     * @tc.number SUB_AVCodeBase_Test_21000
     * @tc.desc   testing OH_AVMuxer_AddTrack AV_ERR_OPERATE_NOT_PERMIT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest21000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest21000';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVMuxer_AddTrackNotPermit();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest21100
     * @tc.number SUB_AVCodeBase_Test_21100
     * @tc.desc   testing OH_AVMuxer_Start AV_ERR_OPERATE_NOT_PERMIT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest21100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest21100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVMuxer_StartNotPermit();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest21200
     * @tc.number SUB_AVCodeBase_Test_21200
     * @tc.desc   testing OH_AVMuxer_WriteSample AV_ERR_OPERATE_NOT_PERMIT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest21200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest21200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVMuxer_WriteSampleNotPermit();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest21300
     * @tc.number SUB_AVCodeBase_Test_21300
     * @tc.desc   testing OH_AVMuxer_WriteSampleBuffer AV_ERR_OPERATE_NOT_PERMIT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest21300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest21300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVMuxer_WriteSampleBufferNotPermit();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.name   testAVCodeBaseTest21400
     * @tc.number SUB_AVCodeBase_Test_21400
     * @tc.desc   testing OH_AVMuxer_StopNot AV_ERR_OPERATE_NOT_PERMIT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testAVCodeBaseTest21400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTest21400';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVMuxer_StopNotPermit();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });


  })
}