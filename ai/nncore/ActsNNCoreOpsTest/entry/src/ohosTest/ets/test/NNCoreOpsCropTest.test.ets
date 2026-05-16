import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libNNCoreOps from 'libnncoreops.so';

export default function NNCoreOpsCropTest() {
  describe('NNCoreOpsCropTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })


    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Build_04
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Build_04
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Build_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Build_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropBuildTest(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Build_05
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Build_05
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Build_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Build_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropBuildTest(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Build_06
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Build_06
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Build_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Build_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropBuildTest(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_Finish_01
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_Finish_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_Finish_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_Finish_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelFinish(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_Finish_02
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_Finish_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_Finish_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_Finish_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelFinish(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_Finish_03
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_Finish_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_Finish_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_Finish_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelFinish(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_SetOperandValue_01
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_SetOperandValue_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_SetOperandValue_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_SetOperandValue_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelSetOperandValue(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_SetOperandValue_02
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_SetOperandValue_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_SetOperandValue_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_SetOperandValue_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelSetOperandValue(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_SetOperandValue_03
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_SetOperandValue_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_SetOperandValue_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_SetOperandValue_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelSetOperandValue(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_01
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelSpecifyInputsAndOutputs(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_02
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelSpecifyInputsAndOutputs(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_03
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelSpecifyInputsAndOutputs(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_04
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_04
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelSpecifyInputsAndOutputs(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_05
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_05
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelSpecifyInputsAndOutputs(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_06
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_06
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelSpecifyInputsAndOutputs(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_07
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_07
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelSpecifyInputsAndOutputs(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_08
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_08
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_SpecifyInputsAndOutputs_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelSpecifyInputsAndOutputs(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_01
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_01
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_01', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelAddOperation(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_02
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_02
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_02', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelAddOperation(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_03
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_03
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_03
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_03', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelAddOperation(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_04
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_04
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_04
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_04', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelAddOperation(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_05
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_05
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_05
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_05', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelAddOperation(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_06
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_06
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_06', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelAddOperation(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_07
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_07
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_07
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_07', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelAddOperation(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_08
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_08
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_08
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_08', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelAddOperation(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_09
     * @tc.number SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_09
     * @tc.desc   SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_09
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AI_NNRt_Func_North_Crop_Model_AddOperation_09', Level.LEVEL0, () => {
      const result = libNNCoreOps.CropModelModelAddOperation(8);
      expect(result).assertEqual(0);
    })
  })
}


