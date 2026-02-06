import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libNNCoreOps from 'libnncoreops.so';

export default function NNCoreOpsGreaterEqualTest() {
  describe('NNCoreOpsGreaterEqualTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Build_01
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Build_01
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Build_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Build_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualBuildTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Build_02
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Build_02
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Build_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Build_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualBuildTest(1);
      expect(result).assertEqual(0);
    })


    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Build_04
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Build_04
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Build_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Build_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualBuildTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Build_05
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Build_05
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Build_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Build_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualBuildTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Build_06
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Build_06
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Build_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Build_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualBuildTest(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Build_07
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Build_07
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Build_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Build_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualBuildTest(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_Finish_01
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_Finish_01
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_Finish_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_Finish_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelFinish(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_Finish_02
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_Finish_02
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_Finish_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_Finish_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelFinish(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_Finish_03
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_Finish_03
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_Finish_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_Finish_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelFinish(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SetOperandValue_01
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_SetOperandValue_01
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SetOperandValue_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_SetOperandValue_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelSetOperandValue(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SetOperandValue_02
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_SetOperandValue_02
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SetOperandValue_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_SetOperandValue_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelSetOperandValue(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SetOperandValue_03
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_SetOperandValue_03
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SetOperandValue_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_SetOperandValue_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelSetOperandValue(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_01
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_01
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelSpecifyInputsAndOutputs(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_02
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_02
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelSpecifyInputsAndOutputs(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_03
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_03
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelSpecifyInputsAndOutputs(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_04
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_04
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelSpecifyInputsAndOutputs(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_05
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_05
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelSpecifyInputsAndOutputs(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_06
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_06
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelSpecifyInputsAndOutputs(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_07
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_07
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelSpecifyInputsAndOutputs(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_08
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_08
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_SpecifyInputsAndOutputs_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelSpecifyInputsAndOutputs(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_01
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_01
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelAddOperation(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_02
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_02
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelAddOperation(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_03
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_03
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelAddOperation(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_04
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_04
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelAddOperation(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_05
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_05
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelAddOperation(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_06
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_06
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelAddOperation(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_07
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_07
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelAddOperation(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_08
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_08
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelAddOperation(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_09
     * @tc.number SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_09
     * @tc.desc   SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_09
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_GreaterEqual_Model_AddOperation_09', Level.LEVEL0, () => {
      const result = libNNCoreOps.GreaterEqualModelModelAddOperation(8);
      expect(result).assertEqual(0);
    })

  })
}

