import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libNNCoreOps from 'libnncoreops.so';

export default function NNCoreOpsSinTest() {
  describe('NNCoreOpsSinTest', () => {
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
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Build_01
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Build_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Build_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Build_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinBuildTest(0);
      expect(result).assertEqual(0);
    })


    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Build_03
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Build_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Build_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Build_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinBuildTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Build_04
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Build_04
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Build_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Build_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinBuildTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Build_05
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Build_05
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Build_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Build_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinBuildTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_Finish_01
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_Finish_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_Finish_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_Finish_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelFinish(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_Finish_02
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_Finish_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_Finish_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_Finish_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelFinish(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_Finish_03
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_Finish_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_Finish_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_Finish_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelFinish(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_SetOperandValue_01
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_SetOperandValue_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_SetOperandValue_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_SetOperandValue_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelSetOperandValue(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_SetOperandValue_02
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_SetOperandValue_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_SetOperandValue_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_SetOperandValue_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelSetOperandValue(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_SetOperandValue_03
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_SetOperandValue_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_SetOperandValue_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_SetOperandValue_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelSetOperandValue(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_01
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelSpecifyInputsAndOutputs(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_02
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelSpecifyInputsAndOutputs(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_03
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelSpecifyInputsAndOutputs(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_04
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_04
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelSpecifyInputsAndOutputs(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_05
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_05
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelSpecifyInputsAndOutputs(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_06
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_06
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelSpecifyInputsAndOutputs(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_07
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_07
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelSpecifyInputsAndOutputs(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_08
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_08
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_SpecifyInputsAndOutputs_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelSpecifyInputsAndOutputs(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_01
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelAddOperation(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_02
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelAddOperation(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_03
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelAddOperation(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_04
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_04
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelAddOperation(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_05
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_05
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelAddOperation(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_06
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_06
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelAddOperation(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_07
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_07
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelAddOperation(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_08
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_08
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelAddOperation(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_09
     * @tc.number SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_09
     * @tc.desc   SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_09
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Sin_Model_AddOperation_09', Level.LEVEL0, () => {
      const result = libNNCoreOps.SinModelModelAddOperation(8);
      expect(result).assertEqual(0);
    })

  })
}
