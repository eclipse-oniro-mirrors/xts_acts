import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libNNCoreOps from 'libnncoreops.so';

export default function NNCoreOpsLogTest() {
  describe('NNCoreOpsLogTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Build_01
     * @tc.number SUB_AI_NNRt_Func_North_Log_Build_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Build_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Build_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogBuildTest(0);
      expect(result).assertEqual(0);
    })


    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Build_03
     * @tc.number SUB_AI_NNRt_Func_North_Log_Build_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Build_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Build_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogBuildTest(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Build_04
     * @tc.number SUB_AI_NNRt_Func_North_Log_Build_04
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Build_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Build_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogBuildTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Build_05
     * @tc.number SUB_AI_NNRt_Func_North_Log_Build_05
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Build_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Build_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogBuildTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_Finish_01
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_Finish_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_Finish_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_Finish_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelFinish(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_Finish_02
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_Finish_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_Finish_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_Finish_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelFinish(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_Finish_03
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_Finish_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_Finish_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_Finish_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelFinish(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_SetOperandValue_01
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_SetOperandValue_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_SetOperandValue_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_SetOperandValue_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelSetOperandValue(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_SetOperandValue_02
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_SetOperandValue_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_SetOperandValue_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_SetOperandValue_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelSetOperandValue(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_SetOperandValue_03
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_SetOperandValue_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_SetOperandValue_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_SetOperandValue_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelSetOperandValue(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_01
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelSpecifyInputsAndOutputs(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_02
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelSpecifyInputsAndOutputs(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_03
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelSpecifyInputsAndOutputs(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_04
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_04
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelSpecifyInputsAndOutputs(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_05
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_05
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelSpecifyInputsAndOutputs(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_06
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_06
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelSpecifyInputsAndOutputs(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_07
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_07
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelSpecifyInputsAndOutputs(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_08
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_08
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_SpecifyInputsAndOutputs_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelSpecifyInputsAndOutputs(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_01
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_AddOperation_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_AddOperation_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelAddOperation(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_02
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_AddOperation_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_AddOperation_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelAddOperation(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_03
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_AddOperation_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_AddOperation_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelAddOperation(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_04
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_AddOperation_04
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_AddOperation_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelAddOperation(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_05
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_AddOperation_05
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_AddOperation_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelAddOperation(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_06
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_AddOperation_06
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_AddOperation_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelAddOperation(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_07
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_AddOperation_07
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_AddOperation_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelAddOperation(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_08
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_AddOperation_08
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_AddOperation_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelAddOperation(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_09
     * @tc.number SUB_AI_NNRt_Func_North_Log_Model_AddOperation_09
     * @tc.desc   SUB_AI_NNRt_Func_North_Log_Model_AddOperation_09
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Log_Model_AddOperation_09', Level.LEVEL0, () => {
      const result = libNNCoreOps.LogModelModelAddOperation(8);
      expect(result).assertEqual(0);
    })
  })
}


