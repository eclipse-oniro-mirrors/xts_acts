import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libAudioEncoder from 'libaudioencoder.so';

export default function AudioEncoderTest() {
  describe('AudioEncoderTest', () => {
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
     * @tc.name   NULL_CHECK_001
     * @tc.number NULL_CHECK_001
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_001', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(0);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_002
     * @tc.number NULL_CHECK_002
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_002', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(1);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_003
     * @tc.number NULL_CHECK_003
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_003', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(2);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_004
     * @tc.number NULL_CHECK_004
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_004', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(3);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_005
     * @tc.number NULL_CHECK_005
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_005', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(4);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_006
     * @tc.number NULL_CHECK_006
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_006', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(5);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_007
     * @tc.number NULL_CHECK_007
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_007', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(6);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_008
     * @tc.number NULL_CHECK_008
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_008', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(7);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_009
     * @tc.number NULL_CHECK_009
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_009', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(8);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_010
     * @tc.number NULL_CHECK_010
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_010', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(9);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_011
     * @tc.number NULL_CHECK_011
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_011', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(10);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_012
     * @tc.number NULL_CHECK_012
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_012', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(11);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_013
     * @tc.number NULL_CHECK_013
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_013', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(12);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_014
     * @tc.number NULL_CHECK_014
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_014', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(13);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_015
     * @tc.number NULL_CHECK_015
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_015', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(14);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_016
     * @tc.number NULL_CHECK_016
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_016', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(15);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_017
     * @tc.number NULL_CHECK_017
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_017', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(16);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_018
     * @tc.number NULL_CHECK_018
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_018', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(17);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_019
     * @tc.number NULL_CHECK_019
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_019', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(18);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_020
     * @tc.number NULL_CHECK_020
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_020', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(19);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_021
     * @tc.number NULL_CHECK_021
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_021', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(20);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_022
     * @tc.number NULL_CHECK_022
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_022', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(21);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   NULL_CHECK_023
     * @tc.number NULL_CHECK_023
     * @tc.desc   null check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NULL_CHECK_023', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_NullCheckTest(22);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   PARAM_CHECK_001
     * @tc.number PARAM_CHECK_001
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_001', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_ParamCheckTest(0);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   PARAM_CHECK_002
     * @tc.number PARAM_CHECK_002
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_002', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_ParamCheckTest(1);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   PARAM_CHECK_003
     * @tc.number PARAM_CHECK_003
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_003', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_ParamCheckTest(2);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   PARAM_CHECK_004
     * @tc.number PARAM_CHECK_004
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_004', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_ParamCheckTest(3);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   PARAM_CHECK_005
     * @tc.number PARAM_CHECK_005
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_005', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_ParamCheckTest(4);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   PARAM_CHECK_006
     * @tc.number PARAM_CHECK_006
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_006', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_ParamCheckTest(5);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   PARAM_CHECK_007
     * @tc.number PARAM_CHECK_007
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_007', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_ParamCheckTest(6);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   PARAM_CHECK_008
     * @tc.number PARAM_CHECK_008
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_008', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_ParamCheckTest(7);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   PARAM_CHECK_009
     * @tc.number PARAM_CHECK_009
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_009', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_ParamCheckTest(8);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   PARAM_CHECK_010
     * @tc.number PARAM_CHECK_010
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_010', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_ParamCheckTest(9);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   PARAM_CHECK_011
     * @tc.number PARAM_CHECK_011
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_011', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_ParamCheckTest(10);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   PARAM_CHECK_012
     * @tc.number PARAM_CHECK_012
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_012', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_ParamCheckTest(11);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   PARAM_CHECK_013
     * @tc.number PARAM_CHECK_013
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_013', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_ParamCheckTest(12);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   PARAM_CHECK_014
     * @tc.number PARAM_CHECK_014
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_014', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_ParamCheckTest(13);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   PARAM_CHECK_015
     * @tc.number PARAM_CHECK_015
     * @tc.desc   param check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PARAM_CHECK_015', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_ParamCheckTest(14);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_001
     * @tc.number STATUS_CHECK_001
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_001', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(0);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_002
     * @tc.number STATUS_CHECK_002
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_002', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(1);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_003
     * @tc.number STATUS_CHECK_003
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_003', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(2);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_004
     * @tc.number STATUS_CHECK_004
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_004', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(3);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_005
     * @tc.number STATUS_CHECK_005
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_005', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(4);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_006
     * @tc.number STATUS_CHECK_006
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_006', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(5);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_007
     * @tc.number STATUS_CHECK_007
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_007', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(6);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_008
     * @tc.number STATUS_CHECK_008
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_008', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(7);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_009
     * @tc.number STATUS_CHECK_009
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_009', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(8);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_010
     * @tc.number STATUS_CHECK_010
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_010', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(9);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_011
     * @tc.number STATUS_CHECK_011
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_011', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(10);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_012
     * @tc.number STATUS_CHECK_012
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_012', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(11);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_013
     * @tc.number STATUS_CHECK_013
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_013', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(12);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_014
     * @tc.number STATUS_CHECK_014
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_014', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(13);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_015
     * @tc.number STATUS_CHECK_015
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_015', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(14);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_016
     * @tc.number STATUS_CHECK_016
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_016', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(15);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_017
     * @tc.number STATUS_CHECK_017
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_017', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(16);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_018
     * @tc.number STATUS_CHECK_018
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_018', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(17);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_020
     * @tc.number STATUS_CHECK_020
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_020', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(19);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_021
     * @tc.number STATUS_CHECK_021
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_021', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(20);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_022
     * @tc.number STATUS_CHECK_022
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_022', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(21);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_023
     * @tc.number STATUS_CHECK_023
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_023', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(22);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_024
     * @tc.number STATUS_CHECK_024
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_024', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(23);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_025
     * @tc.number STATUS_CHECK_025
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_025', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(24);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_026
     * @tc.number STATUS_CHECK_026
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_026', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(25);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_028
     * @tc.number STATUS_CHECK_028
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_028', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(27);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_029
     * @tc.number STATUS_CHECK_029
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_029', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(28);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_030
     * @tc.number STATUS_CHECK_030
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_030', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(29);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_031
     * @tc.number STATUS_CHECK_031
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_031', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(30);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_032
     * @tc.number STATUS_CHECK_032
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_032', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(31);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_033
     * @tc.number STATUS_CHECK_033
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_033', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(32);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_034
     * @tc.number STATUS_CHECK_034
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_034', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(33);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_036
     * @tc.number STATUS_CHECK_036
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_036', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(35);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_037
     * @tc.number STATUS_CHECK_037
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_037', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(36);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_038
     * @tc.number STATUS_CHECK_038
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_038', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(37);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_039
     * @tc.number STATUS_CHECK_039
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_039', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(38);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_040
     * @tc.number STATUS_CHECK_040
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_040', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(39);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_041
     * @tc.number STATUS_CHECK_041
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_041', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(40);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_044
     * @tc.number STATUS_CHECK_044
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_044', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(43);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_045
     * @tc.number STATUS_CHECK_045
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_045', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(44);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_046
     * @tc.number STATUS_CHECK_046
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_046', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(45);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_047
     * @tc.number STATUS_CHECK_047
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_047', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(46);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_048
     * @tc.number STATUS_CHECK_048
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_048', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(47);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_049
     * @tc.number STATUS_CHECK_049
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_049', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(48);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_051
     * @tc.number STATUS_CHECK_051
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_051', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(50);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_052
     * @tc.number STATUS_CHECK_052
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_052', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(51);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_053
     * @tc.number STATUS_CHECK_053
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_053', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(52);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_055
     * @tc.number STATUS_CHECK_055
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_055', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(54);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_056
     * @tc.number STATUS_CHECK_056
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_056', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(55);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_057
     * @tc.number STATUS_CHECK_057
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_057', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(56);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_058
     * @tc.number STATUS_CHECK_058
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_058', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(57);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_060
     * @tc.number STATUS_CHECK_060
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_060', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(59);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_061
     * @tc.number STATUS_CHECK_061
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_061', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(60);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_062
     * @tc.number STATUS_CHECK_062
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_062', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(61);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_063
     * @tc.number STATUS_CHECK_063
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_063', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(62);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_064
     * @tc.number STATUS_CHECK_064
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_064', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(63);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_065
     * @tc.number STATUS_CHECK_065
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_065', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(64);
      expect(result).assertEqual(0);
      done();
    })
    /**
     * @tc.name   STATUS_CHECK_066
     * @tc.number STATUS_CHECK_066
     * @tc.desc   status check test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('STATUS_CHECK_066', Level.LEVEL2, async (done: Function) => {
      const result = libAudioEncoder.Audio_Encoder_StatusCheckTest(65);
      expect(result).assertEqual(0);
      done();
    })


  })
}