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

export default function TypographyTest() {
  describe('TypographyTest', () => {
    /**
     * @tc.number  : SUB_OH_Drawing_FontFeature0100
     * @tc.name    : SUB_OH_Drawing_FontFeature0100
     * @tc.desc    : test OH_Drawing_FontFeature
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontFeature0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontFeature0100");
          let result: number = libGraphics2DApi20.OH_Drawing_FontFeature0100();
          console.info("Test result: SUB_OH_Drawing_FontFeature0100:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontFeature0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontFeature0101
     * @tc.name    : SUB_OH_Drawing_FontFeature0101
     * @tc.desc    : test OH_Drawing_FontFeature
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontFeature0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontFeature0101");
          let result: number = libGraphics2DApi20.OH_Drawing_FontFeature0101();
          console.info("Test result: SUB_OH_Drawing_FontFeature0101:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontFeature0101 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_LineMetrics_0100
     * @tc.name    : SUB_OH_Drawing_LineMetrics_0100
     * @tc.desc    : test OH_Drawing_LineMetrics
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_LineMetrics_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_LineMetrics_0100");
          let result: number = libGraphics2DApi20.OH_Drawing_LineMetrics0100(1);
          console.info("Test result: SUB_OH_Drawing_LineMetrics_0100:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_LineMetrics_0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_LineMetrics_0101
     * @tc.name    : SUB_OH_Drawing_LineMetrics_0101
     * @tc.desc    : test OH_Drawing_LineMetrics
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_LineMetrics_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_LineMetrics_0101");
          let result: number = libGraphics2DApi20.OH_Drawing_LineMetrics0100(2);
          console.info("Test result: SUB_OH_Drawing_LineMetrics_0101:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_LineMetrics_0101 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_LineMetrics_0102
     * @tc.name    : SUB_OH_Drawing_LineMetrics_0102
     * @tc.desc    : test OH_Drawing_LineMetrics
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_LineMetrics_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_LineMetrics_0102");
          let result: number = libGraphics2DApi20.OH_Drawing_LineMetrics0100(3);
          console.info("Test result: SUB_OH_Drawing_LineMetrics_0102:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_LineMetrics_0102 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_LineMetrics_0103
     * @tc.name    : SUB_OH_Drawing_LineMetrics_0103
     * @tc.desc    : test OH_Drawing_LineMetrics
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_LineMetrics_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_LineMetrics_0103");
          let result: number = libGraphics2DApi20.OH_Drawing_LineMetrics0100(4);
          console.info("Test result: SUB_OH_Drawing_LineMetrics_0103:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_LineMetrics_0103 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_LineMetrics_0104
     * @tc.name    : SUB_OH_Drawing_LineMetrics_0104
     * @tc.desc    : test OH_Drawing_LineMetrics
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_LineMetrics_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_LineMetrics_0104");
          let result: number = libGraphics2DApi20.OH_Drawing_LineMetrics0100(5);
          console.info("Test result: SUB_OH_Drawing_LineMetrics_0104:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_LineMetrics_0104 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_LineMetrics_0105
     * @tc.name    : SUB_OH_Drawing_LineMetrics_0105
     * @tc.desc    : test OH_Drawing_LineMetrics
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_LineMetrics_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_LineMetrics_0105");
          let result: number = libGraphics2DApi20.OH_Drawing_LineMetrics0100(6);
          console.info("Test result: SUB_OH_Drawing_LineMetrics_0105:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_LineMetrics_0105 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_LineMetrics_0106
     * @tc.name    : SUB_OH_Drawing_LineMetrics_0106
     * @tc.desc    : test OH_Drawing_LineMetrics
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_LineMetrics_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_LineMetrics_0106");
          let result: number = libGraphics2DApi20.OH_Drawing_LineMetrics0100(7);
          console.info("Test result: SUB_OH_Drawing_LineMetrics_0106:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_LineMetrics_0106 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_LineMetrics_0107
     * @tc.name    : SUB_OH_Drawing_LineMetrics_0107
     * @tc.desc    : test OH_Drawing_LineMetrics
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_LineMetrics_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_LineMetrics_0107");
          let result: number = libGraphics2DApi20.OH_Drawing_LineMetrics0100(8);
          console.info("Test result: SUB_OH_Drawing_LineMetrics_0107:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_LineMetrics_0107 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_LineMetrics_0108
     * @tc.name    : SUB_OH_Drawing_LineMetrics_0108
     * @tc.desc    : test OH_Drawing_LineMetrics
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_LineMetrics_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_LineMetrics_0108");
          let result: number = libGraphics2DApi20.OH_Drawing_LineMetrics0100(9);
          console.info("Test result: SUB_OH_Drawing_LineMetrics_0108:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_LineMetrics_0108 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_LineMetrics_0109
     * @tc.name    : SUB_OH_Drawing_LineMetrics_0109
     * @tc.desc    : test OH_Drawing_LineMetrics
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_LineMetrics_0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_LineMetrics_0109");
          let result: number = libGraphics2DApi20.OH_Drawing_LineMetrics0100(10);
          console.info("Test result: SUB_OH_Drawing_LineMetrics_0109:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_LineMetrics_0109 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_LineMetrics_0110
     * @tc.name    : SUB_OH_Drawing_LineMetrics_0110
     * @tc.desc    : test OH_Drawing_LineMetrics
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_LineMetrics_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_LineMetrics_0110");
          let result: number = libGraphics2DApi20.OH_Drawing_LineMetrics0100(11);
          console.info("Test result: SUB_OH_Drawing_LineMetrics_0110:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_LineMetrics_0110 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontDescriptor_0100
     * @tc.name    : SUB_OH_Drawing_FontDescriptor_0100
     * @tc.desc    : test OH_Drawing_FontDescriptor
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontDescriptor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontDescriptor_0100");
          let result: number = libGraphics2DApi20.OH_Drawing_FontDescriptor0100(1);
          console.info("Test result: SUB_OH_Drawing_FontDescriptor_0100:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontDescriptor_0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontDescriptor_0101
     * @tc.name    : SUB_OH_Drawing_FontDescriptor_0101
     * @tc.desc    : test OH_Drawing_FontDescriptor
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontDescriptor_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontDescriptor_0101");
          let result: number = libGraphics2DApi20.OH_Drawing_FontDescriptor0100(2);
          console.info("Test result: SUB_OH_Drawing_FontDescriptor_0101:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontDescriptor_0101 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontDescriptor_0102
     * @tc.name    : SUB_OH_Drawing_FontDescriptor_0102
     * @tc.desc    : test OH_Drawing_FontDescriptor
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontDescriptor_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontDescriptor_0102");
          let result: number = libGraphics2DApi20.OH_Drawing_FontDescriptor0100(3);
          console.info("Test result: SUB_OH_Drawing_FontDescriptor_0102:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontDescriptor_0102 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontDescriptor_0103
     * @tc.name    : SUB_OH_Drawing_FontDescriptor_0103
     * @tc.desc    : test OH_Drawing_FontDescriptor
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontDescriptor_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontDescriptor_0103");
          let result: number = libGraphics2DApi20.OH_Drawing_FontDescriptor0100(4);
          console.info("Test result: SUB_OH_Drawing_FontDescriptor_0103:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontDescriptor_0103 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontDescriptor_0104
     * @tc.name    : SUB_OH_Drawing_FontDescriptor_0104
     * @tc.desc    : test OH_Drawing_FontDescriptor
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontDescriptor_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontDescriptor_0104");
          let result: number = libGraphics2DApi20.OH_Drawing_FontDescriptor0100(5);
          console.info("Test result: SUB_OH_Drawing_FontDescriptor_0104:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontDescriptor_0104 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontDescriptor_0105
     * @tc.name    : SUB_OH_Drawing_FontDescriptor_0105
     * @tc.desc    : test OH_Drawing_FontDescriptor
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontDescriptor_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontDescriptor_0105");
          let result: number = libGraphics2DApi20.OH_Drawing_FontDescriptor0100(6);
          console.info("Test result: SUB_OH_Drawing_FontDescriptor_0105:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontDescriptor_0105 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontDescriptor_0106
     * @tc.name    : SUB_OH_Drawing_FontDescriptor_0106
     * @tc.desc    : test OH_Drawing_FontDescriptor
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontDescriptor_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontDescriptor_0106");
          let result: number = libGraphics2DApi20.OH_Drawing_FontDescriptor0100(7);
          console.info("Test result: SUB_OH_Drawing_FontDescriptor_0106:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontDescriptor_0106 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontConfigInfo_0100
     * @tc.name    : SUB_OH_Drawing_FontConfigInfo_0100
     * @tc.desc    : test OH_Drawing_FontConfigInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontConfigInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontConfigInfo_0100");
          let result: number = libGraphics2DApi20.OH_Drawing_FontConfigInfo0100(1);
          console.info("Test result: SUB_OH_Drawing_FontConfigInfo_0100:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontConfigInfo_0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontConfigInfo_0101
     * @tc.name    : SUB_OH_Drawing_FontConfigInfo_0101
     * @tc.desc    : test OH_Drawing_FontConfigInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontConfigInfo_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontConfigInfo_0101");
          let result: number = libGraphics2DApi20.OH_Drawing_FontConfigInfo0100(2);
          console.info("Test result: SUB_OH_Drawing_FontConfigInfo_0101:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontConfigInfo_0101 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontConfigInfo_0102
     * @tc.name    : SUB_OH_Drawing_FontConfigInfo_0102
     * @tc.desc    : test OH_Drawing_FontConfigInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontConfigInfo_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontConfigInfo_0102");
          let result: number = libGraphics2DApi20.OH_Drawing_FontConfigInfo0100(3);
          console.info("Test result: SUB_OH_Drawing_FontConfigInfo_0102:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontConfigInfo_0102 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontConfigInfo_0103
     * @tc.name    : SUB_OH_Drawing_FontConfigInfo_0103
     * @tc.desc    : test OH_Drawing_FontConfigInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontConfigInfo_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontConfigInfo_0103");
          let result: number = libGraphics2DApi20.OH_Drawing_FontConfigInfo0100(4);
          console.info("Test result: SUB_OH_Drawing_FontConfigInfo_0103:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontConfigInfo_0103 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontConfigInfo_0104
     * @tc.name    : SUB_OH_Drawing_FontConfigInfo_0104
     * @tc.desc    : test OH_Drawing_FontConfigInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontConfigInfo_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontConfigInfo_0104");
          let result: number = libGraphics2DApi20.OH_Drawing_FontConfigInfo0100(5);
          console.info("Test result: SUB_OH_Drawing_FontConfigInfo_0104:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontConfigInfo_0104 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontConfigInfo_0105
     * @tc.name    : SUB_OH_Drawing_FontConfigInfo_0105
     * @tc.desc    : test OH_Drawing_FontConfigInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontConfigInfo_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontConfigInfo_0105");
          let result: number = libGraphics2DApi20.OH_Drawing_FontConfigInfo0100(6);
          console.info("Test result: SUB_OH_Drawing_FontConfigInfo_0105:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontConfigInfo_0105 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontGenericInfo_0100
     * @tc.name    : SUB_OH_Drawing_FontGenericInfo_0100
     * @tc.desc    : test OH_Drawing_FontGenericInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontGenericInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontGenericInfo_0100");
          let result: number = libGraphics2DApi20.OH_Drawing_FontGenericInfo0100(1);
          console.info("Test result: SUB_OH_Drawing_FontGenericInfo_0100:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontGenericInfo_0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontGenericInfo_0101
     * @tc.name    : SUB_OH_Drawing_FontGenericInfo_0101
     * @tc.desc    : test OH_Drawing_FontGenericInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontGenericInfo_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontGenericInfo_0101");
          let result: number = libGraphics2DApi20.OH_Drawing_FontGenericInfo0100(2);
          console.info("Test result: SUB_OH_Drawing_FontGenericInfo_0101:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontGenericInfo_0101 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontGenericInfo_0102
     * @tc.name    : SUB_OH_Drawing_FontGenericInfo_0102
     * @tc.desc    : test OH_Drawing_FontGenericInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontGenericInfo_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontGenericInfo_0102");
          let result: number = libGraphics2DApi20.OH_Drawing_FontGenericInfo0100(3);
          console.info("Test result: SUB_OH_Drawing_FontGenericInfo_0102:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontGenericInfo_0102 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontGenericInfo_0103
     * @tc.name    : SUB_OH_Drawing_FontGenericInfo_0103
     * @tc.desc    : test OH_Drawing_FontGenericInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontGenericInfo_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontGenericInfo_0103");
          let result: number = libGraphics2DApi20.OH_Drawing_FontGenericInfo0100(4);
          console.info("Test result: SUB_OH_Drawing_FontGenericInfo_0103:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontGenericInfo_0103 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontGenericInfo_0104
     * @tc.name    : SUB_OH_Drawing_FontGenericInfo_0104
     * @tc.desc    : test OH_Drawing_FontGenericInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontGenericInfo_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontGenericInfo_0104");
          let result: number = libGraphics2DApi20.OH_Drawing_FontGenericInfo0100(5);
          console.info("Test result: SUB_OH_Drawing_FontGenericInfo_0104:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontGenericInfo_0104 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontAliasInfo_0100
     * @tc.name    : SUB_OH_Drawing_FontAliasInfo_0100
     * @tc.desc    : test OH_Drawing_FontAliasInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontAliasInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontAliasInfo_0100");
          let result: number = libGraphics2DApi20.OH_Drawing_FontAliasInfo0100(1);
          console.info("Test result: SUB_OH_Drawing_FontAliasInfo_0100:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontAliasInfo_0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontAliasInfo_0101
     * @tc.name    : SUB_OH_Drawing_FontAliasInfo_0101
     * @tc.desc    : test OH_Drawing_FontAliasInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontAliasInfo_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontAliasInfo_0101");
          let result: number = libGraphics2DApi20.OH_Drawing_FontAliasInfo0100(2);
          console.info("Test result: SUB_OH_Drawing_FontAliasInfo_0101:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontAliasInfo_0101 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontAdjustInfo_0100
     * @tc.name    : SUB_OH_Drawing_FontAdjustInfo_0100
     * @tc.desc    : test OH_Drawing_FontAdjustInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontAdjustInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontAdjustInfo_0100");
          let result: number = libGraphics2DApi20.OH_Drawing_FontAdjustInfo0100(1);
          console.info("Test result: SUB_OH_Drawing_FontAdjustInfo_0100:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontAdjustInfo_0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontAdjustInfo_0101
     * @tc.name    : SUB_OH_Drawing_FontAdjustInfo_0101
     * @tc.desc    : test OH_Drawing_FontAdjustInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontAdjustInfo_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontAdjustInfo_0101");
          let result: number = libGraphics2DApi20.OH_Drawing_FontAdjustInfo0100(2);
          console.info("Test result: SUB_OH_Drawing_FontAdjustInfo_0101:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontAdjustInfo_0101 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontFallbackGroup_0100
     * @tc.name    : SUB_OH_Drawing_FontFallbackGroup_0100
     * @tc.desc    : test OH_Drawing_FontFallbackGroup
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontFallbackGroup_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontFallbackGroup_0100");
          let result: number = libGraphics2DApi20.OH_Drawing_FontFallbackGroup0100(1);
          console.info("Test result: SUB_OH_Drawing_FontFallbackGroup_0100:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontFallbackGroup_0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontFallbackGroup_0101
     * @tc.name    : SUB_OH_Drawing_FontFallbackGroup_0101
     * @tc.desc    : test OH_Drawing_FontFallbackGroup
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontFallbackGroup_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontFallbackGroup_0101");
          let result: number = libGraphics2DApi20.OH_Drawing_FontFallbackGroup0100(2);
          console.info("Test result: SUB_OH_Drawing_FontFallbackGroup_0101:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontFallbackGroup_0101 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontFallbackGroup_0102
     * @tc.name    : SUB_OH_Drawing_FontFallbackGroup_0102
     * @tc.desc    : test OH_Drawing_FontFallbackGroup
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontFallbackGroup_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontFallbackGroup_0102");
          let result: number = libGraphics2DApi20.OH_Drawing_FontFallbackGroup0100(3);
          console.info("Test result: SUB_OH_Drawing_FontFallbackGroup_0102:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontFallbackGroup_0102 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontFallbackInfo_0100
     * @tc.name    : SUB_OH_Drawing_FontFallbackInfo_0100
     * @tc.desc    : test OH_Drawing_FontFallbackInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontFallbackInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontFallbackInfo_0100");
          let result: number = libGraphics2DApi20.OH_Drawing_FontFallbackInfo0100(1);
          console.info("Test result: SUB_OH_Drawing_FontFallbackInfo_0100:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontFallbackInfo_0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontFallbackInfo_0101
     * @tc.name    : SUB_OH_Drawing_FontFallbackInfo_0101
     * @tc.desc    : test OH_Drawing_FontFallbackInfo
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontFallbackInfo_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontFallbackInfo_0101");
          let result: number = libGraphics2DApi20.OH_Drawing_FontFallbackInfo0100(2);
          console.info("Test result: SUB_OH_Drawing_FontFallbackInfo_0101:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontFallbackInfo_0101 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontConfigInfoErrorCode_0100
     * @tc.name    : SUB_OH_Drawing_FontConfigInfoErrorCode_0100
     * @tc.desc    : test OH_Drawing_FontConfigInfoErrorCode
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontConfigInfoErrorCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontConfigInfoErrorCode_0100");
          let result: number = libGraphics2DApi20.OH_Drawing_FontConfigInfoErrorCode0100(1);
          console.info("Test result: SUB_OH_Drawing_FontConfigInfoErrorCode_0100:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontConfigInfoErrorCode_0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontConfigInfoErrorCode_0101
     * @tc.name    : SUB_OH_Drawing_FontConfigInfoErrorCode_0101
     * @tc.desc    : test OH_Drawing_FontConfigInfoErrorCode
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontConfigInfoErrorCode_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontConfigInfoErrorCode_0101");
          let result: number = libGraphics2DApi20.OH_Drawing_FontConfigInfoErrorCode0100(2);
          console.info("Test result: SUB_OH_Drawing_FontConfigInfoErrorCode_0101:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontConfigInfoErrorCode_0101 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_FontConfigInfoErrorCode_0102
     * @tc.name    : SUB_OH_Drawing_FontConfigInfoErrorCode_0102
     * @tc.desc    : test OH_Drawing_FontConfigInfoErrorCode
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_FontConfigInfoErrorCode_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_FontConfigInfoErrorCode_0102");
          let result: number = libGraphics2DApi20.OH_Drawing_FontConfigInfoErrorCode0100(3);
          console.info("Test result: SUB_OH_Drawing_FontConfigInfoErrorCode_0102:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_FontConfigInfoErrorCode_0102 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_RectStyle_0100
     * @tc.name    : SUB_OH_Drawing_RectStyle_0100
     * @tc.desc    : test OH_Drawing_RectStyle
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_RectStyle_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_RectStyle_0100");
          let result: number = libGraphics2DApi20.OH_Drawing_RectStyle0100(1);
          console.info("Test result: SUB_OH_Drawing_RectStyle_0100:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_RectStyle_0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_RectStyle_0101
     * @tc.name    : SUB_OH_Drawing_RectStyle_0101
     * @tc.desc    : test OH_Drawing_RectStyle
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_RectStyle_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_RectStyle_0101");
          let result: number = libGraphics2DApi20.OH_Drawing_RectStyle0100(2);
          console.info("Test result: SUB_OH_Drawing_RectStyle_0101:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_RectStyle_0101 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_RectStyle_0102
     * @tc.name    : SUB_OH_Drawing_RectStyle_0102
     * @tc.desc    : test OH_Drawing_RectStyle
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_RectStyle_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_RectStyle_0102");
          let result: number = libGraphics2DApi20.OH_Drawing_RectStyle0100(3);
          console.info("Test result: SUB_OH_Drawing_RectStyle_0102:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_RectStyle_0102 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_RectStyle_0103
     * @tc.name    : SUB_OH_Drawing_RectStyle_0103
     * @tc.desc    : test OH_Drawing_RectStyle
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_RectStyle_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_RectStyle_0103");
          let result: number = libGraphics2DApi20.OH_Drawing_RectStyle0100(4);
          console.info("Test result: SUB_OH_Drawing_RectStyle_0103:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_RectStyle_0103 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_RectStyle_0104
     * @tc.name    : SUB_OH_Drawing_RectStyle_0104
     * @tc.desc    : test OH_Drawing_RectStyle
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_RectStyle_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_RectStyle_0104");
          let result: number = libGraphics2DApi20.OH_Drawing_RectStyle0100(5);
          console.info("Test result: SUB_OH_Drawing_RectStyle_0104:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_RectStyle_0104 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_RectStyle_0105
     * @tc.name    : SUB_OH_Drawing_RectStyle_0105
     * @tc.desc    : test OH_Drawing_RectStyle
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_RectStyle_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_RectStyle_0105");
          let result: number = libGraphics2DApi20.OH_Drawing_RectStyle0100(6);
          console.info("Test result: SUB_OH_Drawing_RectStyle_0105:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_RectStyle_0105 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_PlaceholderVerticalAlignment_0100
     * @tc.name    : SUB_OH_Drawing_PlaceholderVerticalAlignment_0100
     * @tc.desc    : test OH_Drawing_PlaceholderVerticalAlignment
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_PlaceholderVerticalAlignment_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_PlaceholderVerticalAlignment_0100");
          let result: number = libGraphics2DApi20.OH_Drawing_PlaceholderVerticalAlignment0100(1);
          console.info("Test result: SUB_OH_Drawing_PlaceholderVerticalAlignment_0100:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_PlaceholderVerticalAlignment_0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_PlaceholderVerticalAlignment_0101
     * @tc.name    : SUB_OH_Drawing_PlaceholderVerticalAlignment_0101
     * @tc.desc    : test OH_Drawing_PlaceholderVerticalAlignment
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_PlaceholderVerticalAlignment_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_PlaceholderVerticalAlignment_0101");
          let result: number = libGraphics2DApi20.OH_Drawing_PlaceholderVerticalAlignment0100(2);
          console.info("Test result: SUB_OH_Drawing_PlaceholderVerticalAlignment_0101:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_PlaceholderVerticalAlignment_0101 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_PlaceholderVerticalAlignment_0102
     * @tc.name    : SUB_OH_Drawing_PlaceholderVerticalAlignment_0102
     * @tc.desc    : test OH_Drawing_PlaceholderVerticalAlignment
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_PlaceholderVerticalAlignment_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_PlaceholderVerticalAlignment_0102");
          let result: number = libGraphics2DApi20.OH_Drawing_PlaceholderVerticalAlignment0100(3);
          console.info("Test result: SUB_OH_Drawing_PlaceholderVerticalAlignment_0102:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_PlaceholderVerticalAlignment_0102 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_PlaceholderVerticalAlignment_0103
     * @tc.name    : SUB_OH_Drawing_PlaceholderVerticalAlignment_0103
     * @tc.desc    : test OH_Drawing_PlaceholderVerticalAlignment
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_PlaceholderVerticalAlignment_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_PlaceholderVerticalAlignment_0103");
          let result: number = libGraphics2DApi20.OH_Drawing_PlaceholderVerticalAlignment0100(4);
          console.info("Test result: SUB_OH_Drawing_PlaceholderVerticalAlignment_0103:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_PlaceholderVerticalAlignment_0103 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_PlaceholderVerticalAlignment_0104
     * @tc.name    : SUB_OH_Drawing_PlaceholderVerticalAlignment_0104
     * @tc.desc    : test OH_Drawing_PlaceholderVerticalAlignment
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_PlaceholderVerticalAlignment_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_PlaceholderVerticalAlignment_0104");
          let result: number = libGraphics2DApi20.OH_Drawing_PlaceholderVerticalAlignment0100(5);
          console.info("Test result: SUB_OH_Drawing_PlaceholderVerticalAlignment_0104:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_PlaceholderVerticalAlignment_0104 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_WordBreakType_0100
     * @tc.name    : SUB_OH_Drawing_WordBreakType_0100
     * @tc.desc    : test OH_Drawing_WordBreakType
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_WordBreakType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_WordBreakType_0100");
          let result: number = libGraphics2DApi20.OH_Drawing_WordBreakType0100(1);
          console.info("Test result: SUB_OH_Drawing_WordBreakType_0100:", result);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error("Test error: SUB_OH_Drawing_WordBreakType_0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_TextStyleType_0100
     * @tc.name    : SUB_OH_Drawing_TextStyleType_0100
     * @tc.desc    : test OH_Drawing_TextStyleType
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_TextStyleType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_TextStyleType_0100");
          let result: number = libGraphics2DApi20.OH_Drawing_TextStyleType0100(1);
          console.info(`Test result: SUB_OH_Drawing_TextStyleType_0100: ${result}`);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error(`Test error: SUB_OH_Drawing_TextStyleType_0100 occurred: ${err}`);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_TextStyleType_0101
     * @tc.name    : SUB_OH_Drawing_TextStyleType_0101
     * @tc.desc    : test OH_Drawing_TextStyleType
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_TextStyleType_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_TextStyleType_0101");
          let result: number = libGraphics2DApi20.OH_Drawing_TextStyleType0100(2);
          console.info(`Test result: SUB_OH_Drawing_TextStyleType_0101: ${result}`);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error(`Test error: SUB_OH_Drawing_TextStyleType_0101 occurred: ${err}`);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_TextStyleType_0102
     * @tc.name    : SUB_OH_Drawing_TextStyleType_0102
     * @tc.desc    : test OH_Drawing_TextStyleType
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_TextStyleType_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_TextStyleType_0102");
          let result: number = libGraphics2DApi20.OH_Drawing_TextStyleType0100(3);
          console.info(`Test result: SUB_OH_Drawing_TextStyleType_0102: ${result}`);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error(`Test error: SUB_OH_Drawing_TextStyleType_0102 occurred: ${err}`);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_TextStyleType_0103
     * @tc.name    : SUB_OH_Drawing_TextStyleType_0103
     * @tc.desc    : test OH_Drawing_TextStyleType
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_TextStyleType_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_TextStyleType_0103");
          let result: number = libGraphics2DApi20.OH_Drawing_TextStyleType0100(4);
          console.info(`Test result: SUB_OH_Drawing_TextStyleType_0103: ${result}`);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error(`Test error: SUB_OH_Drawing_TextStyleType_0103 occurred: ${err}`);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_TextStyleType_0104
     * @tc.name    : SUB_OH_Drawing_TextStyleType_0104
     * @tc.desc    : test OH_Drawing_TextStyleType
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_TextStyleType_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_TextStyleType_0104");
          let result: number = libGraphics2DApi20.OH_Drawing_TextStyleType0100(5);
          console.info(`Test result: SUB_OH_Drawing_TextStyleType_0104: ${result}`);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error(`Test error: SUB_OH_Drawing_TextStyleType_0104 occurred: ${err}`);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_TextStyleType_0105
     * @tc.name    : SUB_OH_Drawing_TextStyleType_0105
     * @tc.desc    : test OH_Drawing_TextStyleType
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_TextStyleType_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_TextStyleType_0105");
          let result: number = libGraphics2DApi20.OH_Drawing_TextStyleType0100(6);
          console.info(`Test result: SUB_OH_Drawing_TextStyleType_0105: ${result}`);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error(`Test error: SUB_OH_Drawing_TextStyleType_0105 occurred: ${err}`);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_TextStyleType_0106
     * @tc.name    : SUB_OH_Drawing_TextStyleType_0106
     * @tc.desc    : test OH_Drawing_TextStyleType
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_TextStyleType_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_TextStyleType_0106");
          let result: number = libGraphics2DApi20.OH_Drawing_TextStyleType0100(7);
          console.info(`Test result: SUB_OH_Drawing_TextStyleType_0106: ${result}`);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error(`Test error: SUB_OH_Drawing_TextStyleType_0106 occurred: ${err}`);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_OH_Drawing_TextStyleType_0107
     * @tc.name    : SUB_OH_Drawing_TextStyleType_0107
     * @tc.desc    : test OH_Drawing_TextStyleType
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Drawing_TextStyleType_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("Test start: SUB_OH_Drawing_TextStyleType_0107");
          let result: number = libGraphics2DApi20.OH_Drawing_TextStyleType0100(8);
          console.info(`Test result: SUB_OH_Drawing_TextStyleType_0107: ${result}`);
          expect(result).assertEqual(1);
          done();
        } catch (err) {
          console.error(`Test error: SUB_OH_Drawing_TextStyleType_0107 occurred: ${err}`);
          expect(false).assertEqual(0);
        }
      })
  })
}
