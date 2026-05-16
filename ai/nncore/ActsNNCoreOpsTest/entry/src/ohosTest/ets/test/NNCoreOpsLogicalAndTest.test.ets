import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libNNCoreOps from 'libnncoreops.so';

export default function NNCoreOpsLogicalAndTest() {
  describe('NNCoreOpsLogicalAndTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    // Build

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Build_03
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Build_03
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Build_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Build_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndBuildTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Build_04
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Build_04
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Build_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Build_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndBuildTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Build_05
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Build_05
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Build_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Build_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndBuildTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Build_06
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Build_06
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Build_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Build_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndBuildTest(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Build_07
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Build_07
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Build_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Build_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndBuildTest(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Build_08
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Build_08
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Build_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Build_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndBuildTest(7);
      expect(result).assertEqual(0);
    })

    // Model Finish
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_Finish_01
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_Finish_01
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_Finish_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_Finish_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelFinish(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_Finish_02
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_Finish_02
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_Finish_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_Finish_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelFinish(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_Finish_03
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_Finish_03
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_Finish_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_Finish_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelFinish(2);
      expect(result).assertEqual(0);
    })

    // Model SetOperandValue
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SetOperandValue_01
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_SetOperandValue_01
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SetOperandValue_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_SetOperandValue_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelSetOperandValue(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SetOperandValue_02
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_SetOperandValue_02
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SetOperandValue_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_SetOperandValue_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelSetOperandValue(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SetOperandValue_03
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_SetOperandValue_03
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SetOperandValue_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_SetOperandValue_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelSetOperandValue(2);
      expect(result).assertEqual(0);
    })

    // Model SpecifyInputsAndOutputs
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_01
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_01
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelSpecifyInputsAndOutputs(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_02
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_02
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelSpecifyInputsAndOutputs(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_03
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_03
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelSpecifyInputsAndOutputs(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_04
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_04
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelSpecifyInputsAndOutputs(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_05
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_05
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelSpecifyInputsAndOutputs(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_06
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_06
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelSpecifyInputsAndOutputs(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_07
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_07
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelSpecifyInputsAndOutputs(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_08
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_08
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_SpecifyInputsAndOutputs_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelSpecifyInputsAndOutputs(7);
      expect(result).assertEqual(0);
    })

    // Model AddOperation
    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_01
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_01
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelAddOperation(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_02
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_02
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelAddOperation(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_03
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_03
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelAddOperation(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_04
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_04
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelAddOperation(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_05
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_05
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelAddOperation(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_06
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_06
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelAddOperation(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_07
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_07
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelAddOperation(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_08
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_08
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelAddOperation(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_09
     * @tc.number SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_09
     * @tc.desc   SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_09
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_LogicalAnd_Model_AddOperation_09', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogicalAndModelModelAddOperation(8);
      expect(result).assertEqual(0);
    })
  })
}


