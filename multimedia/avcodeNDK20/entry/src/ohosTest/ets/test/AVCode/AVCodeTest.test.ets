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

export default function AVCodeTest() {
  describe('AVCodeTest', () => {
    /**
     * @tc.name   testAudioOHChannelSet001
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_001
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet1 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet002
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_002
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet2 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet003
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_003
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet3 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet3();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet004
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_004
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet4 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet4();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet005
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_005
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet5 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet5();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet006
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_006
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet6 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet6();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet006 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet007
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_007
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet7 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet7();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet007 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet008
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_008
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet8 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet8();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet008 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet009
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_009
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet9 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet9();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet010
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_010
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet10 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet10();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet010 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet011
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_011
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet11 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet11();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet011 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet012
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_012
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet12 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet12();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet012 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet013
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_013
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet13 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet13();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet013 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet014
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_014
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet14 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet14();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet014 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet015
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_015
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet15 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet15();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet015 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet016
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_016
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet16 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet16();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet016 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet017
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_017
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet17 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet17();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet017 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet018
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_018
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet18 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet18();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet018 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet019
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_019
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet19 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet19();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet019 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet020
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_020
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet20 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet20();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet020 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet021
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_021
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet21 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet21();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet021 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet022
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_022
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet22 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet22();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet022 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet023
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_023
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet23 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet23();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet023 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet024
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_024
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet24 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet24();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet024 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet025
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_025
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet25 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet25();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet025 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet026
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_026
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet26 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet26();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet026 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet027
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_027
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet27 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet27();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet027 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet028
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_028
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet28 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet28();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet028 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet029
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_029
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet29 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet29();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet029 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioOHChannelSet030
     * @tc.number SUB_AVCode_Audio_OH_ChannelSet_030
     * @tc.desc   testing OH_Audio_ChannelSet interface with EnumOHAudioChannelSet30 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioOHChannelSet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelSet30();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioOHChannelSet030 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAmbAttributeSet001
     * @tc.number SUB_AVCode_AmbAttributeSet_001
     * @tc.desc   testing OH_Ambient_Attribute_Set interface with EnumAmbAttributeSet1 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAmbAttributeSet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAmbAttributeSet1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAmbAttributeSet001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAmbAttributeSet002
     * @tc.number SUB_AVCode_AmbAttributeSet_002
     * @tc.desc   testing OH_Ambient_Attribute_Set interface with EnumAmbAttributeSet2 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAmbAttributeSet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAmbAttributeSet2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAmbAttributeSet002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAmbAttributeSet003
     * @tc.number SUB_AVCode_AmbAttributeSet_003
     * @tc.desc   testing OH_Ambient_Attribute_Set interface with EnumAmbAttributeSet3 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAmbAttributeSet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAmbAttributeSet3();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAmbAttributeSet003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAmbAttributeSet004
     * @tc.number SUB_AVCode_AmbAttributeSet_004
     * @tc.desc   testing OH_Ambient_Attribute_Set interface with EnumAmbAttributeSet4 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAmbAttributeSet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAmbAttributeSet4();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAmbAttributeSet004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAmbAttributeSet005
     * @tc.number SUB_AVCode_AmbAttributeSet_005
     * @tc.desc   testing OH_Ambient_Attribute_Set interface with EnumAmbAttributeSet5 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAmbAttributeSet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAmbAttributeSet5();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAmbAttributeSet005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAmbAttributeSet006
     * @tc.number SUB_AVCode_AmbAttributeSet_006
     * @tc.desc   testing OH_Ambient_Attribute_Set interface with EnumAmbAttributeSet6 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAmbAttributeSet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAmbAttributeSet6();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAmbAttributeSet006 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAmbAttributeSet007
     * @tc.number SUB_AVCode_AmbAttributeSet_007
     * @tc.desc   testing OH_Ambient_Attribute_Set interface with EnumAmbAttributeSet7 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAmbAttributeSet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAmbAttributeSet7();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAmbAttributeSet007 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAmbAttributeSet008
     * @tc.number SUB_AVCode_AmbAttributeSet_008
     * @tc.desc   testing OH_Ambient_Attribute_Set interface with EnumAmbAttributeSet8 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAmbAttributeSet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumAmbAttributeSet8();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAmbAttributeSet008 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout001
     * @tc.number SUB_AVCode_Audio_ChannelLayout_001
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout1 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout1();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout002
     * @tc.number SUB_AVCode_Audio_ChannelLayout_002
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout2 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout2();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout003
     * @tc.number SUB_AVCode_Audio_ChannelLayout_003
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout3 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout3();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout004
     * @tc.number SUB_AVCode_Audio_ChannelLayout_004
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout4 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout4();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout005
     * @tc.number SUB_AVCode_Audio_ChannelLayout_005
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout5 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout5();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout006
     * @tc.number SUB_AVCode_Audio_ChannelLayout_006
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout6 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout6();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout006 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout007
     * @tc.number SUB_AVCode_Audio_ChannelLayout_007
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout7 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout7();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout007 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout008
     * @tc.number SUB_AVCode_Audio_ChannelLayout_008
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout8 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout8();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout008 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout009
     * @tc.number SUB_AVCode_Audio_ChannelLayout_009
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout9 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout9();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout009 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout010
     * @tc.number SUB_AVCode_Audio_ChannelLayout_010
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout10 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout10();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout010 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout011
     * @tc.number SUB_AVCode_Audio_ChannelLayout_011
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout11 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout11();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout011 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout012
     * @tc.number SUB_AVCode_Audio_ChannelLayout_012
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout12 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout12();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout012 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout013
     * @tc.number SUB_AVCode_Audio_ChannelLayout_013
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout13 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout13();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout013 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout014
     * @tc.number SUB_AVCode_Audio_ChannelLayout_014
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout14 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout14();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout014 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout015
     * @tc.number SUB_AVCode_Audio_ChannelLayout_015
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout15 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout15();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout015 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout016
     * @tc.number SUB_AVCode_Audio_ChannelLayout_016
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout16 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout16();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout016 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout017
     * @tc.number SUB_AVCode_Audio_ChannelLayout_017
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout17 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout17();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout017 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout018
     * @tc.number SUB_AVCode_Audio_ChannelLayout_018
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout18 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout18();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout018 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout019
     * @tc.number SUB_AVCode_Audio_ChannelLayout_019
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout19 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout19();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout019 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout020
     * @tc.number SUB_AVCode_Audio_ChannelLayout_020
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout20 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout20();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout020 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout021
     * @tc.number SUB_AVCode_Audio_ChannelLayout_021
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout21 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout21();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout021 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout022
     * @tc.number SUB_AVCode_Audio_ChannelLayout_022
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout22 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout22();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout022 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout023
     * @tc.number SUB_AVCode_Audio_ChannelLayout_023
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout23 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout23();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout023 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout024
     * @tc.number SUB_AVCode_Audio_ChannelLayout_024
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout24 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout24();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout024 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout025
     * @tc.number SUB_AVCode_Audio_ChannelLayout_025
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout25 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout25();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout025 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout026
     * @tc.number SUB_AVCode_Audio_ChannelLayout_026
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout26 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout26();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout026 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout027
     * @tc.number SUB_AVCode_Audio_ChannelLayout_027
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout27 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout27();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout027 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout028
     * @tc.number SUB_AVCode_Audio_ChannelLayout_028
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout28 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout28();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout028 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout029
     * @tc.number SUB_AVCode_Audio_ChannelLayout_029
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout29 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout29();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout029 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout030
     * @tc.number SUB_AVCode_Audio_ChannelLayout_030
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout30 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout30();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout030 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout031
     * @tc.number SUB_AVCode_Audio_ChannelLayout_031
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout31 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout31();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout031 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout032
     * @tc.number SUB_AVCode_Audio_ChannelLayout_032
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout32 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout32();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout032 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout033
     * @tc.number SUB_AVCode_Audio_ChannelLayout_033
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout33 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout33();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout033 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout034
     * @tc.number SUB_AVCode_Audio_ChannelLayout_034
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout34 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout34();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout034 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout035
     * @tc.number SUB_AVCode_Audio_ChannelLayout_035
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout35 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout35();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout035 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout036
     * @tc.number SUB_AVCode_Audio_ChannelLayout_036
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout36 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout36();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout036 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout037
     * @tc.number SUB_AVCode_Audio_ChannelLayout_037
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout37 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout37();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout037 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout038
     * @tc.number SUB_AVCode_Audio_ChannelLayout_038
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout38 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout38();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout038 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout039
     * @tc.number SUB_AVCode_Audio_ChannelLayout_039
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout39 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout39();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout039 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout040
     * @tc.number SUB_AVCode_Audio_ChannelLayout_040
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout40 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout40();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout040 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout041
     * @tc.number SUB_AVCode_Audio_ChannelLayout_041
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout41 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout41();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout041 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout042
     * @tc.number SUB_AVCode_Audio_ChannelLayout_042
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout42 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout42();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout042 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout043
     * @tc.number SUB_AVCode_Audio_ChannelLayout_043
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout43 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout43();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout043 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout044
     * @tc.number SUB_AVCode_Audio_ChannelLayout_044
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout44 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout44();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout044 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout045
     * @tc.number SUB_AVCode_Audio_ChannelLayout_045
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout45 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout45();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout045 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout046
     * @tc.number SUB_AVCode_Audio_ChannelLayout_046
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout46 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout46();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout046 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout047
     * @tc.number SUB_AVCode_Audio_ChannelLayout_047
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout47 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout47();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout047 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAudioChannelLayout048
     * @tc.number SUB_AVCode_Audio_ChannelLayout_048
     * @tc.desc   testing OH_Audio_Channel_Layout interface with EnumOHAudioChannelLayout48 function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAudioChannelLayout048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavcode.EnumOHAudioChannelLayout48();
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>testAudioChannelLayout048 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
  })
}
