import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libNNCoreOps from 'libnncoreops.so';

export default function NNCoreOpsHardSigmoidTest() {
  describe('NNCoreOpsHardSigmoidTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Build_01
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Build_01
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Build_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Build_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidBuildTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Build_02
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Build_02
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Build_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Build_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidBuildTest(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Build_03
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Build_03
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Build_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Build_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidBuildTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Build_04
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Build_04
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Build_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Build_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidBuildTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Build_05
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Build_05
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Build_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Build_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidBuildTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_Finish_01
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_Finish_01
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_Finish_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_Finish_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelFinish(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_Finish_02
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_Finish_02
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_Finish_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_Finish_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelFinish(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_Finish_03
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_Finish_03
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_Finish_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_Finish_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelFinish(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SetOperandValue_01
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_SetOperandValue_01
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SetOperandValue_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_SetOperandValue_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelSetOperandValue(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SetOperandValue_02
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_SetOperandValue_02
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SetOperandValue_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_SetOperandValue_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelSetOperandValue(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SetOperandValue_03
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_SetOperandValue_03
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SetOperandValue_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_SetOperandValue_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelSetOperandValue(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_01
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_01
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelSpecifyInputsAndOutputs(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_02
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_02
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelSpecifyInputsAndOutputs(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_03
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_03
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelSpecifyInputsAndOutputs(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_04
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_04
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelSpecifyInputsAndOutputs(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_05
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_05
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelSpecifyInputsAndOutputs(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_06
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_06
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelSpecifyInputsAndOutputs(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_07
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_07
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelSpecifyInputsAndOutputs(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_08
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_08
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_SpecifyInputsAndOutputs_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelSpecifyInputsAndOutputs(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_01
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_01
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelAddOperation(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_02
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_02
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelAddOperation(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_03
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_03
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelAddOperation(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_04
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_04
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelAddOperation(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_05
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_05
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelAddOperation(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_06
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_06
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelAddOperation(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_07
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_07
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelAddOperation(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_08
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_08
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelAddOperation(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_09
     * @tc.number SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_09
     * @tc.desc   SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_09
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_HardSigmoid_Model_AddOperation_09', Level.LEVEL0, () => {
      const result = libNNCoreOps.HardSigmoidModelModelAddOperation(8);
      expect(result).assertEqual(0);
    })

  })
}

