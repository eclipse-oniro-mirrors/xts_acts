import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import hiappevent from 'libentry.so'

export default function OhHiAppEventSetEventConfig() {
  describe('ActsHiAppEventSetEventConfigTest', () => {
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
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_001
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_001
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig1();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig2();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_003
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_003
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig3();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_004
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_004
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig4();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_005
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_005
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_005',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig5();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_006
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_006
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_006',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig6();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_007
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_007
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_007',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig7();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_008
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_008
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_008',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig8();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_009
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_009
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_009',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig9();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_010
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_010
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_010',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig10();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_011
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_011
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_011',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig11();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_012
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_012
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_012',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig12();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_013
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_013
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_013',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig13();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_014
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_014
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_014',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig14();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_015
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_015
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_015',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig15();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_016
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_016
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_016',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig16();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_017
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_017
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_017',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig17();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_018
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_018
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_018',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig18();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_019
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_019
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_019',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig19();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_020
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_020
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_020',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig20();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_021
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_021
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_021',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig21();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_022
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_022
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_022',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig22();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_023
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_023
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_023',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig23();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_024
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_024
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_024',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig24();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_025
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_025
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_025',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig25();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_026
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_026
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_026',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig26();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_027
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_027
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_027',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig27();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_028
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_028
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_028',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig28();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_029
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_029
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_029',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig29();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_030
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_030
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_030',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig30();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_031
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_031
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_031',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig31();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_032
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_032
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_032',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig32();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_033
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_033
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_033',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig33();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_034
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_034
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_034',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig34();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_035
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_035
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_035',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig35();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_036
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_036
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_036',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig36();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_037
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_037
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_037',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig37();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_038
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_038
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_038',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig38();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_039
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_039
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_039',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig39();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_040
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_040
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_040',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig40();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_041
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_041
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_041',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig41();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_042
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_042
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_042',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig42();
      expect(result).assertEqual(2);
      done();
    });

    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_043
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_043
     * @tc.desc   test OH_HiAppEvent_Write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_043',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hiappevent.OhHiappEventSetEventConfig43();
      expect(result).assertEqual(2);
      done();
    });


  })
}