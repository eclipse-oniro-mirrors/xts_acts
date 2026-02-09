import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe,
 expect, it, TestType, Size, Level } from '@ohos/hypium';
import audiosuiteenginetest from 'libaudiosuiteenginetest.so';
import { TEST_RESULT, AUDIOSUITE_RESULT } from './Constants.test'

export default function AudioSuiteEngineTest() {
  describe('ActsAudioSuiteEngineTest', () => {
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
     * @tc.name   AudioSuiteEngineCreateTest_0003
     * @tc.number AudioSuiteEngineCreateTest_0003
     * @tc.desc   AudioSuiteEngineCreate AUDIOSUITE_SUCCESS test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AudioSuiteEngineCreateTest_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngineCreateTest_0003 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngineCreateTest_0003();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngineCreateTest_0003 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteEngineCreateTest_0004
     * @tc.number AudioSuiteEngineCreateTest_0004
     * @tc.desc   AudioSuiteEngineCreate AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteEngineCreateTest_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngineCreateTest_0004 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngineCreateTest_0004();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngineCreateTest_0004 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteEngineCreateTest_0005
     * @tc.number AudioSuiteEngineCreateTest_0005
     * @tc.desc   AudioSuiteEngineCreate AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteEngineCreateTest_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngineCreateTest_0005 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngineCreateTest_0005();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngineCreateTest_0005 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteEngineDestroyTest_0001
     * @tc.number AudioSuiteEngineDestroyTest_0001
     * @tc.desc   AudioSuiteEngineDestroy AUDIOSUITE_SUCCESS test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AudioSuiteEngineDestroyTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngineDestroyTest_0001 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngineDestroyTest_0001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngineDestroyTest_0001 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteEngineDestroyTest_0002
     * @tc.number AudioSuiteEngineDestroyTest_0002
     * @tc.desc   AudioSuiteEngineDestroy AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteEngineDestroyTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngineDestroyTest_0002 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngineDestroyTest_0002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngineDestroyTest_0002 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteEngineDestroyTest_0003
     * @tc.number AudioSuiteEngineDestroyTest_0003
     * @tc.desc   AudioSuiteEngineDestroy AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteEngineDestroyTest_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngineDestroyTest_0003 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngineDestroyTest_0003();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngineDestroyTest_0003 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetNodeTypeTest_0001
     * @tc.number AudioSuiteNodeBuilderSetNodeTypeTest_0001
     * @tc.desc   AudioSuitNodeBuilderSetNodeTypeTest AUDIOSUITE_SUCCESS test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AudioSuiteNodeBuilderSetNodeTypeTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetNodeTypeTest_0001 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetNodeTypeTest_0001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetNodeTypeTest_0001 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetNodeTypeTest_0002
     * @tc.number AudioSuiteNodeBuilderSetNodeTypeTest_0002
     * @tc.desc   AudioSuitNodeBuilderSetNodeTypeTest AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AudioSuiteNodeBuilderSetNodeTypeTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetNodeTypeTest_0002 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetNodeTypeTest_0002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetNodeTypeTest_0002 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetFormatTest_0001
     * @tc.number AudioSuiteNodeBuilderSetFormatTest_0001
     * @tc.desc   AudioSuitInputNodeBuilderSetFormatTest single track test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AudioSuiteNodeBuilderSetFormatTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0001 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormatTest_0001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0001 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetFormatTest_0002
     * @tc.number AudioSuiteNodeBuilderSetFormatTest_0002
     * @tc.desc   AudioSuitInputNodeBuilderSetFormatTest double track test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteNodeBuilderSetFormatTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0002 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormatTest_0002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0002 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetFormatTest_0003
     * @tc.number AudioSuiteNodeBuilderSetFormatTest_0003
     * @tc.desc   AudioSuitInputNodeBuilderSetFormatTest AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteNodeBuilderSetFormatTest_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0003 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormatTest_0003();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0003 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetFormatTest_0004
     * @tc.number AudioSuiteNodeBuilderSetFormatTest_0004
     * @tc.desc   AudioSuitInputNodeBuilderSetFormatTest AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteNodeBuilderSetFormatTest_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0004 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormatTest_0004();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0004 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetFormatTest_0005
     * @tc.number AudioSuiteNodeBuilderSetFormatTest_0005
     * @tc.desc   AudioSuitOutputNodeBuilderSetFormatTest single track test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AudioSuiteNodeBuilderSetFormatTest_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0005 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormatTest_0005();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0005 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetFormatTest_0006
     * @tc.number AudioSuiteNodeBuilderSetFormatTest_0006
     * @tc.desc   AudioSuitOutputNodeBuilderSetFormatTest double track test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AudioSuiteNodeBuilderSetFormatTest_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0006 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormatTest_0006();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0006 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetFormatTest_0007
     * @tc.number AudioSuiteNodeBuilderSetFormatTest_0007
     * @tc.desc   AudioSuitOutputNodeBuilderSetFormatTest AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteNodeBuilderSetFormatTest_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0007 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormatTest_0007();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0007 end ====>');
      done();
    })
    /**
     * @tc.name   AudioSuiteNodeBuilderSetFormatTest_0008
     * @tc.number AudioSuiteNodeBuilderSetFormatTest_0008
     * @tc.desc   AudioSuitOutputNodeBuilderSetFormatTest AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AudioSuiteNodeBuilderSetFormatTest_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0008 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilderSetFormatTest_0008();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteNodeBuilderSetFormatTest_0008 end ====>');
      done();
    })
    /**
     * @tc.name   InputNodeRequestDataCallbackTest_0001
     * @tc.number InputNodeRequestDataCallbackTest_0001
     * @tc.desc   InputNodeRequestDataCallbackTest AUDIOSUITE_SUCCESS test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InputNodeRequestDataCallbackTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('=====> InputNodeRequestDataCallbackTest_0001 start ====>');
      let result : number = audiosuiteenginetest.InputNodeRequestDataCallbackTest_0001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> InputNodeRequestDataCallbackTest_0001 end ====>');
      done();
    })
    /**
     * @tc.name   InputNodeRequestDataCallbackTest_0002
     * @tc.number InputNodeRequestDataCallbackTest_0002
     * @tc.desc   InputNodeRequestDataCallbackTest AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InputNodeRequestDataCallbackTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> InputNodeRequestDataCallbackTest_0002 start ====>');
      let result : number = audiosuiteenginetest.InputNodeRequestDataCallbackTest_0002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> InputNodeRequestDataCallbackTest_0002 end ====>');
      done();
    })

    /**
     * @tc.number      AudioSuiteEngineBypassEffectNodeTest_0001
     * @tc.name        AudioSuiteEngineBypassEffectNodeTest_0001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngineBypassEffectNodeTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineBypassEffectNodeTest_0001();
      console.info(`Tag: AudioSuiteEngineBypassEffectNodeTest_0001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineBypassEffectNodeTest_0002
     * @tc.name        AudioSuiteEngineBypassEffectNodeTest_0002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngineBypassEffectNodeTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineBypassEffectNodeTest_0002();
      console.info(`Tag: AudioSuiteEngineBypassEffectNodeTest_0002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineBypassEffectNodeTest_0003
     * @tc.name        AudioSuiteEngineBypassEffectNodeTest_0003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineBypassEffectNodeTest_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineBypassEffectNodeTest_0003();
      console.info(`Tag: AudioSuiteEngineBypassEffectNodeTest_0003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineBypassEffectNodeTest_0004
     * @tc.name        AudioSuiteEngineBypassEffectNodeTest_0004
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineBypassEffectNodeTest_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineBypassEffectNodeTest_0004();
      console.info(`Tag: AudioSuiteEngineBypassEffectNodeTest_0004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineBypassEffectNodeTest_0005
     * @tc.name        AudioSuiteEngineBypassEffectNodeTest_0005
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 3
     */
    it('AudioSuiteEngineBypassEffectNodeTest_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineBypassEffectNodeTest_0005();
      console.info(`Tag: AudioSuiteEngineBypassEffectNodeTest_0005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0001
     * @tc.name        AudioSuiteEngineConnectNodesTest_0001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngineConnectNodesTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0001();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0002
     * @tc.name        AudioSuiteEngineConnectNodesTest_0002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0002();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0003
     * @tc.name        AudioSuiteEngineConnectNodesTest_0003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0003();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0004
     * @tc.name        AudioSuiteEngineConnectNodesTest_0004
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0004();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0005
     * @tc.name        AudioSuiteEngineConnectNodesTest_0005
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0005();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0006
     * @tc.name        AudioSuiteEngineConnectNodesTest_0006
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0006();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0006 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0007
     * @tc.name        AudioSuiteEngineConnectNodesTest_0007
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0007();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0007 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0008
     * @tc.name        AudioSuiteEngineConnectNodesTest_0008
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0008();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0008 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0009
     * @tc.name        AudioSuiteEngineConnectNodesTest_0009
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0009();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0009 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0010
     * @tc.name        AudioSuiteEngineConnectNodesTest_0010
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0010();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0010 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0011
     * @tc.name        AudioSuiteEngineConnectNodesTest_0011
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngineConnectNodesTest_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0011();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0011 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0012
     * @tc.name        AudioSuiteEngineConnectNodesTest_0012
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0012();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0012 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0013
     * @tc.name        AudioSuiteEngineConnectNodesTest_0013
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0013();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0013 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0014
     * @tc.name        AudioSuiteEngineConnectNodesTest_0014
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0014();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0014 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0015
     * @tc.name        AudioSuiteEngineConnectNodesTest_0015
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0015();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0015 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0016
     * @tc.name        AudioSuiteEngineConnectNodesTest_0016
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0016();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0016 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0017
     * @tc.name        AudioSuiteEngineConnectNodesTest_0017
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0017();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0017 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0018
     * @tc.name        AudioSuiteEngineConnectNodesTest_0018
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0018();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0018 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineConnectNodesTest_0019
     * @tc.name        AudioSuiteEngineConnectNodesTest_0019
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineConnectNodesTest_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineConnectNodesTest_0019();
      console.info(`Tag: AudioSuiteEngineConnectNodesTest_0019 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0001
     * @tc.name        AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0001();
      console.info(`Tag: AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0002
     * @tc.name        AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0002();
      console.info(`Tag: AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0003
     * @tc.name        AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0003();
      console.info(`Tag: AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0004
     * @tc.name        AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0004
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0004();
      console.info(`Tag: AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0005
     * @tc.name        AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0005
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0005();
      console.info(`Tag: AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0006
     * @tc.name        AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0006
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0006();
      console.info(`Tag: AudioSuiteEngineSetEqualizerFrequencyBandGainsTest_0006 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0001
     * @tc.name        AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0001();
      console.info(`Tag: AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0002
     * @tc.name        AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0002();
      console.info(`Tag: AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0003
     * @tc.name        AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0003();
      console.info(`Tag: AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0004
     * @tc.name        AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0004
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0004();
      console.info(`Tag: AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0005
     * @tc.name        AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0005
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0005();
      console.info(`Tag: AudioSuiteEngineGetEqualizerFrequencyBandGainsTest_0005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineSetVoiceBeautifierTypeTest_0001
     * @tc.name        AudioSuiteEngineSetVoiceBeautifierTypeTest_0001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngineSetVoiceBeautifierTypeTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineSetVoiceBeautifierTypeTest_0001();
      console.info(`Tag: AudioSuiteEngineSetVoiceBeautifierTypeTest_0001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineSetVoiceBeautifierTypeTest_0002
     * @tc.name        AudioSuiteEngineSetVoiceBeautifierTypeTest_0002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineSetVoiceBeautifierTypeTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineSetVoiceBeautifierTypeTest_0002();
      console.info(`Tag: AudioSuiteEngineSetVoiceBeautifierTypeTest_0002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineSetVoiceBeautifierTypeTest_0003
     * @tc.name        AudioSuiteEngineSetVoiceBeautifierTypeTest_0003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineSetVoiceBeautifierTypeTest_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineSetVoiceBeautifierTypeTest_0003();
      console.info(`Tag: AudioSuiteEngineSetVoiceBeautifierTypeTest_0003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineSetVoiceBeautifierTypeTest_0004
     * @tc.name        AudioSuiteEngineSetVoiceBeautifierTypeTest_0004
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineSetVoiceBeautifierTypeTest_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineSetVoiceBeautifierTypeTest_0004();
      console.info(`Tag: AudioSuiteEngineSetVoiceBeautifierTypeTest_0004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineGetVoiceBeautifierTypeTest_0001
     * @tc.name        AudioSuiteEngineGetVoiceBeautifierTypeTest_0001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngineGetVoiceBeautifierTypeTest_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineGetVoiceBeautifierTypeTest_0001();
      console.info(`Tag: AudioSuiteEngineGetVoiceBeautifierTypeTest_0001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineGetVoiceBeautifierTypeTest_0002
     * @tc.name        AudioSuiteEngineGetVoiceBeautifierTypeTest_0002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineGetVoiceBeautifierTypeTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineGetVoiceBeautifierTypeTest_0002();
      console.info(`Tag: AudioSuiteEngineGetVoiceBeautifierTypeTest_0002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineGetVoiceBeautifierTypeTest_0003
     * @tc.name        AudioSuiteEngineGetVoiceBeautifierTypeTest_0003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineGetVoiceBeautifierTypeTest_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineGetVoiceBeautifierTypeTest_0003();
      console.info(`Tag: AudioSuiteEngineGetVoiceBeautifierTypeTest_0003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineGetVoiceBeautifierTypeTest_0004
     * @tc.name        AudioSuiteEngineGetVoiceBeautifierTypeTest_0004
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineGetVoiceBeautifierTypeTest_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineGetVoiceBeautifierTypeTest_0004();
      console.info(`Tag: AudioSuiteEngineGetVoiceBeautifierTypeTest_0004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineGetVoiceBeautifierTypeTest_0005
     * @tc.name        AudioSuiteEngineGetVoiceBeautifierTypeTest_0005
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineGetVoiceBeautifierTypeTest_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineGetVoiceBeautifierTypeTest_0005();
      console.info(`Tag: AudioSuiteEngineGetVoiceBeautifierTypeTest_0005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteNodeBuilder_Create
     * @tc.name        AudioSuiteNodeBuilder_Create
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteNodeBuilder_Create', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilder_Create();
      console.info(`Tag: AudioSuiteNodeBuilder_Create : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteNodeBuilder_Create_001
     * @tc.name        AudioSuiteNodeBuilder_Create_001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteNodeBuilder_Create_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilder_Create_001();
      console.info(`Tag: AudioSuiteNodeBuilder_Create_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteNodeBuilder_Destory
     * @tc.name        AudioSuiteNodeBuilder_Destory
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteNodeBuilder_Destory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilder_Destory();
      console.info(`Tag: AudioSuiteNodeBuilder_Destory : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteNodeBuilder_Destory_001
     * @tc.name        AudioSuiteNodeBuilder_Destory_001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteNodeBuilder_Destory_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilder_Destory_001();
      console.info(`Tag: AudioSuiteNodeBuilder_Destory_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteNodeBuilder_Reset
     * @tc.name        AudioSuiteNodeBuilder_Reset
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteNodeBuilder_Reset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilder_Reset();
      console.info(`Tag: AudioSuiteNodeBuilder_Reset : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteNodeBuilder_Reset_001
     * @tc.name        AudioSuiteNodeBuilder_Reset_001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteNodeBuilder_Reset_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteNodeBuilder_Reset_001();
      console.info(`Tag: AudioSuiteNodeBuilder_Reset_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineSetSoundFieldType_001
     * @tc.name        AudioSuiteEngineSetSoundFieldType_001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngineSetSoundFieldType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineSetSoundFieldType_001();
      console.info(`Tag: AudioSuiteEngineSetSoundFieldType_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineSetSoundFieldType_002
     * @tc.name        AudioSuiteEngineSetSoundFieldType_002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineSetSoundFieldType_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineSetSoundFieldType_002();
      console.info(`Tag: AudioSuiteEngineSetSoundFieldType_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineSetSoundFieldType_003
     * @tc.name        AudioSuiteEngineSetSoundFieldType_003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineSetSoundFieldType_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineSetSoundFieldType_003();
      console.info(`Tag: AudioSuiteEngineSetSoundFieldType_003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineSetSoundFieldType_004
     * @tc.name        AudioSuiteEngineSetSoundFieldType_004
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineSetSoundFieldType_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineSetSoundFieldType_004();
      console.info(`Tag: AudioSuiteEngineSetSoundFieldType_004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineGetSoundFieldType_001
     * @tc.name        AudioSuiteEngineGetSoundFieldType_001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngineGetSoundFieldType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineGetSoundFieldType_001();
      console.info(`Tag: AudioSuiteEngineGetSoundFieldType_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineGetSoundFieldType_002
     * @tc.name        AudioSuiteEngineGetSoundFieldType_002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineGetSoundFieldType_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineGetSoundFieldType_002();
      console.info(`Tag: AudioSuiteEngineGetSoundFieldType_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineGetSoundFieldType_003
     * @tc.name        AudioSuiteEngineGetSoundFieldType_003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineGetSoundFieldType_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineGetSoundFieldType_003();
      console.info(`Tag: AudioSuiteEngineGetSoundFieldType_003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngineGetSoundFieldType_004
     * @tc.name        AudioSuiteEngineGetSoundFieldType_004
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngineGetSoundFieldType_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngineGetSoundFieldType_004();
      console.info(`Tag: AudioSuiteEngineGetSoundFieldType_004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_SetEnvironmentType_001
     * @tc.name        AudioSuiteEngine_SetEnvironmentType_001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngine_SetEnvironmentType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetEnvironmentType_001();
      console.info(`Tag: AudioSuiteEngine_SetEnvironmentType_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_SetEnvironmentType_002
     * @tc.name        AudioSuiteEngine_SetEnvironmentType_002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_SetEnvironmentType_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetEnvironmentType_002();
      console.info(`Tag: AudioSuiteEngine_SetEnvironmentType_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_SetEnvironmentType_003
     * @tc.name        AudioSuiteEngine_SetEnvironmentType_003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_SetEnvironmentType_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetEnvironmentType_003();
      console.info(`Tag: AudioSuiteEngine_SetEnvironmentType_003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_SetEnvironmentType_004
     * @tc.name        AudioSuiteEngine_SetEnvironmentType_004
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_SetEnvironmentType_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetEnvironmentType_004();
      console.info(`Tag: AudioSuiteEngine_SetEnvironmentType_004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_GetEnvironmentType_001
     * @tc.name        AudioSuiteEngine_GetEnvironmentType_001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngine_GetEnvironmentType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetEnvironmentType_001();
      console.info(`Tag: AudioSuiteEngine_GetEnvironmentType_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_GetEnvironmentType_002
     * @tc.name        AudioSuiteEngine_GetEnvironmentType_002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_GetEnvironmentType_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetEnvironmentType_002();
      console.info(`Tag: AudioSuiteEngine_GetEnvironmentType_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_GetEnvironmentType_003
     * @tc.name        AudioSuiteEngine_GetEnvironmentType_003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_GetEnvironmentType_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetEnvironmentType_003();
      console.info(`Tag: AudioSuiteEngine_GetEnvironmentType_003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_GetEnvironmentType_004
     * @tc.name        AudioSuiteEngine_GetEnvironmentType_004
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_GetEnvironmentType_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetEnvironmentType_004();
      console.info(`Tag: AudioSuiteEngine_GetEnvironmentType_004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_GetNodeBypassStatus_001
     * @tc.name        AudioSuiteEngine_GetNodeBypassStatus_001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngine_GetNodeBypassStatus_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetNodeBypassStatus_001();
      console.info(`Tag: AudioSuiteEngine_GetNodeBypassStatus_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_GetNodeBypassStatus_002
     * @tc.name        AudioSuiteEngine_GetNodeBypassStatus_002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngine_GetNodeBypassStatus_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetNodeBypassStatus_002();
      console.info(`Tag: AudioSuiteEngine_GetNodeBypassStatus_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_GetNodeBypassStatus_003
     * @tc.name        AudioSuiteEngine_GetNodeBypassStatus_003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_GetNodeBypassStatus_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetNodeBypassStatus_003();
      console.info(`Tag: AudioSuiteEngine_GetNodeBypassStatus_003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_GetNodeBypassStatus_004
     * @tc.name        AudioSuiteEngine_GetNodeBypassStatus_004
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_GetNodeBypassStatus_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetNodeBypassStatus_004();
      console.info(`Tag: AudioSuiteEngine_GetNodeBypassStatus_004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_GetNodeBypassStatus_005
     * @tc.name        AudioSuiteEngine_GetNodeBypassStatus_005
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_GetNodeBypassStatus_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetNodeBypassStatus_005();
      console.info(`Tag: AudioSuiteEngine_GetNodeBypassStatus_005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_GetNodeBypassStatus_006
     * @tc.name        AudioSuiteEngine_GetNodeBypassStatus_006
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_GetNodeBypassStatus_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetNodeBypassStatus_006();
      console.info(`Tag: AudioSuiteEngine_GetNodeBypassStatus_006 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_GetNodeBypassStatus_007
     * @tc.name        AudioSuiteEngine_GetNodeBypassStatus_007
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_GetNodeBypassStatus_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetNodeBypassStatus_007();
      console.info(`Tag: AudioSuiteEngine_GetNodeBypassStatus_007 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_setAudioFormat_001
     * @tc.name        AudioSuiteEngine_setAudioFormat_001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngine_setAudioFormat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_setAudioFormat_001();
      console.info(`Tag: AudioSuiteEngine_setAudioFormat_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_setAudioFormat_002
     * @tc.name        AudioSuiteEngine_setAudioFormat_002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_setAudioFormat_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_setAudioFormat_002();
      console.info(`Tag: AudioSuiteEngine_setAudioFormat_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_setAudioFormat_003
     * @tc.name        AudioSuiteEngine_setAudioFormat_003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_setAudioFormat_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_setAudioFormat_003();
      console.info(`Tag: AudioSuiteEngine_setAudioFormat_003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_setAudioFormat_004
     * @tc.name        AudioSuiteEngine_setAudioFormat_004
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_setAudioFormat_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_setAudioFormat_004();
      console.info(`Tag: AudioSuiteEngine_setAudioFormat_004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_setAudioFormat_005
     * @tc.name        AudioSuiteEngine_setAudioFormat_005
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_setAudioFormat_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_setAudioFormat_005();
      console.info(`Tag: AudioSuiteEngine_setAudioFormat_005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_setAudioFormat_006
     * @tc.name        AudioSuiteEngine_setAudioFormat_006
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_setAudioFormat_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_setAudioFormat_006();
      console.info(`Tag: AudioSuiteEngine_setAudioFormat_006 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_DestroyNode_001
     * @tc.name        AudioSuiteEngine_DestroyNode_001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngine_DestroyNode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_DestroyNode_001();
      console.info(`Tag: AudioSuiteEngine_DestroyNode_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_DestroyNode_002
     * @tc.name        AudioSuiteEngine_DestroyNode_002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngine_DestroyNode_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_DestroyNode_002();
      console.info(`Tag: AudioSuiteEngine_DestroyNode_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_DestroyNode_003
     * @tc.name        AudioSuiteEngine_DestroyNode_003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_DestroyNode_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_DestroyNode_003();
      console.info(`Tag: AudioSuiteEngine_DestroyNode_003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_DestroyNode_004
     * @tc.name        AudioSuiteEngine_DestroyNode_004
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_DestroyNode_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_DestroyNode_004();
      console.info(`Tag: AudioSuiteEngine_DestroyNode_004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_DestroyNode_006
     * @tc.name        AudioSuiteEngine_DestroyNode_006
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_DestroyNode_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_DestroyNode_006();
      console.info(`Tag: AudioSuiteEngine_DestroyNode_006 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_CreateNode_001
     * @tc.name        AudioSuiteEngine_CreateNode_001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngine_CreateNode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreateNode_001();
      console.info(`Tag: AudioSuiteEngine_CreateNode_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_CreateNode_002
     * @tc.name        AudioSuiteEngine_CreateNode_002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngine_CreateNode_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreateNode_002();
      console.info(`Tag: AudioSuiteEngine_CreateNode_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_CreateNode_003
     * @tc.name        AudioSuiteEngine_CreateNode_003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_CreateNode_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreateNode_003();
      console.info(`Tag: AudioSuiteEngine_CreateNode_003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_CreateNode_004
     * @tc.name        AudioSuiteEngine_CreateNode_004
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_CreateNode_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreateNode_004();
      console.info(`Tag: AudioSuiteEngine_CreateNode_004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_CreateNode_005
     * @tc.name        AudioSuiteEngine_CreateNode_005
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_CreateNode_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreateNode_005();
      console.info(`Tag: AudioSuiteEngine_CreateNode_005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_CreateNode_006
     * @tc.name        AudioSuiteEngine_CreateNode_006
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_CreateNode_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreateNode_006();
      console.info(`Tag: AudioSuiteEngine_CreateNode_006 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_CreateNode_007
     * @tc.name        AudioSuiteEngine_CreateNode_007
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_CreateNode_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreateNode_007();
      console.info(`Tag: AudioSuiteEngine_CreateNode_007 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_CreateNode_008
     * @tc.name        AudioSuiteEngine_CreateNode_008
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngine_CreateNode_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreateNode_008();
      console.info(`Tag: AudioSuiteEngine_CreateNode_008 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_CreateNode_009
     * @tc.name        AudioSuiteEngine_CreateNode_009
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_CreateNode_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreateNode_009();
      console.info(`Tag: AudioSuiteEngine_CreateNode_009 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_CreateNode_010
     * @tc.name        AudioSuiteEngine_CreateNode_010
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_CreateNode_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreateNode_010();
      console.info(`Tag: AudioSuiteEngine_CreateNode_010 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_CreateNode_011
     * @tc.name        AudioSuiteEngine_CreateNode_011
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_CreateNode_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreateNode_011();
      console.info(`Tag: AudioSuiteEngine_CreateNode_011 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_CreateNode_012
     * @tc.name        AudioSuiteEngine_CreateNode_012
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_CreateNode_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreateNode_012();
      console.info(`Tag: AudioSuiteEngine_CreateNode_012 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_GetPipelineState001
     * @tc.name        AudioSuiteEngine_GetPipelineState001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngine_GetPipelineState001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetPipelineState001();
      console.info(`Tag: AudioSuiteEngine_GetPipelineState001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_GetPipelineState002
     * @tc.name        AudioSuiteEngine_GetPipelineState002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_GetPipelineState002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetPipelineState002();
      console.info(`Tag: AudioSuiteEngine_GetPipelineState002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_GetPipelineState003
     * @tc.name        AudioSuiteEngine_GetPipelineState003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_GetPipelineState003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetPipelineState003();
      console.info(`Tag: AudioSuiteEngine_GetPipelineState003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_RenderFrame001
     * @tc.name        AudioSuiteEngine_RenderFrame001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('AudioSuiteEngine_RenderFrame001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_RenderFrame001();
      console.info(`Tag: AudioSuiteEngine_RenderFrame001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_RenderFrame002
     * @tc.name        AudioSuiteEngine_RenderFrame002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_RenderFrame002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_RenderFrame002();
      console.info(`Tag: AudioSuiteEngine_RenderFrame002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_RenderFrame003
     * @tc.name        AudioSuiteEngine_RenderFrame003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_RenderFrame003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_RenderFrame003();
      console.info(`Tag: AudioSuiteEngine_RenderFrame003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_RenderFrame004
     * @tc.name        AudioSuiteEngine_RenderFrame004
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_RenderFrame004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_RenderFrame004();
      console.info(`Tag: AudioSuiteEngine_RenderFrame004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      AudioSuiteEngine_RenderFrame005
     * @tc.name        AudioSuiteEngine_RenderFrame005
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('AudioSuiteEngine_RenderFrame005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_RenderFrame005();
      console.info(`Tag: AudioSuiteEngine_RenderFrame005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      OH_AudioSuiteEngine_MultiRenderFrame_001
     * @tc.name        OH_AudioSuiteEngine_MultiRenderFrame_001
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 0
     */
    it('OH_AudioSuiteEngine_MultiRenderFrame_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.OH_AudioSuiteEngine_MultiRenderFrame_001();
      console.info(`Tag: OH_AudioSuiteEngine_MultiRenderFrame_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      OH_AudioSuiteEngine_MultiRenderFrame_002
     * @tc.name        OH_AudioSuiteEngine_MultiRenderFrame_002
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('OH_AudioSuiteEngine_MultiRenderFrame_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.OH_AudioSuiteEngine_MultiRenderFrame_002();
      console.info(`Tag: OH_AudioSuiteEngine_MultiRenderFrame_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      OH_AudioSuiteEngine_MultiRenderFrame_003
     * @tc.name        OH_AudioSuiteEngine_MultiRenderFrame_003
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('OH_AudioSuiteEngine_MultiRenderFrame_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.OH_AudioSuiteEngine_MultiRenderFrame_003();
      console.info(`Tag: OH_AudioSuiteEngine_MultiRenderFrame_003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      OH_AudioSuiteEngine_MultiRenderFrame_004
     * @tc.name        OH_AudioSuiteEngine_MultiRenderFrame_004
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('OH_AudioSuiteEngine_MultiRenderFrame_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.OH_AudioSuiteEngine_MultiRenderFrame_004();
      console.info(`Tag: OH_AudioSuiteEngine_MultiRenderFrame_004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number      OH_AudioSuiteEngine_MultiRenderFrame_005
     * @tc.name        OH_AudioSuiteEngine_MultiRenderFrame_005
     * @tc.desc        AudioSuiteEngine create test
     * @tc.size        MEDIUM
     * @tc.type        FUNCTION
     * @tc.level       LEVEL 2
     */
    it('OH_AudioSuiteEngine_MultiRenderFrame_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.OH_AudioSuiteEngine_MultiRenderFrame_005();
      console.info(`Tag: OH_AudioSuiteEngine_MultiRenderFrame_005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_CreatePipeline_0001
     * @tc.name       AudioSuiteEngine_CreatePipeline_0001
     * @tc.desc       AudioSuiteEngine createpipeline test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('AudioSuiteEngine_CreatePipeline_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreatePipeline_0001();
      console.info(`Tag: AudioSuiteEngine_CreatePipeline_0001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_CreatePipeline_0002
     * @tc.name       AudioSuiteEngine_CreatePipeline_0002
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('AudioSuiteEngine_CreatePipeline_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreatePipeline_0002();
      console.info(`Tag: AudioSuiteEngine_CreatePipeline_0002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_CreatePipeline_0003
     * @tc.name       AudioSuiteEngine_CreatePipeline_0003
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('AudioSuiteEngine_CreatePipeline_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreatePipeline_0003();
      console.info(`Tag: AudioSuiteEngine_CreatePipeline_0003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_CreatePipeline_0004
     * @tc.name       AudioSuiteEngine_CreatePipeline_0004
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_ERROR_ENGINE_NOT_EXIST test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('AudioSuiteEngine_CreatePipeline_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreatePipeline_0004();
      console.info(`Tag: AudioSuiteEngine_CreatePipeline_0004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_CreatePipeline_0005
     * @tc.name       AudioSuiteEngine_CreatePipeline_0005
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_ERROR_CREATE_EXCEED_SYSTEM_LIMITS test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('AudioSuiteEngine_CreatePipeline_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_CreatePipeline_0005();
      console.info(`Tag: AudioSuiteEngine_CreatePipeline_0005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_DestroyPipeline_0001
     * @tc.name       AudioSuiteEngine_DestroyPipeline_0001
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_SUCCESS test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('AudioSuiteEngine_DestroyPipeline_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_DestroyPipeline_0001();
      console.info(`Tag: AudioSuiteEngine_DestroyPipeline_0001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_DestroyPipeline_0002
     * @tc.name       AudioSuiteEngine_DestroyPipeline_0002
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('AudioSuiteEngine_DestroyPipeline_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_DestroyPipeline_0002();
      console.info(`Tag: AudioSuiteEngine_DestroyPipeline_0002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_DestroyPipeline_0003
     * @tc.name       AudioSuiteEngine_DestroyPipeline_0003
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_ERROR_PIPELINE_NOT_EXIST test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('AudioSuiteEngine_DestroyPipeline_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_DestroyPipeline_0003();
      console.info(`Tag: AudioSuiteEngine_DestroyPipeline_0003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_DestroyPipeline_0004
     * @tc.name       AudioSuiteEngine_DestroyPipeline_0004
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_ERROR_PIPELINE_NOT_EXIST test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('AudioSuiteEngine_DestroyPipeline_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_DestroyPipeline_0004();
      console.info(`Tag: AudioSuiteEngine_DestroyPipeline_0004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_StartPipeline_0001
     * @tc.name       AudioSuiteEngine_StartPipeline_0001
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_SUCCESS test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('AudioSuiteEngine_StartPipeline_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_StartPipeline_0001();
      console.info(`Tag: AudioSuiteEngine_StartPipeline_0001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_StartPipeline_0002
     * @tc.name       AudioSuiteEngine_StartPipeline_0002
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('AudioSuiteEngine_StartPipeline_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_StartPipeline_0002();
      console.info(`Tag: AudioSuiteEngine_StartPipeline_0002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_StartPipeline_0003
     * @tc.name       AudioSuiteEngine_StartPipeline_0003
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_ERROR_PIPELINE_NOT_EXIST test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('AudioSuiteEngine_StartPipeline_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_StartPipeline_0003();
      console.info(`Tag: AudioSuiteEngine_StartPipeline_0003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_StartPipeline_0004
     * @tc.name       AudioSuiteEngine_StartPipeline_0004
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('AudioSuiteEngine_StartPipeline_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_StartPipeline_0004();
      console.info(`Tag: AudioSuiteEngine_StartPipeline_0004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_StartPipeline_0005
     * @tc.name       AudioSuiteEngine_StartPipeline_0005
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('AudioSuiteEngine_StartPipeline_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_StartPipeline_0005();
      console.info(`Tag: AudioSuiteEngine_StartPipeline_0005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_StartPipeline_0006
     * @tc.name       AudioSuiteEngine_StartPipeline_0006
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('AudioSuiteEngine_StartPipeline_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_StartPipeline_0006();
      console.info(`Tag: AudioSuiteEngine_StartPipeline_0006 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_StopPipeline_0001
     * @tc.name       AudioSuiteEngine_StopPipeline_0001
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_ERROR_PIPELINE_NOT_EXIST test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('AudioSuiteEngine_StopPipeline_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_StopPipeline_0001();
      console.info(`Tag: AudioSuiteEngine_StopPipeline_0001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_StopPipeline_0002
     * @tc.name       AudioSuiteEngine_StopPipeline_0002
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_ERROR_INVALID_PARAM test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('AudioSuiteEngine_StopPipeline_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_StopPipeline_0002();
      console.info(`Tag: AudioSuiteEngine_StopPipeline_0002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_StopPipeline_0003
     * @tc.name       AudioSuiteEngine_StopPipeline_0003
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_ERROR_INVALID_STATE test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('AudioSuiteEngine_StopPipeline_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_StopPipeline_0003();
      console.info(`Tag: AudioSuiteEngine_StopPipeline_0003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_StopPipeline_0004
     * @tc.name       AudioSuiteEngine_StopPipeline_0004
     * @tc.desc       AudioSuiteEngine AUDIOSUITE_SUCCESS test
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('AudioSuiteEngine_StopPipeline_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_StopPipeline_0004();
      console.info(`Tag: AudioSuiteEngine_StopPipeline_0004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number     OH_AudioSuiteEngine_AudioNodeType_001
     * @tc.name       OH_AudioSuiteEngine_AudioNodeType_001
     * @tc.desc       AudioNodeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('OH_AudioSuiteEngine_AudioNodeType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.OH_AudioSuiteEngine_AudioNodeType_001();
      console.info(`Tag: OH_AudioSuiteEngine_AudioNodeType_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number     OH_AudioSuiteEngine_AudioNodeType_002
     * @tc.name       OH_AudioSuiteEngine_AudioNodeType_002
     * @tc.desc       AudioNodeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('OH_AudioSuiteEngine_AudioNodeType_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.OH_AudioSuiteEngine_AudioNodeType_002();
      console.info(`Tag: OH_AudioSuiteEngine_AudioNodeType_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     OH_AudioSuiteEngine_AudioNodeType_003
     * @tc.name       OH_AudioSuiteEngine_AudioNodeType_003
     * @tc.desc       AudioNodeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('OH_AudioSuiteEngine_AudioNodeType_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.OH_AudioSuiteEngine_AudioNodeType_003();
      console.info(`Tag: OH_AudioSuiteEngine_AudioNodeType_003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number     OH_AudioSuiteEngine_PipelineWorkMode_001
     * @tc.name       OH_AudioSuiteEngine_PipelineWorkMode_001
     * @tc.desc       AudioSuite PipelineWorkMode test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('OH_AudioSuiteEngine_PipelineWorkMode_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.OH_AudioSuiteEngine_PipelineWorkMode_001();
      console.info(`Tag: OH_AudioSuiteEngine_PipelineWorkMode_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number     OH_AudioSuiteEngine_AudioSuitePipelineState_001
     * @tc.name       OH_AudioSuiteEngine_AudioSuitePipelineState_001
     * @tc.desc       AudioSuitePipelineState test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('OH_AudioSuiteEngine_AudioSuitePipelineState_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.OH_AudioSuiteEngine_AudioSuitePipelineState_001();
      console.info(`Tag: OH_AudioSuiteEngine_AudioSuitePipelineState_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number     OH_AudioSuiteEngine_SampleFormat_001
     * @tc.name       OH_AudioSuiteEngine_SampleFormat_001
     * @tc.desc       AudioSuite SampleFormat test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('OH_AudioSuiteEngine_SampleFormat_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.OH_AudioSuiteEngine_SampleFormat_001();
      console.info(`Tag: OH_AudioSuiteEngine_SampleFormat_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number     OH_AudioSuiteEngine_SampleRate_001
     * @tc.name       OH_AudioSuiteEngine_SampleRate_001
     * @tc.desc       AudioSuite SampleRate test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('OH_AudioSuiteEngine_SampleRate_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.OH_AudioSuiteEngine_SampleRate_001();
      console.info(`Tag: OH_AudioSuiteEngine_SampleRate_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number     OH_AudioSuiteEngine_SampleRate_002
     * @tc.name       OH_AudioSuiteEngine_SampleRate_002
     * @tc.desc       AudioSuite SampleRate test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('OH_AudioSuiteEngine_SampleRate_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.OH_AudioSuiteEngine_SampleRate_002();
      console.info(`Tag: OH_AudioSuiteEngine_SampleRate_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number     OH_AudioSuiteEngine_AudioSuiteResult_001
     * @tc.name       OH_AudioSuiteEngine_AudioSuiteResult_001
     * @tc.desc       AudioSuiteResult test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('OH_AudioSuiteEngine_AudioSuiteResult_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.OH_AudioSuiteEngine_AudioSuiteResult_001();
      console.info(`Tag: OH_AudioSuiteEngine_AudioSuiteResult_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })
    
    /**
     * @tc.number     OH_AudioSuiteEngine_VoiceBeautifierType_001
     * @tc.name       OH_AudioSuiteEngine_VoiceBeautifierType_001
     * @tc.desc       AudioSuite VoiceBeautifierType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('OH_AudioSuiteEngine_VoiceBeautifierType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.OH_AudioSuiteEngine_VoiceBeautifierType_001();
      console.info(`Tag: OH_AudioSuiteEngine_VoiceBeautifierType_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_IsNodeTypeSupported_0001
     * @tc.name       AudioSuiteEngine_IsNodeTypeSupported_0001
     * @tc.desc       AudioSuite IsNodeTypeSupported test - AUDIOSUITE_SUCCESS
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_IsNodeTypeSupported_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_IsNodeTypeSupported_0001();
      console.info(`Tag: AudioSuiteEngine_IsNodeTypeSupported_0001 : ${result}`);
      expect(result).assertEqual(AUDIOSUITE_RESULT.AUDIOSUITE_SUCCESS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_IsNodeTypeSupported_0002
     * @tc.name       AudioSuiteEngine_IsNodeTypeSupported_0002
     * @tc.desc       AudioSuite IsNodeTypeSupported test - AUDIOSUITE_ERROR_INVALID_PARAM
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_IsNodeTypeSupported_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_IsNodeTypeSupported_0002();
      console.info(`Tag: AudioSuiteEngine_IsNodeTypeSupported_0002 : ${result}`);
      expect(result).assertEqual(AUDIOSUITE_RESULT.AUDIOSUITE_ERROR_INVALID_PARAM);
      done();
    })

    /**
     * @tc.number     AudioPureVoiceChangeTypeTest_001
     * @tc.name       AudioPureVoiceChangeTypeTest_001
     * @tc.desc       AudioSuite AudioPureVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioPureVoiceChangeTypeTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioPureVoiceChangeTypeTest_001();
      console.info(`Tag: AudioPureVoiceChangeTypeTest_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioPureVoiceChangeTypeTest_002
     * @tc.name       AudioPureVoiceChangeTypeTest_002
     * @tc.desc       AudioSuite AudioPureVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioPureVoiceChangeTypeTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioPureVoiceChangeTypeTest_002();
      console.info(`Tag: AudioPureVoiceChangeTypeTest_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioGeneralVoiceChangeTypeTest_001
     * @tc.name       AudioGeneralVoiceChangeTypeTest_001
     * @tc.desc       AudioSuite AudioGeneralVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioGeneralVoiceChangeTypeTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioGeneralVoiceChangeTypeTest_001();
      console.info(`Tag: AudioGeneralVoiceChangeTypeTest_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioGeneralVoiceChangeTypeTest_002
     * @tc.name       AudioGeneralVoiceChangeTypeTest_002
     * @tc.desc       AudioSuite AudioGeneralVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioGeneralVoiceChangeTypeTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioGeneralVoiceChangeTypeTest_002();
      console.info(`Tag: AudioGeneralVoiceChangeTypeTest_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioPureVoiceChangeGenderOptionTest_001
     * @tc.name       AudioPureVoiceChangeGenderOptionTest_001
     * @tc.desc       AudioSuite AudioPureVoiceChangeGenderOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioPureVoiceChangeGenderOptionTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioPureVoiceChangeGenderOptionTest_001();
      console.info(`Tag: AudioPureVoiceChangeGenderOptionTest_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetTempoAndPitch_001
     * @tc.name       AudioSuiteEngine_SetTempoAndPitch_001
     * @tc.desc       AudioSuite SetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_SetTempoAndPitch_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetTempoAndPitch_001();
      console.info(`Tag: AudioSuiteEngine_SetTempoAndPitch_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetTempoAndPitch_002
     * @tc.name       AudioSuiteEngine_SetTempoAndPitch_002
     * @tc.desc       AudioSuite SetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_SetTempoAndPitch_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetTempoAndPitch_002();
      console.info(`Tag: AudioSuiteEngine_SetTempoAndPitch_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetTempoAndPitch_003
     * @tc.name       AudioSuiteEngine_SetTempoAndPitch_003
     * @tc.desc       AudioSuite SetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetTempoAndPitch_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetTempoAndPitch_003();
      console.info(`Tag: AudioSuiteEngine_SetTempoAndPitch_003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetTempoAndPitch_004
     * @tc.name       AudioSuiteEngine_SetTempoAndPitch_004
     * @tc.desc       AudioSuite SetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetTempoAndPitch_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetTempoAndPitch_004();
      console.info(`Tag: AudioSuiteEngine_SetTempoAndPitch_004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetTempoAndPitch_005
     * @tc.name       AudioSuiteEngine_SetTempoAndPitch_005
     * @tc.desc       AudioSuite SetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetTempoAndPitch_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetTempoAndPitch_005();
      console.info(`Tag: AudioSuiteEngine_SetTempoAndPitch_005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetTempoAndPitch_006
     * @tc.name       AudioSuiteEngine_SetTempoAndPitch_006
     * @tc.desc       AudioSuite SetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetTempoAndPitch_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetTempoAndPitch_006();
      console.info(`Tag: AudioSuiteEngine_SetTempoAndPitch_006 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetTempoAndPitch_007
     * @tc.name       AudioSuiteEngine_SetTempoAndPitch_007
     * @tc.desc       AudioSuite SetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetTempoAndPitch_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetTempoAndPitch_007();
      console.info(`Tag: AudioSuiteEngine_SetTempoAndPitch_007 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetTempoAndPitch_008
     * @tc.name       AudioSuiteEngine_SetTempoAndPitch_008
     * @tc.desc       AudioSuite SetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetTempoAndPitch_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetTempoAndPitch_008();
      console.info(`Tag: AudioSuiteEngine_SetTempoAndPitch_008 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetTempoAndPitch_009
     * @tc.name       AudioSuiteEngine_SetTempoAndPitch_009
     * @tc.desc       AudioSuite SetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetTempoAndPitch_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetTempoAndPitch_009();
      console.info(`Tag: AudioSuiteEngine_SetTempoAndPitch_009 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetTempoAndPitch_010
     * @tc.name       AudioSuiteEngine_SetTempoAndPitch_010
     * @tc.desc       AudioSuite SetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetTempoAndPitch_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetTempoAndPitch_010();
      console.info(`Tag: AudioSuiteEngine_SetTempoAndPitch_010 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetTempoAndPitch_011
     * @tc.name       AudioSuiteEngine_SetTempoAndPitch_011
     * @tc.desc       AudioSuite SetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetTempoAndPitch_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetTempoAndPitch_011();
      console.info(`Tag: AudioSuiteEngine_SetTempoAndPitch_011 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetTempoAndPitch_001
     * @tc.name       AudioSuiteEngine_GetTempoAndPitch_001
     * @tc.desc       AudioSuite GetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_GetTempoAndPitch_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetTempoAndPitch_001();
      console.info(`Tag: AudioSuiteEngine_GetTempoAndPitch_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetTempoAndPitch_002
     * @tc.name       AudioSuiteEngine_GetTempoAndPitch_002
     * @tc.desc       AudioSuite GetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetTempoAndPitch_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetTempoAndPitch_002();
      console.info(`Tag: AudioSuiteEngine_GetTempoAndPitch_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetTempoAndPitch_003
     * @tc.name       AudioSuiteEngine_GetTempoAndPitch_003
     * @tc.desc       AudioSuite GetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetTempoAndPitch_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetTempoAndPitch_003();
      console.info(`Tag: AudioSuiteEngine_GetTempoAndPitch_003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetTempoAndPitch_004
     * @tc.name       AudioSuiteEngine_GetTempoAndPitch_004
     * @tc.desc       AudioSuite GetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetTempoAndPitch_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetTempoAndPitch_004();
      console.info(`Tag: AudioSuiteEngine_GetTempoAndPitch_004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetTempoAndPitch_005
     * @tc.name       AudioSuiteEngine_GetTempoAndPitch_005
     * @tc.desc       AudioSuite GetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetTempoAndPitch_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetTempoAndPitch_005();
      console.info(`Tag: AudioSuiteEngine_GetTempoAndPitch_005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetTempoAndPitch_006
     * @tc.name       AudioSuiteEngine_GetTempoAndPitch_006
     * @tc.desc       AudioSuite GetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetTempoAndPitch_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetTempoAndPitch_006();
      console.info(`Tag: AudioSuiteEngine_GetTempoAndPitch_006 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetTempoAndPitch_007
     * @tc.name       AudioSuiteEngine_GetTempoAndPitch_007
     * @tc.desc       AudioSuite GetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetTempoAndPitch_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetTempoAndPitch_007();
      console.info(`Tag: AudioSuiteEngine_GetTempoAndPitch_007 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetTempoAndPitch_008
     * @tc.name       AudioSuiteEngine_GetTempoAndPitch_008
     * @tc.desc       AudioSuite GetTempoAndPitch test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetTempoAndPitch_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetTempoAndPitch_008();
      console.info(`Tag: AudioSuiteEngine_GetTempoAndPitch_008 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetPureVoiceChangeOption_001
     * @tc.name       AudioSuiteEngine_SetPureVoiceChangeOption_001
     * @tc.desc       AudioSuite SetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetPureVoiceChangeOption_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetPureVoiceChangeOption_001();
      console.info(`Tag: AudioSuiteEngine_SetPureVoiceChangeOption_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetPureVoiceChangeOption_002
     * @tc.name       AudioSuiteEngine_SetPureVoiceChangeOption_002
     * @tc.desc       AudioSuite SetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_SetPureVoiceChangeOption_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetPureVoiceChangeOption_002();
      console.info(`Tag: AudioSuiteEngine_SetPureVoiceChangeOption_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetPureVoiceChangeOption_003
     * @tc.name       AudioSuiteEngine_SetPureVoiceChangeOption_003
     * @tc.desc       AudioSuite SetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_SetPureVoiceChangeOption_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetPureVoiceChangeOption_003();
      console.info(`Tag: AudioSuiteEngine_SetPureVoiceChangeOption_003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetPureVoiceChangeOption_004
     * @tc.name       AudioSuiteEngine_SetPureVoiceChangeOption_004
     * @tc.desc       AudioSuite SetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_SetPureVoiceChangeOption_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetPureVoiceChangeOption_004();
      console.info(`Tag: AudioSuiteEngine_SetPureVoiceChangeOption_004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetPureVoiceChangeOption_005
     * @tc.name       AudioSuiteEngine_SetPureVoiceChangeOption_005
     * @tc.desc       AudioSuite SetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_SetPureVoiceChangeOption_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetPureVoiceChangeOption_005();
      console.info(`Tag: AudioSuiteEngine_SetPureVoiceChangeOption_005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetPureVoiceChangeOption_006
     * @tc.name       AudioSuiteEngine_SetPureVoiceChangeOption_006
     * @tc.desc       AudioSuite SetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetPureVoiceChangeOption_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetPureVoiceChangeOption_006();
      console.info(`Tag: AudioSuiteEngine_SetPureVoiceChangeOption_006 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetPureVoiceChangeOption_007
     * @tc.name       AudioSuiteEngine_SetPureVoiceChangeOption_007
     * @tc.desc       AudioSuite SetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetPureVoiceChangeOption_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetPureVoiceChangeOption_007();
      console.info(`Tag: AudioSuiteEngine_SetPureVoiceChangeOption_007 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetPureVoiceChangeOption_008
     * @tc.name       AudioSuiteEngine_SetPureVoiceChangeOption_008
     * @tc.desc       AudioSuite SetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetPureVoiceChangeOption_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetPureVoiceChangeOption_008();
      console.info(`Tag: AudioSuiteEngine_SetPureVoiceChangeOption_008 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetPureVoiceChangeOption_009
     * @tc.name       AudioSuiteEngine_SetPureVoiceChangeOption_009
     * @tc.desc       AudioSuite SetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetPureVoiceChangeOption_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetPureVoiceChangeOption_009();
      console.info(`Tag: AudioSuiteEngine_SetPureVoiceChangeOption_009 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetPureVoiceChangeOption_010
     * @tc.name       AudioSuiteEngine_SetPureVoiceChangeOption_010
     * @tc.desc       AudioSuite SetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetPureVoiceChangeOption_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetPureVoiceChangeOption_010();
      console.info(`Tag: AudioSuiteEngine_SetPureVoiceChangeOption_010 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetPureVoiceChangeOption_011
     * @tc.name       AudioSuiteEngine_SetPureVoiceChangeOption_011
     * @tc.desc       AudioSuite SetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetPureVoiceChangeOption_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetPureVoiceChangeOption_011();
      console.info(`Tag: AudioSuiteEngine_SetPureVoiceChangeOption_011 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetPureVoiceChangeOption_001
     * @tc.name       AudioSuiteEngine_GetPureVoiceChangeOption_001
     * @tc.desc       AudioSuite GetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetPureVoiceChangeOption_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetPureVoiceChangeOption_001();
      console.info(`Tag: AudioSuiteEngine_GetPureVoiceChangeOption_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetPureVoiceChangeOption_002
     * @tc.name       AudioSuiteEngine_GetPureVoiceChangeOption_002
     * @tc.desc       AudioSuite GetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_GetPureVoiceChangeOption_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetPureVoiceChangeOption_002();
      console.info(`Tag: AudioSuiteEngine_GetPureVoiceChangeOption_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetPureVoiceChangeOption_003
     * @tc.name       AudioSuiteEngine_GetPureVoiceChangeOption_003
     * @tc.desc       AudioSuite GetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_GetPureVoiceChangeOption_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetPureVoiceChangeOption_003();
      console.info(`Tag: AudioSuiteEngine_GetPureVoiceChangeOption_003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetPureVoiceChangeOption_004
     * @tc.name       AudioSuiteEngine_GetPureVoiceChangeOption_004
     * @tc.desc       AudioSuite GetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_GetPureVoiceChangeOption_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetPureVoiceChangeOption_004();
      console.info(`Tag: AudioSuiteEngine_GetPureVoiceChangeOption_004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetPureVoiceChangeOption_005
     * @tc.name       AudioSuiteEngine_GetPureVoiceChangeOption_005
     * @tc.desc       AudioSuite GetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_GetPureVoiceChangeOption_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetPureVoiceChangeOption_005();
      console.info(`Tag: AudioSuiteEngine_GetPureVoiceChangeOption_005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetPureVoiceChangeOption_006
     * @tc.name       AudioSuiteEngine_GetPureVoiceChangeOption_006
     * @tc.desc       AudioSuite GetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetPureVoiceChangeOption_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetPureVoiceChangeOption_006();
      console.info(`Tag: AudioSuiteEngine_GetPureVoiceChangeOption_006 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetPureVoiceChangeOption_007
     * @tc.name       AudioSuiteEngine_GetPureVoiceChangeOption_007
     * @tc.desc       AudioSuite GetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetPureVoiceChangeOption_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetPureVoiceChangeOption_007();
      console.info(`Tag: AudioSuiteEngine_GetPureVoiceChangeOption_007 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetPureVoiceChangeOption_008
     * @tc.name       AudioSuiteEngine_GetPureVoiceChangeOption_008
     * @tc.desc       AudioSuite GetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetPureVoiceChangeOption_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetPureVoiceChangeOption_008();
      console.info(`Tag: AudioSuiteEngine_GetPureVoiceChangeOption_008 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetPureVoiceChangeOption_009
     * @tc.name       AudioSuiteEngine_GetPureVoiceChangeOption_009
     * @tc.desc       AudioSuite GetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetPureVoiceChangeOption_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetPureVoiceChangeOption_009();
      console.info(`Tag: AudioSuiteEngine_GetPureVoiceChangeOption_009 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetPureVoiceChangeOption_010
     * @tc.name       AudioSuiteEngine_GetPureVoiceChangeOption_010
     * @tc.desc       AudioSuite GetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetPureVoiceChangeOption_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetPureVoiceChangeOption_010();
      console.info(`Tag: AudioSuiteEngine_GetPureVoiceChangeOption_010 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetPureVoiceChangeOption_011
     * @tc.name       AudioSuiteEngine_GetPureVoiceChangeOption_011
     * @tc.desc       AudioSuite GetPureVoiceChangeOption test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetPureVoiceChangeOption_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetPureVoiceChangeOption_011();
      console.info(`Tag: AudioSuiteEngine_GetPureVoiceChangeOption_011 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetGeneralVoiceChangeType_001
     * @tc.name       AudioSuiteEngine_SetGeneralVoiceChangeType_001
     * @tc.desc       AudioSuite SetGeneralVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_SetGeneralVoiceChangeType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetGeneralVoiceChangeType_001();
      console.info(`Tag: AudioSuiteEngine_SetGeneralVoiceChangeType_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetGeneralVoiceChangeType_002
     * @tc.name       AudioSuiteEngine_SetGeneralVoiceChangeType_002
     * @tc.desc       AudioSuite SetGeneralVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetGeneralVoiceChangeType_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetGeneralVoiceChangeType_002();
      console.info(`Tag: AudioSuiteEngine_SetGeneralVoiceChangeType_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetGeneralVoiceChangeType_003
     * @tc.name       AudioSuiteEngine_SetGeneralVoiceChangeType_003
     * @tc.desc       AudioSuite SetGeneralVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetGeneralVoiceChangeType_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetGeneralVoiceChangeType_003();
      console.info(`Tag: AudioSuiteEngine_SetGeneralVoiceChangeType_003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetGeneralVoiceChangeType_004
     * @tc.name       AudioSuiteEngine_SetGeneralVoiceChangeType_004
     * @tc.desc       AudioSuite SetGeneralVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetGeneralVoiceChangeType_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetGeneralVoiceChangeType_004();
      console.info(`Tag: AudioSuiteEngine_SetGeneralVoiceChangeType_004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetGeneralVoiceChangeType_005
     * @tc.name       AudioSuiteEngine_SetGeneralVoiceChangeType_005
     * @tc.desc       AudioSuite SetGeneralVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetGeneralVoiceChangeType_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetGeneralVoiceChangeType_005();
      console.info(`Tag: AudioSuiteEngine_SetGeneralVoiceChangeType_005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_SetGeneralVoiceChangeType_006
     * @tc.name       AudioSuiteEngine_SetGeneralVoiceChangeType_006
     * @tc.desc       AudioSuite SetGeneralVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetGeneralVoiceChangeType_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetGeneralVoiceChangeType_006();
      console.info(`Tag: AudioSuiteEngine_SetGeneralVoiceChangeType_006 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetGeneralVoiceChangeType_001
     * @tc.name       AudioSuiteEngine_GetGeneralVoiceChangeType_001
     * @tc.desc       AudioSuite GetGeneralVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_GetGeneralVoiceChangeType_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetGeneralVoiceChangeType_001();
      console.info(`Tag: AudioSuiteEngine_GetGeneralVoiceChangeType_001 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetGeneralVoiceChangeType_002
     * @tc.name       AudioSuiteEngine_GetGeneralVoiceChangeType_002
     * @tc.desc       AudioSuite GetGeneralVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetGeneralVoiceChangeType_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetGeneralVoiceChangeType_002();
      console.info(`Tag: AudioSuiteEngine_GetGeneralVoiceChangeType_002 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetGeneralVoiceChangeType_003
     * @tc.name       AudioSuiteEngine_GetGeneralVoiceChangeType_003
     * @tc.desc       AudioSuite GetGeneralVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetGeneralVoiceChangeType_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetGeneralVoiceChangeType_003();
      console.info(`Tag: AudioSuiteEngine_GetGeneralVoiceChangeType_003 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetGeneralVoiceChangeType_004
     * @tc.name       AudioSuiteEngine_GetGeneralVoiceChangeType_004
     * @tc.desc       AudioSuite GetGeneralVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetGeneralVoiceChangeType_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetGeneralVoiceChangeType_004();
      console.info(`Tag: AudioSuiteEngine_GetGeneralVoiceChangeType_004 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetGeneralVoiceChangeType_005
     * @tc.name       AudioSuiteEngine_GetGeneralVoiceChangeType_005
     * @tc.desc       AudioSuite GetGeneralVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetGeneralVoiceChangeType_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetGeneralVoiceChangeType_005();
      console.info(`Tag: AudioSuiteEngine_GetGeneralVoiceChangeType_005 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetGeneralVoiceChangeType_006
     * @tc.name       AudioSuiteEngine_GetGeneralVoiceChangeType_006
     * @tc.desc       AudioSuite GetGeneralVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetGeneralVoiceChangeType_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetGeneralVoiceChangeType_006();
      console.info(`Tag: AudioSuiteEngine_GetGeneralVoiceChangeType_006 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetGeneralVoiceChangeType_007
     * @tc.name       AudioSuiteEngine_GetGeneralVoiceChangeType_007
     * @tc.desc       AudioSuite GetGeneralVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetGeneralVoiceChangeType_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetGeneralVoiceChangeType_007();
      console.info(`Tag: AudioSuiteEngine_GetGeneralVoiceChangeType_007 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.number     AudioSuiteEngine_GetGeneralVoiceChangeType_008
     * @tc.name       AudioSuiteEngine_GetGeneralVoiceChangeType_008
     * @tc.desc       AudioSuite GetGeneralVoiceChangeType test
     * @tc.size       MEDIUM
     * @tc.type       FUNCTION
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetGeneralVoiceChangeType_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetGeneralVoiceChangeType_008();
      console.info(`Tag: AudioSuiteEngine_GetGeneralVoiceChangeType_008 : ${result}`);
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      done();
    })

    /**
     * @tc.name       OH_AudioSuiteEngine_AudioNodeType_004
     * @tc.number     OH_AudioSuiteEngine_AudioNodeType_004
     * @tc.desc       OH_AudioNodeType and OH_AudioSuite_SurroundDirection enum
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 0
     */
    it('OH_AudioSuiteEngine_AudioNodeType_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('=====> OH_AudioSuiteEngine_AudioNodeType_004 start ====>');
      let result : number = audiosuiteenginetest.OH_AudioSuiteEngine_AudioNodeType_004();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> OH_AudioSuiteEngine_AudioNodeType_004 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_SetSpaceRenderPositionParams_001
     * @tc.number     AudioSuiteEngine_SetSpaceRenderPositionParams_001
     * @tc.desc       SetSpaceRenderPositionParams AUDIOSUITE_SUCCESS
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_SetSpaceRenderPositionParams_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_SetSpaceRenderPositionParams_001 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetSpaceRenderPositionParams_001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_SetSpaceRenderPositionParams_001 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_SetSpaceRenderPositionParams_002
     * @tc.number     AudioSuiteEngine_SetSpaceRenderPositionParams_002
     * @tc.desc       SetSpaceRenderPositionParams AUDIOSUITE_ERROR_NODE_NOT_EXIST
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetSpaceRenderPositionParams_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_SetSpaceRenderPositionParams_002 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetSpaceRenderPositionParams_002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_SetSpaceRenderPositionParams_002 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_SetSpaceRenderPositionParams_003
     * @tc.number     AudioSuiteEngine_SetSpaceRenderPositionParams_003
     * @tc.desc       SetSpaceRenderPositionParams AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetSpaceRenderPositionParams_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_SetSpaceRenderPositionParams_003 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetSpaceRenderPositionParams_003();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_SetSpaceRenderPositionParams_003 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_SetSpaceRenderPositionParams_004
     * @tc.number     AudioSuiteEngine_SetSpaceRenderPositionParams_004
     * @tc.desc       SetSpaceRenderPositionParams AUDIOSUITE_ERROR_INVALID_PARAM
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetSpaceRenderPositionParams_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_SetSpaceRenderPositionParams_004 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetSpaceRenderPositionParams_004();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_SetSpaceRenderPositionParams_004 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_SetSpaceRenderPositionParams_005
     * @tc.number     AudioSuiteEngine_SetSpaceRenderPositionParams_005
     * @tc.desc       SetSpaceRenderPositionParams AUDIOSUITE_ERROR_INVALID_PARAM
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetSpaceRenderPositionParams_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_SetSpaceRenderPositionParams_005 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetSpaceRenderPositionParams_005();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_SetSpaceRenderPositionParams_005 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderPositionParams_001
     * @tc.number     AudioSuiteEngine_GetSpaceRenderPositionParams_001
     * @tc.desc       GetSpaceRenderPositionParams AUDIOSUITE_SUCCESS
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_GetSpaceRenderPositionParams_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderPositionParams_001 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderPositionParams_001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderPositionParams_001 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderPositionParams_002
     * @tc.number     AudioSuiteEngine_GetSpaceRenderPositionParams_002
     * @tc.desc       GetSpaceRenderPositionParams AUDIOSUITE_ERROR_NODE_NOT_EXIST
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetSpaceRenderPositionParams_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderPositionParams_002 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderPositionParams_002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderPositionParams_002 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderPositionParams_003
     * @tc.number     AudioSuiteEngine_GetSpaceRenderPositionParams_003
     * @tc.desc       GetSpaceRenderPositionParams AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetSpaceRenderPositionParams_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderPositionParams_003 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderPositionParams_003();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderPositionParams_003 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderPositionParams_004
     * @tc.number     AudioSuiteEngine_GetSpaceRenderPositionParams_004
     * @tc.desc       GetSpaceRenderPositionParams AUDIOSUITE_ERROR_INVALID_PARAM
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetSpaceRenderPositionParams_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderPositionParams_004 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderPositionParams_004();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderPositionParams_004 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderPositionParams_005
     * @tc.number     AudioSuiteEngine_GetSpaceRenderPositionParams_005
     * @tc.desc       GetSpaceRenderPositionParams AUDIOSUITE_ERROR_INVALID_PARAM
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetSpaceRenderPositionParams_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderPositionParams_005 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderPositionParams_005();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderPositionParams_005 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderPositionParams_006
     * @tc.number     AudioSuiteEngine_GetSpaceRenderPositionParams_006
     * @tc.desc       GetSpaceRenderPositionParams AUDIOSUITE_ERROR_INVALID_PARAM
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetSpaceRenderPositionParams_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderPositionParams_006 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderPositionParams_006();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderPositionParams_006 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_SetSpaceRenderRotationParams_001
     * @tc.number     AudioSuiteEngine_SetSpaceRenderRotationParams_001
     * @tc.desc       SetSpaceRenderRotationParams AUDIOSUITE_SUCCESS
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_SetSpaceRenderRotationParams_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_SetSpaceRenderRotationParams_001 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetSpaceRenderRotationParams_001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_SetSpaceRenderRotationParams_001 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_SetSpaceRenderRotationParams_002
     * @tc.number     AudioSuiteEngine_SetSpaceRenderRotationParams_002
     * @tc.desc       SetSpaceRenderRotationParams AUDIOSUITE_ERROR_NODE_NOT_EXIST
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetSpaceRenderRotationParams_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_SetSpaceRenderRotationParams_002 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetSpaceRenderRotationParams_002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_SetSpaceRenderRotationParams_002 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_SetSpaceRenderRotationParams_003
     * @tc.number     AudioSuiteEngine_SetSpaceRenderRotationParams_003
     * @tc.desc       SetSpaceRenderRotationParams AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetSpaceRenderRotationParams_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_SetSpaceRenderRotationParams_003 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetSpaceRenderRotationParams_003();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_SetSpaceRenderRotationParams_003 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_SetSpaceRenderRotationParams_004
     * @tc.number     AudioSuiteEngine_SetSpaceRenderRotationParams_004
     * @tc.desc       SetSpaceRenderRotationParams AUDIOSUITE_ERROR_INVALID_PARAM
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetSpaceRenderRotationParams_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_SetSpaceRenderRotationParams_004 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetSpaceRenderRotationParams_004();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_SetSpaceRenderRotationParams_004 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_SetSpaceRenderRotationParams_005
     * @tc.number     AudioSuiteEngine_SetSpaceRenderRotationParams_005
     * @tc.desc       SetSpaceRenderRotationParams AUDIOSUITE_ERROR_INVALID_PARAM
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetSpaceRenderRotationParams_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_SetSpaceRenderRotationParams_005 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetSpaceRenderRotationParams_005();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_SetSpaceRenderRotationParams_005 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderRotationParams_001
     * @tc.number     AudioSuiteEngine_GetSpaceRenderRotationParams_001
     * @tc.desc       GetSpaceRenderRotationParams AUDIOSUITE_SUCCESS
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_GetSpaceRenderRotationParams_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderRotationParams_001 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderRotationParams_001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderRotationParams_001 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderRotationParams_002
     * @tc.number     AudioSuiteEngine_GetSpaceRenderRotationParams_002
     * @tc.desc       GetSpaceRenderRotationParams AUDIOSUITE_ERROR_NODE_NOT_EXIST
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetSpaceRenderRotationParams_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderRotationParams_002 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderRotationParams_002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderRotationParams_002 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderRotationParams_003
     * @tc.number     AudioSuiteEngine_GetSpaceRenderRotationParams_003
     * @tc.desc       GetSpaceRenderRotationParams AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetSpaceRenderRotationParams_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderRotationParams_003 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderRotationParams_003();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderRotationParams_003 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderRotationParams_004
     * @tc.number     AudioSuiteEngine_GetSpaceRenderRotationParams_004
     * @tc.desc       GetSpaceRenderRotationParams AUDIOSUITE_ERROR_INVALID_PARAM
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetSpaceRenderRotationParams_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderRotationParams_004 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderRotationParams_004();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderRotationParams_004 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderRotationParams_005
     * @tc.number     AudioSuiteEngine_GetSpaceRenderRotationParams_005
     * @tc.desc       GetSpaceRenderRotationParams AUDIOSUITE_ERROR_INVALID_PARAM
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetSpaceRenderRotationParams_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderRotationParams_005 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderRotationParams_005();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderRotationParams_005 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderRotationParams_006
     * @tc.number     AudioSuiteEngine_GetSpaceRenderRotationParams_006
     * @tc.desc       GetSpaceRenderRotationParams AUDIOSUITE_ERROR_INVALID_PARAM
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetSpaceRenderRotationParams_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderRotationParams_006 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderRotationParams_006();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderRotationParams_006 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_SetSpaceRenderExtensionParams_001
     * @tc.number     AudioSuiteEngine_SetSpaceRenderExtensionParams_001
     * @tc.desc       SetSpaceRenderExtensionParams AUDIOSUITE_SUCCESS
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_SetSpaceRenderExtensionParams_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_SetSpaceRenderExtensionParams_001 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetSpaceRenderExtensionParams_001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_SetSpaceRenderExtensionParams_001 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_SetSpaceRenderExtensionParams_002
     * @tc.number     AudioSuiteEngine_SetSpaceRenderExtensionParams_002
     * @tc.desc       SetSpaceRenderExtensionParams AUDIOSUITE_ERROR_NODE_NOT_EXIST
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetSpaceRenderExtensionParams_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_SetSpaceRenderExtensionParams_002 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetSpaceRenderExtensionParams_002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_SetSpaceRenderExtensionParams_002 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_SetSpaceRenderExtensionParams_003
     * @tc.number     AudioSuiteEngine_SetSpaceRenderExtensionParams_003
     * @tc.desc       SetSpaceRenderExtensionParams AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetSpaceRenderExtensionParams_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_SetSpaceRenderExtensionParams_003 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetSpaceRenderExtensionParams_003();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_SetSpaceRenderExtensionParams_003 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_SetSpaceRenderExtensionParams_004
     * @tc.number     AudioSuiteEngine_SetSpaceRenderExtensionParams_004
     * @tc.desc       SetSpaceRenderExtensionParams AUDIOSUITE_ERROR_INVALID_PARAM
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetSpaceRenderExtensionParams_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_SetSpaceRenderExtensionParams_004 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetSpaceRenderExtensionParams_004();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_SetSpaceRenderExtensionParams_004 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_SetSpaceRenderExtensionParams_005
     * @tc.number     AudioSuiteEngine_SetSpaceRenderExtensionParams_005
     * @tc.desc       SetSpaceRenderExtensionParams AUDIOSUITE_ERROR_INVALID_PARAM
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_SetSpaceRenderExtensionParams_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_SetSpaceRenderExtensionParams_005 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_SetSpaceRenderExtensionParams_005();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_SetSpaceRenderExtensionParams_005 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderExtensionParams_001
     * @tc.number     AudioSuiteEngine_GetSpaceRenderExtensionParams_001
     * @tc.desc       GetSpaceRenderExtensionParams AUDIOSUITE_SUCCESS
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 0
     */
    it('AudioSuiteEngine_GetSpaceRenderExtensionParams_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderExtensionParams_001 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderExtensionParams_001();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderExtensionParams_001 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderExtensionParams_002
     * @tc.number     AudioSuiteEngine_GetSpaceRenderExtensionParams_002
     * @tc.desc       GetSpaceRenderExtensionParams AUDIOSUITE_ERROR_NODE_NOT_EXIST
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetSpaceRenderExtensionParams_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderExtensionParams_002 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderExtensionParams_002();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderExtensionParams_002 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderExtensionParams_003
     * @tc.number     AudioSuiteEngine_GetSpaceRenderExtensionParams_003
     * @tc.desc       GetSpaceRenderExtensionParams AUDIOSUITE_ERROR_UNSUPPORTED_OPERATION
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetSpaceRenderExtensionParams_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderExtensionParams_003 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderExtensionParams_003();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderExtensionParams_003 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderExtensionParams_004
     * @tc.number     AudioSuiteEngine_GetSpaceRenderExtensionParams_004
     * @tc.desc       GetSpaceRenderExtensionParams AUDIOSUITE_ERROR_INVALID_PARAM
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetSpaceRenderExtensionParams_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderExtensionParams_004 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderExtensionParams_004();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderExtensionParams_004 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderExtensionParams_005
     * @tc.number     AudioSuiteEngine_GetSpaceRenderExtensionParams_005
     * @tc.desc       GetSpaceRenderExtensionParams AUDIOSUITE_ERROR_INVALID_PARAM
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetSpaceRenderExtensionParams_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderExtensionParams_005 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderExtensionParams_005();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderExtensionParams_005 end ====>');
      done();
    })

    /**
     * @tc.name       AudioSuiteEngine_GetSpaceRenderExtensionParams_006
     * @tc.number     AudioSuiteEngine_GetSpaceRenderExtensionParams_006
     * @tc.desc       GetSpaceRenderExtensionParams AUDIOSUITE_ERROR_INVALID_PARAM
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL 2
     */
    it('AudioSuiteEngine_GetSpaceRenderExtensionParams_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
      console.info('=====> AudioSuiteEngine_GetSpaceRenderExtensionParams_006 start ====>');
      let result : number = audiosuiteenginetest.AudioSuiteEngine_GetSpaceRenderExtensionParams_006();
      expect(result).assertEqual(TEST_RESULT.TEST_PASS);
      console.info('=====> AudioSuiteEngine_GetSpaceRenderExtensionParams_006 end ====>');
      done();
    })

  })
}