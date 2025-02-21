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

import { describe, expect, it } from '@ohos/hypium'
import hiappevent from 'libhiappeventndk.so'

export default function hiappeventNdkTest() {
  describe('HibiewdfxHiappeventTest', () => {
    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_WRITE_0100
     * @tc.name       : testOHHiAppEventWrite001
     * @tc.desc       : test OH_HiAppEvent_Write
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventWrite001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventWrite();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_CONFIGURE_0100
     * @tc.name       : testOHHiAppEventConfigure001
     * @tc.desc       : test OH_HiAppEvent_Configure
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventConfigure001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventConfigure();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDBOOLPARAM_0100
     * @tc.name       : testOHHiAppEventAddBoolParam001
     * @tc.desc       : test OH_HiAppEvent_AddBoolParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddBoolParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddBoolParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDBOOLARRAYPARAM_0100
     * @tc.name       : testOHHiAppEventAddBoolArrayParam001
     * @tc.desc       : test OH_HiAppEvent_AddBoolArrayParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddBoolArrayParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddBoolArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT8PARAM_0100
     * @tc.name       : testOHHiAppEventAddInt8Param001
     * @tc.desc       : test OH_HiAppEvent_AddInt8Param
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddInt8Param001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt8Param();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT8ARRAYPARAM_0100
     * @tc.name       : testOHHiAppEventAddInt8ArrayParam001
     * @tc.desc       : test OH_HiAppEvent_AddInt8ArrayParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddInt8ArrayParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt8ArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT16PARAM_0100
     * @tc.name       : testOHHiAppEventAddInt16Param001
     * @tc.desc       : test OH_HiAppEvent_AddInt16Param
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddInt16Param001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt16Param();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT16ARRAYPARAM_0100
     * @tc.name       : testOHHiAppEventAddInt16ArrayParam001
     * @tc.desc       : test OH_HiAppEvent_AddInt16ArrayParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddInt16ArrayParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt16ArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT32PARAM_0100
     * @tc.name       : testOHHiAppEventAddInt32Param001
     * @tc.desc       : test OH_HiAppEvent_AddInt32Param
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddInt32Param001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt32Param();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT32ARRAYPARAM_0100
     * @tc.name       : testOHHiAppEventAddInt32ArrayParam001
     * @tc.desc       : test OH_HiAppEvent_AddInt32ArrayParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddInt32ArrayParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt32ArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT64PARAM_0100
     * @tc.name       : testOHHiAppEventAddInt64Param001
     * @tc.desc       : test OH_HiAppEvent_AddInt64Param
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddInt64Param001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt64Param();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDINT64ARRAYPARAM_0100
     * @tc.name       : testOHHiAppEventAddInt64ArrayParam001
     * @tc.desc       : test OH_HiAppEvent_AddInt64ArrayParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddInt64ArrayParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddInt64ArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDFLOATPARAM_0100
     * @tc.name       : testOHHiAppEventAddFloatParam001
     * @tc.desc       : test OH_HiAppEvent_AddFloatParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddFloatParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddFloatParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDFLOATARRAYPARAM_0100
     * @tc.name       : testOHHiAppEventAddFloatArrayParam001
     * @tc.desc       : test OH_HiAppEvent_AddFloatArrayParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddFloatArrayParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddFloatArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDDOUBLEPARAM_0100
     * @tc.name       : testOHHiAppEventAddDoubleParam001
     * @tc.desc       : test OH_HiAppEvent_AddDoubleParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddDoubleParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddDoubleParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDDOUBLEARRAYPARAM_0100
     * @tc.name       : testOHHiAppEventAddDoubleArrayParam001
     * @tc.desc       : test OH_HiAppEvent_AddDoubleArrayParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddDoubleArrayParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddDoubleArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDSTRINGPARAM_0100
     * @tc.name       : testOHHiAppEventAddStringParam001
     * @tc.desc       : test OH_HiAppEvent_AddStringParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddStringParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddStringParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_ADDSTRINGARRAYPARAM_0100
     * @tc.name       : testOHHiAppEventAddStringArrayParam001
     * @tc.desc       : test OH_HiAppEvent_AddStringArrayParam
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventAddStringArrayParam001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventAddStringArrayParam();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_HIVIEWDFX_HIAPPEVENT_HIAPPEVENT_OH_HIAPPEVENT_CREATEPARAMLIST_0100
     * @tc.name       : testOHHiAppEventCreateParamList001
     * @tc.desc       : test OH_HiAppEvent_CreateParamList
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHHiAppEventCreateParamList001', 0, async (done: Function) => {
      let result: number = hiappevent.oHHiAppEventCreateParamList();
      expect(result).assertEqual(0);
      done();
    });
  })
}
