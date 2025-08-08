import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import accessibility from '@ohos.accessibility'
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function abilityTest() {
  describe("AccessibleCheckAbilityStaticTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');


    /*
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0500
      * @tc.desc    The result of isOpenAccessibilitySync() should be boolean type.
      * @tc.size    MEDIUMTEST
      * @tc.type    User
      * @tc.level   Level 0
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

    /*
      * @tc.number  SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600
      * @tc.name    SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600
      * @tc.desc    The result of isOpenTouchGuideSync() should be boolean type.
      * @tc.size    MEDIUMTEST
      * @tc.type    User
      * @tc.level   Level 0
      */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600');
      try {
        let status = accessibility.isOpenTouchGuideSync();
        hilog.info(domain, tag, `AccessibilityApi: SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600 result: ${status}`);
        expect(typeof (status)).assertEqual('boolean');
        done();
      } catch (error) {
        hilog.error(domain, tag,'SUB_BASIC_BARRIERFREE_API_AccessibleCheckAbility_static_0600 failed to isOpenTouchGuideSync because ');
        expect(null).assertFail();
        done();
      }
    })
  })
}