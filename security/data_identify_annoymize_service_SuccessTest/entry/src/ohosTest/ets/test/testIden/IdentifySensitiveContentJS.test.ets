
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level,Size } from '@ohos/hypium';
import identifySensitiveContent from '@ohos.security.identifySensitiveContent';
import { dlpPermission } from '@kit.DataProtectionKit';
let filePathTest = "/data/app/el1/bundle/public/";
let notFile = "aaaaaa";
let dataPath = "/data/app/el2/0/database/h.txt";
export default function identifySensitiveContentTestUnit() {
  describe('identifySensitiveContentTestUnit', () => {
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
     * @tc.name   scanfileInputnull
     * @tc.number PrivacyAssistant_JS_25.1_2_004
     * @tc.desc   normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scanfileInputnull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
        console.info('scanfileInputnull');
        let policies:identifySensitiveContent.Policy[] =[];
        try {
          await identifySensitiveContent.scanFile(null,policies);
          expect().assertFail();
        }catch (error){
          console.info('scanfileInputnull:'+error.code);
          expect(error.code === 401  ||  error.code === 201 ).assertTrue();
        }
        try {
          await identifySensitiveContent.scanFile(filePathTest,null);
          expect().assertFail();
        }catch (error){
          console.info('scanfileInputnull:'+error.code);
          expect(error.code === 401  ||  error.code === 201 ).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileTypeNotSupport
     * @tc.number PrivacyAssistant_JS_25.1_2_012
     * @tc.desc   normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scanfileTypeNotSupport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {
        console.info('scanfileTypeNotSupport');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Pornography",keywords:[],regex:"hello"};
        let policies:identifySensitiveContent.Policy[] =[policy];
        try {
          await identifySensitiveContent.scanFile(notFile,policies);
        }catch (error){
          console.info('scanfileTypeNotSupport:'+error.code);
          expect( error.code === 19110004 || error.code === 201 || error.code === 19110003).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileSandboxDirtxt
     * @tc.number PrivacyAssistant_JS_25.1_2_001
     * @tc.desc   normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scanfileSandboxDirtxt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
        console.info('scanfileSandboxDirtxt');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Pornography",keywords:[],regex:"hello"};
        let policies:identifySensitiveContent.Policy[] =[policy];
        try {
          let matchResult =  await identifySensitiveContent.scanFile(dataPath,policies);
          console.info("scanfileSandboxDirtxt:"+matchResult.length);
          expect(matchResult.length).assertEqual(1);
          expect(matchResult[0].sensitiveLabel).assertEqual('Pornography');
          expect(matchResult[0].matchNumber).assertEqual(1);
          expect(matchResult[0].matchContent).assertEqual('h***o');
        }catch (error){
          expect(error.code===201 || error.code===19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfileSandboxDirnull
     * @tc.number PrivacyAssistant_JS_25.1_2_000
     * @tc.desc   normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('scanfileSandboxDirnull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async() => {
        console.info('scanfileSandboxDirnull');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Pornography", keywords:[], regex:"hello"};
        let policies:identifySensitiveContent.Policy[] = [policy];
        try {
          let matchResult =  await identifySensitiveContent.scanFile(dataPath, policies);
          expect(matchResult.length).assertEqual(0);
          console.info("scanfileSandboxDirnull:" + matchResult.length);
        }catch (error){
          console.info('scanfileSandboxDirnull:'+error.code);
          expect(error.code===201 || error.code===19110004).assertTrue();
        }
    })

    /**
     * @tc.name   scanfile1025policy
     * @tc.number PrivacyAssistant_JS_25.1_2_006
     * @tc.desc   normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scanfile1025policy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async() => {

        console.info('scanfile1025policy');
        let policy:identifySensitiveContent.Policy = {sensitiveLabel:"Pornography",keywords:['lei'],regex:"lei"};
        let policies:identifySensitiveContent.Policy[] =[];
        for (let i= 0;i<1025;i++){
          policies.push(policy);
        }
        try {
          let matchResult =  await identifySensitiveContent.scanFile(dataPath,policies);
          console.info("scanfile1025policy:"+matchResult.length);
          expect().assertFail();
        }catch (error){
          expect(error.code === 19110001 || error.code === 201 ).assertTrue();
        }
    })

    })


}