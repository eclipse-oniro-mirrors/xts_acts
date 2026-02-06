import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libNNCoreOps from 'libnncoreops.so';

export default function NNCoreOpsExpTest() {
  describe('NNCoreOpsExpTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Build_01
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Build_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Build_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Build_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpBuildTest(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Build_02
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Build_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Build_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Build_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpBuildTest(1);
      expect(result).assertEqual(0);
    })


    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Build_04
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Build_04
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Build_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Build_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpBuildTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Build_05
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Build_05
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Build_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Build_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpBuildTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Build_06
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Build_06
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Build_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Build_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpBuildTest(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Build_07
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Build_07
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Build_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Build_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpBuildTest(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_Finish_01
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_Finish_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_Finish_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_Finish_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelFinish(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_Finish_02
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_Finish_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_Finish_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_Finish_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelFinish(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_Finish_03
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_Finish_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_Finish_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_Finish_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelFinish(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_SetOperandValue_01
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_SetOperandValue_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_SetOperandValue_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_SetOperandValue_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelSetOperandValue(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_SetOperandValue_02
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_SetOperandValue_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_SetOperandValue_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_SetOperandValue_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelSetOperandValue(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_SetOperandValue_03
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_SetOperandValue_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_SetOperandValue_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_SetOperandValue_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelSetOperandValue(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_01
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelSpecifyInputsAndOutputs(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_02
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelSpecifyInputsAndOutputs(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_03
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelSpecifyInputsAndOutputs(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_04
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_04
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelSpecifyInputsAndOutputs(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_05
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_05
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelSpecifyInputsAndOutputs(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_06
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_06
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelSpecifyInputsAndOutputs(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_07
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_07
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelSpecifyInputsAndOutputs(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_08
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_08
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_SpecifyInputsAndOutputs_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelSpecifyInputsAndOutputs(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_01
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelAddOperation(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_02
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelAddOperation(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_03
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelAddOperation(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_04
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_04
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelAddOperation(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_05
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_05
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelAddOperation(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_06
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_06
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelAddOperation(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_07
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_07
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelAddOperation(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_08
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_08
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelAddOperation(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_09
     * @tc.number SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_09
     * @tc.desc   SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_09
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Exp_Model_AddOperation_09', Level.LEVEL0, () => {
      const result = libNNCoreOps.ExpModelModelAddOperation(8);
      expect(result).assertEqual(0);
    })

  })
}

