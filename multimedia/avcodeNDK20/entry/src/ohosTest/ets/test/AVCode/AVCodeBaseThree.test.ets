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

import { describe, it, expect, TestType, Size, Level, beforeEach, afterEach } from '@ohos/hypium'
import libavcode from 'libavcode.so'

export default function AVCodeBaseThreeTest() {
  let TAG = '';
  describe('AVCodeBaseThreeTest', () => {

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_100
     * @tc.name     testAVCodeBaseThreeTest100
     * @tc.desc     testing OH_VideoEncoder_FreeOutputBuffer AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoEncoder_FreeOutputBuffer();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_200
     * @tc.name     testAVCodeBaseThreeTest200
     * @tc.desc     testing OH_VideoEncoder_RegisterParameterCallback AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoEncoder_RegisterParameterCallback();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_300
     * @tc.name     testAVCodeBaseThreeTest300
     * @tc.desc     testing OH_VideoEncoder_SetParameter AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoEncoder_SetParameter();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_400
     * @tc.name     testAVCodeBaseThreeTest400
     * @tc.desc     testing OH_VideoEncoder_NotifyEndOfStream AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest400';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoEncoder_NotifyEndOfStream();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_500
     * @tc.name     testAVCodeBaseThreeTest500
     * @tc.desc     testing OH_VideoEncoder_PushInputData AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest500';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoEncoder_PushInputData();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_600
     * @tc.name     testAVCodeBaseThreeTest600
     * @tc.desc     testing OH_VideoEncoder_PushInputBuffer AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest600';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoEncoder_PushInputBuffer();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_700
     * @tc.name     testAVCodeBaseThreeTest700
     * @tc.desc     testing OH_VideoEncoder_PushInputParameter AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest700';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoEncoder_PushInputParameter();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_800
     * @tc.name     testAVCodeBaseThreeTest800
     * @tc.desc     testing OH_VideoEncoder_QueryInputBuffer AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest800';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoEncoder_QueryInputBuffer1();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_900
     * @tc.name     testAVCodeBaseThreeTest900
     * @tc.desc     testing OH_VideoEncoder_QueryInputBuffer AV_ERR_TRY_AGAIN_LATER.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest900';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoEncoder_QueryInputBuffer2();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_1000
     * @tc.name     testAVCodeBaseThreeTest1000
     * @tc.desc     testing OH_VideoEncoder_QueryInputBuffer AV_ERR_OPERATE_NOT_PERMIT.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest1000';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoEncoder_QueryInputBuffer3();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_1100
     * @tc.name     testAVCodeBaseThreeTest1100
     * @tc.desc     testing OH_VideoEncoder_QueryOutputBuffer AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest1100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoEncoder_QueryOutputBuffer1();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_1200
     * @tc.name     testAVCodeBaseThreeTest1200
     * @tc.desc     testing OH_VideoEncoder_QueryOutputBuffer AV_ERR_TRY_AGAIN_LATER.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest1200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoEncoder_QueryOutputBuffer2();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_1300
     * @tc.name     testAVCodeBaseThreeTest1300
     * @tc.desc     testing OH_VideoEncoder_QueryOutputBuffer AV_ERR_OPERATE_NOT_PERMIT.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest1300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoEncoder_QueryOutputBuffer3();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });


      /**
       * @tc.number   SUB_AVCodeBaseThreeTest_Test_1400
       * @tc.name     testAVCodeBaseThreeTest1400
       * @tc.desc     testing OH_VideoDecoder_SetSurface AV_ERR_INVALID_STATE.
       * @tc.level    Level3
       * @tc.size     MediumTest
       * @tc.type     Function
       */
      it('testAVCodeBaseThreeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        TAG = 'testAVCodeBaseThreeTest1400';
        try {
          console.info(TAG + "===> START");
          let result: number = libavcode.VideoDecoder_SetSurface();
          console.info(TAG + "Test ret Result ===> " + result);
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error( "====> " + TAG + " err: " + err);
          done()
        }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_1500
     * @tc.name     testAVCodeBaseThreeTest1500
     * @tc.desc     testing OH_VideoDecoder_SetParameter AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest1500';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_SetParameter();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_1600
     * @tc.name     testAVCodeBaseThreeTest1600
     * @tc.desc     testing OH_VideoDecoder_PushInputData AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest1600';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_PushInputData();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_1700
     * @tc.name     testAVCodeBaseThreeTest1700
     * @tc.desc     testing OH_VideoDecoder_RenderOutputData AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest1700';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_RenderOutputData();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_1800
     * @tc.name     testAVCodeBaseThreeTest1800
     * @tc.desc     testing OH_VideoDecoder_FreeOutputData AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest1800';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_FreeOutputData();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_1900
     * @tc.name     testAVCodeBaseThreeTest1900
     * @tc.desc     testing OH_VideoDecoder_PushInputBuffer AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest1900';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_PushInputBuffer();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_2000
     * @tc.name     testAVCodeBaseThreeTest2000
     * @tc.desc     testing OH_VideoDecoder_RenderOutputBuffer AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest2000';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_RenderOutputBuffer();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_2100
     * @tc.name     testAVCodeBaseThreeTest2100
     * @tc.desc     testing OH_VideoDecoder_RenderOutputBufferAtTime AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest2100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_RenderOutputBufferAtTime();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_2200
     * @tc.name     testAVCodeBaseThreeTest2200
     * @tc.desc     testing OH_VideoDecoder_FreeOutputBuffer AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest2200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_FreeOutputBuffer();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_2300
     * @tc.name     testAVCodeBaseThreeTest2300
     * @tc.desc     testing OH_VideoDecoder_QueryInputBuffer AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest2300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_QueryInputBuffer1();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_2400
     * @tc.name     testAVCodeBaseThreeTest2400
     * @tc.desc     testing OH_VideoDecoder_QueryInputBuffer AV_ERR_TRY_AGAIN_LATER.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest2400';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_QueryInputBuffer2();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_2500
     * @tc.name     testAVCodeBaseThreeTest2500
     * @tc.desc     testing OH_VideoDecoder_QueryInputBuffer AV_ERR_OPERATE_NOT_PERMIT.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest2500';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_QueryInputBuffer3();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_2600
     * @tc.name     testAVCodeBaseThreeTest2600
     * @tc.desc     testing OH_VideoDecoder_QueryOutputBuffer AV_ERR_INVALID_STATE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest2600';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_QueryOutputBuffer1();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_2700
     * @tc.name     testAVCodeBaseThreeTest2700
     * @tc.desc     testing OH_VideoDecoder_QueryOutputBuffer AV_ERR_TRY_AGAIN_LATER.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest2700';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_QueryOutputBuffer2();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_2800
     * @tc.name     testAVCodeBaseThreeTest2800
     * @tc.desc     testing OH_VideoDecoder_QueryOutputBuffer AV_ERR_OPERATE_NOT_PERMIT.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest2800';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_QueryOutputBuffer3();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_2900
     * @tc.name     testAVCodeBaseThreeTest2900
     * @tc.desc     testing VideoDecoder_Configure AV_ERR_VIDEO_UNSUPPORTED_COLOR_SPACE_CONVERSION.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest2900';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_Configure();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_3000
     * @tc.name     testAVCodeBaseThreeTest3000
     * @tc.desc     testing VideoDecoder_Prepare AV_ERR_OPERATE_NOT_PERMIT.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest3000';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_Prepare();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseThreeTest_Test_3100
     * @tc.name     testAVCodeBaseThreeTest3100
     * @tc.desc     testing OH_VideoDecoder_Start AV_ERR_OPERATE_NOT_PERMIT.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseThreeTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseThreeTest3100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_Start();
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