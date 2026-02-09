import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import accessibility from '@ohos.accessibility'
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function abilityTest() {
  describe("AccessibleRegisterStateStatic", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100
     * @tc.desc   onAccessibilityStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100');
      let callbackdata = (data:boolean) => {
        expect(data).assertEqual(false);
      }
      try {
        accessibility.onAccessibilityStateChange(callbackdata);
        accessibility.offAccessibilityStateChange(callbackdata);
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0100 failed');
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500
     * @tc.desc   The result of isOpenAccessibilitySync() should be boolean type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500');
      try {
        let status = accessibility.isOpenAccessibilitySync();
        hilog.info(domain, tag, `AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500 result: ${status}`);
        expect(typeof (status)).assertEqual('boolean');
        done();
      } catch (error) {
        hilog.error(domain, tag,'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500 failed to isOpenAccessibilitySync because ');
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300
     * @tc.desc   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300');
      let callbackdata = (data:boolean) => {
        expect(data).assertEqual(false);
      }
      try {
        accessibility.onScreenReaderStateChange(callbackdata);
        accessibility.offScreenReaderStateChange(callbackdata);
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0300 failed');
        expect(null).assertFail();
        done();
      }
    })
  })
}