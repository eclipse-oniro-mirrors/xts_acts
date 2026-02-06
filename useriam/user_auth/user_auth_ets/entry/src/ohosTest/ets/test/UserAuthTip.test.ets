import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { userAuth } from '@kit.UserAuthenticationKit';

export default function UserAuthTipTest() {
  describe('UserAuthTipTest', () => {
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
     * @tc.number : SUB_Security_userIam_authWidget_Func_skip_0190
     * @tc.name   : SUB_Security_userIam_authWidget_Func_skip_0190
     * @tc.desc   : authWidget
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_userIam_authWidget_Func_skip_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_Security_userIam_authWidget_Func_skip_0190 start')
      try {
        //authParam
        let authParam1:userAuth.AuthParam = {
          challenge:new Uint8Array([49,49,49,49,49,49]),
          authType:[userAuth.UserAuthType.PIN],
          authTrustLevel:userAuth.AuthTrustLevel.ATL1,
          skipLockedBiometricAuth:false,
        };
        let authParam2:userAuth.AuthParam = {
          challenge:new Uint8Array([49,49,49,49,49,49]),
          authType:[userAuth.UserAuthType.PIN],
          authTrustLevel:userAuth.AuthTrustLevel.ATL1,
          skipLockedBiometricAuth:true,
        };
        //widgetParam
        let widgetParam: userAuth.WidgetParam = {
          title:"title",
        };
        userAuth.getUserAuthInstance(authParam1,widgetParam);
        userAuth.getUserAuthInstance(authParam2,widgetParam);
      }
      catch (err){
        console.error('SUB_Security_userIam_authWidget_Func_skip_0190'+err.code);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number : SUB_Security_userIam_authWidget_Func_Tip_0031
     * @tc.name   : SUB_Security_userIam_authWidget_Func_Tip_0031
     * @tc.desc   : authWidget
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_userIam_authWidget_Func_Tip_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_Security_userIam_authWidget_Func_Tip_0031 start')
      expect(1).assertEqual(userAuth.UserAuthTipCode.COMPARE_FAILURE);
      expect(2).assertEqual(userAuth.UserAuthTipCode.TIMEOUT);
      expect(3).assertEqual(userAuth.UserAuthTipCode.TEMPORARILY_LOCKED);
      expect(4).assertEqual(userAuth.UserAuthTipCode.PERMANENTLY_LOCKED);
      expect(5).assertEqual(userAuth.UserAuthTipCode.WIDGET_LOADED);
      expect(6).assertEqual(userAuth.UserAuthTipCode.WIDGET_RELEASED);
      expect(7).assertEqual(userAuth.UserAuthTipCode.COMPARE_FAILURE_WITH_FROZEN);
      console.info('SUB_Security_userIam_authWidget_Func_Tip_0031 end')
      done();
    })

    /**
     * @tc.number : SUB_Security_userIam_authWidget_Func_Tip_0032
     * @tc.name   : SUB_Security_userIam_authWidget_Func_Tip_0032
     * @tc.desc   : authWidget
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : Level3
     */
    it('SUB_Security_userIam_authWidget_Func_Tip_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async (done:Function) => {
      console.info('SUB_Security_userIam_authWidget_Func_Tip_0032 start')
      //authParam
      let authParam:userAuth.AuthParam = {
        challenge:new Uint8Array([49,49,49,49,49,49]),
        authType:[userAuth.UserAuthType.PIN],
        authTrustLevel:userAuth.AuthTrustLevel.ATL1,
      };
      //widgetParam
      let widgetParam: userAuth.WidgetParam = {
        title:"title",
      };
      try {
        let userAuthInstance = userAuth.getUserAuthInstance(authParam,widgetParam);
        userAuthInstance.on('authTip',(authTipInfo:userAuth.AuthTipInfo)=>{
          console.info('SUB_Security_userIam_authWidget_Func_Tip_0032 authTipInfo.tipType = ' + authTipInfo.tipType)
          console.info('SUB_Security_userIam_authWidget_Func_Tip_0032 authTipInfo.tipCode = ' + authTipInfo.tipCode)
          console.info('SUB_Security_userIam_authWidget_Func_Tip_0032 on with callback')
        });
        userAuthInstance.off('authTip',(authTipInfo:userAuth.AuthTipInfo)=>{
          console.info('SUB_Security_userIam_authWidget_Func_Tip_0032 on with callback')
        });
        userAuthInstance.on('authTip',(authTipInfo:userAuth.AuthTipInfo)=>{
          console.info('SUB_Security_userIam_authWidget_Func_Tip_0032 on without callback')
        });
        userAuthInstance.off('authTip');
      }
      catch (err){
        console.error('SUB_Security_userIam_authWidget_Func_Tip_0032 err.code '+err.code);
        expect(null).assertFail();
      }
      try {
        let userAuthInstance = userAuth.getUserAuthInstance(authParam,widgetParam);
        userAuthInstance.on('authTip',(authTipInfo:userAuth.AuthTipInfo)=>{});
        userAuthInstance.on('authTip',(authTipInfo:userAuth.AuthTipInfo)=>{});
        expect(null).assertFail();
      }
      catch (err){
        console.error('SUB_Security_userIam_authWidget_Func_Tip_0032 err.code '+err.code);
        expect(12500002).assertEqual(err.code);
      }
      try {
        let userAuthInstance = userAuth.getUserAuthInstance(authParam,widgetParam);
        userAuthInstance.off('authTip',(authTipInfo:userAuth.AuthTipInfo)=>{});
        expect(null).assertFail();
      }
      catch (err) {
        console.error('SUB_Security_userIam_authWidget_Func_Tip_0032 err1.code '+err.code);
        expect(12500002).assertEqual(err.code);
      }
      done();
    });
  })
}