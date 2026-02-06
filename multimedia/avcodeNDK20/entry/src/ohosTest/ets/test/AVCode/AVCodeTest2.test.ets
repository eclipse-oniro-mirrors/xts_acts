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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import libavcode from 'libavcode.so'

const OS_ACCOUNT_ERR_OK = 0;

export default function AVCodeTest2() {
  describe('AVCodeTest2', () => {
    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_001
     * @tc.name testAudioChannelSet001
     * @tc.desc testing audio channel set with EnumAudioChannelSet1 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_002
     * @tc.name testAudioChannelSet002
     * @tc.desc testing audio channel set with EnumAudioChannelSet2 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_003
     * @tc.name testAudioChannelSet003
     * @tc.desc testing audio channel set with EnumAudioChannelSet3 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet3();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_004
     * @tc.name testAudioChannelSet004
     * @tc.desc testing audio channel set with EnumAudioChannelSet4 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet4();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_005
     * @tc.name testAudioChannelSet005
     * @tc.desc testing audio channel set with EnumAudioChannelSet5 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet5();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_006
     * @tc.name testAudioChannelSet006
     * @tc.desc testing audio channel set with EnumAudioChannelSet6 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet6();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet006 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_007
     * @tc.name testAudioChannelSet007
     * @tc.desc testing audio channel set with EnumAudioChannelSet7 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet7();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet007 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_008
     * @tc.name testAudioChannelSet008
     * @tc.desc testing audio channel set with EnumAudioChannelSet8 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet8();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet008 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_009
     * @tc.name testAudioChannelSet009
     * @tc.desc testing audio channel set with EnumAudioChannelSet9 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet9();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_010
     * @tc.name testAudioChannelSet010
     * @tc.desc testing audio channel set with EnumAudioChannelSet10 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet10();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet010 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_011
     * @tc.name testAudioChannelSet011
     * @tc.desc testing audio channel set with EnumAudioChannelSet11 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet11();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet011 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_012
     * @tc.name testAudioChannelSet012
     * @tc.desc testing audio channel set with EnumAudioChannelSet12 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet12();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet012 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_013
     * @tc.name testAudioChannelSet013
     * @tc.desc testing audio channel set with EnumAudioChannelSet13 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet13();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet013 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_014
     * @tc.name testAudioChannelSet014
     * @tc.desc testing audio channel set with EnumAudioChannelSet14 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet14();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet014 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_015
     * @tc.name testAudioChannelSet015
     * @tc.desc testing audio channel set with EnumAudioChannelSet15 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet15();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet015 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_016
     * @tc.name testAudioChannelSet016
     * @tc.desc testing audio channel set with EnumAudioChannelSet16 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet16();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet016 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_017
     * @tc.name testAudioChannelSet017
     * @tc.desc testing audio channel set with EnumAudioChannelSet17 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet17();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet017 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_018
     * @tc.name testAudioChannelSet018
     * @tc.desc testing audio channel set with EnumAudioChannelSet18 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet18();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet018 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_019
     * @tc.name testAudioChannelSet019
     * @tc.desc testing audio channel set with EnumAudioChannelSet19 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet19();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet019 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_020
     * @tc.name testAudioChannelSet020
     * @tc.desc testing audio channel set with EnumAudioChannelSet20 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet20();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet020 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_021
     * @tc.name testAudioChannelSet021
     * @tc.desc testing audio channel set with EnumAudioChannelSet21 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet21();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet021 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_022
     * @tc.name testAudioChannelSet022
     * @tc.desc testing audio channel set with EnumAudioChannelSet22 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet22();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet022 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_023
     * @tc.name testAudioChannelSet023
     * @tc.desc testing audio channel set with EnumAudioChannelSet23 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet23();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet023 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_024
     * @tc.name testAudioChannelSet024
     * @tc.desc testing audio channel set with EnumAudioChannelSet24 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet24();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet024 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_025
     * @tc.name testAudioChannelSet025
     * @tc.desc testing audio channel set with EnumAudioChannelSet25 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet25();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet025 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_026
     * @tc.name testAudioChannelSet026
     * @tc.desc testing audio channel set with EnumAudioChannelSet26 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet26();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet026 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_027
     * @tc.name testAudioChannelSet027
     * @tc.desc testing audio channel set with EnumAudioChannelSet27 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet27();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet027 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_028
     * @tc.name testAudioChannelSet028
     * @tc.desc testing audio channel set with EnumAudioChannelSet28 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet28();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet028 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_029
     * @tc.name testAudioChannelSet029
     * @tc.desc testing audio channel set with EnumAudioChannelSet29 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet29();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet029 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_030
     * @tc.name testAudioChannelSet030
     * @tc.desc testing audio channel set with EnumAudioChannelSet30 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet30();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet030 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_031
     * @tc.name testAudioChannelSet031
     * @tc.desc testing audio channel set with EnumAudioChannelSet31 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet31();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet031 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_032
     * @tc.name testAudioChannelSet032
     * @tc.desc testing audio channel set with EnumAudioChannelSet32 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet32();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet032 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });


    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_033
     * @tc.name testAudioChannelSet033
     * @tc.desc testing audio channel set with EnumAudioChannelSet33 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet33();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet033 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_034
     * @tc.name testAudioChannelSet034
     * @tc.desc testing audio channel set with EnumAudioChannelSet34 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet34();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet034 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_035
     * @tc.name testAudioChannelSet035
     * @tc.desc testing audio channel set with EnumAudioChannelSet35 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet35();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet035 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_036
     * @tc.name testAudioChannelSet036
     * @tc.desc testing audio channel set with EnumAudioChannelSet36 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet36();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet036 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_037
     * @tc.name testAudioChannelSet037
     * @tc.desc testing audio channel set with EnumAudioChannelSet37 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet37();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet037 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_038
     * @tc.name testAudioChannelSet038
     * @tc.desc testing audio channel set with EnumAudioChannelSet38 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet38();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet038 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_039
     * @tc.name testAudioChannelSet039
     * @tc.desc testing audio channel set with EnumAudioChannelSet39 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet39();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet039 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_040
     * @tc.name testAudioChannelSet040
     * @tc.desc testing audio channel set with EnumAudioChannelSet40 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet40();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet040 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_041
     * @tc.name testAudioChannelSet041
     * @tc.desc testing audio channel set with EnumAudioChannelSet41 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet41();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet041 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_042
     * @tc.name testAudioChannelSet042
     * @tc.desc testing audio channel set with EnumAudioChannelSet42 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet42();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet042 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_043
     * @tc.name testAudioChannelSet043
     * @tc.desc testing audio channel set with EnumAudioChannelSet43 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet43();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet043 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_044
     * @tc.name testAudioChannelSet044
     * @tc.desc testing audio channel set with EnumAudioChannelSet44 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet44();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet044 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_045
     * @tc.name testAudioChannelSet045
     * @tc.desc testing audio channel set with EnumAudioChannelSet45 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet45();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet045 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_046
     * @tc.name testAudioChannelSet046
     * @tc.desc testing audio channel set with EnumAudioChannelSet46 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet46();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet046 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_047
     * @tc.name testAudioChannelSet047
     * @tc.desc testing audio channel set with EnumAudioChannelSet47 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet47();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet047 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_048
     * @tc.name testAudioChannelSet048
     * @tc.desc testing audio channel set with EnumAudioChannelSet48 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet48();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet048 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_049
     * @tc.name testAudioChannelSet049
     * @tc.desc testing audio channel set with EnumAudioChannelSet49 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet49();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet049 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_Audio_ChannelSet_050
     * @tc.name testAudioChannelSet050
     * @tc.desc testing audio channel set with EnumAudioChannelSet50 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelSet050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelSet50();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelSet050 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_001
     * @tc.name testAudioChannelLayout001
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout1 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_002
     * @tc.name testAudioChannelLayout002
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout2 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_003
     * @tc.name testAudioChannelLayout003
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout3 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout3();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_004
     * @tc.name testAudioChannelLayout004
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout4 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout4();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_005
     * @tc.name testAudioChannelLayout005
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout5 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout5();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_006
     * @tc.name testAudioChannelLayout006
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout6 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout6();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout006 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_007
     * @tc.name testAudioChannelLayout007
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout7 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout7();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout007 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_008
     * @tc.name testAudioChannelLayout008
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout8 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout8();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout008 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_009
     * @tc.name testAudioChannelLayout009
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout9 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout9();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_010
     * @tc.name testAudioChannelLayout010
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout10 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout10();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout010 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_011
     * @tc.name testAudioChannelLayout011
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout11 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout11();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout011 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_012
     * @tc.name testAudioChannelLayout012
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout12 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout12();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout012 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_013
     * @tc.name testAudioChannelLayout013
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout13 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout13();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout013 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_014
     * @tc.name testAudioChannelLayout014
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout14 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout14();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout014 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_015
     * @tc.name testAudioChannelLayout015
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout15 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout15();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout015 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_016
     * @tc.name testAudioChannelLayout016
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout16 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout16();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout016 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_017
     * @tc.name testAudioChannelLayout017
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout17 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout17();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout017 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_018
     * @tc.name testAudioChannelLayout018
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout18 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout18();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout018 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_019
     * @tc.name testAudioChannelLayout019
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout19 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout19();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout019 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_020
     * @tc.name testAudioChannelLayout020
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout20 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout20();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout020 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_021
     * @tc.name testAudioChannelLayout021
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout21 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout21();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout021 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_022
     * @tc.name testAudioChannelLayout022
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout22 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout22();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout022 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_023
     * @tc.name testAudioChannelLayout023
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout23 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout23();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout023 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_024
     * @tc.name testAudioChannelLayout024
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout24 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout24();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout024 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_025
     * @tc.name testAudioChannelLayout025
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout25 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout25();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout025 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_026
     * @tc.name testAudioChannelLayout026
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout26 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout26();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout026 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_027
     * @tc.name testAudioChannelLayout027
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout27 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout27();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout027 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_028
     * @tc.name testAudioChannelLayout028
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout28 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout28();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout028 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_029
     * @tc.name testAudioChannelLayout029
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout29 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout29();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout029 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_030
     * @tc.name testAudioChannelLayout030
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout30 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout30();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout030 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_031
     * @tc.name testAudioChannelLayout031
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout31 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout31();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout031 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_AudioChannelLayout_032
     * @tc.name testAudioChannelLayout032
     * @tc.desc testing audio channel layout with EnumAudioChannelLayout32 function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAudioChannelLayout032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAudioChannelLayout32();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout032 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AVBufferDestroy_001
     * @tc.name testOHAVBufferDestroy001
     * @tc.desc testing AV buffer destroy with AVCodeAVBufferDestroyErrInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testOHAVBufferDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeAVBufferDestroyErrInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testOHAVBufferDestroy001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AVBufferGetBufferAttr_001
     * @tc.name testOHAVBufferGetBufferAttr001
     * @tc.desc testing AV buffer get attribute with AVCodeAVBufferGetBufferAttrErrInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testOHAVBufferGetBufferAttr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeAVBufferGetBufferAttrErrInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testOHAVBufferDestroy002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AVBufferSetBufferAttr_001
     * @tc.name testOHAVBufferSetBufferAttr001
     * @tc.desc testing AV buffer set attribute with AVCodeAVBufferSetBufferAttrErrInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testOHAVBufferSetBufferAttr001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeAVBufferSetBufferAttrErrInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testOHAVBufferSetBufferAttr001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AVBufferGetParameter_001
     * @tc.name testOHAVBufferGetParameter001
     * @tc.desc testing AV buffer get parameter with AVCodeAVBufferSetParameterErrInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testOHAVBufferGetParameter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeAVBufferSetParameterErrInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testOHAVBufferGetParameter001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AVCapability_GetAudioSupportedSampleRateRanges_001
     * @tc.name testOHAVCapabilityGetAudioSupportedSampleRateRanges001
     * @tc.desc testing AV capability get audio sample rates with AVCodeOHAVCapabilityGetAudioSupportedSampleRates function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testOHAVCapabilityGetAudioSupportedSampleRateRanges001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAVCapabilityGetAudioSupportedSampleRates();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testOHAVCapabilityGetAudioSupportedSampleRateRanges001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AVCapabilityGetAudioChannelCountRange_001
     * @tc.name testOHAVCapabilityGetAudioChannelCountRange001
     * @tc.desc testing AV capability get audio channel range with AVCodeOHAVCapabilityGetAudioChannelCountRange function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testOHAVCapabilityGetAudioChannelCountRange001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAVCapabilityGetAudioChannelCountRange();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testOHAVCapabilityGetAudioChannelCountRange001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoderDestroy_001
     * @tc.name testAVCodeOHAudioDecoderDestroy001
     * @tc.desc testing audio decoder destroy with AVCodeOHAudioDecoderDestroySuccess function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderDestroy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderDestroySuccess();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderDestroy001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoderDestroy_002
     * @tc.name testAVCodeOHAudioDecoderDestroy002
     * @tc.desc testing audio decoder destroy with AVCodeOHAudioDecoderDestroyInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderDestroy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderDestroyInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderDestroy002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoderConfigure_002
     * @tc.name testAVCodeOHAudioDecoderConfigure002
     * @tc.desc testing audio decoder configure with AVCodeOHAudioDecoderConfigureInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderConfigure002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderConfigureInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderConfigure002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoderConfigure_010
     * @tc.name testAVCodeOHAudioDecoderConfigure010
     * @tc.desc testing audio decoder configure with AVCodeOHAudioDecoderConfigureUnsupport function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderConfigure010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderConfigureUnsupport();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderConfigure010 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoderPrepare_002
     * @tc.name testAVCodeOHAudioDecoderPrepare002
     * @tc.desc testing audio decoder prepare with AVCodeOHAudioDecoderPrepareInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderPrepare002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderPrepareInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderPrepare002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoderPrepare_010
     * @tc.name testAVCodeOHAudioDecoderPrepare010
     * @tc.desc testing audio decoder prepare with AVCodeOHAudioDecoderConfigureUnsupport function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderPrepare010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderConfigureUnsupport();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderPrepare010 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoderStart_002
     * @tc.name testAVCodeOHAudioDecoderStart002
     * @tc.desc testing audio decoder start with AVCodeOHAudioDecoderStartInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderStart002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderStartInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderStart002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoderStart_009
     * @tc.name testAVCodeOHAudioDecoderStart009
     * @tc.desc testing audio decoder start with AVCodeOHAudioDecoderStartInvalidState function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderStart009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderStartInvalidState();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderStart009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoderStop_002
     * @tc.name testAVCodeOHAudioDecoderStop002
     * @tc.desc testing audio decoder stop with AVCodeOHAudioDecoderStopInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderStop002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderStopInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderStop002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoderStop_009
     * @tc.name testAVCodeOHAudioDecoderStop009
     * @tc.desc testing audio decoder stop with AVCodeOHAudioDecoderStopInvalidState function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderStop009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderStopInvalidState();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderStop009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoder_Flush_002
     * @tc.name testAVCodeOHAudioDecoderFlush002
     * @tc.desc testing audio decoder flush with AVCodeOHAudioDecoderFlushInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderFlush002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderFlushInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderFlush002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoder_Flush_009
     * @tc.name testAVCodeOHAudioDecoderFlush009
     * @tc.desc testing audio decoder flush with AVCodeOHAudioDecoderFlushInvalidState function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderFlush009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderFlushInvalidState();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderFlush009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoder_Reset_002
     * @tc.name testAVCodeOHAudioDecoderReset002
     * @tc.desc testing audio decoder reset with AVCodeOHAudioDecoderResetInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderReset002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderResetInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderReset002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoder_SetParameter_002
     * @tc.name testAVCodeOHAudioDecoderSetParameter002
     * @tc.desc testing audio decoder set parameter with AVCodeOHAudioDecoderSetParameterInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderSetParameter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderSetParameterInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderSetParameter002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoder_PushInputData_002
     * @tc.name testAVCodeOHAudioDecoderPushInputData002
     * @tc.desc testing audio decoder push input data with AVCodeOHAudioDecoderPushInputDataInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderPushInputData002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderPushInputDataInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderPushInputData002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoder_FreeOutputData_002
     * @tc.name testAVCodeOHAudioDecoderFreeOutputData002
     * @tc.desc testing audio decoder free output data with AVCodeOHAudioDecoderPushFreeOutputDataInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderFreeOutputData002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderPushFreeOutputDataInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderFreeOutputData002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoder_FreeOutputData_001
     * @tc.name testAVCodeOHAudioDecoderFreeOutputData008
     * @tc.desc testing audio decoder free output data with AVCodeOHAudioDecoderPushFreeOutputDataInvalidState function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderFreeOutputData008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderPushFreeOutputDataInvalidState();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderFreeOutputData008 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoder_IsValid_002
     * @tc.name testAVCodeOHAudioDecoderIsValid002
     * @tc.desc testing audio decoder validity check with AVCodeOHAudioDecoderIsValidInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderIsValid002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderIsValidInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderIsValid002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioDecoder_SetCallback_002
     * @tc.name testAVCodeOHAudioDecoderSetCallback002
     * @tc.desc testing audio decoder validity check with AVCodeOHAudioDecoderIsValidInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioDecoderSetCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioDecoderSetCallbackInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioDecoderSetCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.number SUB_AVCode_OH_AudioEncoder_SetCallback_002
     * @tc.name testAVCodeOHAudioEncoderSetCallback002
     * @tc.desc testing audio encoder validity check with AVCodeOHAudioEncoderIsValidInvalidVal function.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testAVCodeOHAudioEncoderSetCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.AVCodeOHAudioEncoderSetCallbackInvalidVal();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAVCodeOHAudioEncoderSetCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
  })
}
