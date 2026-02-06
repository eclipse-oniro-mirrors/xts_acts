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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import libavcode from 'libavcode.so'

export default function AVCodeBaseTwoTest() {
  let TAG = '';
  describe('AVCodeBaseTwoTest', () => {

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_00100
     * @tc.name     testAVCodeBaseTwoTest00100
     * @tc.desc     testing OH_H263Level H263_LEVEL_10 and OH_AVErrCode AV_ERR_SERVICE_DIED.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest00100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest00100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest1();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_00200
     * @tc.name     testAVCodeBaseTwoTest00200
     * @tc.desc     testing OH_H263Level H263_LEVEL_20 and OH_AVErrCode AV_ERR_UNSUPPORTED_FORMAT.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest00200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest00200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest2();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_00300
     * @tc.name     testAVCodeBaseTwoTest00300
     * @tc.desc     testing OH_H263Level H263_LEVEL_30 and OH_AVErrCode AV_ERR_EXTEND_START.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest00300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest00300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest3();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_00400
     * @tc.name     testAVCodeBaseTwoTest00400
     * @tc.desc     testing OH_H263Level H263_LEVEL_40 and OH_AVErrCode AV_ERR_DRM_BASE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest00400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest00400';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest4();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_00500
     * @tc.name     testAVCodeBaseTwoTest00500
     * @tc.desc     testing OH_H263Level H263_LEVEL_45 and OH_AVErrCode AV_ERR_DRM_DECRYPT_FAILED.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest00500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest00500';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest5();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_00600
     * @tc.name     testAVCodeBaseTwoTest00600
     * @tc.desc     testing OH_H263Level H263_LEVEL_50 and OH_AVErrCode AV_ERR_VIDEO_BASE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest00600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest00600';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest6();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_00700
     * @tc.name     testAVCodeBaseTwoTest00700
     * @tc.desc     testing OH_H263Level H263_LEVEL_60 and OH_AVErrCode AV_ERR_IO_CANNOT_FIND_HOST.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest00700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest00700';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest7();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_00800
     * @tc.name     testAVCodeBaseTwoTest00800
     * @tc.desc     testing OH_H263Level H263_LEVEL_70 and OH_AVErrCode AV_ERR_IO_CONNECTION_TIMEOUT.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest00800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest00800';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest8();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_00900
     * @tc.name     testAVCodeBaseTwoTest00900
     * @tc.desc     testing OH_AVErrCode AV_ERR_IO_NETWORK_ABNORMAL.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest00900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest00900';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest9();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_01000
     * @tc.name     testAVCodeBaseTwoTest01000
     * @tc.desc     testing OH_AVErrCode AV_ERR_IO_NETWORK_UNAVAILABLE.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest01000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest01000';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest10();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_01100
     * @tc.name     testAVCodeBaseTwoTest01100
     * @tc.desc     testing OH_AVErrCode AV_ERR_IO_NO_PERMISSION.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest01100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest01100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest11();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_01200
     * @tc.name     testAVCodeBaseTwoTest01200
     * @tc.desc     testing OH_AVErrCode AV_ERR_IO_NETWORK_ACCESS_DENIED.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest01200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest01200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest12();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_01300
     * @tc.name     testAVCodeBaseTwoTest01300
     * @tc.desc     testing OH_AVErrCode AV_ERR_IO_RESOURCE_NOT_FOUND.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest01300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest01300';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest13();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_01400
     * @tc.name     testAVCodeBaseTwoTest01400
     * @tc.desc     testing OH_AVErrCode AV_ERR_IO_SSL_CLIENT_CERT_NEEDED.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest01400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest01400';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest14();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_01500
     * @tc.name     testAVCodeBaseTwoTest01500
     * @tc.desc     testing OH_AVErrCode AV_ERR_IO_SSL_CONNECT_FAIL.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest01500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest01500';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest15();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_01600
     * @tc.name     testAVCodeBaseTwoTest01600
     * @tc.desc     testing OH_AVErrCode AV_ERR_IO_SSL_SERVER_CERT_UNTRUSTED.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest01600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest01600';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest16();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_01700
     * @tc.name     testAVCodeBaseTwoTest01700
     * @tc.desc     testing OH_AVErrCode AV_ERR_IO_UNSUPPORTED_REQUEST.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest01700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest01700';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest17();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_01800
     * @tc.name     testAVCodeBaseTwoTest01800
     * @tc.desc     testing OH_AVErrCode AV_ERR_TRY_AGAIN_LATER.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest01800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest01800';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVErrCodeTest18();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_01900
     * @tc.name     testAVCodeBaseTwoTest01900
     * @tc.desc     testing OH_AVPixelFormat.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest01900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest01900';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.OH_AVFormat_SetIntValueTest();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(1);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_02000
     * @tc.name     testAVCodeBaseTwoTest02000
     * @tc.desc     testing OH_AVCLevel AVC_LEVEL_1.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest02000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest02100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoEncoder_QueryOutputBuffer();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_02100
     * @tc.name     testAVCodeBaseTwoTest02100
     * @tc.desc     testing OH_AVCLevel AVC_LEVEL_1.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest02100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest02100';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoEncoder_QueryInputBuffer();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });

    /**
     * @tc.number   SUB_AVCodeBaseTwo_Test_02200
     * @tc.name     testAVCodeBaseTwoTest02200
     * @tc.desc     testing OH_AVCLevel AVC_LEVEL_1.
     * @tc.level    Level3
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('testAVCodeBaseTwoTest02200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      TAG = 'testAVCodeBaseTwoTest02200';
      try {
        console.info(TAG + "===> START");
        let result: number = libavcode.VideoDecoder_AVDecodeSync();
        console.info(TAG + "Test ret Result ===> " + result);
        expect(result).assertEqual(0);
        done()
      } catch (err) {
        console.error( "====> " + TAG + " err: " + err);
        done()
      }
    });
  })
}