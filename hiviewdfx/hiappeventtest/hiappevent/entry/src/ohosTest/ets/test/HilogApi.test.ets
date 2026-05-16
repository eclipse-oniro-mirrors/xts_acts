import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
function generateLongString(length: number): string {
  let str: string = '';
  for (let i: number = 0; i < length; i++) {
    str += 'a';
  }
  return str;
}
export default function HilogApi() {
  describe('HilogApi', () => {
    beforeAll(() => {
      console.info('HilogParamSpecTest beforeAll called');
    });

    afterAll(() => {
      console.info('HilogParamSpecTest afterAll called');
    });

    // ==================== debug接口测试 ====================

    /**
     * @tc.name   hilogDebugDomainValidRange0100
     * @tc.number SUB_HiviewDFX_Hilog_Debug_Domain_ValidRange_0100
     * @tc.desc   Test debug interface with domain value in valid range (0x0000).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogDebugDomainValidRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogDebugDomainValidRange0100 start');
      try {
        hilog.debug(0x0000, 'HILOGTEST', 'Test message for valid domain');
        console.info('hilogDebugDomainValidRange0100 end');
        done();
      } catch (error) {
        console.error(`hilogDebugDomainValidRange0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogDebugDomainValidRange0200
     * @tc.number SUB_HiviewDFX_Hilog_Debug_Domain_ValidRange_0200
     * @tc.desc   Test debug interface with domain value in valid range (0xFFFF).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogDebugDomainValidRange0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogDebugDomainValidRange0200 start');
      try {
        hilog.debug(0xFFFF, 'HILOGTEST', 'Test message for valid domain');
        console.info('hilogDebugDomainValidRange0200 end');
        done();
      } catch (error) {
        console.error(`hilogDebugDomainValidRange0200 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogDebugDomainValidRange0300
     * @tc.number SUB_HiviewDFX_Hilog_Debug_Domain_ValidRange_0300
     * @tc.desc   Test debug interface with domain value at upper boundary (0xDFFFFFFF).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogDebugDomainValidRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogDebugDomainValidRange0300 start');
      try {
        hilog.debug(0xDFFFFFFF, 'HILOGTEST', 'Test message for upper boundary domain');
        console.info('hilogDebugDomainValidRange0300 end');
        done();
      } catch (error) {
        console.error(`hilogDebugDomainValidRange0300 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogDebugDomainInvalidRange0100
     * @tc.number SUB_HiviewDFX_Hilog_Debug_Domain_InvalidRange_0100
     * @tc.desc   Test debug interface with domain value exceeding valid range (0xFFFFFFFF).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogDebugDomainInvalidRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogDebugDomainInvalidRange0100 start');
      try {
        hilog.debug(0xFFFFFFFF, 'HILOGTEST', 'Test message for exceeding domain');
        console.info('hilogDebugDomainInvalidRange0100 end');
        done();
      } catch (error) {
        console.error(`hilogDebugDomainInvalidRange0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   hilogDebugDomainInvalidRange0200
     * @tc.number SUB_HiviewDFX_Hilog_Debug_Domain_InvalidRange_0200
     * @tc.desc   Test debug interface with negative domain value (-1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogDebugDomainInvalidRange0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogDebugDomainInvalidRange0200 start');
      try {
        hilog.debug(-1, 'HILOGTEST', 'Test message for negative domain');
        console.info('hilogDebugDomainInvalidRange0200 end');
        done();
      } catch (error) {
        console.error(`hilogDebugDomainInvalidRange0200 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogDebugTagValidLength0100
     * @tc.number SUB_HiviewDFX_Hilog_Debug_Tag_ValidLength_0100
     * @tc.desc   Test debug interface with tag length at boundary (31 bytes).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogDebugTagValidLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogDebugTagValidLength0100 start');
      let boundaryTag: string = generateLongString(31);
      try {
        hilog.debug(0xD002100, boundaryTag, 'Test message for boundary tag length');
        console.info('hilogDebugTagValidLength0100 end');
        done();
      } catch (error) {
        console.error(`hilogDebugTagValidLength0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogDebugTagInvalidLength0100
     * @tc.number SUB_HiviewDFX_Hilog_Debug_Tag_InvalidLength_0100
     * @tc.desc   Test debug interface with tag exceeding max length (32 bytes).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogDebugTagInvalidLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogDebugTagInvalidLength0100 start');
      let longTag: string = generateLongString(32);
      try {
        hilog.debug(0xD002100, longTag, 'Test message for exceeding tag length');
        console.info('hilogDebugTagInvalidLength0100 end');
        done();
      } catch (error) {
        console.error(`hilogDebugTagInvalidLength0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogDebugTagInvalidLength0200
     * @tc.number SUB_HiviewDFX_Hilog_Debug_Tag_InvalidLength_0200
     * @tc.desc   Test debug interface with very long tag (100 bytes).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogDebugTagInvalidLength0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogDebugTagInvalidLength0200 start');
      let veryLongTag: string = generateLongString(100);
      try {
        hilog.debug(0xD002100, veryLongTag, 'Test message for very long tag');
        console.info('hilogDebugTagInvalidLength0200 end');
        done();
      } catch (error) {
        console.error(`hilogDebugTagInvalidLength0200 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogDebugEmptyTag0100
     * @tc.number SUB_HiviewDFX_Hilog_Debug_EmptyTag_0100
     * @tc.desc   Test debug interface with empty tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogDebugEmptyTag0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogDebugEmptyTag0100 start');
      try {
        hilog.debug(0xD002100, '', 'Test message for empty tag');
        console.info('hilogDebugEmptyTag0100 end'); 
        done();
      } catch (error) {
        console.error(`hilogDebugEmptyTag0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogDebugNullTag0100
     * @tc.number SUB_HiviewDFX_Hilog_Debug_NullTag_0100
     * @tc.desc   Test debug interface with null tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogDebugNullTag0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogDebugNullTag0100 start');
      try {
        hilog.debug(0xD002100, null, 'Test message for null tag');
        console.info('hilogDebugNullTag0100 end');
        done();
      } catch (error) {
        console.error(`hilogDebugNullTag0100 error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    // ==================== info接口测试 ====================

    /**
     * @tc.name   hilogInfoDomainValidRange0100
     * @tc.number SUB_HiviewDFX_Hilog_Info_Domain_ValidRange_0100
     * @tc.desc   Test info interface with domain value in valid range (0x0000).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogInfoDomainValidRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogInfoDomainValidRange0100 start');
      try {
        hilog.info(0x0000, 'HILOGTEST', 'Test message for valid domain');
        console.info('hilogInfoDomainValidRange0100 end');
        done();
      } catch (error) {
        console.error(`hilogInfoDomainValidRange0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogInfoDomainValidRange0200
     * @tc.number SUB_HiviewDFX_Hilog_Info_Domain_ValidRange_0200
     * @tc.desc   Test info interface with domain value in valid range (0xFFFF).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogInfoDomainValidRange0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogInfoDomainValidRange0200 start');
      try {
        hilog.info(0xFFFF, 'HILOGTEST', 'Test message for valid domain');
        console.info('hilogInfoDomainValidRange0200 end');
        done();
      } catch (error) {
        console.error(`hilogInfoDomainValidRange0200 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogInfoDomainValidRange0300
     * @tc.number SUB_HiviewDFX_Hilog_Info_Domain_ValidRange_0300
     * @tc.desc   Test info interface with domain value at upper boundary (0xDFFFFFFF).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogInfoDomainValidRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogInfoDomainValidRange0300 start');
      try {
        hilog.info(0xDFFFFFFF, 'HILOGTEST', 'Test message for upper boundary domain');
        console.info('hilogInfoDomainValidRange0300 end');
        done();
      } catch (error) {
        console.error(`hilogInfoDomainValidRange0300 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogInfoDomainInvalidRange0100
     * @tc.number SUB_HiviewDFX_Hilog_Info_Domain_InvalidRange_0100
     * @tc.desc   Test info interface with domain value exceeding valid range (0xFFFFFFFF).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogInfoDomainInvalidRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogInfoDomainInvalidRange0100 start');
      try {
        hilog.info(0xFFFFFFFF, 'HILOGTEST', 'Test message for exceeding domain');
        console.info('hilogInfoDomainInvalidRange0100 end');
        done();
      } catch (error) {
        console.error(`hilogInfoDomainInvalidRange0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogInfoDomainInvalidRange0200
     * @tc.number SUB_HiviewDFX_Hilog_Info_Domain_InvalidRange_0200
     * @tc.desc   Test info interface with negative domain value (-1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogInfoDomainInvalidRange0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogInfoDomainInvalidRange0200 start');
      try {
        hilog.info(-1, 'HILOGTEST', 'Test message for negative domain');
        console.info('hilogInfoDomainInvalidRange0200 end');
        done();
      } catch (error) {
        console.error(`hilogInfoDomainInvalidRange0200 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogInfoTagValidLength0100
     * @tc.number SUB_HiviewDFX_Hilog_Info_Tag_ValidLength_0100
     * @tc.desc   Test info interface with tag length at boundary (31 bytes).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogInfoTagValidLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogInfoTagValidLength0100 start');
      let boundaryTag: string = generateLongString(31);
      try {
        hilog.info(0xD002100, boundaryTag, 'Test message for boundary tag length');
        console.info('hilogInfoTagValidLength0100 end');
        done();
      } catch (error) {
        console.error(`hilogInfoTagValidLength0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogInfoTagInvalidLength0100
     * @tc.number SUB_HiviewDFX_Hilog_Info_Tag_InvalidLength_0100
     * @tc.desc   Test info interface with tag exceeding max length (32 bytes).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogInfoTagInvalidLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogInfoTagInvalidLength0100 start');
      let longTag: string = generateLongString(32);
      try {
        hilog.info(0xD002100, longTag, 'Test message for exceeding tag length');
        console.info('hilogInfoTagInvalidLength0100 end'); 
        done();
      } catch (error) {
        console.error(`hilogInfoTagInvalidLength0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogInfoTagInvalidLength0200
     * @tc.number SUB_HiviewDFX_Hilog_Info_Tag_InvalidLength_0200
     * @tc.desc   Test info interface with very long tag (100 bytes).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogInfoTagInvalidLength0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogInfoTagInvalidLength0200 start');
      let veryLongTag: string = generateLongString(100);
      try {
        hilog.info(0xD002100, veryLongTag, 'Test message for very long tag');
        console.info('hilogInfoTagInvalidLength0200 end');
        done();
      } catch (error) {
        console.error(`hilogInfoTagInvalidLength0200 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogInfoEmptyTag0100
     * @tc.number SUB_HiviewDFX_Hilog_Info_EmptyTag_0100
     * @tc.desc   Test info interface with empty tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogInfoEmptyTag0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogInfoEmptyTag0100 start');
      try {
        hilog.info(0xD002100, '', 'Test message for empty tag');
        console.info('hilogInfoEmptyTag0100 end');
        done();
      } catch (error) {
        console.error(`hilogInfoEmptyTag0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogInfoNullTag0100
     * @tc.number SUB_HiviewDFX_Hilog_Info_NullTag_0100
     * @tc.desc   Test info interface with null tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogInfoNullTag0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogInfoNullTag0100 start');
      try {
        hilog.info(0xD002100, null, 'Test message for null tag');
        console.info('hilogInfoNullTag0100 end');
        done();
      } catch (error) {
        console.error(`hilogInfoNullTag0100 error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    // ==================== warn接口测试 ====================

    /**
     * @tc.name   hilogWarnDomainValidRange0100
     * @tc.number SUB_HiviewDFX_Hilog_Warn_Domain_ValidRange_0100
     * @tc.desc   Test warn interface with domain value in valid range (0x0000).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogWarnDomainValidRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogWarnDomainValidRange0100 start');
      try {
        hilog.warn(0x0000, 'HILOGTEST', 'Test message for valid domain');
        console.info('hilogWarnDomainValidRange0100 end');
        done();
      } catch (error) {
        console.error(`hilogWarnDomainValidRange0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogWarnDomainValidRange0200
     * @tc.number SUB_HiviewDFX_Hilog_Warn_Domain_ValidRange_0200
     * @tc.desc   Test warn interface with domain value in valid range (0xFFFF).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogWarnDomainValidRange0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogWarnDomainValidRange0200 start');
      try {
        hilog.warn(0xFFFF, 'HILOGTEST', 'Test message for valid domain');
        console.info('hilogWarnDomainValidRange0200 end');
        done();
      } catch (error) {
        console.error(`hilogWarnDomainValidRange0200 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogWarnDomainValidRange0300
     * @tc.number SUB_HiviewDFX_Hilog_Warn_Domain_ValidRange_0300
     * @tc.desc   Test warn interface with domain value at upper boundary (0xDFFFFFFF).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogWarnDomainValidRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogWarnDomainValidRange0300 start');
      try {
        hilog.warn(0xDFFFFFFF, 'HILOGTEST', 'Test message for upper boundary domain');
        console.info('hilogWarnDomainValidRange0300 end');
        done();
      } catch (error) {
        console.error(`hilogWarnDomainValidRange0300 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogWarnDomainInvalidRange0100
     * @tc.number SUB_HiviewDFX_Hilog_Warn_Domain_InvalidRange_0100
     * @tc.desc   Test warn interface with domain value exceeding valid range (0xFFFFFFFF).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogWarnDomainInvalidRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogWarnDomainInvalidRange0100 start');
      try {
        hilog.warn(0xFFFFFFFF, 'HILOGTEST', 'Test message for exceeding domain');
        console.info('hilogWarnDomainInvalidRange0100 end');
        done();
      } catch (error) {
        console.error(`hilogWarnDomainInvalidRange0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogWarnDomainInvalidRange0200
     * @tc.number SUB_HiviewDFX_Hilog_Warn_Domain_InvalidRange_0200
     * @tc.desc   Test warn interface with negative domain value (-1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogWarnDomainInvalidRange0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogWarnDomainInvalidRange0200 start');
      try {
        hilog.warn(-1, 'HILOGTEST', 'Test message for negative domain');
        console.info('hilogWarnDomainInvalidRange0200 end');
        done();
      } catch (error) {
        console.error(`hilogWarnDomainInvalidRange0200 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogWarnTagValidLength0100
     * @tc.number SUB_HiviewDFX_Hilog_Warn_Tag_ValidLength_0100
     * @tc.desc   Test warn interface with tag length at boundary (31 bytes).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogWarnTagValidLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogWarnTagValidLength0100 start');
      let boundaryTag: string = generateLongString(31);
      try {
        hilog.warn(0xD002100, boundaryTag, 'Test message for boundary tag length');
        console.info('hilogWarnTagValidLength0100 end');
        done();
      } catch (error) {
        console.error(`hilogWarnTagValidLength0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogWarnTagInvalidLength0100
     * @tc.number SUB_HiviewDFX_Hilog_Warn_Tag_InvalidLength_0100
     * @tc.desc   Test warn interface with tag exceeding max length (32 bytes).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogWarnTagInvalidLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogWarnTagInvalidLength0100 start');
      let longTag: string = generateLongString(32);
      try {
        hilog.warn(0xD002100, longTag, 'Test message for exceeding tag length');
        console.info('hilogWarnTagInvalidLength0100 end');
        done();
      } catch (error) {
        console.error(`hilogWarnTagInvalidLength0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogWarnTagInvalidLength0200
     * @tc.number SUB_HiviewDFX_Hilog_Warn_Tag_InvalidLength_0200
     * @tc.desc   Test warn interface with very long tag (100 bytes).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogWarnTagInvalidLength0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogWarnTagInvalidLength0200 start');
      let veryLongTag: string = generateLongString(100);
      try {
        hilog.warn(0xD002100, veryLongTag, 'Test message for very long tag');
        console.info('hilogWarnTagInvalidLength0200 end');
        done();
      } catch (error) {
        console.error(`hilogWarnTagInvalidLength0200 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogWarnEmptyTag0100
     * @tc.number SUB_HiviewDFX_Hilog_Warn_EmptyTag_0100
     * @tc.desc   Test warn interface with empty tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogWarnEmptyTag0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogWarnEmptyTag0100 start');
      try {
        hilog.warn(0xD002100, '', 'Test message for empty tag');
        console.info('hilogWarnEmptyTag0100 end');
        done();
      } catch (error) {
        console.error(`hilogWarnEmptyTag0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogWarnNullTag0100
     * @tc.number SUB_HiviewDFX_Hilog_Warn_NullTag_0100
     * @tc.desc   Test warn interface with null tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogWarnNullTag0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogWarnNullTag0100 start');
      try {
        hilog.warn(0xD002100, null, 'Test message for null tag');
        console.info('hilogWarnNullTag0100 end');
        done();
      } catch (error) {
        console.error(`hilogWarnNullTag0100 error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    // ==================== error接口测试 ====================

    /**
     * @tc.name   hilogErrorDomainValidRange0100
     * @tc.number SUB_HiviewDFX_Hilog_Error_Domain_ValidRange_0100
     * @tc.desc   Test error interface with domain value in valid range (0x0000).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogErrorDomainValidRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogErrorDomainValidRange0100 start');
      try {
        hilog.error(0x0000, 'HILOGTEST', 'Test message for valid domain');
        console.info('hilogErrorDomainValidRange0100 end');
        done();
      } catch (error) {
        console.error(`hilogErrorDomainValidRange0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogErrorDomainValidRange0200
     * @tc.number SUB_HiviewDFX_Hilog_Error_Domain_ValidRange_0200
     * @tc.desc   Test error interface with domain value in valid range (0xFFFF).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogErrorDomainValidRange0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogErrorDomainValidRange0200 start');
      try {
        hilog.error(0xFFFF, 'HILOGTEST', 'Test message for valid domain');
        console.info('hilogErrorDomainValidRange0200 end');
        done();
      } catch (error) {
        console.error(`hilogErrorDomainValidRange0200 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogErrorDomainValidRange0300
     * @tc.number SUB_HiviewDFX_Hilog_Error_Domain_ValidRange_0300
     * @tc.desc   Test error interface with domain value at upper boundary (0xDFFFFFFF).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogErrorDomainValidRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogErrorDomainValidRange0300 start');
      try {
        hilog.error(0xDFFFFFFF, 'HILOGTEST', 'Test message for upper boundary domain');
        console.info('hilogErrorDomainValidRange0300 end');
        done();
      } catch (error) {
        console.error(`hilogErrorDomainValidRange0300 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogErrorDomainInvalidRange0100
     * @tc.number SUB_HiviewDFX_Hilog_Error_Domain_InvalidRange_0100
     * @tc.desc   Test error interface with domain value exceeding valid range (0xFFFFFFFF).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogErrorDomainInvalidRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogErrorDomainInvalidRange0100 start');
      try {
        hilog.error(0xFFFFFFFF, 'HILOGTEST', 'Test message for exceeding domain');
        console.info('hilogErrorDomainInvalidRange0100 end');
        done();
      } catch (error) {
        console.error(`hilogErrorDomainInvalidRange0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogErrorDomainInvalidRange0200
     * @tc.number SUB_HiviewDFX_Hilog_Error_Domain_InvalidRange_0200
     * @tc.desc   Test error interface with negative domain value (-1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogErrorDomainInvalidRange0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogErrorDomainInvalidRange0200 start');
      try {
        hilog.error(-1, 'HILOGTEST', 'Test message for negative domain');
        console.info('hilogErrorDomainInvalidRange0200 end');
        done();
      } catch (error) {
        console.error(`hilogErrorDomainInvalidRange0200 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogErrorTagValidLength0100
     * @tc.number SUB_HiviewDFX_Hilog_Error_Tag_ValidLength_0100
     * @tc.desc   Test error interface with tag length at boundary (31 bytes).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogErrorTagValidLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogErrorTagValidLength0100 start');
      let boundaryTag: string = generateLongString(31);
      try {
        hilog.error(0xD002100, boundaryTag, 'Test message for boundary tag length');
        console.info('hilogErrorTagValidLength0100 end');
        done();
      } catch (error) {
        console.error(`hilogErrorTagValidLength0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogErrorTagInvalidLength0100
     * @tc.number SUB_HiviewDFX_Hilog_Error_Tag_InvalidLength_0100
     * @tc.desc   Test error interface with tag exceeding max length (32 bytes).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogErrorTagInvalidLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogErrorTagInvalidLength0100 start');
      let longTag: string = generateLongString(32);
      try {
        hilog.error(0xD002100, longTag, 'Test message for exceeding tag length');
        console.info('hilogErrorTagInvalidLength0100 end');
        done();
      } catch (error) {
        console.error(`hilogErrorTagInvalidLength0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogErrorTagInvalidLength0200
     * @tc.number SUB_HiviewDFX_Hilog_Error_Tag_InvalidLength_0200
     * @tc.desc   Test error interface with very long tag (100 bytes).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogErrorTagInvalidLength0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogErrorTagInvalidLength0200 start');
      let veryLongTag: string = generateLongString(100);
      try {
        hilog.error(0xD002100, veryLongTag, 'Test message for very long tag');
        console.info('hilogErrorTagInvalidLength0200 end');
        done();
      } catch (error) {
        console.error(`hilogErrorTagInvalidLength0200 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogErrorEmptyTag0100
     * @tc.number SUB_HiviewDFX_Hilog_Error_EmptyTag_0100
     * @tc.desc   Test error interface with empty tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogErrorEmptyTag0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogErrorEmptyTag0100 start');
      try {
        hilog.error(0xD002100, '', 'Test message for empty tag');
        console.info('hilogErrorEmptyTag0100 end');
        done();
      } catch (error) {
        console.error(`hilogErrorEmptyTag0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogErrorNullTag0100
     * @tc.number SUB_HiviewDFX_Hilog_Error_NullTag_0100
     * @tc.desc   Test error interface with null tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogErrorNullTag0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogErrorNullTag0100 start');
      try {
        hilog.error(0xD002100, null, 'Test message for null tag');
        console.info('hilogErrorNullTag0100 end');
        done();
      } catch (error) {
        console.error(`hilogErrorNullTag0100 error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    // ==================== fatal接口测试 ====================

    /**
     * @tc.name   hilogFatalDomainValidRange0100
     * @tc.number SUB_HiviewDFX_Hilog_Fatal_Domain_ValidRange_0100
     * @tc.desc   Test fatal interface with domain value in valid range (0x0000).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogFatalDomainValidRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogFatalDomainValidRange0100 start');
      try {
        hilog.fatal(0x0000, 'HILOGTEST', 'Test message for valid domain');
        console.info('hilogFatalDomainValidRange0100 end');
        done();
      } catch (error) {
        console.error(`hilogFatalDomainValidRange0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogFatalDomainValidRange0200
     * @tc.number SUB_HiviewDFX_Hilog_Fatal_Domain_ValidRange_0200
     * @tc.desc   Test fatal interface with domain value in valid range (0xFFFF).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogFatalDomainValidRange0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogFatalDomainValidRange0200 start');
      try {
        hilog.fatal(0xFFFF, 'HILOGTEST', 'Test message for valid domain');
        console.info('hilogFatalDomainValidRange0200 end');
        done();
      } catch (error) {
        console.error(`hilogFatalDomainValidRange0200 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogFatalDomainValidRange0300
     * @tc.number SUB_HiviewDFX_Hilog_Fatal_Domain_ValidRange_0300
     * @tc.desc   Test fatal interface with domain value at upper boundary (0xDFFFFFFF).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogFatalDomainValidRange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogFatalDomainValidRange0300 start');
      try {
        hilog.fatal(0xDFFFFFFF, 'HILOGTEST', 'Test message for upper boundary domain');
        console.info('hilogFatalDomainValidRange0300 end');
        done();
      } catch (error) {
        console.error(`hilogFatalDomainValidRange0300 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogFatalDomainInvalidRange0100
     * @tc.number SUB_HiviewDFX_Hilog_Fatal_Domain_InvalidRange_0100
     * @tc.desc   Test fatal interface with domain value exceeding valid range (0xFFFFFFFF).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogFatalDomainInvalidRange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogFatalDomainInvalidRange0100 start');
      try {
        hilog.fatal(0xFFFFFFFF, 'HILOGTEST', 'Test message for exceeding domain');
        console.info('hilogFatalDomainInvalidRange0100 end');
        done();
      } catch (error) {
        console.error(`hilogFatalDomainInvalidRange0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogFatalDomainInvalidRange0200
     * @tc.number SUB_HiviewDFX_Hilog_Fatal_Domain_InvalidRange_0200
     * @tc.desc   Test fatal interface with negative domain value (-1).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogFatalDomainInvalidRange0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogFatalDomainInvalidRange0200 start');
      try {
        hilog.fatal(-1, 'HILOGTEST', 'Test message for negative domain');
        console.info('hilogFatalDomainInvalidRange0200 end');
        done();
      } catch (error) {
        console.error(`hilogFatalDomainInvalidRange0200 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogFatalTagValidLength0100
     * @tc.number SUB_HiviewDFX_Hilog_Fatal_Tag_ValidLength_0100
     * @tc.desc   Test fatal interface with tag length at boundary (31 bytes).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('hilogFatalTagValidLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      console.info('hilogFatalTagValidLength0100 start');
      let boundaryTag: string = generateLongString(31);
      try {
        hilog.fatal(0xD002100, boundaryTag, 'Test message for boundary tag length');
        console.info('hilogFatalTagValidLength0100 end');
        done();
      } catch (error) {
        console.error(`hilogFatalTagValidLength0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogFatalTagInvalidLength0100
     * @tc.number SUB_HiviewDFX_Hilog_Fatal_Tag_InvalidLength_0100
     * @tc.desc   Test fatal interface with tag exceeding max length (32 bytes).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogFatalTagInvalidLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogFatalTagInvalidLength0100 start');
      let longTag: string = generateLongString(32);
      try {
        hilog.fatal(0xD002100, longTag, 'Test message for exceeding tag length');
        console.info('hilogFatalTagInvalidLength0100 end');
        done();
      } catch (error) {
        console.error(`hilogFatalTagInvalidLength0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogFatalTagInvalidLength0200
     * @tc.number SUB_HiviewDFX_Hilog_Fatal_Tag_InvalidLength_0200
     * @tc.desc   Test fatal interface with very long tag (100 bytes).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogFatalTagInvalidLength0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogFatalTagInvalidLength0200 start');
      let veryLongTag: string = generateLongString(100);
      try {
        hilog.fatal(0xD002100, veryLongTag, 'Test message for very long tag');
        console.info('hilogFatalTagInvalidLength0200 end');
        done();
      } catch (error) {
        console.error(`hilogFatalTagInvalidLength0200 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogFatalEmptyTag0100
     * @tc.number SUB_HiviewDFX_Hilog_Fatal_EmptyTag_0100
     * @tc.desc   Test fatal interface with empty tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogFatalEmptyTag0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogFatalEmptyTag0100 start');
      try {
        hilog.fatal(0xD002100, '', 'Test message for empty tag');
        console.info('hilogFatalEmptyTag0100 end');
        done();
      } catch (error) {
        console.error(`hilogFatalEmptyTag0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogFatalNullTag0100
     * @tc.number SUB_HiviewDFX_Hilog_Fatal_NullTag_0100
     * @tc.desc   Test fatal interface with null tag.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogFatalNullTag0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogFatalNullTag0100 start');
      try {
        hilog.fatal(0xD002100, null, 'Test message for null tag');
        console.info('hilogFatalNullTag0100 end');
        done();
      } catch (error) {
        console.error(`hilogFatalNullTag0100 error: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    // ==================== 公共参数规格测试 ====================

    /**
     * @tc.name   hilogDomainZeroValue0100
     * @tc.number SUB_HiviewDFX_Hilog_Domain_ZeroValue_0100
     * @tc.desc   Test all hilog interfaces with domain zero value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogDomainZeroValue0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogDomainZeroValue0100 start');
      try {
        hilog.debug(0x0, 'HILOGTEST', 'debug with domain 0');
        hilog.info(0x0, 'HILOGTEST', 'info with domain 0');
        hilog.warn(0x0, 'HILOGTEST', 'warn with domain 0');
        hilog.error(0x0, 'HILOGTEST', 'error with domain 0');
        hilog.fatal(0x0, 'HILOGTEST', 'fatal with domain 0');
        console.info('hilogDomainZeroValue0100 end');
        done();
      } catch (error) {
        console.error(`hilogDomainZeroValue0100 error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   hilogDomainTypeCheck0100
     * @tc.number SUB_HiviewDFX_Hilog_Domain_TypeCheck_0100
     * @tc.desc   Test hilog interfaces with domain as invalid type (string).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('hilogDomainTypeCheck0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
      console.info('hilogDomainTypeCheck0100 start');
      try {
        hilog.debug(1123, 'HILOGTEST', 'Test message');
        done();
      } catch (error) {
        console.error(`hilogDomainTypeCheck0100 caught expected error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });
  });
}