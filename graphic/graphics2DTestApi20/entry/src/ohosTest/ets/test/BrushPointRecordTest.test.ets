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
import libGraphics2DApi20 from 'libgraphicsApiNdk.so'
const OH_DRAWING_SUCCESS = 0;
const OH_DRAWING_ERROR_INVALID_PARAMETER = 401;
export default function BrushPointRecordTest() {
  describe('BrushPointRecordTest', () => {
    /**
     * @tc.name   SUB_OH_Data_Asset_GetAlphaFloat_0100
     * @tc.number SUB_OH_Data_Asset_GetAlphaFloat_0100
     * @tc.desc   test OH_Data_Asset_GetAlphaFloat Test Normal Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Data_Asset_GetAlphaFloat_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Data_Asset_GetAlphaFloat_0100 start====");
          let result: number = libGraphics2DApi20.drawingBrushGetAlphaFloatSuccess();
          console.info("====>SUB_OH_Data_Asset_GetAlphaFloat_0100 result====", result);
          expect(result).assertEqual(OH_DRAWING_SUCCESS);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Data_Asset_GetAlphaFloat_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Data_Asset_GetAlphaFloat_0200
     * @tc.number SUB_OH_Data_Asset_GetAlphaFloat_0200
     * @tc.desc   test OH_Data_Asset_GetAlphaFloat Test Normal Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Data_Asset_GetAlphaFloat_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Data_Asset_GetAlphaFloat_0200 start====");
          let result: number = libGraphics2DApi20.drawingBrushGetAlphaFloatFail();
          console.info("====>SUB_OH_Data_Asset_GetAlphaFloat_0200 result====", result);
          expect(result).assertEqual(OH_DRAWING_ERROR_INVALID_PARAMETER);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Data_Asset_GetAlphaFloat_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_BrushGetRedFloatSuccess_0100
     * @tc.number SUB_OH_Drawing_BrushGetRedFloatSuccess_0100
     * @tc.desc   test OH_Drawing_BrushGetRedFloatSuccess Normal Fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_BrushGetRedFloatSuccess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_BrushGetRedFloatSuccess_0100 start====");
          let result: number = libGraphics2DApi20.brushGetRedFloatSuccess();
          console.info("====>SUB_OH_Drawing_BrushGetRedFloatSuccess_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_BrushGetRedFloatSuccess_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_BrushGetRedFloatFail_0200
     * @tc.number SUB_OH_Drawing_BrushGetRedFloatFail_0200
     * @tc.desc   test OH_Drawing_BrushGetRedFloatFail  Fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_BrushGetRedFloatFail_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_BrushGetRedFloatFail_0200 start====");
          let result: number = libGraphics2DApi20.brushGetRedFloatFail();
          console.info("====>SUB_OH_Drawing_BrushGetRedFloatFail_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_BrushGetRedFloatFail_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_BrushGetGreenFloatSuccess_0100
     * @tc.number SUB_OH_Drawing_BrushGetGreenFloatSuccess_0100
     * @tc.desc   test SUB_OH_Drawing_BrushGetGreenFloatSuccess Normal Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_BrushGetGreenFloatSuccess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_BrushGetGreenFloatSuccess_0100 start====");
          let result: number = libGraphics2DApi20.brushGetGreenFloatSuccess();
          console.info("====>SUB_OH_Drawing_BrushGetGreenFloatSuccess_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_BrushGetGreenFloatSuccess_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_BrushGetGreenFloatFail_0200
     * @tc.number SUB_OH_Drawing_BrushGetGreenFloatFail_0200
     * @tc.desc   test SUB_OH_Drawing_BrushGetGreenFloat Fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_BrushGetGreenFloatFail_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_BrushGetGreenFloatSuccess_0100 start====");
          let result: number = libGraphics2DApi20.brushGetGreenFloatFail();
          console.info("====>SUB_OH_Drawing_BrushGetGreenFloatSuccess_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_BrushGetGreenFloatSuccess_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_BrushGetBlueFloat_0100
     * @tc.number SUB_OH_Drawing_BrushGetBlueFloat_0100
     * @tc.desc   test OH_Drawing_BrushGetBlueFloat Normal Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_BrushGetBlueFloat_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_BrushGetBlueFloat_0100 start====");
          let result: number = libGraphics2DApi20.brushGetBlueFloatSuccess();
          console.info("====>SUB_OH_Drawing_BrushGetBlueFloat_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_BrushGetBlueFloat_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_BrushGetBlueFloat_0200
     * @tc.number SUB_OH_Drawing_BrushGetBlueFloat_0200
     * @tc.desc   test SUB_OH_Drawing_BrushGetBlueFloat Fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_BrushGetBlueFloat_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_BrushGetBlueFloat_0200 start====");
          let result: number = libGraphics2DApi20.brushGetBlueFloatFail();
          console.info("====>SUB_OH_Drawing_BrushGetBlueFloat_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_BrushGetBlueFloat_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_PointGetX_0100
     * @tc.number SUB_OH_Drawing_PointGetX_0100
     * @tc.desc   test SUB_OH_Drawing_PointGetX Success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_PointGetX_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_OH_Drawing_PointGetX_0100 start====");
        let result: number = libGraphics2DApi20.pointGetXSuccess();
        console.info("====>SUB_OH_Drawing_PointGetX_0100 result====", result);
        expect(result).assertEqual(1);
        done();
      } catch (err) {
        console.error("====>SUB_OH_Drawing_PointGetX_0100 catch err: " + err);
      }
    })

    /**
     * @tc.name   SUB_OH_Drawing_PointGetX_0200
     * @tc.number SUB_OH_Drawing_PointGetX_0200
     * @tc.desc   test SUB_OH_Drawing_PointGetX Fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_PointGetX_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_OH_Drawing_PointGetX_0200 start====");
        let result: number = libGraphics2DApi20.pointGetXFail();
        console.info("====>SUB_OH_Drawing_PointGetX_0200 result====", result);
        expect(result).assertEqual(1);
        done();
      } catch (err) {
        console.error("====>SUB_OH_Drawing_PointGetX_0200 catch err: " + err);
      }
    })

    /**
     * @tc.name   SUB_OH_Drawing_PointGetY_0100
     * @tc.number SUB_OH_Drawing_PointGetY_0100
     * @tc.desc   test SUB_OH_Drawing_PointGetY Success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_PointGetY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_OH_Drawing_PointGetY_0100 start====");
        let result: number = libGraphics2DApi20.pointGetYSuccess();
        console.info("====>SUB_OH_Drawing_PointGetY_0100 result====", result);
        expect(result).assertEqual(1);
        done();
      } catch (err) {
        console.error("====>SUB_OH_Drawing_PointGetY_0100 catch err: " + err);
      }
    })

    /**
     * @tc.name   SUB_OH_Drawing_PointGetY_0200
     * @tc.number SUB_OH_Drawing_PointGetY_0200
     * @tc.desc   test SUB_OH_Drawing_PointGetY Fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_PointGetY_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_OH_Drawing_PointGetY_0200 start====");
        let result: number = libGraphics2DApi20.pointGetYFail();
        console.info("====>SUB_OH_Drawing_PointGetY_0200 result====", result);
        expect(result).assertEqual(1);
        done();
      } catch (err) {
        console.error("====>SUB_OH_Drawing_PointGetY_0200 catch err: " + err);
      }
    })

    /**
     * @tc.name   SUB_OH_Drawing_PointSet_0100
     * @tc.number SUB_OH_Drawing_PointSet_0100
     * @tc.desc   test SUB_OH_Drawing_PointSet Success Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_PointSet_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_OH_Drawing_PointSet_0100 start====");
        let result: number = libGraphics2DApi20.pointSetSuccess();
        console.info("====>SUB_OH_Drawing_PointSet_0100 result====", result);
        expect(result).assertEqual(1);
        done();
      } catch (err) {
        console.error("====>SUB_OH_Drawing_PointSet_0100 catch err: " + err);
      }
    })

    /**
     * @tc.name   SUB_OH_Drawing_PointSet_0200
     * @tc.number SUB_OH_Drawing_PointSet_0200
     * @tc.desc   test SUB_OH_Drawing_PointSet_0200 Fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_PointSet_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info("====>SUB_OH_Drawing_PointSet_0200 start====");
        let result: number = libGraphics2DApi20.pointSetFail();
        console.info("====>SUB_OH_Drawing_PointSet_0200 result====", result);
        expect(result).assertEqual(1);
        done();
      } catch (err) {
        console.error("====>SUB_OH_Drawing_PointSet_0200 catch err: " + err);
      }
    })

    /**
     * @tc.name   SUB_OH_Drawing_RecordCmdUtilsDestroy_0100
     * @tc.number SUB_OH_Drawing_RecordCmdUtilsDestroy_0100
     * @tc.desc   test SUB_OH_Drawing_RecordCmdUtilsDestroy_0100 SUCCESS Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_RecordCmdUtilsDestroy_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_RecordCmdUtilsDestroy_0100 start====");
          let result: number = libGraphics2DApi20.recordCmdUtilsDestroySuccess();
          console.info("====>SUB_OH_Drawing_RecordCmdUtilsDestroy_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_RecordCmdUtilsDestroy_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_RecordCmdUtilsDestroy_0200
     * @tc.number SUB_OH_Drawing_RecordCmdUtilsDestroy_0200
     * @tc.desc   test SUB_OH_Drawing_RecordCmdUtilsDestroy_0200 SUCCESS Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_RecordCmdUtilsDestroy_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_RecordCmdUtilsDestroy_0200 start====");
          let result: number = libGraphics2DApi20.recordCmdUtilsDestroyFail();
          console.info("====>SUB_OH_Drawing_RecordCmdUtilsDestroy_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_RecordCmdUtilsDestroy_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_RecordCmdUtilsBeginRecording_0100
     * @tc.number SUB_OH_Drawing_RecordCmdUtilsBeginRecording_0100
     * @tc.desc   test SUB_OH_Drawing_RecordCmdUtilsBeginRecording_0100 SUCCESS Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_RecordCmdUtilsBeginRecording_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_RecordCmdUtilsBeginRecording_0100 start====");
          let result: number = libGraphics2DApi20.recordCmdUtilsBeginRecordingSuccess();
          console.info("====>SUB_OH_Drawing_RecordCmdUtilsBeginRecording_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_RecordCmdUtilsBeginRecording_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_RecordCmdUtilsBeginRecording_0200
     * @tc.number SUB_OH_Drawing_RecordCmdUtilsBeginRecording_0200
     * @tc.desc   test SUB_OH_Drawing_RecordCmdUtilsBeginRecording_0200 fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_RecordCmdUtilsBeginRecording_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_RecordCmdUtilsBeginRecording_0200 start====");
          let result: number = libGraphics2DApi20.recordCmdUtilsBeginRecordingFail();
          console.info("====>SUB_OH_Drawing_RecordCmdUtilsBeginRecording_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_RecordCmdUtilsBeginRecording_0200 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_RecordCmdUtilsFinishRecording_0100
     * @tc.number SUB_OH_Drawing_RecordCmdUtilsFinishRecording_0100
     * @tc.desc   test SUB_OH_Drawing_RecordCmdUtilsFinishRecording SUCCESS Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_RecordCmdUtilsFinishRecording_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_RecordCmdUtilsFinishRecording_0100 start====");
          let result: number = libGraphics2DApi20.recordCmdUtilsFinishRecordingSuccess();
          console.info("====>SUB_OH_Drawing_RecordCmdUtilsFinishRecording_0100 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_RecordCmdUtilsFinishRecording_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.name   SUB_OH_Drawing_RecordCmdUtilsFinishRecording_0200
     * @tc.number SUB_OH_Drawing_RecordCmdUtilsFinishRecording_0200
     * @tc.desc   test SUB_OH_Drawing_RecordCmdUtilsFinishRecording fail Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_OH_Drawing_RecordCmdUtilsFinishRecording_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Drawing_RecordCmdUtilsFinishRecording_0200 start====");
          let result: number = libGraphics2DApi20.recordCmdUtilsFinishRecordingFail();
          console.info("====>SUB_OH_Drawing_RecordCmdUtilsFinishRecording_0200 result====", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Drawing_RecordCmdUtilsFinishRecording_0200 catch err: " + err);
          done();
        }
      })
  })
}