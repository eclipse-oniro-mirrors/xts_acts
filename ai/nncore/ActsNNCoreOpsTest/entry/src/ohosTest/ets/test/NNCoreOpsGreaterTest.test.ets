import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libNNCoreOps from 'libnncoreops.so';

export default function NNCoreOpsGreaterTest() {
  describe('NNCoreOpsGreaterTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Build_01
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Build_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Build_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Build_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterBuildTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Build_02
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Build_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Build_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Build_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterBuildTest(1);
      expect(result).assertEqual(0);
    })


    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Build_04
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Build_04
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Build_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Build_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterBuildTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Build_05
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Build_05
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Build_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Build_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterBuildTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Build_06
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Build_06
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Build_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Build_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterBuildTest(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Build_07
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Build_07
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Build_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Build_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterBuildTest(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_Finish_01
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_Finish_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_Finish_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_Finish_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelFinish(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_Finish_02
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_Finish_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_Finish_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_Finish_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelFinish(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_Finish_03
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_Finish_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_Finish_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_Finish_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelFinish(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_SetOperandValue_01
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_SetOperandValue_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_SetOperandValue_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_SetOperandValue_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelSetOperandValue(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_SetOperandValue_02
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_SetOperandValue_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_SetOperandValue_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_SetOperandValue_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelSetOperandValue(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_SetOperandValue_03
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_SetOperandValue_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_SetOperandValue_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_SetOperandValue_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelSetOperandValue(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_01
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelSpecifyInputsAndOutputs(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_02
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelSpecifyInputsAndOutputs(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_03
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelSpecifyInputsAndOutputs(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_04
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_04
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelSpecifyInputsAndOutputs(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_05
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_05
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelSpecifyInputsAndOutputs(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_06
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_06
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelSpecifyInputsAndOutputs(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_07
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_07
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelSpecifyInputsAndOutputs(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_08
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_08
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_SpecifyInputsAndOutputs_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelSpecifyInputsAndOutputs(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_01
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelAddOperation(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_02
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelAddOperation(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_03
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelAddOperation(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_04
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_04
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelAddOperation(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_05
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_05
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelAddOperation(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_06
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_06
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelAddOperation(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_07
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_07
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelAddOperation(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_08
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_08
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelAddOperation(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_09
     * @tc.number SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_09
     * @tc.desc   SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_09
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Greater_Model_AddOperation_09', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterModelModelAddOperation(8);
      expect(result).assertEqual(0);
    })

  })
}

